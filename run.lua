-- ============================================================
--  MASTERS STANDALONE EXECUTOR  [v6]
--  Fixes v6 (so với v5):
--   • PERF/CRASH #1: Hook không còn gọi GetFullName()/IsDescendantOf()
--     trên mỗi namecall → thay bằng O(1) instance-keyed lookup table
--   • PERF/CRASH #2: eventsBasePath tính lại mỗi lần → cache 1 lần sau clone
--   • BUG #3: CreatePlaylist mock nhận {Name,Private} table nhưng xử lý như string
--   • Handler start được defer sang sau khi lookup table đã build xong
-- ============================================================

local CONFIG = {
    USE_LOCAL_FILE  = true,
    LOCAL_FILE_PATH = "Masters.rbxmx",
    ASSET_ID        = 0,
    SAVE_FILE       = "masters_local_data.json",
    DEBUG           = false,
    FAKE_VERSION    = "102",
    FORCE_MOBILE_UI = "auto",
}

local function Log(...)
    if CONFIG.DEBUG then print("[Masters]", ...) end
end
local function Warn(...) warn("[Masters]", ...) end

-- ============================================================
--  SERVICES
-- ============================================================

local Players           = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local InsertService     = game:GetService("InsertService")
local HttpService       = game:GetService("HttpService")
local UserInputService  = game:GetService("UserInputService")

local client    = Players.LocalPlayer
local PlayerGui = client:WaitForChild("PlayerGui")

-- ============================================================
--  MOBILE DETECT
-- ============================================================

local function IsMobileExecutor()
    if CONFIG.FORCE_MOBILE_UI == true  then return true  end
    if CONFIG.FORCE_MOBILE_UI == false then return false end
    local ok, result = pcall(function()
        local vp        = workspace.CurrentCamera and workspace.CurrentCamera.ViewportSize or Vector2.zero
        local touchOnly = UserInputService.TouchEnabled
            and not UserInputService.KeyboardEnabled
            and not UserInputService.MouseEnabled
        local phoneVP   = vp.X > 0 and vp.Y > 0 and math.min(vp.X, vp.Y) <= 700
        return UserInputService.TouchEnabled and (touchOnly or phoneVP)
    end)
    return ok and result == true
end

local MOBILE_EXECUTOR = IsMobileExecutor()

-- ============================================================
--  LOCAL DATA SCHEMAS
-- ============================================================

local function DefaultSettings()
    return {
        Playback = {
            Crossfade  = { Enabled = true,  Duration = 3 },
            Equalizer  = { Enabled = false, HighGain = 0, MidGain = 0, LowGain = 0 },
        },
        Extras  = { Glow = true, PlaybackHaptics = false },
        Socials = { ListeningVisibility = false, Sharing = false },
    }
end

local function DefaultPreferences()
    return { Artists = { Block = {} }, Songs = { Favorite = {}, Dislike = {} } }
end

local function DefaultAlgorithm()
    return { Artists = {}, Songs = {}, Tags = {} }
end

local function DefaultLibrary()
    return { Artists = {}, Songs = {}, Playlists = {} }
end

local LocalData = {
    Settings      = DefaultSettings(),
    Preferences   = DefaultPreferences(),
    Algorithm     = DefaultAlgorithm(),
    Library       = DefaultLibrary(),
    LocalStations = {},
    Configuration = {
        Access = {
            PermitEveryone = true,
            LinkPasses     = {},
            LinkGroups     = {},
            LinkPlayers    = {},
        },
        Stations       = { AutoStart = "", OnlineStations = true },
        CustomSections = {},
    },
}

local function ApplyMobileSettingsDefaults()
    if not MOBILE_EXECUTOR then return end
    if type(LocalData.Settings) ~= "table" then
        LocalData.Settings = DefaultSettings()
    end
    LocalData.Settings.Extras = LocalData.Settings.Extras or {}
    LocalData.Settings.Extras.Glow            = false
    LocalData.Settings.Extras.PlaybackHaptics = false
end

local function SaveData()
    if not writefile then return end
    pcall(function()
        writefile(CONFIG.SAVE_FILE, HttpService:JSONEncode({
            Library       = LocalData.Library,
            Preferences   = LocalData.Preferences,
            Settings      = LocalData.Settings,
            LocalStations = LocalData.LocalStations,
        }))
    end)
end

local function TryLoadSave()
    if not readfile then return end
    local ok, saved = pcall(function()
        return HttpService:JSONDecode(readfile(CONFIG.SAVE_FILE))
    end)
    if ok and type(saved) == "table" then
        if saved.Library       then LocalData.Library       = saved.Library       end
        if saved.Preferences   then LocalData.Preferences   = saved.Preferences   end
        if saved.Settings      then LocalData.Settings      = saved.Settings      end
        if saved.LocalStations then LocalData.LocalStations = saved.LocalStations end
        Log("Loaded saved data")
    end
end

TryLoadSave()
ApplyMobileSettingsDefaults()

-- ============================================================
--  RE-EXECUTE DETECT
-- ============================================================

local alreadyInjected = ReplicatedStorage:FindFirstChild("Masters(Storage)") ~= nil
    and PlayerGui:FindFirstChild("Masters") ~= nil

if alreadyInjected then
    print("[Masters] Re-execute detected → resuming...")
    local storage = ReplicatedStorage:FindFirstChild("Masters(Storage)")
    local events  = storage and storage:FindFirstChild("Events")
    if events then
        for _, path in {"Main.Onboarding.SetupComplete","Main.Onboarding.Complete",
                        "Main.Setup.RunGame","Main.ServerReady"} do
            local cur = events
            for _, p in path:split(".") do cur = cur and cur:FindFirstChild(p) end
            if cur then
                pcall(function() if cur:IsA("RemoteEvent")    then cur:FireServer()   end end)
                pcall(function() if cur:IsA("RemoteFunction") then cur:InvokeServer() end end)
            end
        end
    end
    local mg = PlayerGui:FindFirstChild("Masters")
    if mg then
        for _, n in {"Onboarding","Setup","Welcome","UpdateScreen","UpdateUI","Update"} do
            local f = mg:FindFirstChild(n, true)
            if f and f:IsA("GuiObject") then f.Visible = false end
        end
    end
    print("[Masters] Resume done ✓")
    return
end

-- ============================================================
--  LOAD MODEL
-- ============================================================

local MastersRoot

if CONFIG.USE_LOCAL_FILE and getcustomasset then
    local ok1, assetUrl = pcall(getcustomasset, CONFIG.LOCAL_FILE_PATH)
    if ok1 and assetUrl then
        local ok2, result = pcall(function() return game:GetObjects(assetUrl) end)
        if ok2 and result and #result > 0 then
            for _, obj in result do
                if obj.Name == "Masters" or obj:FindFirstChild("MainFile") then
                    MastersRoot = obj; break
                end
            end
            MastersRoot = MastersRoot or result[1]
            Log("Loaded from local file")
        else
            Warn("game:GetObjects() failed:", tostring(result))
        end
    else
        Warn("getcustomasset() failed:", tostring(assetUrl))
    end
elseif CONFIG.USE_LOCAL_FILE then
    Warn("getcustomasset not available")
end

if not MastersRoot then
    if CONFIG.ASSET_ID == 0 then
        error("[Masters] Model load failed. Check '" .. CONFIG.LOCAL_FILE_PATH .. "'", 2)
    end
    local ok, result = pcall(function() return InsertService:LoadAsset(CONFIG.ASSET_ID) end)
    if ok and result then
        MastersRoot = result:GetChildren()[1] or result
    else
        error("[Masters] InsertService failed: " .. tostring(result), 2)
    end
end

-- ============================================================
--  TÌM SCREENGUI VÀ HANDLER
-- ============================================================

local StorageFolder = MastersRoot:FindFirstChild("Masters(Storage)", true)

local MastersGui
do
    local mainFile      = MastersRoot:FindFirstChild("MainFile")
    local mastersServer = mainFile and mainFile:FindFirstChild("Masters(Server)")
    local components    = mastersServer and mastersServer:FindFirstChild("Components")
    local mastersComp   = components and components:FindFirstChild("Masters")

    if mastersComp and mastersComp:IsA("ScreenGui") then
        MastersGui = mastersComp
        Log("ScreenGui found via direct path ✓")
    end

    if not MastersGui then
        for _, obj in MastersRoot:GetDescendants() do
            if obj:IsA("ScreenGui") and obj:FindFirstChild("Handler", true) then
                MastersGui = obj
                Log("ScreenGui found via Handler search ✓")
                break
            end
        end
    end

    if not MastersGui then
        for _, obj in MastersRoot:GetDescendants() do
            if obj:IsA("ScreenGui")
               and obj.Name ~= "Onboarding"
               and obj.Name ~= "MastersOnboarding" then
                MastersGui = obj
                Warn("Using fallback ScreenGui:", obj.Name)
                break
            end
        end
    end
end

local HandlerScript = MastersGui and MastersGui:FindFirstChild("Handler", true)

if not StorageFolder then error("[Masters] Masters(Storage) not found in model.", 2) end
if not MastersGui    then Warn("No suitable ScreenGui found.") end
if not HandlerScript then Warn("No Handler script found.")    end

-- ============================================================
--  MOBILE GUI PATCHES
-- ============================================================

local function ApplyMobileGuiPatches(gui)
    if not MOBILE_EXECUTOR or not gui then return end
    pcall(function() gui.IgnoreGuiInset = false end)
    pcall(function() gui.ScreenInsets = Enum.ScreenInsets.DeviceSafeInsets end)
    pcall(function() gui.ClipToDeviceSafeArea = false end)

    local interface = gui:FindFirstChild("Interface", true)
    if interface and interface:IsA("GuiObject") then
        interface.AnchorPoint = Vector2.new(0.5, 0.5)
        interface.Position    = UDim2.fromScale(0.5, 0.5)
        interface.Size        = UDim2.fromScale(1, 1)

        local scale = interface:FindFirstChild("MobileExecutorScale")
        if not scale then
            scale      = Instance.new("UIScale")
            scale.Name = "MobileExecutorScale"
            scale.Parent = interface
        end
        scale.Scale = 1
    end
    Log("Applied mobile-safe GUI defaults")
end

local function RevealMobileStartupBar(gui)
    if not gui then return end
    pcall(function()
        for _, name in {"StartupBar","MobileBar","LoadingBar","SplashScreen","Splash"} do
            local obj = gui:FindFirstChild(name, true)
            if obj and obj:IsA("GuiObject") then
                obj.Visible = true
            end
        end
    end)
end

-- ============================================================
--  MOBILE MODULE PATCHES
-- ============================================================

local function ApplyMobileModulePatches(storageRoot)
    if not MOBILE_EXECUTOR or not storageRoot then return end

    local modules = storageRoot:FindFirstChild("Modules")
    if not modules then return end

    local utilitiesModule = modules:FindFirstChild("Utilities")
    if utilitiesModule then
        local ok, utilities = pcall(require, utilitiesModule)
        if ok and type(utilities) == "table" then
            utilities.GetViewportRatio = function() return 0 end
            utilities.Haptic           = function() end
            Log("Patched Utilities ✓")
        else
            Warn("Cannot patch Utilities:", tostring(utilities))
        end
    end

    local audiosModule = modules:FindFirstChild("Audios")
    if audiosModule then
        local ok, audios = pcall(require, audiosModule)
        if ok and type(audios) == "table" then
            audios.LoadAudios = function()
                task.defer(function()
                    pcall(function() audios.ChunkLoadingFinished:Fire() end)
                end)
            end
            audios.IsLoaded = function() return true end
            Log("Patched Audios ✓")
        else
            Warn("Cannot patch Audios:", tostring(audios))
        end
    end

    local mainModule = modules:FindFirstChild("Main")
    if mainModule then
        local ok, main = pcall(require, mainModule)
        if ok and type(main) == "table"
           and type(main.SetState) == "function"
           and not main.__MastersMobileExecutorPatched then
            main.__MastersMobileExecutorPatched = true
            local originalSetState = main.SetState
            main.SetState = function(state)
                local result = originalSetState(state)
                if state == "Full" then
                    task.defer(function()
                        pcall(function() main.Fullscreen(true) end)
                        pcall(function() main.Sidebar(false) end)
                    end)
                end
                return result
            end
            Log("Patched Main ✓")
        else
            Warn("Cannot patch Main:", tostring(main))
        end
    end
end

-- ============================================================
--  MOCK EVENT HANDLERS  (path → function)
-- ============================================================

local MockInvoke = {}
local MockFire   = {}

local function OnInvoke(path, fn) MockInvoke[path] = fn end
local function OnFire(path, fn)   MockFire[path]   = fn end

-- ── VERSION / UPDATE ──────────────────────────────────────
local function FakeVer()      return CONFIG.FAKE_VERSION end
local function FakeVerCheck() return true, CONFIG.FAKE_VERSION end

OnInvoke("Main.GetVersion",            FakeVer)
OnInvoke("Main.FetchVersion",          FakeVer)
OnInvoke("Main.CheckVersion",          FakeVerCheck)
OnInvoke("Main.Version",               FakeVer)
OnInvoke("Main.VersionCheck",          FakeVerCheck)
OnInvoke("Main.UpdateCheck",           FakeVerCheck)
OnInvoke("Main.IsUpToDate",            function() return true end)
OnInvoke("Main.GetLatestVersion",      FakeVer)
OnInvoke("Main.Setup.GetVersion",      FakeVer)
OnInvoke("Main.Onboarding.GetVersion", FakeVer)

-- ── ONBOARDING ────────────────────────────────────────────
OnInvoke("Main.Onboarding.GetStatus",  function() return true, "complete" end)
OnInvoke("Main.Onboarding.IsComplete", function() return true end)
OnInvoke("Main.Onboarding.GetStep",    function() return "complete" end)
OnInvoke("Main.Setup.GetStatus",       function() return true, "ready" end)
OnInvoke("Main.Setup.IsReady",         function() return true end)
OnInvoke("Main.ServerReady",           function() return true end)
OnInvoke("Main.GameReady",             function() return true end)
OnFire("Main.Onboarding.SetupComplete", function() end)
OnFire("Main.Onboarding.Complete",      function() end)
OnFire("Main.Onboarding.Finish",        function() end)
OnFire("Main.Setup.RunGame",            function() end)
OnFire("Main.Setup.Complete",           function() end)
OnFire("Main.ServerReady",              function() end)
OnFire("Main.GameReady",                function() end)

-- ── SETTINGS ──────────────────────────────────────────────
OnInvoke("Main.Settings.FetchSettings",    function() return LocalData.Settings end)
OnInvoke("Modules.Settings.FetchSettings", function() return LocalData.Settings end)
OnFire("Main.Settings.SetSettings", function(newSettings)
    if type(newSettings) ~= "table" then return end
    for k, v in newSettings do LocalData.Settings[k] = v end
    SaveData()
end)

-- ── ALGORITHM ─────────────────────────────────────────────
OnInvoke("Main.Algorithm.FetchAlgorithm", function() return LocalData.Algorithm end)

-- ── LIBRARY ───────────────────────────────────────────────
OnInvoke("Main.Library.FetchLibrary", function()
    return {
        Songs     = LocalData.Library.Songs,
        Artists   = LocalData.Library.Artists,
        Playlists = LocalData.Library.Playlists,
    }
end)

OnInvoke("Main.Library.SetSong", function(songId, add)
    if add then
        if not table.find(LocalData.Library.Songs, songId) then
            table.insert(LocalData.Library.Songs, songId)
        end
    else
        local idx = table.find(LocalData.Library.Songs, songId)
        if idx then table.remove(LocalData.Library.Songs, idx) end
    end
    SaveData()
    return true, add and "Added" or "Removed"
end)

OnInvoke("Main.Library.IsSongSaved", function(songId)
    return table.find(LocalData.Library.Songs, songId) ~= nil
end)

OnInvoke("Main.Library.SetArtist", function(artistName, add)
    if add then
        if not table.find(LocalData.Library.Artists, artistName) then
            table.insert(LocalData.Library.Artists, artistName)
        end
    else
        local idx = table.find(LocalData.Library.Artists, artistName)
        if idx then table.remove(LocalData.Library.Artists, idx) end
    end
    SaveData()
    return true, add and "Added" or "Removed"
end)

OnInvoke("Main.Library.IsArtistSaved", function(artistName)
    return table.find(LocalData.Library.Artists, artistName) ~= nil
end)

OnInvoke("Main.Library.IsPinned", function() return false end)
OnFire("Main.Library.Pin",        function() end)

OnInvoke("Main.Library.GetPlaylists", function()
    local result = {}
    for _, data in LocalData.Library.Playlists do
        table.insert(result, data)
    end
    return result
end)

OnInvoke("Main.Library.GetPlaylistIdByName", function(name)
    for id, data in LocalData.Library.Playlists do
        if data.Name == name then return id end
    end
    return nil
end)

OnInvoke("Main.Library.GetPlaylistByPlaylistId", function(creatorId, playlistId)
    return LocalData.Library.Playlists[playlistId]
end)

-- FIX v6: Handler passes {Name=..., Private=...} table, not a plain string
OnInvoke("Main.Library.CreatePlaylist", function(nameOrData)
    local id   = "LOCAL_" .. tostring(math.floor(tick() * 1000))
    local name = (type(nameOrData) == "table" and nameOrData.Name)
              or (type(nameOrData) == "string" and nameOrData)
              or "New Playlist"
    LocalData.Library.Playlists[id] = {
        PlaylistId = id,
        Name       = name,
        Songs      = {},
        Private    = (type(nameOrData) == "table" and nameOrData.Private) or false,
        CreatorId  = client.UserId,
    }
    SaveData()
    return true, id
end)

OnInvoke("Main.Library.SetSongToPlaylist", function(playlistId, songId, add)
    local playlist = LocalData.Library.Playlists[playlistId]
    if not playlist then return false, "Not found" end
    if add then
        if not table.find(playlist.Songs, songId) then
            table.insert(playlist.Songs, songId)
        end
    else
        local idx = table.find(playlist.Songs, songId)
        if idx then table.remove(playlist.Songs, idx) end
    end
    SaveData()
    return true, add and "Added" or "Removed"
end)

OnInvoke("Main.Library.SetPlaylistProperty", function(playlistId, property, value)
    local playlist = LocalData.Library.Playlists[playlistId]
    if not playlist then return false end
    playlist[property] = value
    SaveData()
    return true
end)

OnInvoke("Main.Library.AddPublicPlaylist", function(creatorId, playlistId)
    if not LocalData.Library.Playlists[playlistId] then
        LocalData.Library.Playlists[playlistId] = {
            PlaylistId = playlistId, Name = "Shared Playlist",
            Songs = {}, Private = false, CreatorId = creatorId,
        }
        SaveData()
    end
    return true
end)

OnFire("Main.Library.DeletePlaylist", function(playlistId)
    LocalData.Library.Playlists[playlistId] = nil
    SaveData()
end)

OnInvoke("Main.Library.CopyOnlineStation", function() return true, "Copied" end)
OnInvoke("Main.Library.CopyLocalStation",  function() return true, "Copied" end)

-- ── PREFERENCES ───────────────────────────────────────────
OnInvoke("Main.Preferences.FetchPreference", function() return LocalData.Preferences end)

OnInvoke("Main.Preferences.FavoriteSong", function(songId, add)
    if add then
        if not table.find(LocalData.Preferences.Songs.Favorite, songId) then
            table.insert(LocalData.Preferences.Songs.Favorite, songId)
        end
    else
        local idx = table.find(LocalData.Preferences.Songs.Favorite, songId)
        if idx then table.remove(LocalData.Preferences.Songs.Favorite, idx) end
    end
    SaveData()
    return true, add and "Favorited" or "Unfavorited"
end)

OnInvoke("Main.Preferences.IsSongFavorite", function(songId)
    return table.find(LocalData.Preferences.Songs.Favorite, songId) ~= nil
end)

OnInvoke("Main.Preferences.DislikeSong", function(songId, add)
    if add then
        if not table.find(LocalData.Preferences.Songs.Dislike, songId) then
            table.insert(LocalData.Preferences.Songs.Dislike, songId)
        end
    else
        local idx = table.find(LocalData.Preferences.Songs.Dislike, songId)
        if idx then table.remove(LocalData.Preferences.Songs.Dislike, idx) end
    end
    SaveData()
    return true, add and "Disliked" or "Undisliked"
end)

OnInvoke("Main.Preferences.IsSongDislike", function(songId)
    return table.find(LocalData.Preferences.Songs.Dislike, songId) ~= nil
end)

OnInvoke("Main.Preferences.BlockArtist", function(artistName, add)
    if add then
        if not table.find(LocalData.Preferences.Artists.Block, artistName) then
            table.insert(LocalData.Preferences.Artists.Block, artistName)
        end
    else
        local idx = table.find(LocalData.Preferences.Artists.Block, artistName)
        if idx then table.remove(LocalData.Preferences.Artists.Block, idx) end
    end
    SaveData()
    return true, add and "Blocked" or "Unblocked"
end)

OnInvoke("Main.Preferences.IsArtistBlock", function(artistName)
    return table.find(LocalData.Preferences.Artists.Block, artistName) ~= nil
end)

-- ── SHARING ───────────────────────────────────────────────
OnInvoke("Main.Sharing.Share",              function() return false, "Disabled" end)
OnInvoke("Main.Sharing.IsShared",           function() return false end)
OnInvoke("Main.Sharing.FetchSharedWithYou", function() return {} end)

-- ── SESSION SAVING ────────────────────────────────────────
OnInvoke("Main.SessionSaving.FetchSavedSession", function() return nil end)
OnFire("Main.SessionSaving.SetPlaybackState",    function() end)

-- ── LISTENERS ─────────────────────────────────────────────
OnInvoke("Modules.Listeners.GetListeners",        function() return {} end)
OnInvoke("Modules.Listeners.GetCurrentTimestamp", function() return 0  end)
OnFire("Modules.Listeners.UpdateListener",        function() end)

-- ── TEXT FILTERING ────────────────────────────────────────
OnInvoke("Modules.TextFiltering.FilterText", function(mode, text) return text end)

-- ── CONFIGURATION ─────────────────────────────────────────
OnInvoke("Modules.Configuration.GetConfiguration",       function() return LocalData.Configuration end)
OnInvoke("Modules.Configuration.GetConfigurationServer", function() return LocalData.Configuration end)
OnInvoke("Modules.Configuration.GetLocalStations",       function() return LocalData.LocalStations  end)
OnInvoke("Modules.Configuration.GetLocalStationsServer", function() return LocalData.LocalStations  end)

-- ── ONLINE STATIONS ───────────────────────────────────────
OnInvoke("Modules.OnlineStations.GetStationsIndex", function()
    local ok, result = pcall(function()
        local apiKey  = "AIzaSyAZkUG43dtTWV1L0kKZxyb_PeT9x5RlDsY"
        local sheetId = "1iJRuAArdm2fSobb0R1T4pLdaEKyyseqSsRhpyD9D7cA"
        local url = ("https://sheets.googleapis.com/v4/spreadsheets/%s/values/e1?key=%s"):format(sheetId, apiKey)
        return HttpService:JSONDecode(HttpService:GetAsync(url))
    end)
    return ok and result or {}
end)

-- ============================================================
--  INSTANCE-KEYED LOOKUP TABLE  (built once after clone)
--
--  Thay vì hook tính GetFullName() + string ops mỗi lần,
--  ta walk Events tree 1 lần và map instance → handler.
--  Hook chỉ cần 1 table lookup O(1), không có string ops,
--  không có pcall, không có IsDescendantOf.
-- ============================================================

-- Populated after StorageClone is created (xem bên dưới)
local RF_handlers = {}   -- [RemoteFunction instance] = fn
local RE_handlers = {}   -- [RemoteEvent    instance] = fn

local function BuildLookupTables(eventsFolder)
    if not eventsFolder then
        Warn("Events folder not found — hook will be no-op")
        return
    end

    -- Helper: tính relative path từ eventsFolder đến obj
    -- Ví dụ: Events.Main.Settings.FetchSettings → "Main.Settings.FetchSettings"
    local function RelPath(obj)
        local parts = {}
        local cur = obj
        while cur and cur ~= eventsFolder do
            table.insert(parts, 1, cur.Name)
            cur = cur.Parent
        end
        if cur ~= eventsFolder then return nil end
        return table.concat(parts, ".")
    end

    local rfCount, reCount = 0, 0

    for _, obj in eventsFolder:GetDescendants() do
        local path = RelPath(obj)
        if path then
            if obj:IsA("RemoteFunction") then
                local handler = MockInvoke[path]
                if handler then
                    RF_handlers[obj] = handler
                    rfCount += 1
                    Log("RF mapped:", path)
                else
                    -- Unmocked RF: return nil silently
                    RF_handlers[obj] = function()
                        Warn("Unmocked RF called:", path)
                        return nil
                    end
                end
            elseif obj:IsA("RemoteEvent") then
                local handler = MockFire[path]
                if handler then
                    RE_handlers[obj] = handler
                    reCount += 1
                    Log("RE mapped:", path)
                else
                    -- Unmocked RE: no-op silently
                    RE_handlers[obj] = function()
                        Warn("Unmocked RE called:", path)
                    end
                end
            end
        end
    end

    Log(("BuildLookupTables: %d RF + %d RE mapped"):format(rfCount, reCount))
end

-- ============================================================
--  HOOK __namecall  — O(1) instance lookup, zero string ops
-- ============================================================

if not hookmetamethod then
    Warn("hookmetamethod not available — event mocking disabled.")
else
    local orig
    orig = hookmetamethod(game, "__namecall", function(self, ...)
        local method = getnamecallmethod()

        -- Fast path: skip nếu không phải method ta quan tâm
        if method == "InvokeServer" then
            local handler = RF_handlers[self]
            if handler then
                Log("RF intercept hit")
                local ok, a, b, c, d, e = pcall(handler, ...)
                if ok then
                    return a, b, c, d, e
                else
                    Warn("RF handler error:", a)
                    return nil
                end
            end

        elseif method == "FireServer" then
            local handler = RE_handlers[self]
            if handler then
                Log("RE intercept hit")
                pcall(handler, ...)
                return
            end
        end

        return orig(self, ...)
    end)
    Log("hookmetamethod installed ✓")
end

-- ============================================================
--  INJECT
-- ============================================================

-- Step 1: Storage → ReplicatedStorage
local StorageClone
pcall(function()
    local existing = ReplicatedStorage:FindFirstChild("Masters(Storage)")
    if existing then existing:Destroy() end
    StorageClone = StorageFolder:Clone()
    StorageClone.Parent = ReplicatedStorage
    Log("Step 1/5: Injected Masters(Storage) ✓")
end)

task.wait(0.1)

-- Step 2: Build O(1) lookup table ngay sau khi clone xong
-- (phải làm trước khi Handler chạy vì Handler gọi InvokeServer ngay lập tức)
pcall(function()
    if StorageClone then
        local eventsFolder = StorageClone:FindFirstChild("Events")
        BuildLookupTables(eventsFolder)
        Log("Step 2/5: Lookup tables built ✓")
    end
end)

task.wait(0.1)

-- Step 3: Mobile module patches
pcall(function()
    if StorageClone then
        ApplyMobileModulePatches(StorageClone)
        Log("Step 3/5: Mobile module patches ✓")
    end
end)

task.wait(0.1)

-- Step 4: GUI → PlayerGui
local GuiClone
pcall(function()
    if MastersGui then
        local existing = PlayerGui:FindFirstChild("Masters")
        if existing then existing:Destroy() end
        GuiClone = MastersGui:Clone()
        ApplyMobileGuiPatches(GuiClone)
        GuiClone.Parent = PlayerGui
        Log("Step 4/5: Injected ScreenGui ✓")
    end
end)

task.wait(0.2)

-- Step 5: Handler script  (lookup tables đã sẵn sàng → an toàn)
pcall(function()
    if HandlerScript and GuiClone then
        local clone = HandlerScript:Clone()
        clone.Disabled = true
        clone.Parent   = GuiClone
        local ok, err  = pcall(function() clone.Disabled = false end)
        if ok then
            Log("Step 5/5: Handler started ✓")
        else
            Warn("Handler error:", err)
        end
    elseif not HandlerScript then
        Warn("Step 5/5: Handler script not found.")
    end
end)

-- ============================================================
--  WAIT FOR STORAGE CONFIRM
-- ============================================================

local storage = ReplicatedStorage:WaitForChild("Masters(Storage)", 15)
if not storage then
    Warn("Masters(Storage) không xuất hiện sau 15s — tiếp tục.")
end

-- ============================================================
--  ẨN ONBOARDING UI
-- ============================================================

task.spawn(function()
    task.wait(1.5)
    local mg = PlayerGui:FindFirstChild("Masters")
    if not mg then return end

    for _, name in {"Update","UpdateScreen","UpdateUI","UpdateRequired","Onboarding",
                    "Setup","Welcome","Install","UpdateInstructions","Installation"} do
        local frame = mg:FindFirstChild(name, true)
        if frame and frame:IsA("GuiObject") then
            frame.Visible = false
            Log("Hidden:", name)
        end
    end

    for _, btn in mg:GetDescendants() do
        if btn:IsA("GuiButton") then
            local nl = btn.Name:lower()
            local tl = ""
            pcall(function()
                tl = (btn:FindFirstChildWhichIsA("TextLabel") or {Text=""}).Text:lower()
            end)
            for _, kw in {"rungame","run game","continue","finish","done","start"} do
                if nl:find(kw) or tl:find(kw) then
                    pcall(function() btn.MouseButton1Click:Fire() end)
                    break
                end
            end
        end
    end
end)

RevealMobileStartupBar(GuiClone)

if writefile then
    task.spawn(function()
        while task.wait(60) do SaveData() end
    end)
end

-- ============================================================
print("╔══════════════════════════════════════════╗")
print("║   Masters Standalone Executor  [v6]      ║")
print("╠══════════════════════════════════════════╣")
print("║  FIX: Hook O(1) instance lookup          ║")
print("║  FIX: eventsBasePath cached after clone  ║")
print("║  FIX: CreatePlaylist table arg handling  ║")
print("║  FIX: Handler start after lookup built   ║")
print("╚══════════════════════════════════════════╝")

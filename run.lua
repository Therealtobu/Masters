-- ============================================================
--  MASTERS STANDALONE EXECUTOR  [PATCHED v3]
--  Fixes v3:
--   • Preferences schema đúng: Artists.Block / Songs.Favorite / Songs.Dislike
--   • Algorithm schema đúng: Songs[] / Tags[] / Artists[] (arrays, not dicts)
--   • Library schema đúng: Songs[] / Artists[] arrays
--   • Thêm mock Modules.Settings.FetchSettings (path khác với Main.Settings)
--   • Thêm mock Modules.TextFiltering.FilterText
--   • Correct game ScreenGui (không lấy Plugin Onboarding)
--   • Thêm mock GetConfigurationServer / GetLocalStationsServer
-- ============================================================

local CONFIG = {
    USE_LOCAL_FILE  = true,
    LOCAL_FILE_PATH = "Masters.rbxmx",
    ASSET_ID        = 0,
    SAVE_FILE       = "masters_local_data.json",
    DEBUG           = false,
    FAKE_VERSION    = "102",
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

local client    = Players.LocalPlayer
local PlayerGui = client:WaitForChild("PlayerGui")

-- ============================================================
--  RE-EXECUTE DETECT
-- ============================================================

local alreadyInjected = ReplicatedStorage:FindFirstChild("Masters(Storage)") ~= nil
    and PlayerGui:FindFirstChild("Masters") ~= nil

if alreadyInjected then
    print("[Masters] Detected re-execute → resuming...")
    local storage = ReplicatedStorage:FindFirstChild("Masters(Storage)")
    local events  = storage and storage:FindFirstChild("Events")
    local function TryFireResume(ef)
        if not ef then return end
        for _, path in {"Main.Onboarding.SetupComplete","Main.Onboarding.Complete","Main.Setup.RunGame","Main.ServerReady"} do
            local cur = ef
            for _, p in path:split(".") do cur = cur and cur:FindFirstChild(p) end
            if cur then
                pcall(function() if cur:IsA("RemoteEvent")    then cur:FireServer()   end end)
                pcall(function() if cur:IsA("RemoteFunction") then cur:InvokeServer() end end)
            end
        end
    end
    TryFireResume(events)
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
--  LOCAL DATA — schemas match EXACT server defaults
-- ============================================================

local function DefaultSettings()
    return {
        Playback = {
            Crossfade  = { Enabled = true, Duration = 3 },
            Equalizer  = { Enabled = false, HighGain = 0, MidGain = 0, LowGain = 0 },
        },
        Extras  = { Glow = true, PlaybackHaptics = false },
        Socials = { ListeningVisibility = false, Sharing = false },
    }
end

local function DefaultPreferences()
    -- MUST match server GetDefaultPreferences():
    -- { Artists = { Block = {} }, Songs = { Favorite = {}, Dislike = {} } }
    return {
        Artists = { Block = {} },
        Songs   = { Favorite = {}, Dislike = {} },
    }
end

local function DefaultAlgorithm()
    -- MUST match server GetDefaultAlgorithm():
    -- { Artists = {}, Songs = {}, Tags = {} }  (all arrays)
    return {
        Artists = {},
        Songs   = {},
        Tags    = {},
    }
end

local function DefaultLibrary()
    -- MUST match server GetDefaultLibrary():
    -- { Artists = {}, Songs = {}, Playlists = {} }  (arrays for Songs/Artists)
    return {
        Artists   = {},
        Songs     = {},
        Playlists = {},
    }
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

TryLoadSave()

-- ============================================================
--  LOAD MODEL
-- ============================================================

local MastersRoot

if CONFIG.USE_LOCAL_FILE then
    if getcustomasset then
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
    else
        Warn("getcustomasset not available")
    end
end

if not MastersRoot then
    if CONFIG.ASSET_ID == 0 then
        error("[Masters] Model load failed. Check file '" .. CONFIG.LOCAL_FILE_PATH .. "'", 2)
    end
    local ok, result = pcall(function() return InsertService:LoadAsset(CONFIG.ASSET_ID) end)
    if ok and result then
        MastersRoot = result:GetChildren()[1] or result
    else
        error("[Masters] InsertService failed: " .. tostring(result), 2)
    end
end

-- ============================================================
--  FIND CORRECT GAME SCREENGUI
--  Plugin Onboarding ScreenGui (UpdateInstructions page) is at:
--    Masters/Onboarding/...
--  Actual game ScreenGui is at:
--    Masters/MainFile/Masters(Server)/Components/Masters
--  FindFirstChildWhichIsA("ScreenGui", true) always finds the
--  WRONG one first → fixed by navigating the path directly.
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
        Log("Game ScreenGui found via direct path ✓")
    else
        -- Fallback: any ScreenGui containing Handler script
        for _, obj in MastersRoot:GetDescendants() do
            if obj:IsA("ScreenGui") and obj:FindFirstChild("Handler", true) then
                MastersGui = obj
                Log("Game ScreenGui found via Handler search ✓")
                break
            end
        end
    end

    if not MastersGui then
        -- Last resort: avoid Onboarding ScreenGui
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
if not HandlerScript then Warn("No Handler script found.") end

-- ============================================================
--  INJECT INTO GAME
-- ============================================================

local existing = ReplicatedStorage:FindFirstChild("Masters(Storage)")
if existing then existing:Destroy() end

local StorageClone = StorageFolder:Clone()
StorageClone.Parent = ReplicatedStorage
Log("Injected Masters(Storage) → ReplicatedStorage")

local existingGui = PlayerGui:FindFirstChild("Masters")
if existingGui then existingGui:Destroy() end

local GuiClone
if MastersGui then
    GuiClone = MastersGui:Clone()
    GuiClone.Parent = PlayerGui
    Log("Injected ScreenGui →", GuiClone.Name)
end

task.wait(0.3)

local storage = ReplicatedStorage:WaitForChild("Masters(Storage)", 15)
if not storage then error("[Masters] Masters(Storage) did not appear in 15s.", 2) end

local events = storage:WaitForChild("Events", 10)
if not events then Warn("Events folder not found.") end

-- ============================================================
--  MOCK EVENT SYSTEM
-- ============================================================

local MockInvoke = {}
local MockFire   = {}

local eventsFullPath = events and events:GetFullName() or ""
local eventsPathLen  = #eventsFullPath

local function GetRelativePath(instance)
    local full = instance:GetFullName()
    if full:sub(1, eventsPathLen) == eventsFullPath then
        return full:sub(eventsPathLen + 2)
    end
    return full
end

local function OnInvoke(path, fn) MockInvoke[path] = fn end
local function OnFire(path, fn)   MockFire[path]   = fn end

-- ============================================================
--  HANDLERS
-- ============================================================

-- ── VERSION / UPDATE ──────────────────────────────────────
local function FakeVer() return CONFIG.FAKE_VERSION end
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
-- Handler.client.lua dùng: events.Main.Settings.FetchSettings
-- Settings module dùng:    events.Modules.Settings.FetchSettings
-- → Cần mock CẢ HAI path
OnInvoke("Main.Settings.FetchSettings", function()
    return LocalData.Settings
end)
OnInvoke("Modules.Settings.FetchSettings", function()  -- BUG FIX v3
    return LocalData.Settings
end)
OnFire("Main.Settings.SetSettings", function(newSettings)
    if type(newSettings) ~= "table" then return end
    for k, v in newSettings do LocalData.Settings[k] = v end
    SaveData()
end)

-- ── ALGORITHM ─────────────────────────────────────────────
-- Schema: { Artists=[], Songs=[], Tags=[] }  (arrays of objects)
-- Handler dùng: Algorithm.Songs, Algorithm.Tags, Algorithm.Artists
OnInvoke("Main.Algorithm.FetchAlgorithm", function()
    return LocalData.Algorithm
end)

-- ── LIBRARY ───────────────────────────────────────────────
-- Schema: { Songs=[], Artists=[], Playlists={} }
-- Songs/Artists = arrays; Playlists = dict keyed by PlaylistId
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

OnInvoke("Main.Library.IsPinned", function(itemType, id)
    -- Not tracked locally; always false
    return false
end)

OnFire("Main.Library.Pin", function(itemType, id, pin) end)

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

OnInvoke("Main.Library.CreatePlaylist", function(name)
    local id = "LOCAL_" .. tostring(math.floor(tick() * 1000))
    LocalData.Library.Playlists[id] = {
        PlaylistId = id,
        Name       = name or "New Playlist",
        Songs      = {},
        Private    = false,
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
-- Schema phải ĐÚNG: { Artists={Block=[]}, Songs={Favorite=[], Dislike=[]} }
-- Handler dùng: Preferences.Artists.Block, Preferences.Songs.Favorite, Preferences.Songs.Dislike
OnInvoke("Main.Preferences.FetchPreference", function()
    return LocalData.Preferences
end)

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
OnInvoke("Main.SessionSaving.FetchSavedSession",  function() return nil end)
OnFire("Main.SessionSaving.SetPlaybackState",     function() end)

-- ── LISTENERS ─────────────────────────────────────────────
OnInvoke("Modules.Listeners.GetListeners",        function() return {} end)
OnInvoke("Modules.Listeners.GetCurrentTimestamp", function() return 0  end)
OnFire("Modules.Listeners.UpdateListener",        function() end)

-- ── TEXT FILTERING ────────────────────────────────────────
-- BUG FIX v3: thiếu mock này gây crash khi user search
OnInvoke("Modules.TextFiltering.FilterText", function(mode, text, targetUserId)
    return text  -- trả về text gốc không filter
end)

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
--  HOOK __namecall
-- ============================================================

if not hookmetamethod then
    Warn("hookmetamethod not available — event mocking limited.")
else
    local orig
    orig = hookmetamethod(game, "__namecall", function(self, ...)
        local method = getnamecallmethod()
        local ok, isDesc = pcall(function() return self:IsDescendantOf(game) end)
        if not ok or not isDesc then return orig(self, ...) end

        if method == "InvokeServer" then
            local isRF = pcall(function() return self:IsA("RemoteFunction") end)
            if isRF then
                local path    = GetRelativePath(self)
                local handler = MockInvoke[path]
                if handler then
                    Log("Intercepted InvokeServer:", path)
                    return handler(...)
                end
            end
        end

        if method == "FireServer" then
            local isRE = pcall(function() return self:IsA("RemoteEvent") end)
            if isRE then
                local path    = GetRelativePath(self)
                local handler = MockFire[path]
                if handler then
                    Log("Intercepted FireServer:", path)
                    handler(...)
                    return
                end
            end
        end

        return orig(self, ...)
    end)
    Log("hookmetamethod installed ✓")
end

-- ============================================================
--  PATCH ONBOARDING UI (ẩn nếu vẫn còn hiện)
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
            local tl = (btn:FindFirstChildWhichIsA("TextLabel") or {Text=""}).Text:lower()
            for _, kw in {"rungame","run game","continue","finish","done","start"} do
                if nl:find(kw) or tl:find(kw) then
                    pcall(function() btn.MouseButton1Click:Fire() end)
                    break
                end
            end
        end
    end
end)

-- ============================================================
--  START HANDLER
-- ============================================================

task.wait(0.5)

if HandlerScript then
    local clone = HandlerScript:Clone()
    clone.Parent = GuiClone or PlayerGui
    local ok, err = pcall(function() clone.Disabled = false end)
    if not ok then Warn("Handler error:", err)
    else Log("Handler started ✓") end
else
    Warn("Handler script not found in model.")
end

-- ── AUTO-SAVE ─────────────────────────────────────────────
if writefile then
    task.spawn(function()
        while task.wait(60) do SaveData() end
    end)
end

-- ============================================================
print("╔══════════════════════════════════════════╗")
print("║  Masters Standalone Executor [FIXED v3]  ║")
print("╠══════════════════════════════════════════╣")
print("║  FIX: Correct game ScreenGui             ║")
print("║  FIX: Preferences schema (Artists/Songs) ║")
print("║  FIX: Algorithm schema (Songs/Tags/...)  ║")
print("║  FIX: Modules.Settings + TextFiltering   ║")
print("╚══════════════════════════════════════════╝")

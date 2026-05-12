-- ============================================================
--  MASTERS STANDALONE EXECUTOR [CLEAN v10]
--  New clean single-file runner: no patch stack / conflict blocks.
--  - Quarantines cloned GUI scripts so only one Handler runs.
--  - Hooks Masters remotes with schema-safe fallback data.
--  - Hooks common Roblox services used by the engine/UI.
--  - Provides local songs, username hydration, and UI un-freeze.
-- ============================================================

local CONFIG = {
    USE_LOCAL_FILE = true,
    LOCAL_FILE_PATH = "Masters.rbxmx",
    ASSET_ID = 0,
    SAVE_FILE = "masters_local_data.json",
    DEBUG = false,
    FAKE_VERSION = "102",
    REVEAL_DELAY = 0.75,
    AUDIO_CHUNK_DELAY = 0.25,
}

local function Log(...)
    if CONFIG.DEBUG then print("[Masters]", ...) end
end

local function Warn(...)
    warn("[Masters]", ...)
end

-- ============================================================
--  SERVICES
-- ============================================================

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local InsertService = game:GetService("InsertService")
local HttpService = game:GetService("HttpService")
local AssetService = game:GetService("AssetService")
local MarketplaceService = game:GetService("MarketplaceService")
local PolicyService = game:GetService("PolicyService")
local UserService = game:GetService("UserService")
local ContentProvider = game:GetService("ContentProvider")
local TextService = game:GetService("TextService")
local HapticService = game:GetService("HapticService")
local GuiService = game:GetService("GuiService")
local UserInputService = game:GetService("UserInputService")
local BadgeService = game:GetService("BadgeService")
local TeleportService = game:GetService("TeleportService")
local SocialService = game:GetService("SocialService")
local AvatarEditorService = game:GetService("AvatarEditorService")
local GroupService = game:GetService("GroupService")
local StarterGui = game:GetService("StarterGui")

local client = Players.LocalPlayer
local PlayerGui = client:WaitForChild("PlayerGui")

-- ============================================================
--  LOCAL MOCK DATA
-- ============================================================

local LOCAL_AUDIO_LIBRARY = {
    { Id = 1843529634, Title = "Relaxed Scene", Artist = "Roblox", Duration = 183, Tags = {"ambient", "chill"} },
    { Id = 1845756489, Title = "Town Talk", Artist = "Roblox", Duration = 124, Tags = {"pop", "bright"} },
    { Id = 1841647093, Title = "Life in an Elevator", Artist = "Roblox", Duration = 91, Tags = {"electronic", "chill"} },
    { Id = 1837849285, Title = "Happy Home", Artist = "Roblox", Duration = 134, Tags = {"happy", "pop"} },
    { Id = 1846458016, Title = "No More", Artist = "Roblox", Duration = 156, Tags = {"electronic", "dance"} },
    { Id = 1848354536, Title = "Sunny", Artist = "Roblox", Duration = 138, Tags = {"bright", "pop"} },
    { Id = 9048375035, Title = "Lo-Fi Chill A", Artist = client.Name, Duration = 142, Tags = {"lofi", "chill"} },
    { Id = 9048376689, Title = "Lo-Fi Chill B", Artist = client.Name, Duration = 165, Tags = {"lofi", "ambient"} },
}

local function cloneArray(source)
    local out = {}
    for i, value in ipairs(source or {}) do
        out[i] = value
    end
    return out
end

local function cloneAudio(entry)
    return {
        Id = entry.Id,
        AssetId = entry.Id,
        SongId = entry.Id,
        Title = entry.Title,
        Name = entry.Title,
        Artist = entry.Artist,
        Creator = { Id = 1, Name = entry.Artist, CreatorType = "User" },
        Duration = entry.Duration,
        Tags = cloneArray(entry.Tags),
    }
end

local function localAudioIds()
    local ids = {}
    for _, entry in ipairs(LOCAL_AUDIO_LIBRARY) do
        table.insert(ids, entry.Id)
    end
    return ids
end

local function localAudioMetadata(assetIds)
    if type(assetIds) ~= "table" then assetIds = { assetIds } end
    local byId = {}
    for _, entry in ipairs(LOCAL_AUDIO_LIBRARY) do
        byId[tonumber(entry.Id)] = entry
    end

    local result = {}
    for index, assetId in ipairs(assetIds or {}) do
        local entry = byId[tonumber(assetId)] or LOCAL_AUDIO_LIBRARY[((index - 1) % #LOCAL_AUDIO_LIBRARY) + 1]
        table.insert(result, cloneAudio(entry))
    end
    return result
end

local function localAudioPages()
    local pages = { IsFinished = true }
    function pages:GetCurrentPage()
        return localAudioMetadata(localAudioIds())
    end
    function pages:AdvanceToNextPageAsync()
        self.IsFinished = true
    end
    return pages
end

local function defaultSettings()
    return {
        Playback = {
            Crossfade = { Enabled = true, Duration = 3 },
            Equalizer = { Enabled = false, HighGain = 0, MidGain = 0, LowGain = 0 },
        },
        Extras = { Glow = false, PlaybackHaptics = false },
        Socials = { ListeningVisibility = false, Sharing = false },
    }
end

local LocalData = {
    Settings = defaultSettings(),
    Preferences = { Artists = { Block = {} }, Songs = { Favorite = {}, Dislike = {} } },
    Algorithm = {
        Artists = { { Name = "Roblox", Relevance = 20, LastUpdate = os.time() } },
        Tags = { { Tag = "chill", Relevance = 20, LastUpdate = os.time() } },
        Songs = {},
    },
    Library = { Artists = { "Roblox" }, Songs = localAudioIds(), Playlists = {} },
    LocalStations = {},
    Configuration = {
        Access = { PermitEveryone = true, LinkPasses = {}, LinkGroups = {}, LinkPlayers = {} },
        Stations = { AutoStart = "", OnlineStations = true },
        CustomSections = {
            LocalMastersPicks = { Name = "Masters Picks", Songs = localAudioIds() },
        },
    },
}

local function tryLoadSave()
    if not readfile then return end
    local ok, saved = pcall(function()
        return HttpService:JSONDecode(readfile(CONFIG.SAVE_FILE))
    end)
    if ok and type(saved) == "table" then
        if type(saved.Settings) == "table" then LocalData.Settings = saved.Settings end
        if type(saved.Preferences) == "table" then LocalData.Preferences = saved.Preferences end
        if type(saved.Library) == "table" then LocalData.Library = saved.Library end
        if type(saved.LocalStations) == "table" then LocalData.LocalStations = saved.LocalStations end
    end
    LocalData.Settings.Extras = LocalData.Settings.Extras or {}
    LocalData.Settings.Extras.Glow = false
    LocalData.Settings.Extras.PlaybackHaptics = false
end

local function saveData()
    if not writefile then return end
    pcall(function()
        writefile(CONFIG.SAVE_FILE, HttpService:JSONEncode({
            Settings = LocalData.Settings,
            Preferences = LocalData.Preferences,
            Library = LocalData.Library,
            LocalStations = LocalData.LocalStations,
        }))
    end)
end

tryLoadSave()

-- ============================================================
--  MODEL LOADING / DISCOVERY
-- ============================================================

local function loadRoot()
    if CONFIG.USE_LOCAL_FILE and getcustomasset then
        local okAsset, assetUrl = pcall(getcustomasset, CONFIG.LOCAL_FILE_PATH)
        if okAsset and assetUrl then
            local okObjects, objects = pcall(function()
                return game:GetObjects(assetUrl)
            end)
            if okObjects and type(objects) == "table" and #objects > 0 then
                for _, obj in ipairs(objects) do
                    if obj.Name == "Masters" or obj:FindFirstChild("MainFile") then
                        return obj
                    end
                end
                return objects[1]
            end
            Warn("game:GetObjects failed:", tostring(objects))
        else
            Warn("getcustomasset failed:", tostring(assetUrl))
        end
    end

    if CONFIG.ASSET_ID ~= 0 then
        local okLoad, asset = pcall(function()
            return InsertService:LoadAsset(CONFIG.ASSET_ID)
        end)
        if okLoad and asset then
            return asset:GetChildren()[1] or asset
        end
        Warn("InsertService failed:", tostring(asset))
    end

    error("[Masters] Could not load Masters.rbxmx", 2)
end

local function findGui(root)
    local mainFile = root:FindFirstChild("MainFile")
    local server = mainFile and mainFile:FindFirstChild("Masters(Server)")
    local components = server and server:FindFirstChild("Components")
    local direct = components and components:FindFirstChild("Masters")
    if direct and direct:IsA("ScreenGui") then return direct end

    for _, obj in ipairs(root:GetDescendants()) do
        if obj:IsA("ScreenGui") and obj:FindFirstChild("Handler", true) then
            return obj
        end
    end
end

local function disableEmbeddedScripts(gui)
    if not gui then return end
    for _, obj in ipairs(gui:GetDescendants()) do
        if obj:IsA("LocalScript") then
            obj.Disabled = true
            if obj.Name == "Handler" then obj:Destroy() end
        end
    end
end

local MastersRoot = loadRoot()
local StorageFolder = MastersRoot:FindFirstChild("Masters(Storage)", true)
local MastersGui = findGui(MastersRoot)
local HandlerScript = MastersGui and MastersGui:FindFirstChild("Handler", true)

if not StorageFolder then error("[Masters] Masters(Storage) not found", 2) end
if not MastersGui then Warn("Game ScreenGui not found") end
if not HandlerScript then Warn("Handler not found") end

-- ============================================================
--  UI HYDRATION / PERSONALIZATION
-- ============================================================

local function username()
    return client.Name or "Player"
end

local function personalizeGui(gui)
    if not gui then return end
    for _, obj in ipairs(gui:GetDescendants()) do
        if obj:IsA("TextLabel") or obj:IsA("TextButton") or obj:IsA("TextBox") then
            local okText, text = pcall(function() return obj.Text end)
            if okText and type(text) == "string" then
                local lower = text:lower()
                if lower == "river" or lower == "@river" then
                    obj.Text = username()
                end
            end
        end
    end

    local userFrame = gui:FindFirstChild("User", true)
    local display = userFrame and userFrame:FindFirstChild("Display", true)
    if display and (display:IsA("TextLabel") or display:IsA("TextButton") or display:IsA("TextBox")) then
        display.Text = username()
    end
end

local function forceBarState(gui)
    if not gui then return end
    local interface = gui:FindFirstChild("Interface", true)
    local frame = interface and interface:FindFirstChild("Frame")
    local bar = frame and frame:FindFirstChild("Bar")
    local page = frame and frame:FindFirstChildWhichIsA("UIPageLayout")

    if interface and interface:IsA("GuiObject") then
        interface:SetAttribute("State", "Bar")
        interface.AnchorPoint = Vector2.new(0.5, 0.5)
        interface.Position = UDim2.fromScale(0.5, 0.5)
        interface.Size = UDim2.fromOffset(300, 120)
        interface.ImageTransparency = 0.8
        interface.Active = true
        pcall(function() interface.Interactable = true end)
    end
    if frame then pcall(function() frame.Modal = false end) end
    if page and bar then pcall(function() page:JumpTo(bar) end) end
end

local function hydrateGui(gui)
    if not gui then return end
    personalizeGui(gui)
    for _, obj in ipairs(gui:GetDescendants()) do
        if obj:IsA("GuiObject") then
            pcall(function() obj.Active = true end)
            pcall(function() obj.Interactable = true end)
            if obj:IsA("GuiButton") then
                pcall(function() obj.Selectable = true end)
                pcall(function() obj.AutoButtonColor = true end)
            end
            local lower = obj.Name:lower()
            if lower == "loading" or lower == "spinner" or lower == "throbber" then
                pcall(function() obj.Visible = false end)
            end
        end
    end
end

-- ============================================================
--  INJECT STORAGE / GUI
-- ============================================================

local oldStorage = ReplicatedStorage:FindFirstChild("Masters(Storage)")
if oldStorage then oldStorage:Destroy() end
local StorageClone = StorageFolder:Clone()
StorageClone.Parent = ReplicatedStorage

local oldGui = PlayerGui:FindFirstChild("Masters")
if oldGui then oldGui:Destroy() end

local GuiClone
if MastersGui then
    GuiClone = MastersGui:Clone()
    GuiClone.Enabled = false
    disableEmbeddedScripts(GuiClone)
    forceBarState(GuiClone)
    personalizeGui(GuiClone)
    GuiClone.Parent = PlayerGui
end

local storage = ReplicatedStorage:WaitForChild("Masters(Storage)", 15)
local events = storage and storage:WaitForChild("Events", 10)

-- ============================================================
--  REMOTE MOCKS
-- ============================================================

local MockInvoke = {}
local MockFire = {}
local eventsFullPath = events and events:GetFullName() or ""
local eventsPathLen = #eventsFullPath

local function relativePath(instance)
    local full = instance:GetFullName()
    if eventsFullPath ~= "" and full:sub(1, eventsPathLen) == eventsFullPath then
        return full:sub(eventsPathLen + 2)
    end
    return full
end

local function onInvoke(path, fn) MockInvoke[path] = fn end
local function onFire(path, fn) MockFire[path] = fn end

local function libraryResponse()
    return {
        Songs = LocalData.Library.Songs or localAudioIds(),
        Artists = LocalData.Library.Artists or { "Roblox" },
        Playlists = LocalData.Library.Playlists or {},
    }
end

local function defaultInvoke(path, ...)
    local lower = tostring(path or ""):lower()
    local args = { ... }

    if lower:find("check") and lower:find("version") then return true, CONFIG.FAKE_VERSION end
    if lower:find("version") then return CONFIG.FAKE_VERSION end
    if lower:find("settings") then return LocalData.Settings end
    if lower:find("preference") then return LocalData.Preferences end
    if lower:find("algorithm") then return LocalData.Algorithm end
    if lower:find("library") and lower:find("fetch") then return libraryResponse() end
    if lower:find("configuration") then return LocalData.Configuration end
    if lower:find("localstations") then return LocalData.LocalStations end
    if lower:find("stations") then return {} end
    if lower:find("filter") then return args[2] or args[1] or "" end
    if lower:find("listener") then return {} end
    if lower:find("playlist") and lower:find("get") then return {} end
    if lower:find("session") then return nil end
    if lower:find("share") then return false, "Disabled" end
    if lower:find("is") or lower:find("has") or lower:find("can") then return false end
    if lower:find("create") or lower:find("set") or lower:find("add") or lower:find("copy")
        or lower:find("delete") or lower:find("pin") or lower:find("update")
        or lower:find("complete") or lower:find("ready") then
        return true
    end
    if lower:find("get") or lower:find("fetch") or lower:find("load") or lower:find("search") then return {} end
    return true
end

local function defaultFire()
    return true
end

-- Version / onboarding / settings
onInvoke("Main.GetVersion", function() return CONFIG.FAKE_VERSION end)
onInvoke("Main.FetchVersion", function() return CONFIG.FAKE_VERSION end)
onInvoke("Main.CheckVersion", function() return true, CONFIG.FAKE_VERSION end)
onInvoke("Main.Version", function() return CONFIG.FAKE_VERSION end)
onInvoke("Main.VersionCheck", function() return true, CONFIG.FAKE_VERSION end)
onInvoke("Main.UpdateCheck", function() return true, CONFIG.FAKE_VERSION end)
onInvoke("Main.IsUpToDate", function() return true end)
onInvoke("Main.GetLatestVersion", function() return CONFIG.FAKE_VERSION end)
onInvoke("Main.Setup.GetVersion", function() return CONFIG.FAKE_VERSION end)
onInvoke("Main.Onboarding.GetVersion", function() return CONFIG.FAKE_VERSION end)
onInvoke("Main.Onboarding.GetStatus", function() return true, "complete" end)
onInvoke("Main.Onboarding.IsComplete", function() return true end)
onInvoke("Main.Onboarding.GetStep", function() return "complete" end)
onInvoke("Main.Setup.GetStatus", function() return true, "ready" end)
onInvoke("Main.Setup.IsReady", function() return true end)
onInvoke("Main.ServerReady", function() return true end)
onInvoke("Main.GameReady", function() return true end)
onFire("Main.Onboarding.SetupComplete", function() end)
onFire("Main.Onboarding.Complete", function() end)
onFire("Main.Setup.RunGame", function() end)
onFire("Main.ServerReady", function() end)

onInvoke("Main.Settings.FetchSettings", function() return LocalData.Settings end)
onInvoke("Modules.Settings.FetchSettings", function() return LocalData.Settings end)
onFire("Main.Settings.SetSettings", function(newSettings)
    if type(newSettings) == "table" then
        for key, value in pairs(newSettings) do LocalData.Settings[key] = value end
        saveData()
    end
end)

onInvoke("Main.Algorithm.FetchAlgorithm", function() return LocalData.Algorithm end)
onInvoke("Main.Library.FetchLibrary", libraryResponse)
onInvoke("Main.Preferences.FetchPreference", function() return LocalData.Preferences end)
onInvoke("Modules.Configuration.GetConfiguration", function() return LocalData.Configuration end)
onInvoke("Modules.Configuration.GetConfigurationServer", function() return LocalData.Configuration end)
onInvoke("Modules.Configuration.GetLocalStations", function() return LocalData.LocalStations end)
onInvoke("Modules.Configuration.GetLocalStationsServer", function() return LocalData.LocalStations end)
onInvoke("Modules.OnlineStations.GetStationsIndex", function() return {} end)
onInvoke("Modules.TextFiltering.FilterText", function(_, text) return text end)
onInvoke("Modules.Listeners.GetListeners", function() return {} end)
onInvoke("Modules.Listeners.GetCurrentTimestamp", function() return 0 end)
onInvoke("Main.SessionSaving.FetchSavedSession", function() return nil end)
onFire("Main.SessionSaving.SetPlaybackState", function() end)

-- Common library/preference mutations
onInvoke("Main.Library.SetSong", function(songId, add)
    local songs = LocalData.Library.Songs
    if add then
        if not table.find(songs, songId) then table.insert(songs, songId) end
    else
        local idx = table.find(songs, songId)
        if idx then table.remove(songs, idx) end
    end
    saveData()
    return true
end)
onInvoke("Main.Library.IsSongSaved", function(songId) return table.find(LocalData.Library.Songs, songId) ~= nil end)
onInvoke("Main.Library.SetArtist", function(artist, add)
    local artists = LocalData.Library.Artists
    if add then
        if not table.find(artists, artist) then table.insert(artists, artist) end
    else
        local idx = table.find(artists, artist)
        if idx then table.remove(artists, idx) end
    end
    saveData()
    return true
end)
onInvoke("Main.Library.IsArtistSaved", function(artist) return table.find(LocalData.Library.Artists, artist) ~= nil end)
onInvoke("Main.Library.GetPlaylists", function() return {} end)
onInvoke("Main.Library.IsPinned", function() return false end)
onFire("Main.Library.Pin", function() end)
onFire("Main.Library.DeletePlaylist", function() end)

onInvoke("Main.Preferences.FavoriteSong", function(songId, add)
    local list = LocalData.Preferences.Songs.Favorite
    local idx = table.find(list, songId)
    if add and not idx then table.insert(list, songId) elseif (not add) and idx then table.remove(list, idx) end
    saveData()
    return true
end)
onInvoke("Main.Preferences.IsSongFavorite", function(songId) return table.find(LocalData.Preferences.Songs.Favorite, songId) ~= nil end)
onInvoke("Main.Preferences.DislikeSong", function(songId, add)
    local list = LocalData.Preferences.Songs.Dislike
    local idx = table.find(list, songId)
    if add and not idx then table.insert(list, songId) elseif (not add) and idx then table.remove(list, idx) end
    saveData()
    return true
end)
onInvoke("Main.Preferences.IsSongDislike", function(songId) return table.find(LocalData.Preferences.Songs.Dislike, songId) ~= nil end)
onInvoke("Main.Preferences.BlockArtist", function(artist, add)
    local list = LocalData.Preferences.Artists.Block
    local idx = table.find(list, artist)
    if add and not idx then table.insert(list, artist) elseif (not add) and idx then table.remove(list, idx) end
    saveData()
    return true
end)
onInvoke("Main.Preferences.IsArtistBlock", function(artist) return table.find(LocalData.Preferences.Artists.Block, artist) ~= nil end)

-- ============================================================
--  ENGINE / SERVICE MOCKS
-- ============================================================

local function textFilterResult(text)
    local object = {}
    function object:GetChatForUserAsync() return text or "" end
    function object:GetNonChatStringForBroadcastAsync() return text or "" end
    function object:GetNonChatStringForUserAsync() return text or "" end
    return object
end

local function serviceFallback(method, ...)
    local lower = tostring(method or ""):lower()
    if lower:find("async") then
        if lower:find("badge") or lower:find("owns") or lower:find("can") or lower:find("is") then return false end
        if lower:find("thumbnail") then return "rbxthumb://type=AvatarHeadShot&id=" .. tostring(client.UserId) .. "&w=150&h=150", true end
        if lower:find("info") then return {} end
        return {}
    end
    if lower:sub(1, 3) == "get" then
        if lower:find("mouse") or lower:find("position") or lower:find("inset") then return Vector2.zero, Vector2.zero end
        if lower:find("thumbnail") then return "rbxthumb://type=AvatarHeadShot&id=" .. tostring(client.UserId) .. "&w=150&h=150", true end
        if lower:find("name") then return username() end
        if lower:find("id") then return client.UserId end
        return {}
    end
    if lower:sub(1, 3) == "set" or lower:find("prompt") or lower:find("teleport")
        or lower:find("preload") or lower:find("award") or lower:find("vibrate")
        or lower:find("send") then
        return nil
    end
    return nil
end

local function hookServicesAndRemotes()
    if not hookmetamethod then
        Warn("hookmetamethod missing; remote mocking is limited")
        return
    end

    local original
    original = hookmetamethod(game, "__namecall", function(self, ...)
        local method = getnamecallmethod()
        local okDesc, isDesc = pcall(function() return self:IsDescendantOf(game) end)
        if not okDesc or not isDesc then return original(self, ...) end

        if self == AssetService then
            if method == "GetAudioMetadataAsync" then return localAudioMetadata((...)) end
            if method == "SearchAudio" then return localAudioPages() end
            return serviceFallback(method, ...)
        end

        if self == Players then
            local first = ...
            if method == "GetNameFromUserIdAsync" then return tonumber(first) == client.UserId and client.Name or ("Player_" .. tostring(first)) end
            if method == "GetUserIdFromNameAsync" then return client.UserId end
            if method == "GetUserThumbnailAsync" then return "rbxthumb://type=AvatarHeadShot&id=" .. tostring(first or client.UserId) .. "&w=150&h=150", true end
            if method == "GetPlayerByUserId" then return tonumber(first) == client.UserId and client or nil end
            if method == "GetPlayers" then return { client } end
            return serviceFallback(method, ...)
        end

        if self == UserService and method == "GetUserInfosByUserIdsAsync" then
            local ids = (...)
            if type(ids) ~= "table" then ids = { client.UserId } end
            local result = {}
            for _, id in ipairs(ids) do
                table.insert(result, { Id = id, Username = tonumber(id) == client.UserId and client.Name or ("Player_" .. tostring(id)), DisplayName = tonumber(id) == client.UserId and client.DisplayName or ("Player " .. tostring(id)) })
            end
            return result
        end

        if self == MarketplaceService and method == "GetProductInfo" then
            local assetId = tonumber((...)) or 0
            local meta = localAudioMetadata({ assetId })[1]
            return { AssetId = assetId, Name = meta.Title, Description = "Mocked asset", Creator = meta.Creator, AssetTypeId = 3 }
        end

        if self == PolicyService and method == "GetPolicyInfoForPlayerAsync" then
            return { AreAdsAllowed = false, IsPaidRandomItemsRestricted = false, AllowedExternalLinkReferences = {}, IsSubjectToChinaPolicies = false }
        end

        if self == TextService then
            local text = tostring((...) or "")
            if method == "FilterStringAsync" then return textFilterResult(text) end
            if method == "GetTextSize" or method == "GetTextBoundsAsync" then return Vector2.new(math.max(#text * 8, 16), 18) end
            return serviceFallback(method, ...)
        end

        if self == HttpService then
            if method == "GetAsync" or method == "PostAsync" then return HttpService:JSONEncode({ ok = true, values = {} }) end
            if method == "RequestAsync" then return { Success = true, StatusCode = 200, Body = HttpService:JSONEncode({ ok = true }) } end
            return serviceFallback(method, ...)
        end

        if self == ContentProvider or self == HapticService or self == GuiService or self == UserInputService
            or self == BadgeService or self == TeleportService or self == SocialService or self == AvatarEditorService
            or self == GroupService or self == StarterGui then
            if self == GuiService and method == "GetGuiInset" then return Vector2.zero, Vector2.zero end
            if self == UserInputService and method == "GetMouseLocation" then return Vector2.zero end
            if self == UserInputService and method == "GetLastInputType" then return Enum.UserInputType.Touch end
            if self == UserInputService and (method == "IsKeyDown" or method == "IsMouseButtonPressed") then return false end
            if self == BadgeService and method == "UserHasBadgeAsync" then return false end
            if self == SocialService and method == "CanSendGameInviteAsync" then return false end
            if self == GroupService and method == "GetGroupInfoAsync" then return { Id = tonumber((...)) or 0, Name = "Mock Group" } end
            return serviceFallback(method, ...)
        end

        if method == "InvokeServer" then
            local okRF, isRF = pcall(function() return self:IsA("RemoteFunction") end)
            if okRF and isRF then
                local path = relativePath(self)
                local handler = MockInvoke[path]
                if handler then return handler(...) end
                if events and self:IsDescendantOf(events) then
                    Warn("Fallback InvokeServer:", path)
                    return defaultInvoke(path, ...)
                end
            end
        elseif method == "FireServer" then
            local okRE, isRE = pcall(function() return self:IsA("RemoteEvent") end)
            if okRE and isRE then
                local path = relativePath(self)
                local handler = MockFire[path]
                if handler then handler(...); return end
                if events and self:IsDescendantOf(events) then
                    Warn("Fallback FireServer:", path)
                    defaultFire(path, ...)
                    return
                end
            end
        end

        return original(self, ...)
    end)

    Log("__namecall hook installed")
end

hookServicesAndRemotes()

-- ============================================================
--  MODULE PATCHES
-- ============================================================

local function patchModules()
    local modules = storage and storage:FindFirstChild("Modules")
    if not modules then return end

    local utilitiesModule = modules:FindFirstChild("Utilities")
    if utilitiesModule then
        local ok, utilities = pcall(require, utilitiesModule)
        if ok and type(utilities) == "table" then
            utilities.GetViewportRatio = function() return 0 end
            utilities.Haptic = function() end
            utilities.GetPlayerThumbnail = function(userId)
                return "rbxthumb://type=AvatarHeadShot&id=" .. tostring(userId or client.UserId) .. "&w=150&h=150"
            end
        end
    end

    local audiosModule = modules:FindFirstChild("Audios")
    if audiosModule then
        local ok, audios = pcall(require, audiosModule)
        if ok and type(audios) == "table" then
            local loaded = false
            audios.GetAudioMetadataAsync = function(assetIds) return localAudioMetadata(assetIds) end
            audios.LoadAudios = function(container)
                task.spawn(function()
                    local chunk = localAudioMetadata(localAudioIds())
                    if container then container[1] = chunk end
                    pcall(function() audios.ChunkLoaded:Fire(1, chunk) end)
                    task.wait(CONFIG.AUDIO_CHUNK_DELAY)
                    loaded = true
                    pcall(function() audios.ChunkLoadingFinished:Fire() end)
                end)
            end
            audios.IsLoaded = function() return loaded end
            audios.SearchAudiosByKeyword = function()
                local signal = audios.SearchedAudio or { Fire = function() end }
                return { ChunkLoaded = signal, Advance = function() end, Results = localAudioMetadata(localAudioIds()), Finished = true }
            end
        end
    end

    local mainModule = modules:FindFirstChild("Main")
    if mainModule then
        local ok, main = pcall(require, mainModule)
        if ok and type(main) == "table" and type(main.SetState) == "function" and not main.__MastersCleanPatched then
            main.__MastersCleanPatched = true
            local originalSetState = main.SetState
            main.SetState = function(state)
                local result = originalSetState(state)
                if state == "Bar" then task.defer(function() forceBarState(PlayerGui:FindFirstChild("Masters")) end) end
                return result
            end
        end
    end
end

patchModules()

-- ============================================================
--  START HANDLER / UI READY
-- ============================================================

task.wait(0.25)

if HandlerScript then
    local handler = HandlerScript:Clone()
    handler.Disabled = true
    handler.Parent = GuiClone or PlayerGui
    local ok, err = pcall(function() handler.Disabled = false end)
    if ok then Log("Handler started") else Warn("Handler start error:", err) end
end

task.delay(CONFIG.REVEAL_DELAY, function()
    if GuiClone and GuiClone.Parent then
        forceBarState(GuiClone)
        hydrateGui(GuiClone)
        GuiClone.Enabled = true
    end
end)

task.spawn(function()
    while task.wait(2) do
        if GuiClone and GuiClone.Parent then hydrateGui(GuiClone) else break end
    end
end)

if writefile then
    task.spawn(function()
        while task.wait(60) do saveData() end
    end)
end

print("╔══════════════════════════════════════════╗")
print("║  Masters Standalone Executor [CLEAN v10] ║")
print("╠══════════════════════════════════════════╣")
print("║  NEW: single clean run.lua               ║")
print("║  MOCK: remotes + engine services         ║")
print("║  UI: username hydrate + interactable     ║")
print("╚══════════════════════════════════════════╝")

-- ============================================================
--  MASTERS STANDALONE EXECUTOR [CLEAN v12 - FULL MOCK FIX]
--  Fix so với v11:
--    1. STORAGE_MOCKS["Main"]  → thêm đủ signals + methods
--    2. STORAGE_MOCKS["Queue"] → viết lại hoàn toàn thành
--                                 playback manager (v11 sai)
--    3. STORAGE_MOCKS["Smoothness"] → thêm ApproachInHeartbeat
--    4. STORAGE_MOCKS["Utilities"]  → thêm GenerateArtistGradient,
--                                     GetInitials, ArrangeByFrequency,
--                                     HowSimilar, ISOToEpoch
--    5. STORAGE_MOCKS["Audios"]        → thêm LoadArtist
--    6. STORAGE_MOCKS["OnlineStations"]→ thêm GetOnlineStations
--    7. STORAGE_MOCKS["LyricsEngine"]  → thêm HasLyrics
-- ============================================================

local CONFIG = {
    USE_LOCAL_FILE  = true,
    LOCAL_FILE_PATH = "Masters.rbxmx",
    ASSET_ID        = 0,
    SAVE_FILE       = "masters_local_data.json",
    DEBUG           = false,
    FAKE_VERSION    = "102",
    REVEAL_DELAY    = 0.75,
    AUDIO_CHUNK_DELAY = 0.25,
    RUN_HANDLER      = true,
}

if getgenv and getgenv().__MastersStandaloneBooting then
    warn("[Masters] Existing runtime detected, skipping duplicate bootstrap.")
    return
end
if getgenv then
    getgenv().__MastersStandaloneBooting = true
end

local function Log(...)  if CONFIG.DEBUG then print("[Masters]", ...) end end
local function Warn(...) warn("[Masters]", ...) end

-- ============================================================
--  SERVICES
-- ============================================================
local Players             = game:GetService("Players")
local ReplicatedStorage   = game:GetService("ReplicatedStorage")
local InsertService       = game:GetService("InsertService")
local HttpService         = game:GetService("HttpService")
local AssetService        = game:GetService("AssetService")
local MarketplaceService  = game:GetService("MarketplaceService")
local PolicyService       = game:GetService("PolicyService")
local UserService         = game:GetService("UserService")
local ContentProvider     = game:GetService("ContentProvider")
local TextService         = game:GetService("TextService")
local HapticService       = game:GetService("HapticService")
local GuiService          = game:GetService("GuiService")
local UserInputService    = game:GetService("UserInputService")
local BadgeService        = game:GetService("BadgeService")
local TeleportService     = game:GetService("TeleportService")
local SocialService       = game:GetService("SocialService")
local AvatarEditorService = game:GetService("AvatarEditorService")
local GroupService        = game:GetService("GroupService")
local StarterGui          = game:GetService("StarterGui")
local TweenService        = game:GetService("TweenService")
local RunService          = game:GetService("RunService")

local client    = Players.LocalPlayer
local PlayerGui = client:WaitForChild("PlayerGui")

-- ============================================================
--  LOCAL MOCK AUDIO LIBRARY
-- ============================================================
local LOCAL_AUDIO_LIBRARY = {
    { Id = 1843529634, Title = "Relaxed Scene",      Artist = "Roblox", Duration = 183, Tags = {"ambient","chill"} },
    { Id = 1845756489, Title = "Town Talk",           Artist = "Roblox", Duration = 124, Tags = {"pop","bright"} },
    { Id = 1841647093, Title = "Life in an Elevator", Artist = "Roblox", Duration = 91,  Tags = {"electronic","chill"} },
    { Id = 1837849285, Title = "Happy Home",          Artist = "Roblox", Duration = 134, Tags = {"happy","pop"} },
    { Id = 1846458016, Title = "No More",             Artist = "Roblox", Duration = 156, Tags = {"electronic","dance"} },
    { Id = 1848354536, Title = "Sunny",               Artist = "Roblox", Duration = 138, Tags = {"bright","pop"} },
    { Id = 9048375035, Title = "Lo-Fi Chill A", Artist = client.Name, Duration = 142, Tags = {"lofi","chill"} },
    { Id = 9048376689, Title = "Lo-Fi Chill B", Artist = client.Name, Duration = 165, Tags = {"lofi","ambient"} },
}

local function cloneArray(src)
    local out = {}; for i,v in ipairs(src or {}) do out[i]=v end; return out
end
local function cloneAudio(e)
    return {
        Id=e.Id, AssetId=e.Id, SongId=e.Id,
        Title=e.Title, Name=e.Title, Artist=e.Artist,
        Creator={Id=1,Name=e.Artist,CreatorType="User"},
        Duration=e.Duration, Tags=cloneArray(e.Tags),
    }
end
local function localAudioIds()
    local ids={}; for _,e in ipairs(LOCAL_AUDIO_LIBRARY) do table.insert(ids,e.Id) end; return ids
end
local function localAudioMetadata(assetIds)
    if type(assetIds)~="table" then assetIds={assetIds} end
    local byId={}
    for _,e in ipairs(LOCAL_AUDIO_LIBRARY) do byId[tonumber(e.Id)]=e end
    local result={}
    for idx,aid in ipairs(assetIds or {}) do
        local e=byId[tonumber(aid)] or LOCAL_AUDIO_LIBRARY[((idx-1)%#LOCAL_AUDIO_LIBRARY)+1]
        table.insert(result,cloneAudio(e))
    end
    return result
end
local function localAudioPages()
    local pages={IsFinished=true}
    function pages:GetCurrentPage() return localAudioMetadata(localAudioIds()) end
    function pages:AdvanceToNextPageAsync() self.IsFinished=true end
    return pages
end

-- ============================================================
--  SETTINGS / SAVE
-- ============================================================
local function defaultSettings()
    return {
        Playback={Crossfade={Enabled=true,Duration=3},Equalizer={Enabled=false,HighGain=0,MidGain=0,LowGain=0}},
        Extras={Glow=false,PlaybackHaptics=false},
        Socials={ListeningVisibility=false,Sharing=false},
    }
end

local LocalData = {
    Settings    = defaultSettings(),
    Preferences = {Artists={Block={}},Songs={Favorite={},Dislike={}}},
    Algorithm   = {
        Artists={{Name="Roblox",Relevance=20,LastUpdate=os.time()}},
        Tags   ={{Tag="chill", Relevance=20,LastUpdate=os.time()}},
        Songs  = {},
    },
    Library      = {Artists={"Roblox"},Songs=localAudioIds(),Playlists={}},
    LocalStations= {},
    Configuration= {
        Access  ={PermitEveryone=true,LinkPasses={},LinkGroups={},LinkPlayers={}},
        Stations={AutoStart="",OnlineStations=true},
        CustomSections={
            LocalMastersPicks={Name="Masters Picks",Songs=localAudioIds()},
        },
    },
}

local function tryLoadSave()
    if not readfile then return end
    local ok,saved=pcall(function() return HttpService:JSONDecode(readfile(CONFIG.SAVE_FILE)) end)
    if ok and type(saved)=="table" then
        if type(saved.Settings)=="table"      then LocalData.Settings     =saved.Settings      end
        if type(saved.Preferences)=="table"   then LocalData.Preferences  =saved.Preferences   end
        if type(saved.Library)=="table"       then LocalData.Library       =saved.Library       end
        if type(saved.LocalStations)=="table" then LocalData.LocalStations =saved.LocalStations end
    end
    LocalData.Settings.Extras=LocalData.Settings.Extras or {}
    LocalData.Settings.Extras.Glow=false
    LocalData.Settings.Extras.PlaybackHaptics=false
end
local function saveData()
    if not writefile then return end
    pcall(function()
        writefile(CONFIG.SAVE_FILE, HttpService:JSONEncode({
            Settings=LocalData.Settings, Preferences=LocalData.Preferences,
            Library=LocalData.Library,   LocalStations=LocalData.LocalStations,
        }))
    end)
end
tryLoadSave()

-- ============================================================
--  MOBILE DETECTION
-- ============================================================
local function IsMobileExecutor()
    if CONFIG.FORCE_MOBILE_UI==true  then return true  end
    if CONFIG.FORCE_MOBILE_UI==false then return false end
    local ok,result=pcall(function()
        local cam=workspace.CurrentCamera
        local vp=cam and cam.ViewportSize or Vector2.zero
        local touchOnly=UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled and not UserInputService.MouseEnabled
        local phoneLike=vp.X>0 and vp.Y>0 and math.min(vp.X,vp.Y)<=700
        return UserInputService.TouchEnabled and (touchOnly or phoneLike)
    end)
    return ok and result==true
end
local MOBILE_EXECUTOR=IsMobileExecutor()
local function ApplyMobileSettingsDefaults()
    if not MOBILE_EXECUTOR then return end
    if type(LocalData.Settings)~="table" then LocalData.Settings=defaultSettings() end
    LocalData.Settings.Extras=LocalData.Settings.Extras or {}
    LocalData.Settings.Extras.Glow=false
    LocalData.Settings.Extras.PlaybackHaptics=false
end
ApplyMobileSettingsDefaults()

-- ============================================================
--  MODEL LOADING
-- ============================================================
local function loadRoot()
    if CONFIG.USE_LOCAL_FILE and getcustomasset then
        local ok,url=pcall(getcustomasset,CONFIG.LOCAL_FILE_PATH)
        if ok and url then
            local ok2,objs=pcall(function() return game:GetObjects(url) end)
            if ok2 and type(objs)=="table" and #objs>0 then
                for _,obj in ipairs(objs) do
                    if obj.Name=="Masters" or obj:FindFirstChild("MainFile") then return obj end
                end
                return objs[1]
            end
            Warn("game:GetObjects failed:",tostring(objs))
        else Warn("getcustomasset failed:",tostring(url)) end
    end
    if CONFIG.ASSET_ID~=0 then
        local ok,asset=pcall(function() return InsertService:LoadAsset(CONFIG.ASSET_ID) end)
        if ok and asset then return asset:GetChildren()[1] or asset end
        Warn("InsertService failed:",tostring(asset))
    end
    error("[Masters] Could not load Masters.rbxmx",2)
end
local function findGui(root)
    local mf=root:FindFirstChild("MainFile")
    local sv=mf and mf:FindFirstChild("Masters(Server)")
    local cp=sv and sv:FindFirstChild("Components")
    local dr=cp and cp:FindFirstChild("Masters")
    if dr and dr:IsA("ScreenGui") then return dr end
    for _,obj in ipairs(root:GetDescendants()) do
        if obj:IsA("ScreenGui") and obj:FindFirstChild("Handler",true) then return obj end
    end
end
local function disableEmbeddedScripts(gui)
    if not gui then return end
    for _,obj in ipairs(gui:GetDescendants()) do
        if obj:IsA("LocalScript") then
            obj.Disabled=true
        end
    end
end
local MastersRoot   = loadRoot()
local StorageFolder = MastersRoot:FindFirstChild("Masters(Storage)",true)
local MastersGui    = findGui(MastersRoot)
local HandlerScript = MastersGui and MastersGui:FindFirstChild("Handler",true)
if not StorageFolder then error("[Masters] Masters(Storage) not found",2) end
if not MastersGui    then Warn("Game ScreenGui not found") end
if not HandlerScript then Warn("Handler not found") end

-- ============================================================
--  UI HELPERS
-- ============================================================
local function username() return client.Name or "Player" end

local function forceBarState(gui)
    if not gui then return end
    local interface=gui:FindFirstChild("Interface",true)
    local frame    =interface and interface:FindFirstChild("Frame")
    local bar      =frame and frame:FindFirstChild("Bar")
    local page     =frame and frame:FindFirstChildWhichIsA("UIPageLayout")
    if interface and interface:IsA("GuiObject") then
        interface:SetAttribute("State","Bar")
        interface.AnchorPoint      =Vector2.new(0.5,1)
        interface.Position         =UDim2.new(0.5,0,1,-100)
        interface.Size             =UDim2.fromOffset(310,120)
        interface.ImageTransparency=0.8
        interface.Active           =true
        pcall(function() interface.Interactable=true end)
        pcall(function() interface.ClipsDescendants=false end)
    end
    if frame then
        pcall(function() frame.Modal=false end)
        pcall(function() frame.Active=true end)
    end
    if page and bar then pcall(function() page:JumpTo(bar) end) end
end

local function personalizeGui(gui)
    if not gui then return end
    for _,obj in ipairs(gui:GetDescendants()) do
        if obj:IsA("TextLabel") or obj:IsA("TextButton") or obj:IsA("TextBox") then
            local ok,text=pcall(function() return obj.Text end)
            if ok and type(text)=="string" then
                local l=text:lower()
                if l=="river" or l=="@river" then obj.Text=username() end
            end
        end
    end
    local uf=gui:FindFirstChild("User",true)
    local dp=uf and uf:FindFirstChild("Display",true)
    if dp and (dp:IsA("TextLabel") or dp:IsA("TextButton") or dp:IsA("TextBox")) then
        dp.Text=username()
    end
end

local function hydrateGui(gui)
    if not gui then return end
    personalizeGui(gui)
    for _,obj in ipairs(gui:GetDescendants()) do
        if obj:IsA("GuiObject") then
            pcall(function() obj.Active=true end)
            pcall(function() obj.Interactable=true end)
            if obj:IsA("GuiButton") then
                pcall(function() obj.Selectable=true end)
                pcall(function() obj.AutoButtonColor=true end)
            end
            local l=obj.Name:lower()
            if l=="loading" or l=="spinner" or l=="throbber" then
                pcall(function() obj.Visible=false end)
            end
        end
    end
end

-- ============================================================
--  INJECT STORAGE / GUI
-- ============================================================
local oldStorage=ReplicatedStorage:FindFirstChild("Masters(Storage)")
if oldStorage then oldStorage:Destroy() end
local StorageClone=StorageFolder:Clone()
StorageClone.Parent=ReplicatedStorage

local oldGui=PlayerGui:FindFirstChild("Masters")
if oldGui then oldGui:Destroy() end

local GuiClone
if MastersGui then
    GuiClone=MastersGui:Clone()
    GuiClone.Enabled=false
    disableEmbeddedScripts(GuiClone)
    forceBarState(GuiClone)
    personalizeGui(GuiClone)
    GuiClone.Parent=PlayerGui
end

local storage=ReplicatedStorage:WaitForChild("Masters(Storage)",15)
local events =storage and storage:WaitForChild("Events",10)

-- ============================================================
--  REMOTE MOCKS
-- ============================================================
local MockInvoke,MockFire={},{}
local function onInvoke(p,fn) MockInvoke[p]=fn end
local function onFire(p,fn)   MockFire[p]=fn   end

local function libraryResponse()
    return {
        Songs    =LocalData.Library.Songs    or localAudioIds(),
        Artists  =LocalData.Library.Artists  or {"Roblox"},
        Playlists=LocalData.Library.Playlists or {},
    }
end
local function defaultInvoke(path,...)
    local l=tostring(path or ""):lower(); local args={...}
    if l:find("check") and l:find("version") then return true,CONFIG.FAKE_VERSION end
    if l:find("version")       then return CONFIG.FAKE_VERSION end
    if l:find("settings")      then return LocalData.Settings end
    if l:find("preference")    then return LocalData.Preferences end
    if l:find("algorithm")     then return LocalData.Algorithm end
    if l:find("library") and l:find("fetch") then return libraryResponse() end
    if l:find("configuration") then return LocalData.Configuration end
    if l:find("localstations") then return LocalData.LocalStations end
    if l:find("stations")      then return {} end
    if l:find("filter")        then return args[2] or args[1] or "" end
    if l:find("listener")      then return {} end
    if l:find("playlist") and l:find("get") then return {} end
    if l:find("session")       then return nil end
    if l:find("share")         then return false,"Disabled" end
    if l:find("is") or l:find("has") or l:find("can") then return false end
    if l:find("create") or l:find("set") or l:find("add") or l:find("copy")
    or l:find("delete") or l:find("pin") or l:find("update")
    or l:find("complete") or l:find("ready") then return true end
    if l:find("get") or l:find("fetch") or l:find("load") or l:find("search") then return {} end
    return true
end
local function defaultFire() return true end

-- Version / onboarding
onInvoke("Main.GetVersion",            function() return CONFIG.FAKE_VERSION end)
onInvoke("Main.FetchVersion",          function() return CONFIG.FAKE_VERSION end)
onInvoke("Main.CheckVersion",          function() return true,CONFIG.FAKE_VERSION end)
onInvoke("Main.Version",               function() return CONFIG.FAKE_VERSION end)
onInvoke("Main.VersionCheck",          function() return true,CONFIG.FAKE_VERSION end)
onInvoke("Main.UpdateCheck",           function() return true,CONFIG.FAKE_VERSION end)
onInvoke("Main.IsUpToDate",            function() return true end)
onInvoke("Main.GetLatestVersion",      function() return CONFIG.FAKE_VERSION end)
onInvoke("Main.Setup.GetVersion",      function() return CONFIG.FAKE_VERSION end)
onInvoke("Main.Onboarding.GetVersion", function() return CONFIG.FAKE_VERSION end)
onInvoke("Main.Onboarding.GetStatus",  function() return true,"complete" end)
onInvoke("Main.Onboarding.IsComplete", function() return true end)
onInvoke("Main.Onboarding.GetStep",    function() return "complete" end)
onInvoke("Main.Setup.GetStatus",       function() return true,"ready" end)
onInvoke("Main.Setup.IsReady",         function() return true end)
onInvoke("Main.ServerReady",           function() return true end)
onInvoke("Main.GameReady",             function() return true end)
onFire("Main.Onboarding.SetupComplete",function() end)
onFire("Main.Onboarding.Complete",     function() end)
onFire("Main.Setup.RunGame",           function() end)
onFire("Main.ServerReady",             function() end)

onInvoke("Main.Settings.FetchSettings",    function() return LocalData.Settings end)
onInvoke("Modules.Settings.FetchSettings", function() return LocalData.Settings end)
onFire("Main.Settings.SetSettings", function(d)
    if type(d)=="table" then for k,v in pairs(d) do LocalData.Settings[k]=v end saveData() end
end)
onInvoke("Main.Algorithm.FetchAlgorithm",               function() return LocalData.Algorithm end)
onInvoke("Main.Library.FetchLibrary",                    libraryResponse)
onInvoke("Main.Preferences.FetchPreference",             function() return LocalData.Preferences end)
onInvoke("Modules.Configuration.GetConfiguration",       function() return LocalData.Configuration end)
onInvoke("Modules.Configuration.GetConfigurationServer", function() return LocalData.Configuration end)
onInvoke("Modules.Configuration.GetLocalStations",       function() return LocalData.LocalStations end)
onInvoke("Modules.Configuration.GetLocalStationsServer", function() return LocalData.LocalStations end)
onInvoke("Modules.OnlineStations.GetStationsIndex",      function() return {} end)
onInvoke("Modules.TextFiltering.FilterText",             function(_,text) return text end)
onInvoke("Modules.Listeners.GetListeners",               function() return {} end)
onInvoke("Modules.Listeners.GetCurrentTimestamp",        function() return 0 end)
onInvoke("Main.SessionSaving.FetchSavedSession",         function() return nil end)
onFire("Main.SessionSaving.SetPlaybackState",            function() end)

onInvoke("Main.Library.SetSong", function(id,add)
    local s=LocalData.Library.Songs
    if add then if not table.find(s,id) then table.insert(s,id) end
    else local i=table.find(s,id); if i then table.remove(s,i) end end
    saveData(); return true
end)
onInvoke("Main.Library.IsSongSaved",  function(id) return table.find(LocalData.Library.Songs,id)~=nil end)
onInvoke("Main.Library.SetArtist", function(a,add)
    local ar=LocalData.Library.Artists
    if add then if not table.find(ar,a) then table.insert(ar,a) end
    else local i=table.find(ar,a); if i then table.remove(ar,i) end end
    saveData(); return true
end)
onInvoke("Main.Library.IsArtistSaved",  function(a) return table.find(LocalData.Library.Artists,a)~=nil end)
onInvoke("Main.Library.GetPlaylists",   function() return {} end)
onInvoke("Main.Library.IsPinned",       function() return false end)
onFire("Main.Library.Pin",              function() end)
onFire("Main.Library.DeletePlaylist",   function() end)

onInvoke("Main.Preferences.FavoriteSong", function(id,add)
    local l=LocalData.Preferences.Songs.Favorite; local i=table.find(l,id)
    if add and not i then table.insert(l,id) elseif not add and i then table.remove(l,i) end
    saveData(); return true
end)
onInvoke("Main.Preferences.IsSongFavorite", function(id)
    return table.find(LocalData.Preferences.Songs.Favorite,id)~=nil end)
onInvoke("Main.Preferences.DislikeSong", function(id,add)
    local l=LocalData.Preferences.Songs.Dislike; local i=table.find(l,id)
    if add and not i then table.insert(l,id) elseif not add and i then table.remove(l,i) end
    saveData(); return true
end)
onInvoke("Main.Preferences.IsSongDislike", function(id)
    return table.find(LocalData.Preferences.Songs.Dislike,id)~=nil end)
onInvoke("Main.Preferences.BlockArtist", function(a,add)
    local l=LocalData.Preferences.Artists.Block; local i=table.find(l,a)
    if add and not i then table.insert(l,a) elseif not add and i then table.remove(l,i) end
    saveData(); return true
end)
onInvoke("Main.Preferences.IsArtistBlock", function(a)
    return table.find(LocalData.Preferences.Artists.Block,a)~=nil end)

-- ============================================================
--  ENGINE / SERVICE MOCKS
-- ============================================================
local function textFilterResult(text)
    local obj={}
    function obj:GetChatForUserAsync()               return text or "" end
    function obj:GetNonChatStringForBroadcastAsync() return text or "" end
    function obj:GetNonChatStringForUserAsync()      return text or "" end
    return obj
end
local function serviceFallback(method,...)
    local l=tostring(method or ""):lower()
    if l:find("async") then
        if l:find("badge") or l:find("owns") or l:find("can") or l:find("is") then return false end
        if l:find("thumbnail") then
            return "rbxthumb://type=AvatarHeadShot&id="..tostring(client.UserId).."&w=150&h=150",true end
        if l:find("info") then return {} end; return {}
    end
    if l:sub(1,3)=="get" then
        if l:find("mouse") or l:find("position") or l:find("inset") then return Vector2.zero,Vector2.zero end
        if l:find("thumbnail") then
            return "rbxthumb://type=AvatarHeadShot&id="..tostring(client.UserId).."&w=150&h=150",true end
        if l:find("name") then return username() end
        if l:find("id")   then return client.UserId end; return {}
    end
    return nil
end

-- ============================================================
--  __namecall HOOK
-- ============================================================
local function hookServicesAndRemotes()
    if not hookmetamethod then Warn("hookmetamethod missing; remote mocking limited"); return end
    local cachedPaths={}
    if events then
        for _,obj in ipairs(events:GetDescendants()) do
            local ok,fp=pcall(function() return obj:GetFullName() end)
            if ok then
                local rel=fp:sub(#events:GetFullName()+2)
                cachedPaths[obj]=rel
            end
        end
    end
    local function getCachedPath(inst) return cachedPaths[inst] or "" end
    local _reentrant=false
    local svcAsset=AssetService; local svcPlayers=Players; local svcUser=UserService
    local svcMarket=MarketplaceService; local svcPolicy=PolicyService
    local svcText=TextService; local svcHttp=HttpService
    local svcContent=ContentProvider; local svcHaptic=HapticService
    local svcGui=GuiService; local svcInput=UserInputService
    local svcBadge=BadgeService; local svcTeleport=TeleportService
    local svcSocial=SocialService; local svcAvatar=AvatarEditorService
    local svcGroup=GroupService; local svcStarter=StarterGui
    local original
    original=hookmetamethod(game,"__namecall",function(self,...)
        if _reentrant then return original(self,...) end
        _reentrant=true
        local method=getnamecallmethod()
        local function done(...) _reentrant=false; return ... end
        if rawequal(self,svcAsset) then
            if method=="GetAudioMetadataAsync" then return done(localAudioMetadata((...))) end
            if method=="SearchAudio"           then return done(localAudioPages()) end
            _reentrant=false; return serviceFallback(method,...)
        end
        if rawequal(self,svcPlayers) then
            local first=...
            if method=="GetNameFromUserIdAsync" then
                return done(tonumber(first)==client.UserId and client.Name or ("Player_"..tostring(first)))
            end
            if method=="GetUserIdFromNameAsync" then return done(client.UserId) end
            if method=="GetUserThumbnailAsync"  then
                return done("rbxthumb://type=AvatarHeadShot&id="..tostring(first or client.UserId).."&w=150&h=150",true)
            end
            if method=="GetPlayerByUserId" then return done(tonumber(first)==client.UserId and client or nil) end
            if method=="GetPlayers"        then return done({client}) end
            _reentrant=false; return serviceFallback(method,...)
        end
        if rawequal(self,svcUser) and method=="GetUserInfosByUserIdsAsync" then
            local ids=(...); if type(ids)~="table" then ids={client.UserId} end
            local result={}
            for _,id in ipairs(ids) do
                table.insert(result,{
                    Id=id,
                    Username   =tonumber(id)==client.UserId and client.Name        or ("Player_"..tostring(id)),
                    DisplayName=tonumber(id)==client.UserId and client.DisplayName or ("Player " ..tostring(id)),
                })
            end
            return done(result)
        end
        if rawequal(self,svcMarket) and method=="GetProductInfo" then
            local aid=tonumber((...)) or 0; local meta=localAudioMetadata({aid})[1]
            return done({AssetId=aid,Name=meta.Title,Description="Mocked",Creator=meta.Creator,AssetTypeId=3})
        end
        if rawequal(self,svcPolicy) and method=="GetPolicyInfoForPlayerAsync" then
            return done({AreAdsAllowed=false,IsPaidRandomItemsRestricted=false,
                AllowedExternalLinkReferences={},IsSubjectToChinaPolicies=false})
        end
        if rawequal(self,svcText) then
            local text=tostring((...) or "")
            if method=="FilterStringAsync"    then return done(textFilterResult(text)) end
            if method=="GetTextSize" or method=="GetTextBoundsAsync" then
                return done(Vector2.new(math.max(#text*8,16),18)) end
            _reentrant=false; return serviceFallback(method,...)
        end
        if rawequal(self,svcHttp) then
            if method=="GetAsync" or method=="PostAsync" then return done('{"ok":true,"values":[]}') end
            if method=="RequestAsync" then return done({Success=true,StatusCode=200,Body='{"ok":true}'}) end
            _reentrant=false; return serviceFallback(method,...)
        end
        if rawequal(self,svcContent) or rawequal(self,svcHaptic) or rawequal(self,svcGui)
        or rawequal(self,svcInput) or rawequal(self,svcBadge) or rawequal(self,svcTeleport)
        or rawequal(self,svcSocial) or rawequal(self,svcAvatar) or rawequal(self,svcGroup)
        or rawequal(self,svcStarter) then
            if rawequal(self,svcGui)    and method=="GetGuiInset"          then return done(Vector2.zero,Vector2.zero) end
            if rawequal(self,svcInput)  and method=="GetMouseLocation"     then return done(Vector2.zero) end
            if rawequal(self,svcInput)  and method=="GetLastInputType"     then return done(Enum.UserInputType.Touch) end
            if rawequal(self,svcInput)  and (method=="IsKeyDown" or method=="IsMouseButtonPressed") then return done(false) end
            if rawequal(self,svcBadge)  and method=="UserHasBadgeAsync"    then return done(false) end
            if rawequal(self,svcSocial) and method=="CanSendGameInviteAsync" then return done(false) end
            if rawequal(self,svcGroup)  and method=="GetGroupInfoAsync"    then
                return done({Id=tonumber((...)) or 0,Name="Mock Group"}) end
            _reentrant=false; return serviceFallback(method,...)
        end
        if method=="InvokeServer" then
            local path=getCachedPath(self)
            if path~="" then
                local h=MockInvoke[path]
                if h then return done(h(...)) end
                Warn("Fallback InvokeServer:",path)
                return done(defaultInvoke(path,...))
            end
        elseif method=="FireServer" then
            local path=getCachedPath(self)
            if path~="" then
                local h=MockFire[path]
                if h then h(...); _reentrant=false; return end
                Warn("Fallback FireServer:",path)
                defaultFire(path,...); _reentrant=false; return
            end
        end
        _reentrant=false; return original(self,...)
    end)
    Log("__namecall hook installed")
end
hookServicesAndRemotes()

-- ============================================================
--  SIGNAL FACTORY
-- ============================================================
local function makeSignal()
    local sig={_conns={}}
    function sig:Connect(fn)
        local c={fn=fn,live=true}; table.insert(self._conns,c)
        return {Disconnect=function() c.live=false end, Connected=true}
    end
    function sig:Once(fn)
        local c; c=self:Connect(function(...)
            c:Disconnect(); fn(...)
        end); return c
    end
    function sig:Fire(...)
        local args={...}
        for _,c in ipairs(self._conns) do
            if c.live then task.spawn(c.fn,table.unpack(args)) end
        end
    end
    function sig:Wait()
        local done,res=false,nil
        local c=self:Connect(function(...) res={...}; done=true end)
        repeat task.wait() until done; c:Disconnect(); return table.unpack(res)
    end
    return sig
end

-- ============================================================
--  SAFE MOCK WRAPPER
-- ============================================================
local function makeSafeMock(t,mockName)
    return setmetatable(t,{
        __index=function(tbl,k)
            local l=tostring(k):lower()
            local val
            if l:find("signal") or l:find("event") or l:find("changed") or l:find("added")
            or l:find("removed") or l:find("fired") or l:find("loaded")
            or l:find("finished") or l:find("searched") or l:find("completed")
            or l:find("triggered") or l:find("updated") then
                val=makeSignal()
            else
                Warn("Mock ["..(mockName or "?").."] missing key:",k,"→ no-op")
                val=function() return true end
            end
            rawset(tbl,k,val); return val
        end,
    })
end

-- ============================================================
--  STORAGE MOCKS
-- ============================================================
local STORAGE_MOCKS={}

-- Signal
STORAGE_MOCKS["Signal"]=(function()
    local Signal={}; Signal.__index=Signal
    function Signal.new()
        local self=setmetatable({},Signal); self._sig=makeSignal(); return self
    end
    function Signal:Connect(fn) return self._sig:Connect(fn) end
    function Signal:Once(fn)    return self._sig:Once(fn)    end
    function Signal:Fire(...)   self._sig:Fire(...)           end
    function Signal:Wait()      return self._sig:Wait()       end
    return Signal
end)()

-- ─── Smoothness (v12: add ApproachInHeartbeat) ────────────────────────────
STORAGE_MOCKS["Smoothness"]=(function()
    local m={}

    function m.Tween(instance,info,props,callback)
        local ok,t=pcall(function() return TweenService:Create(instance,info,props) end)
        if ok and t then
            if callback then t.Completed:Connect(callback) end
            t:Play(); return t
        end
    end

    function m.Spring() end
    function m.Dampen() end

    -- ApproachInHeartbeat: interpolates a property per-frame
    function m.ApproachInHeartbeat(instance,property,target,delta,tweenInfo)
        if not instance then return end
        if not instance.Parent then return end
        local ok,err=pcall(function()
            local alpha=math.min(1, delta * 12)   -- ~12 = snappy approach
            local cur=instance[property]
            local tt=typeof(target)
            if tt=="number" then
                instance[property]=cur+(target-cur)*alpha
            elseif tt=="Vector2" then
                instance[property]=cur:Lerp(target,alpha)
            elseif tt=="Color3" then
                instance[property]=cur:Lerp(target,alpha)
            elseif tt=="UDim2" then
                instance[property]=cur:Lerp(target,alpha)
            elseif tt=="UDim" then
                local ns=cur.Scale+(target.Scale-cur.Scale)*alpha
                local no=cur.Offset+(target.Offset-cur.Offset)*alpha
                instance[property]=UDim.new(ns,no)
            elseif tt=="Vector3" then
                instance[property]=cur:Lerp(target,alpha)
            else
                instance[property]=target
            end
        end)
        if not ok then
            -- silent: property may not exist on this frame
        end
    end

    return makeSafeMock(m,"Smoothness")
end)()

-- ─── Utilities (v12: added missing functions) ──────────────────────────────
STORAGE_MOCKS["Utilities"]=(function()
    local m={}

    function m.GetViewportRatio()
        local v=workspace.CurrentCamera.ViewportSize; return v.X+v.Y
    end
    function m.Haptic() end
    function m.GetPlayerThumbnail(id)
        return "rbxthumb://type=AvatarHeadShot&id="..tostring(id or client.UserId).."&w=150&h=150"
    end

    -- time formatting
    function m.FormatSecondsToMSS(seconds)
        local s=math.floor(seconds or 0); local min=math.floor(s/60); local sec=s%60
        return string.format("%d:%02d",min,sec)
    end
    function m.FormatTime(seconds)
        local s=math.floor(math.abs(seconds or 0))
        local d=math.floor(s/86400); s=s%86400
        local h=math.floor(s/3600);  s=s%3600
        local min=math.floor(s/60);  s=s%60
        return {Days=d,Hours=h,Minutes=min,Seconds=string.format("%02d",s)}
    end
    function m.FormatSecondsToHM(seconds,detail)
        if not seconds or seconds<60 then return "0m" end
        local min=math.floor(seconds/60); local h=math.floor(min/60); min=min%60
        if h>0 then return string.format("%dh %dm",h,min) else return string.format("%dm",min) end
    end
    local monthNames={"January","February","March","April","May","June",
                      "July","August","September","October","November","December"}
    local monthShort={"Jan","Feb","Mar","Apr","May","Jun",
                      "Jul","Aug","Sep","Oct","Nov","Dec"}
    function m.FormatEpochData(epoch)
        local t=os.date("*t",epoch)
        local hour=t.hour%12; if hour==0 then hour=12 end
        return {
            Time={Hour=hour,Minutes=string.format("%02d",t.min),
                  Seconds=string.format("%02d",t.sec),Period=t.hour<12 and "AM" or "PM"},
            Calender={Month={Short=monthShort[t.month],Long=monthNames[t.month],Numerical=t.month},
                      Day=t.day,Year={Short=t.year%100,Long=t.year}},
            Relative="A moment ago", Epoch=epoch,
        }
    end
    function m.GetISO8601()
        return os.date("!%Y-%m-%dT%H:%M:%SZ",os.time())
    end

    -- ── NEW v12 ──
    -- Generate a pair of Color3 from artist name (deterministic)
    function m.GenerateArtistGradient(name)
        local hash=0
        for i=1,#(name or "") do hash=hash*31+string.byte(name,i) end
        local h1=((hash%360)/360)
        local h2=((hash//360)%360)/360
        local c1=Color3.fromHSV(h1,0.55,0.85)
        local c2=Color3.fromHSV(h2,0.75,0.65)
        return c1,c2
    end

    -- Get 1-2 uppercase initials from a name
    function m.GetInitials(name)
        name=name or ""
        local words={}
        for w in name:gmatch("%S+") do table.insert(words,w) end
        if #words>=2 then
            return words[1]:sub(1,1):upper()..words[2]:sub(1,1):upper()
        elseif #name>=2 then
            return name:sub(1,2):upper()
        else
            return (name:upper()):sub(1,1)
        end
    end

    -- Sort a list by frequency (most common first), return unique values
    function m.ArrangeByFrequency(list)
        local counts={}
        for _,v in ipairs(list or {}) do counts[v]=(counts[v] or 0)+1 end
        local unique={}
        for v in pairs(counts) do table.insert(unique,v) end
        table.sort(unique,function(a,b) return counts[a]>counts[b] end)
        return unique
    end

    -- Simple similarity score 0-100
    function m.HowSimilar(a,b)
        a=(a or ""):lower(); b=(b or ""):lower()
        if a==b then return 100 end
        if a=="" or b=="" then return 0 end
        if a:find(b,1,true) or b:find(a,1,true) then return 80 end
        -- count matching chars
        local match=0
        for i=1,#a do
            if b:find(a:sub(i,i),1,true) then match=match+1 end
        end
        return math.floor(match/#a*60)
    end

    -- Parse ISO 8601 string to Unix epoch
    function m.ISOToEpoch(iso)
        if not iso then return nil end
        local y,mo,d,h,mi,s=iso:match("(%d+)-(%d+)-(%d+)T(%d+):(%d+):(%d+)")
        if not y then
            y,mo,d=iso:match("(%d+)-(%d+)-(%d+)")
            if not y then return nil end
            h,mi,s=0,0,0
        end
        return os.time({year=tonumber(y),month=tonumber(mo),day=tonumber(d),
                        hour=tonumber(h),min=tonumber(mi),sec=tonumber(s)})
    end
    -- ── END NEW v12 ──

    function m.SwitchToggle(Switch,State)
        if not Switch then return end
        pcall(function()
            local info=TweenInfo.new(0.5,Enum.EasingStyle.Exponential)
            if State then
                TweenService:Create(Switch,info,{ImageColor3=Color3.fromRGB(0,185,62)}):Play()
                TweenService:Create(Switch.Knob,info,{Position=UDim2.fromScale(1,0.5),ImageColor3=Color3.fromRGB(0,85,28)}):Play()
            else
                TweenService:Create(Switch,info,{ImageColor3=Color3.fromRGB(34,34,34)}):Play()
                TweenService:Create(Switch.Knob,info,{Position=UDim2.fromScale(0,0.5),ImageColor3=Color3.fromRGB(12,12,12)}):Play()
            end
        end)
    end
    function m.Map(v,vMin,vMax,pMin,pMax)
        return pMin+(v-vMin)*(pMax-pMin)/(vMax-vMin)
    end
    function m.ResetScrollPosition(ui)
        if not ui then return end
        for _,scroll in ipairs(ui:GetDescendants()) do
            if scroll:IsA("ScrollingFrame") then scroll.CanvasPosition=Vector2.zero end
        end
    end
    function m.SetStatusForScriptDescendants(item,status)
        for _,s in ipairs(item:GetDescendants()) do
            if s:IsA("LocalScript") and not s:HasTag("MastersExcludeScript") then
                s.Enabled=status
            end
        end
    end
    function m.AssetToTexture(id)
        return "https://www.roblox.com/Thumbs/Asset.ashx?width=420&height=420&assetId="..tostring(id)
    end
    function m.GetCoverForSong(id) return m.AssetToTexture(id) end
    function m.CapitalizeWords(text)
        return (text:gsub("(%a)([%w_']*)",function(f,r) return f:upper()..r:lower() end))
    end
    function m.TrimString(input,max)
        return #input>max and input:sub(1,max) or input
    end
    function m.AbbreviateNumber(n)
        n=tonumber(n) or 0; local abs=math.abs(n)
        for _,t in ipairs({{1e12,"t"},{1e9,"b"},{1e6,"m"},{1e3,"k"}}) do
            if abs>=t[1] then return string.format("%.1f%s",n/t[1],t[2]) end
        end
        return tostring(n)
    end
    function m.AddBadgeToIdentifier(id,isVerified,Membership)
        if isVerified then id=id..utf8.char(0xE000) end
        if Membership==Enum.MembershipType.Premium then id=id..utf8.char(0xE001) end
        return id
    end
    function m.RemoveDuplicateFromTable(t)
        local seen,res={},{}
        for _,v in ipairs(t) do if not seen[v] then seen[v]=true; table.insert(res,v) end end
        return res
    end
    function m.CombineTables(t1,t2)
        local res={}
        for i,v in ipairs(t1) do res[i]=v end
        for _,v in ipairs(t2) do res[#res+1]=v end
        return res
    end
    function m.GetElementsNumber(t)
        local n=0; for _ in pairs(t) do n+=1 end; return n
    end
    function m.ExtractTableContents(t,start,last)
        local res={}; for i=start,last do table.insert(res,t[i]) end; return res
    end
    function m.SerializeNumberTable(t) return table.concat(t,",") end
    function m.DeserializeNumberTable(s)
        local res={}; for n in s:gmatch("[^,]+") do table.insert(res,tonumber(n)) end; return res
    end
    function m.GetTagsBySongId(audios,songId)
        for _,chunk in pairs(audios or {}) do
            for _,song in pairs(chunk) do if song.Id==songId then return song.Tags end end
        end
        return {}
    end
    function m.GetNameByUserIdAsync(id,addAt)
        local ok,name=pcall(function() return Players:GetNameFromUserIdAsync(id) end)
        if ok then return addAt and ("@"..name) or name end; return ""
    end
    function m.GetDisplayNameById(id)
        local ok,r=pcall(function() return UserService:GetUserInfosByUserIdsAsync({id})[1] end)
        return ok and r and r.DisplayName or ""
    end
    function m.GetUserInfoByUserId(id)
        local ok,r=pcall(function() return UserService:GetUserInfosByUserIdsAsync({id}) end)
        return ok and r and r[1] or nil
    end
    function m.GetUserIdByNameAsync(name)
        local ok,id=pcall(function() return Players:GetUserIdFromNameAsync(name) end)
        return ok and id or nil
    end
    function m.PlayersToUserIds(playerTable)
        local ids={}; for _,p in ipairs(playerTable) do table.insert(ids,p.UserId) end; return ids
    end
    function m.GetRelativePixels(desired,parent) return desired-parent end
    function m.RandomOffRange(mn,offMin,offMax,mx)
        if math.random()<0.5 then return math.random()*(offMin-mn)+mn
        else return math.random()*(mx-offMax)+offMax end
    end
    function m.FormatSecondsToRealDate(seconds)
        local target=os.time()+seconds; local diff=math.floor(seconds/86400)
        local fmt=os.date("%I:%M%p",target):gsub("^0","")
        if diff==0 then return "Today, "..fmt
        elseif diff==1 then return "Tomorrow, "..fmt
        else
            local d=os.date("*t",target)
            return string.format("%d/%d/%d, %s",d.month,d.day,d.year%100,fmt)
        end
    end
    function m.AdjustColor(color)
        local r,g,b=color.R*255,color.G*255,color.B*255
        local bright=(r*0.299+g*0.587+b*0.114)/255
        local adj=bright<0.5 and 0.3 or -0.3
        return Color3.fromRGB(math.clamp(r+adj*255,0,255),math.clamp(g+adj*255,0,255),math.clamp(b+adj*255,0,255))
    end

    return m
end)()

-- ─── Audios (v12: add LoadArtist) ──────────────────────────────────────────
STORAGE_MOCKS["Audios"]=(function()
    local _audioChunkLoaded   =makeSignal()
    local _audioChunkFinished =makeSignal()
    local _audioSearched      =makeSignal()
    local _audioLoaded        =false

    local m={
        ChunkLoaded          =_audioChunkLoaded,
        ChunkLoadingFinished =_audioChunkFinished,
        SearchedAudio        =_audioSearched,
    }

    function m.GetAudioMetadataAsync(assetIds)
        return localAudioMetadata(assetIds)
    end
    function m.LoadAudios(container)
        task.spawn(function()
            local chunk=localAudioMetadata(localAudioIds())
            if container then container[1]=chunk end
            _audioChunkLoaded:Fire(1,chunk)
            task.wait(CONFIG.AUDIO_CHUNK_DELAY)
            _audioLoaded=true
            _audioChunkFinished:Fire()
        end)
    end
    function m.IsLoaded() return _audioLoaded end
    function m.SearchAudiosByKeyword(keyword)
        local results=localAudioMetadata(localAudioIds())
        local chunkSig=makeSignal()
        task.defer(function()
            chunkSig:Fire(1,results)
            _audioSearched:Fire(results)
        end)
        return {ChunkLoaded=chunkSig,Advance=function()end,Results=results,Finished=true}
    end
    function m.GetAudioPages() return localAudioPages() end
    function m.SearchAudio()   return localAudioPages() end

    -- ── NEW v12 ──
    -- LoadArtist: returns metadata for songs by this artist
    function m.LoadArtist(artistName)
        local results={}
        for _,entry in ipairs(LOCAL_AUDIO_LIBRARY) do
            if entry.Artist==artistName then
                table.insert(results,cloneAudio(entry))
            end
        end
        -- fallback: return at least one entry so the artist page doesn't bail
        if #results==0 then
            table.insert(results,cloneAudio(LOCAL_AUDIO_LIBRARY[1]))
        end
        return results
    end
    -- ── END NEW v12 ──

    return makeSafeMock(m,"Audios")
end)()

-- ─── Configuration ─────────────────────────────────────────────────────────
STORAGE_MOCKS["Configuration"]=makeSafeMock({
    GetConfiguration=function() return LocalData.Configuration end,
    GetConfigurationAsync=function() return LocalData.Configuration end,
    GetLocalStations=function() return LocalData.LocalStations end,
    GetLocalStationByStationId=function(id)
        for _,s in ipairs(LocalData.LocalStations) do if s.StationId==id then return s end end
        return nil
    end,
    SetConfiguration=function(data)
        if type(data)=="table" then LocalData.Configuration=data end; return true
    end,
},"Configuration")

-- ─── Settings ──────────────────────────────────────────────────────────────
STORAGE_MOCKS["Settings"]=makeSafeMock({
    FetchSettings=function() return LocalData.Settings end,
    FetchDefaultSettings=function() return defaultSettings() end,
    SetSettings=function(_,data)
        if type(data)~="table" then return end
        for k,v in pairs(data) do
            if type(v)=="table" and type(LocalData.Settings[k])=="table" then
                for sk,sv in pairs(v) do LocalData.Settings[k][sk]=sv end
            else LocalData.Settings[k]=v end
        end
        saveData()
    end,
    SetSetting=function(_,cat,setting,value)
        if LocalData.Settings[cat] then LocalData.Settings[cat][setting]=value end
    end,
},"Settings")

-- ─── Listeners ─────────────────────────────────────────────────────────────
STORAGE_MOCKS["Listeners"]=(function()
    local listeners={}
    return makeSafeMock({
        AddListener     =function(uid) listeners[uid]={CurrentSoundId=0,ContinuePlaying=false,Queue={}} end,
        RemoveListener  =function(uid) listeners[uid]=nil end,
        UpdateListener  =function(uid,data) if data then listeners[uid]=data end end,
        GetListeners    =function() return listeners end,
        GetCurrentTimestamp=function() return 0 end,
    },"Listeners")
end)()

-- ─── Queue (v12: complete rewrite as playback manager) ─────────────────────
STORAGE_MOCKS["Queue"]=(function()
    local Q={}
    local _queue,_continuePlaying={},{}
    local _contextName=""
    local _currentSongId=nil
    local _currentMetadata=nil
    local _soundObj=nil
    local _loading=false
    local _crossfading=false
    local _settings={Shuffle=false,RepeatMode="None"}
    local _repeating=false
    local _trackCounter=0

    -- Signals
    Q.TrackChanged  =makeSignal()
    Q.QueueUpdated  =makeSignal()
    Q.StatusChanged =makeSignal()

    local function nextTid() _trackCounter+=1; return tostring(_trackCounter) end
    local function syncPublicQueueRefs()
        Q.Queue=_queue
        Q.ContinuePlaying=_continuePlaying
        Q.QueueSection=_queue
        Q.ContinuePlayingSection=_continuePlaying
        Q.Repeating=_repeating
    end

    function Q.LoadSource(songIds,pointer,contextName,play)
        if type(songIds)~="table" or #songIds==0 then return end
        _continuePlaying={}; _queue={}; _contextName=contextName or ""
        for _,id in ipairs(songIds) do
            table.insert(_continuePlaying,{Id=id,TrackingId=nextTid()})
        end
        local startId=songIds[pointer or 1]
        if startId then
            _currentSongId=startId
            -- get metadata from local library
            local meta=localAudioMetadata({startId})[1]
            _currentMetadata=meta
            Q.TrackChanged:Fire(startId)
            Q.QueueUpdated:Fire()
        end
        syncPublicQueueRefs()
    end

    function Q.GetVisualQueue()   return {Queue=_queue,ContinuePlaying=_continuePlaying} end
    function Q.GetActiveSound()   return _soundObj end
    function Q.GetCurrentSongId() return _currentSongId end
    function Q.GetCurrentMetadata() return _currentMetadata end
    function Q.GetCrossfadingStatus() return _crossfading end
    function Q.GetLoadingStatus()   return _loading end
    function Q.GetSettings()        return _settings end
    function Q.GetContextName()     return _contextName end

    function Q.ToggleShuffle()
        _settings.Shuffle=not _settings.Shuffle
        Q.StatusChanged:Fire({Settings=_settings})
    end
    function Q.ToggleRepeat()
        _settings.RepeatMode=_settings.RepeatMode=="Song" and "None" or "Song"
        _repeating=_settings.RepeatMode~="None"
        syncPublicQueueRefs()
        Q.StatusChanged:Fire({Settings=_settings})
    end

    function Q.Next()     end
    function Q.Previous() end
    function Q.Pause()    end
    function Q.Resume()   end

    function Q.PlayNext(songs)
        if type(songs)~="table" then return end
        for i=#songs,1,-1 do table.insert(_queue,1,{Id=songs[i],TrackingId=nextTid()}) end
        syncPublicQueueRefs()
        Q.QueueUpdated:Fire()
    end
    function Q.AddToQueue(songs)
        if type(songs)~="table" then return end
        for _,id in ipairs(songs) do table.insert(_continuePlaying,{Id=id,TrackingId=nextTid()}) end
        syncPublicQueueRefs()
        Q.QueueUpdated:Fire()
    end
    function Q.ClearQueue()
        _queue={}; syncPublicQueueRefs(); Q.QueueUpdated:Fire()
    end
    function Q.ClearContinuePlaying()
        _continuePlaying={}; syncPublicQueueRefs(); Q.QueueUpdated:Fire()
    end
    function Q.RemoveFromQueue(indexOrTrackingId)
        if type(indexOrTrackingId)=="number" then
            table.remove(_queue,indexOrTrackingId)
        else
            Q.RemoveByTrackingId(indexOrTrackingId)
            return
        end
        syncPublicQueueRefs()
        Q.QueueUpdated:Fire()
    end
    function Q.RemoveByTrackingId(tid)
        for i,item in ipairs(_queue) do if item.TrackingId==tid then table.remove(_queue,i); break end end
        for i,item in ipairs(_continuePlaying) do if item.TrackingId==tid then table.remove(_continuePlaying,i); break end end
        syncPublicQueueRefs()
        Q.QueueUpdated:Fire()
    end
    function Q.ProceedByTrackingId(tid)
        -- move this item to now-playing position
        for i,item in ipairs(_continuePlaying) do
            if item.TrackingId==tid then
                _currentSongId=item.Id
                local meta=localAudioMetadata({item.Id})[1]; _currentMetadata=meta
                table.remove(_continuePlaying,i)
                syncPublicQueueRefs()
                Q.TrackChanged:Fire(item.Id)
                Q.QueueUpdated:Fire()
                return
            end
        end
        for i,item in ipairs(_queue) do
            if item.TrackingId==tid then
                _currentSongId=item.Id
                local meta=localAudioMetadata({item.Id})[1]; _currentMetadata=meta
                table.remove(_queue,i)
                syncPublicQueueRefs()
                Q.TrackChanged:Fire(item.Id)
                Q.QueueUpdated:Fire()
                return
            end
        end
    end

    syncPublicQueueRefs()

    return makeSafeMock(Q,"Queue")
end)()

-- ─── TextFiltering ─────────────────────────────────────────────────────────
STORAGE_MOCKS["TextFiltering"]=makeSafeMock({
    FilterForPlayer =function(text) return text or "" end,
    FilterBroadcast =function(text) return text or "" end,
    FilterText      =function(text) return text or "" end,
    FilterAsync     =function(text) return text or "" end,
},"TextFiltering")

-- ─── OnlineStations (v12: add GetOnlineStations) ───────────────────────────
STORAGE_MOCKS["OnlineStations"]=makeSafeMock({
    GetStationsIndex            =function() return {} end,
    GetOnlineStationByStationId =function() return nil end,
    GetOnlineStations           =function() return {} end,  -- NEW v12
    IsAvailable                 =function() return false end,
},"OnlineStations")

-- ─── LyricsEngine (v12: add HasLyrics) ────────────────────────────────────
STORAGE_MOCKS["LyricsEngine"]=makeSafeMock({
    GetLyrics   =function() return nil end,
    IsAvailable =function() return false end,
    FetchLyrics =function() return nil end,
    HasLyrics   =function() return false end,  -- NEW v12
},"LyricsEngine")

-- ─── Alerts ────────────────────────────────────────────────────────────────
STORAGE_MOCKS["Alerts"]=makeSafeMock({
    BannerNotify=function(data)
        if data and data.Header then Warn("BannerNotify:",data.Header,data.Description or "") end
    end,
},"Alerts")

-- ─── Main (v12: full signals + all methods Handler calls) ──────────────────
STORAGE_MOCKS["Main"]=(function()
    local m={__MastersCleanPatched=true}

    -- ── Signals ──
    m.StateChanged       = makeSignal()
    m.PageChanged        = makeSignal()
    m.OrientationChanged = makeSignal()
    m.PreparenessChanged = makeSignal()
    m.PlaylistCreationClosed = makeSignal()

    -- ── State ──
    local _state        = "Bar"
    local _lastMainPage = "Discovery"
    local _currentPage  = "Discovery"
    local _orientation  = "Portrait"
    local _sidebarOpen  = false
    local _sidebarFS    = false
    local _nowPlayingOpen = false
    local _nowPlayingPanel = "QueueList"
    local _nowPlayingViewMedia = true
    local _nowPlayingViewPanel = false
    local _lastPos      = UDim2.fromScale(0.5,0.5)
    local _playlistCreationOpen = false

    -- SetState / GetState
    function m.SetState(newState)
        _state=newState
        m.StateChanged:Fire(newState)
        if newState=="Bar" then
            task.defer(function()
                local gui=PlayerGui:FindFirstChild("Masters")
                if gui then forceBarState(gui) end
            end)
        end
        return true
    end
    function m.GetState() return _state end

    -- SetPage / GetCurrentPage / GetLastMainPage
    function m.SetPage(page,param)
        local mainPages={"Discovery","Search","Library","Artist","Playlist","Stations","Details","Queue"}
        for _,p in ipairs(mainPages) do
            if p==_currentPage then _lastMainPage=_currentPage; break end
        end
        _currentPage=page
        m.PageChanged:Fire(page,param)
    end
    function m.GetCurrentPage()  return _currentPage  end
    function m.GetLastMainPage() return _lastMainPage end

    -- Orientation
    function m.GetOrientation() return _orientation end

    -- SetLastPosition
    function m.SetLastPosition(pos) _lastPos=pos end
    function m.GetLastPosition() return _lastPos end

    -- Sidebar
    function m.Sidebar(open,fullscreen)
        _sidebarOpen=open
        _sidebarFS  =fullscreen or false
    end
    function m.GetSidebarStatus() return _sidebarOpen,_sidebarFS end

    -- NowPlaying
    function m.NowPlaying(open)
        _nowPlayingOpen=open
    end
    function m.NowPlayingPanelScreen(screen)
        _nowPlayingPanel=screen
    end
    function m.NowPlayingView(media,panel)
        _nowPlayingViewMedia=media
        _nowPlayingViewPanel=panel
    end
    function m.GetNowplayingViewStates()
        return _nowPlayingViewMedia,_nowPlayingViewPanel
    end

    -- PlaylistCreation
    function m.PlaylistCreation(open)
        _playlistCreationOpen=open
        if not open then m.PlaylistCreationClosed:Fire(nil) end
    end

    -- PromptOptions: immediately return nil (no UI to show)
    function m.PromptOptions(data) return nil end

    -- PromptShare
    function m.PromptShare(data) return nil end

    -- Top-level navigation helpers used by Handler buttons
    function m.Settings(open)
        if open then m.SetPage("Settings") else m.SetPage(_lastMainPage or "Discovery") end
        return true
    end
    function m.Library(open)
        if open then m.SetPage("Library") end
        return true
    end
    function m.Preferences(open)
        if open then m.SetPage("Preferences") end
        return true
    end
    function m.Algorithm(open)
        if open then m.SetPage("Discovery") end
        return true
    end
    function m.SessionSaving() return true end
    function m.Sharing(open)
        if open then m.SetPage("Sharing") end
        return true
    end

    -- Playback controls (no-ops for now)
    function m.Play()        return true end
    function m.Pause()       return true end
    function m.Stop()        return true end
    function m.Skip()        return true end
    function m.Previous()    return true end
    function m.SetVolume()   return true end
    function m.GetVolume()   return 0.5  end
    function m.SetShuffle()  return true end
    function m.SetRepeat()   return true end
    function m.GetShuffle()  return false end
    function m.GetRepeat()   return false end
    function m.SetQueue()    return true end
    function m.GetQueue()    return {}   end
    function m.GetCurrentSong() return nil end
    function m.IsPlaying()   return false end
    function m.GetPlaybackState()
        return {SoundId=0,Volume=0.5,Shuffle=false,["Repeat"]=false,
                TimePosition=0,Queue={},Context="None"}
    end
    function m.FetchSavedSession()    return nil end
    function m.SetPlaybackState()     end
    function m.FetchAlgorithm()       return LocalData.Algorithm end
    function m.AddArtist()            end
    function m.AddSong()              end
    function m.AddTag()               end
    function m.FetchLibrary()         return libraryResponse() end
    function m.SetSong(id,add)
        local songs=LocalData.Library.Songs
        if add then if not table.find(songs,id) then table.insert(songs,id) end
        else local i=table.find(songs,id); if i then table.remove(songs,i) end end
        return true
    end
    function m.IsSongSaved(id) return table.find(LocalData.Library.Songs,id)~=nil end
    function m.FetchPreference()      return LocalData.Preferences end
    function m.FavoriteSong(id,add)
        local l=LocalData.Preferences.Songs.Favorite; local i=table.find(l,id)
        if add and not i then table.insert(l,id) elseif not add and i then table.remove(l,i) end
        return true
    end
    function m.DislikeSong(id,add)
        local l=LocalData.Preferences.Songs.Dislike; local i=table.find(l,id)
        if add and not i then table.insert(l,id) elseif not add and i then table.remove(l,i) end
        return true
    end
    function m.IsSongFavorite(id) return table.find(LocalData.Preferences.Songs.Favorite,id)~=nil end
    function m.IsSongDislike(id)  return table.find(LocalData.Preferences.Songs.Dislike,id)~=nil end

    -- Preparedness (signal fired once audios load + state == Full)
    -- The Handler does: Main.PreparenessChanged:Connect(function() ... end)
    -- We fire it once when the UI becomes Full
    m.StateChanged:Connect(function(state)
        if state=="Full" then
            task.delay(0.5, function()
                m.PreparenessChanged:Fire()
            end)
        end
    end)

    -- Fallback for any other method the Handler calls
    setmetatable(m,{
        __index=function(_,k)
            local l=tostring(k):lower()
            -- return a Signal for anything that sounds like an event
            if l:find("signal") or l:find("changed") or l:find("event")
            or l:find("added") or l:find("removed") or l:find("fired")
            or l:find("closed") or l:find("updated") then
                local sig=makeSignal()
                rawset(m,k,sig); return sig
            end
            return function() return true end
        end
    })
    return m
end)()

-- ============================================================
--  HANDLER ERROR CAPTURE
-- ============================================================
pcall(function()
    local SC=game:GetService("ScriptContext")
    SC.Error:Connect(function(msg,stack,scr)
        if scr and scr.Name=="Handler" then
            warn("[Masters v12] !! HANDLER ERROR !!")
            warn("[Masters v12] MSG:",msg)
            warn("[Masters v12] STACK:",stack)
        end
    end)
end)

-- ============================================================
--  HOOK require()
-- ============================================================
local _storageMods       =storage and storage:FindFirstChild("Modules")
local _mockInstanceCache ={}

if _storageMods then
    for name,mockTable in pairs(STORAGE_MOCKS) do
        local mod=_storageMods:FindFirstChild(name)
        if mod then _mockInstanceCache[mod]=mockTable; Log("Registered mock for module:",name)
        else Log("Storage module not found (skipped):",name) end
    end
end

local _hookOk=false
if hookfunction and newcclosure then
    local _origRequire
    _origRequire=hookfunction(require,newcclosure(function(module)
        if typeof(module)=="Instance" and module:IsA("ModuleScript") then
            local cached=_mockInstanceCache[module]
            if cached then Log("Intercepted require:",module.Name); return cached end
        end
        return _origRequire(module)
    end))
    _hookOk=true; Log("hookfunction(require) installed")
end
if not _hookOk then
    local _origRequire=require
    getgenv().require=function(module)
        if typeof(module)=="Instance" and module:IsA("ModuleScript") then
            local cached=_mockInstanceCache[module]
            if cached then Log("Intercepted require (getgenv):",module.Name); return cached end
        end
        return _origRequire(module)
    end
    Log("getgenv require override installed")
end

-- ============================================================
--  MODULE PATCHES (extra safety after require)
-- ============================================================
local function patchModules()
    local modules=storage and storage:FindFirstChild("Modules")
    if not modules then return end

    -- Utilities extra patch
    local utilitiesModule=modules:FindFirstChild("Utilities")
    if utilitiesModule then
        local ok,utilities=pcall(require,utilitiesModule)
        if ok and type(utilities)=="table" then
            utilities.GetViewportRatio   =STORAGE_MOCKS["Utilities"].GetViewportRatio
            utilities.Haptic             =STORAGE_MOCKS["Utilities"].Haptic
            utilities.GetPlayerThumbnail =STORAGE_MOCKS["Utilities"].GetPlayerThumbnail
            -- v12 extras
            utilities.GenerateArtistGradient=STORAGE_MOCKS["Utilities"].GenerateArtistGradient
            utilities.GetInitials           =STORAGE_MOCKS["Utilities"].GetInitials
            utilities.ArrangeByFrequency    =STORAGE_MOCKS["Utilities"].ArrangeByFrequency
            utilities.HowSimilar            =STORAGE_MOCKS["Utilities"].HowSimilar
            utilities.ISOToEpoch            =STORAGE_MOCKS["Utilities"].ISOToEpoch
            Log("Utilities extra-patched (v12)")
        end
    end

    -- Audios extra patch
    local audiosModule=modules:FindFirstChild("Audios")
    if audiosModule then
        local ok,audios=pcall(require,audiosModule)
        if ok and type(audios)=="table" then
            local A=STORAGE_MOCKS["Audios"]
            audios.GetAudioMetadataAsync =A.GetAudioMetadataAsync
            audios.LoadAudios            =A.LoadAudios
            audios.IsLoaded              =A.IsLoaded
            audios.SearchAudiosByKeyword =A.SearchAudiosByKeyword
            audios.LoadArtist            =A.LoadArtist  -- NEW v12
            audios.ChunkLoaded           =A.ChunkLoaded
            audios.ChunkLoadingFinished  =A.ChunkLoadingFinished
            audios.SearchedAudio         =A.SearchedAudio
            Log("Audios extra-patched (v12)")
        end
    end

    -- Smoothness extra patch
    local smoothnessModule=modules:FindFirstChild("Smoothness")
    if smoothnessModule then
        local ok,sm=pcall(require,smoothnessModule)
        if ok and type(sm)=="table" then
            sm.ApproachInHeartbeat=STORAGE_MOCKS["Smoothness"].ApproachInHeartbeat
            Log("Smoothness extra-patched (v12)")
        end
    end

    -- Main extra patch
    local mainModule=modules:FindFirstChild("Main")
    if mainModule then
        local ok,main=pcall(require,mainModule)
        if ok and type(main)=="table" and not main.__MastersCleanPatched then
            main.__MastersCleanPatched=true
            Log("Main extra-patched (v12)")
        end
    end
end
patchModules()

-- ============================================================
--  START HANDLER / UI REVEAL
-- ============================================================
task.wait(0.25)

local HANDLER_STARTED=false
if CONFIG.RUN_HANDLER and HandlerScript then
    local handler=HandlerScript:Clone()
    handler.Disabled=true
    handler.Parent=GuiClone or PlayerGui
    local ok,err=pcall(function() handler.Disabled=false end)
    if ok then
        HANDLER_STARTED=true
        Log("Handler started")
    else
        Warn("Handler start failed:",err)
    end
end

task.delay(CONFIG.REVEAL_DELAY, function()
    if GuiClone and GuiClone.Parent then
        forceBarState(GuiClone)
        hydrateGui(GuiClone)
        GuiClone.Enabled=true

        task.spawn(function()
            if HANDLER_STARTED then return end -- let real Handler manage interactions
            task.wait(0.2)
            local interface=GuiClone:FindFirstChild("Interface",true)
            if not interface then return end
            local frame=interface:FindFirstChild("Frame")
            local bar  =frame and frame:FindFirstChild("Bar")

            local function expandUI()
                local page=frame and frame:FindFirstChildWhichIsA("UIPageLayout")
                local mainPage=frame and (
                    frame:FindFirstChild("Full") or frame:FindFirstChild("Main") or
                    frame:FindFirstChild("Player") or frame:FindFirstChild("Expanded"))
                if page and mainPage then pcall(function() page:JumpTo(mainPage) end) end
                interface:SetAttribute("State","Full")
                TweenService:Create(interface,TweenInfo.new(0.35,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),{
                    AnchorPoint=Vector2.new(0.5,0.5),
                    Position   =UDim2.fromScale(0.5,0.5),
                    Size       =UDim2.fromOffset(340,560),
                    ImageTransparency=0,
                }):Play()
                -- tell Main mock the state changed to Full
                STORAGE_MOCKS["Main"].SetState("Full")
            end

            local function collapseUI()
                local page=frame and frame:FindFirstChildWhichIsA("UIPageLayout")
                if page and bar then pcall(function() page:JumpTo(bar) end) end
                interface:SetAttribute("State","Bar")
                TweenService:Create(interface,TweenInfo.new(0.3,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),{
                    AnchorPoint=Vector2.new(0.5,1),
                    Position   =UDim2.new(0.5,0,1,-100),
                    Size       =UDim2.fromOffset(310,120),
                    ImageTransparency=0.8,
                }):Play()
                STORAGE_MOCKS["Main"].SetState("Bar")
            end

            -- Try to hook existing bar button
            local connected=false
            if bar then
                for _,obj in ipairs(bar:GetDescendants()) do
                    if obj:IsA("GuiButton") and obj.Size==UDim2.fromScale(1,1) then
                        obj.Activated:Connect(function()
                            local st=interface:GetAttribute("State") or "Bar"
                            if st=="Bar" then expandUI() else collapseUI() end
                        end)
                        connected=true; break
                    end
                end
            end

            -- no overlay fallback: avoid blocking touches/gameplay under the bar

            -- Drag fallback in Bar state (when Handler drag is broken)
            local dragging=false
            local dragStart,startPos=nil,nil
            local dragEndConn=nil
            interface.InputBegan:Connect(function(input)
                if input.UserInputType~=Enum.UserInputType.Touch
                and input.UserInputType~=Enum.UserInputType.MouseButton1 then return end
                local st=interface:GetAttribute("State") or "Bar"
                if st~="Bar" then return end
                dragging=true
                dragStart=input.Position
                startPos=interface.Position
                if dragEndConn then dragEndConn:Disconnect() end
                dragEndConn=input.Changed:Connect(function()
                    if input.UserInputState==Enum.UserInputState.End then
                        dragging=false
                        STORAGE_MOCKS["Main"].SetLastPosition(interface.Position)
                    end
                end)
            end)
            UserInputService.InputChanged:Connect(function(input)
                if not dragging or not dragStart or not startPos then return end
                if input.UserInputType~=Enum.UserInputType.Touch
                and input.UserInputType~=Enum.UserInputType.MouseMovement then return end
                local delta=input.Position-dragStart
                interface.Position=UDim2.new(
                    startPos.X.Scale, startPos.X.Offset+delta.X,
                    startPos.Y.Scale, startPos.Y.Offset+delta.Y
                )
            end)

            -- UserInputService fallback
            UserInputService.InputBegan:Connect(function(input,gpe)
                if gpe then return end
                if input.UserInputType~=Enum.UserInputType.Touch
                and input.UserInputType~=Enum.UserInputType.MouseButton1 then return end
                local st=interface:GetAttribute("State") or "Bar"
                if st~="Bar" then return end
                local pos=input.Position
                local absPos=interface.AbsolutePosition
                local absSize=interface.AbsoluteSize
                if pos.X>=absPos.X and pos.X<=absPos.X+absSize.X
                and pos.Y>=absPos.Y and pos.Y<=absPos.Y+absSize.Y then
                    expandUI()
                end
            end)
        end)
    end
end)

if writefile then
    task.spawn(function()
        while task.wait(60) do saveData() end
    end)
end

print("╔══════════════════════════════════════════════════╗")
print("║  Masters Standalone Executor [CLEAN v12]         ║")
print("╠══════════════════════════════════════════════════╣")
print("║  FIX Main: signals + SetPage/NowPlaying/etc.    ║")
print("║  FIX Queue: viết lại thành playback manager     ║")
print("║  FIX Smoothness: ApproachInHeartbeat            ║")
print("║  FIX Utilities: GenerateArtistGradient etc.     ║")
print("║  FIX Audios: LoadArtist                         ║")
print("║  FIX LyricsEngine: HasLyrics                    ║")
print("╚══════════════════════════════════════════════════╝")

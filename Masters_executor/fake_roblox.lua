local M = {}

local function shallowCopy(orig)
    local copy = {}
    for k, v in pairs(orig) do
        copy[k] = v
    end
    return copy
end

local function deepCopy(orig, seen)
    if type(orig) ~= "table" then
        return orig
    end
    if seen and seen[orig] then
        return seen[orig]
    end
    local copy = {}
    seen = seen or {}
    seen[orig] = copy
    for k, v in pairs(orig) do
        if k ~= "_parent" and k ~= "Parent" then
            copy[k] = deepCopy(v, seen)
        end
    end
    local mt = getmetatable(orig)
    if mt then
        setmetatable(copy, mt)
    end
    return copy
end

local function normalizePath(path)
    return path:gsub('\\', '/')
end

local function splitPath(path)
    local components = {}
    for part in path:gmatch('[^/]+') do
        table.insert(components, part)
    end
    return components
end

local function stripExtension(filename)
    local name = filename:match('^(.-)\.[^%.]+$') or filename
    name = name:gsub('%.server$', ''):gsub('%.client$', '')
    return name
end

local FakeEvent = {}
FakeEvent.__index = FakeEvent

function FakeEvent.new()
    local self = setmetatable({handlers = {}}, FakeEvent)
    return self
end

function FakeEvent:Connect(callback)
    if type(callback) ~= 'function' then
        error('Connect expects a function')
    end
    table.insert(self.handlers, callback)
    return {
        Disconnect = function() end
    }
end

function FakeEvent:Fire(...)
    for _, callback in ipairs(self.handlers) do
        pcall(callback, ...)
    end
end

local FakeInstance = {}
FakeInstance.__index = function(self, key)
    if rawget(self, key) ~= nil then
        return rawget(self, key)
    end

    if key == 'Parent' then
        return rawget(self, '_parent')
    end

    if FakeInstance[key] then
        return FakeInstance[key]
    end

    local child = self._children[key]
    if child then
        return child
    end

    local defaultEvents = {
        MouseButton1Click = true,
        MouseEnter = true,
        MouseLeave = true,
        InputBegan = true,
        InputEnded = true,
        InputChanged = true,
        Changed = true,
        Activated = true
    }
    if defaultEvents[key] then
        local event = FakeEvent.new()
        rawset(self, key, event)
        return event
    end

    local newChild = FakeInstance.new(key, 'GuiObject')
    self._children[key] = newChild
    newChild._parent = self
    return newChild
end

function FakeInstance.__pairs(self)
    local function iter(t, k)
        return next(t._children, k)
    end
    return iter, self, nil
end

function FakeInstance.new(name, className)
    local obj = {
        Name = name or '',
        ClassName = className or 'Folder',
        _children = {},
        _tags = {},
        _attributes = {}
    }
    return setmetatable(obj, FakeInstance)
end

function FakeInstance:AddChild(child)
    if type(child) ~= 'table' then
        error('AddChild expects a table')
    end
    child._parent = self
    self._children[child.Name] = child
    return child
end

function FakeInstance:GetChildren()
    local list = {}
    for _, child in pairs(self._children) do
        table.insert(list, child)
    end
    return list
end

function FakeInstance:GetDescendants()
    local descendants = {}
    local function recurse(node)
        for _, child in pairs(node._children) do
            table.insert(descendants, child)
            recurse(child)
        end
    end
    recurse(self)
    return descendants
end

function FakeInstance:FindFirstChild(name)
    return self._children[name]
end

function FakeInstance:WaitForChild(name)
    local child = self:FindFirstChild(name)
    if child then
        return child
    end
    child = FakeInstance.new(name, 'Folder')
    self:AddChild(child)
    return child
end

function FakeInstance:GetPropertyChangedSignal(propertyName)
    return FakeEvent.new()
end

function FakeInstance:GetAttributeChangedSignal(attributeName)
    return FakeEvent.new()
end

function FakeInstance:HasTag(tag)
    return self._tags[tag] == true
end

function FakeInstance:AddTag(tag)
    self._tags[tag] = true
end

function FakeInstance:SetAttribute(key, value)
    self._attributes[key] = value
end

function FakeInstance:GetAttribute(key)
    return self._attributes[key]
end

function FakeInstance:IsA(className)
    if className == 'Instance' then
        return true
    end
    if self.ClassName == className then
        return true
    end
    if className == 'GuiObject' then
        return true
    end
    if self.ClassName == 'GuiObject' then
        if className:find('Button') or className:find('Frame') or className:find('Label') or className:find('Image') or className:find('Text') or className:find('Input') or className:find('List') then
            return true
        end
    end
    return false
end

function FakeInstance:Clone()
    local function cloneRecursive(node)
        local copy = FakeInstance.new(node.Name, node.ClassName)
        if node.__path then
            copy.__path = node.__path
        end
        for k, v in pairs(node) do
            if k ~= '_children' and k ~= '_parent' and k ~= '_tags' and k ~= '_attributes' and k ~= 'Name' and k ~= 'ClassName' then
                copy[k] = deepCopy(v)
            end
        end
        for tag, _ in pairs(node._tags) do
            copy._tags[tag] = true
        end
        for attr, value in pairs(node._attributes) do
            copy._attributes[attr] = deepCopy(value)
        end
        for _, child in pairs(node._children) do
            local childCopy = cloneRecursive(child)
            copy:AddChild(childCopy)
        end
        return copy
    end
    return cloneRecursive(self)
end

function FakeInstance:Destroy()
    if self._parent then
        self._parent._children[self.Name] = nil
        self._parent = nil
    end
end

local function moduleClassFromExtension(name)
    if name:find('%.client%.lua$') then
        return 'LocalScript'
    elseif name:find('%.server%.lua$') then
        return 'Script'
    elseif name:find('%.lua$') then
        return 'ModuleScript'
    end
    return 'ModuleScript'
end

local function makeFolder(name)
    return FakeInstance.new(name, 'Folder')
end

local function makeModule(name, path)
    local module = FakeInstance.new(name, moduleClassFromExtension(path))
    module.__path = normalizePath(path)
    return module
end

local function buildObjectTree(rootPath)
    rootPath = normalizePath(rootPath)
    local root = makeFolder('Masters')

    local function addEntry(relPath, isFile)
        local parts = splitPath(relPath)
        local node = root
        for i = 1, #parts - 1 do
            local part = parts[i]
            if not node._children[part] then
                local folder = makeFolder(part)
                node._children[part] = folder
                folder._parent = node
            end
            node = node._children[part]
        end
        local last = parts[#parts]
        if isFile then
            local name = stripExtension(last)
            local child = makeModule(name, rootPath .. '/' .. relPath)
            node._children[name] = child
            child._parent = node
        else
            if not node._children[last] then
                local folder = makeFolder(last)
                node._children[last] = folder
                folder._parent = node
            end
        end
    end

    local handle = io.popen('find "' .. rootPath .. '" -type d -o -type f 2>/dev/null')
    if not handle then
        error('Failed to open directory listing for ' .. rootPath)
    end

    for line in handle:lines() do
        local path = normalizePath(line)
        if path ~= rootPath then
            local rel = path:sub(#rootPath + 2)
            local isFile = path:match('%.%w+$') ~= nil
            addEntry(rel, isFile)
        end
    end
    handle:close()

    return root
end

local function makeSafeHttp()
    local function jsonDecode(_, str)
        local normalized = str:gsub('null', 'nil')
        local ok, result = pcall(function()
            return assert(load('return ' .. normalized))()
        end)
        if ok then
            return result
        end
        local ok2, cjson = pcall(require, 'cjson')
        if ok2 and cjson and cjson.decode then
            return cjson.decode(str)
        end
        error('JSON decode failed')
    end

    local function urlEncode(_, value)
        value = tostring(value)
        return value:gsub('([^%w%-_%.~])', function(ch)
            return string.format('%%%02X', string.byte(ch))
        end)
    end

    local function requestAsync(_, params)
        return true, {Success = true, Body = '{"details":{"owned":true}}'}
    end

    local function getAsync(_, url)
        if url:find('flare%-studio.online') then
            return '{"downloads":0}'
        end
        return '{"values": []}'
    end

    local function postAsync(_, url, body)
        return '{"downloads":0}'
    end

    return {
        JSONDecode = jsonDecode,
        UrlEncode = urlEncode,
        RequestAsync = requestAsync,
        GetAsync = getAsync,
        PostAsync = postAsync
    }
end

local function makeEnum()
    local function makeNode(path)
        return setmetatable({}, {
            __index = function(t, key)
                local node = makeNode(path .. '.' .. key)
                rawset(t, key, node)
                return node
            end,
            __tostring = function()
                return path
            end
        })
    end

    return setmetatable({}, {
        __index = function(t, key)
            local node = makeNode('Enum.' .. key)
            rawset(t, key, node)
            return node
        end
    })
end

local function makeVector2()
    local vector2 = {}
    function vector2.new(x, y)
        return {X = x or 0, Y = y or 0, type = 'Vector2'}
    end
    function vector2.fromOffset(x, y)
        return vector2.new(x, y)
    end
    function vector2.fromScale(x, y)
        return vector2.new(x, y)
    end
    return vector2
end

local function makeVector3()
    local vector3 = {}
    function vector3.new(x, y, z)
        return {X = x or 0, Y = y or 0, Z = z or 0, type = 'Vector3'}
    end
    return vector3
end

local function makeUDim()
    local udim = {}
    function udim.new(scale, offset)
        return {Scale = scale or 0, Offset = offset or 0, type = 'UDim'}
    end
    return udim
end

local function makeUDim2()
    local udim2 = {}
    function udim2.new(xScale, xOffset, yScale, yOffset)
        return {XScale = xScale or 0, XOffset = xOffset or 0, YScale = yScale or 0, YOffset = yOffset or 0, type = 'UDim2'}
    end
    function udim2.fromOffset(x, y)
        return udim2.new(0, x, 0, y)
    end
    function udim2.fromScale(x, y)
        return udim2.new(x, 0, y, 0)
    end
    return udim2
end

local function makeColor3()
    local color3 = {}
    function color3.fromRGB(r, g, b)
        return {R = r or 0, G = g or 0, B = b or 0, type = 'Color3'}
    end
    function color3.fromHSV(h, s, v)
        return {H = h or 0, S = s or 0, V = v or 0, type = 'Color3'}
    end
    return color3
end

local function makeFont()
    local font = {}
    function font.new(id, weight, style)
        return {Id = id, Weight = weight, Style = style, type = 'Font'}
    end
    return font
end

local function buildOnboardingUI(env)
    local onboarding = FakeInstance.new('Onboarding', 'Folder')
    
    local interface = FakeInstance.new('Interface', 'Frame')
    interface.Size = {X = 600, Y = 400}
    interface.Position = {X = 100, Y = 100}
    interface.Interactable = true
    interface.Visible = true
    interface.ImageTransparency = 0
    onboarding:AddChild(interface)
    
    local frame = FakeInstance.new('Frame', 'Frame')
    interface:AddChild(frame)
    
    local pages = FakeInstance.new('Pages', 'Frame')
    frame:AddChild(pages)
    
    local pageNames = {
        'GetStarted', 'Installation', 'UpdateInstructions', 
        'Agreement', 'Configuration', 'Process'
    }
    
    for _, pageName in ipairs(pageNames) do
        local page = FakeInstance.new(pageName, 'Frame')
        page:AddTag('MastersOnboardingPage')
        page.Visible = false
        pages:AddChild(page)
        
        if pageName == 'Installation' then
            local content = FakeInstance.new('Content', 'Frame')
            page:AddChild(content)
            
            local scroll = FakeInstance.new('Scroll', 'ScrollingFrame')
            content:AddChild(scroll)
            
            local actions = FakeInstance.new('Actions', 'Frame')
            content:AddChild(actions)
            
            local installBtn = FakeInstance.new('Install', 'TextButton')
            installBtn.Text = 'Install Masters'
            actions:AddChild(installBtn)
            
            local stations = FakeInstance.new('Stations', 'ImageButton')
            stations:AddTag('MastersExternalButton')
            actions:AddChild(stations)
            
            local external = FakeInstance.new('External', 'Frame')
            scroll:AddChild(external)
            
            local moreDetails = FakeInstance.new('MoreDetails', 'Frame')
            scroll:AddChild(moreDetails)
            local downloads = FakeInstance.new('Downloads', 'TextLabel')
            moreDetails:AddChild(downloads)
            
            local label = FakeInstance.new('Label', 'TextLabel')
            label.Text = 'Instructions'
            stations:AddChild(label)
        end
    end
    
    local process = FakeInstance.new('Process', 'Frame')
    frame:AddChild(process)
    
    local loader = FakeInstance.new('Loader', 'Frame')
    process:AddChild(loader)
    
    local icon = FakeInstance.new('Icon', 'ImageLabel')
    loader:AddChild(icon)
    
    local scale = FakeInstance.new('scale', 'Frame')
    loader:AddChild(scale)
    
    local inactive = FakeInstance.new('Inactive', 'Frame')
    frame:AddChild(inactive)
    
    local outOfAccess = FakeInstance.new('OutOfAccess', 'Frame')
    frame:AddChild(outOfAccess)
    
    local padding = FakeInstance.new('padding', 'UIPadding')
    pages:AddChild(padding)
    
    local onboardingTag = FakeInstance.new('OnboardingTag', 'Frame')
    pages:AddChild(onboardingTag)
    onboardingTag.Visible = false
    
    local viewportWarning = FakeInstance.new('ViewportSizeWarning', 'Frame')
    onboarding:AddChild(viewportWarning)
    viewportWarning.Visible = false
    
    local storage = FakeInstance.new('Storage', 'Folder')
    storage:AddTag('MastersOnboardingTemplate')
    onboarding:AddChild(storage)
    
    local items = FakeInstance.new('Items', 'Folder')
    storage:AddChild(items)
    
    local passItem = FakeInstance.new('PassItem', 'Frame')
    items:AddChild(passItem)
    
    local mainFile = FakeInstance.new('MainFile', 'Folder')
    onboarding:AddChild(mainFile)
    
    return onboarding
end

local function createEnvironment(rootPath)
    local env = setmetatable({}, {__index = _G})
    env.services = {}
    env.loadedModules = {}

    local treeRoot = buildObjectTree(rootPath)

    local function makeService(name, object)
        env.services[name] = object
        object.Name = name
        if type(object.GetService) ~= 'function' then
            object.GetService = function(self, serviceName)
                return env.services[serviceName]
            end
        end
        return object
    end

    env.Enum = makeEnum()

    local workspaceInst = FakeInstance.new('Workspace', 'Folder')
    workspaceInst.Camera = {ViewportSize = {X = 1200, Y = 800}}
    workspaceInst.SetAttribute = function(_, key, value)
        workspaceInst._attributes[key] = value
    end
    workspaceInst.GetAttribute = function(_, key)
        return workspaceInst._attributes[key]
    end

    local game = {
        PlaceId = 123456,
        CreatorId = 123456789,
        CreatorType = env.Enum.CreatorType.User,
        GameId = 987654321,
        CoreGui = FakeInstance.new('CoreGui', 'ScreenGui'),
        GetService = function(self, name)
            return env.services[name]
        end,
        WaitForChild = function(self, name)
            return self[name] or FakeInstance.new(name, 'Folder')
        end
    }
    game.Workspace = workspaceInst

    env.services.RunService = makeService('RunService', {
        IsEdit = function()
            return false
        end
    })

    env.services.GroupService = makeService('GroupService', {
        GetGroupInfoAsync = function(_, _)
            return {Owner = {Id = 123456789}}
        end
    })

    env.services.HttpService = makeService('HttpService', makeSafeHttp())

    env.services.CoreGui = makeService('CoreGui', game.CoreGui)

    env.services.DataStoreService = makeService('DataStoreService', {
        GetDataStore = function(_, _)
            return {
                GetAsync = function() return nil end,
                SetAsync = function() end,
                UpdateAsync = function(_, callback)
                    return callback(nil)
                end
            }
        end
    })

    env.services.UserInputService = makeService('UserInputService', {
        GetMouseLocation = function()
            return {X = 0, Y = 0}
        end,
        GetLastInputType = function() return env.Enum.UserInputType.MouseMovement end
    })

    env.services.MarketplaceService = makeService('MarketplaceService', {
        GetProductInfoAsync = function(_, id, _)
            return {Name = tostring(id), PriceInRobux = 0}
        end,
        PlayerOwnsAsset = function() return false end
    })

    env.services.TweenService = makeService('TweenService', {
        Create = function(_, instance, tweenInfo, properties)
            return {
                Play = function() end,
                Cancel = function() end,
                Pause = function() end,
                Completed = FakeEvent.new()
            }
        end
    })

    env.services.Players = makeService('Players', {
        LocalPlayer = {UserId = 123456, Name = 'ExecutorUser'},
        GetUserThumbnailAsync = function(_, id, thumbnailType, thumbnailSize)
            return 'thumbnail_url', 'png'
        end,
        GetUserIdFromNameAsync = function(_, name)
            return 123456
        end
    })

    env.services.ReplicatedStorage = makeService('ReplicatedStorage', FakeInstance.new('ReplicatedStorage', 'Folder'))
    env.services.ServerScriptService = makeService('ServerScriptService', FakeInstance.new('ServerScriptService', 'Folder'))
    env.services.Workspace = makeService('Workspace', workspaceInst)

    env.game = game
    env.workspace = workspaceInst
    env.script = { Parent = treeRoot }
    env.plugin = { Name = 'MastersPlugin' }
    env.task = { wait = function() end }
    env.os = os
    env.math = math
    env.string = string
    env.table = table
    env.tonumber = tonumber
    env.assert = assert
    env.pcall = pcall
    env.error = error
    env.ipairs = ipairs
    env.pairs = pairs
    env.next = next
    env.type = type
    env.tostring = tostring
    env.warn = print
    env.print = print

    env.Enum = makeEnum()
    env.TweenInfo = {
        new = function(_, duration, style, direction, repeatCount, reverses, delayTime)
            return {
                Time = duration,
                EasingStyle = style,
                EasingDirection = direction,
                RepeatCount = repeatCount,
                Reverses = reverses,
                DelayTime = delayTime
            }
        end
    }
    env.Vector2 = makeVector2()
    env.Vector3 = makeVector3()
    env.UDim = makeUDim()
    env.UDim2 = makeUDim2()
    env.Color3 = makeColor3()
    env.Font = makeFont()
    env.NumberSequence = { new = function(...) return {type='NumberSequence', Values={...}} end }
    env.NumberRange = { new = function(min, max) return {Min = min, Max = max, type='NumberRange'} end }
    env.ColorSequence = { new = function(...) return {type='ColorSequence', Values={...}} end }

    if not table.clone then
        table.clone = function(t)
            local copy = {}
            for k, v in pairs(t) do
                copy[k] = v
            end
            return copy
        end
    end

    env.Nb = {
        game = game,
        workspace = workspaceInst,
        script = env.script,
        plugin = env.plugin,
        table = table,
        string = string,
        math = math,
        os = os,
        task = env.task,
        pcall = pcall,
        warn = print,
        Enum = env.Enum,
        TweenInfo = env.TweenInfo,
        require = function(moduleObj)
            if type(moduleObj) ~= 'table' or not moduleObj.__path then
                error('Unsupported require target: ' .. tostring(moduleObj))
            end
            if env.loadedModules[moduleObj.__path] then
                return env.loadedModules[moduleObj.__path]
            end
            local chunk, err = loadfile(moduleObj.__path, 't', env)
            if not chunk then
                error(err)
            end
            local result = chunk()
            env.loadedModules[moduleObj.__path] = result or true
            return env.loadedModules[moduleObj.__path]
        end
    }

    env.require = env.Nb.require
    env.game = game
    env.ReplicatedStorage = env.services.ReplicatedStorage
    env.ServerScriptService = env.services.ServerScriptService
    env.CoreGui = env.services.CoreGui
    env.RunService = env.services.RunService
    env.GroupService = env.services.GroupService
    env.HttpService = env.services.HttpService
    env.DataStoreService = env.services.DataStoreService
    env.UserInputService = env.services.UserInputService
    env.MarketplaceService = env.services.MarketplaceService
    env.TweenService = env.services.TweenService
    env.Players = env.services.Players
    env.Workspace = env.services.Workspace

    env.script.Parent.MainFile = treeRoot.MainFile or FakeInstance.new('MainFile', 'Folder')
    env.script.Parent.Modules = treeRoot.Modules or FakeInstance.new('Modules', 'Folder')
    
    local onboardingUI = buildOnboardingUI(env)
    env.script.Parent.Onboarding = onboardingUI
    
    local installBtn = onboardingUI:FindFirstChild('Interface'):FindFirstChild('Frame'):FindFirstChild('Pages'):FindFirstChild('Installation'):FindFirstChild('Content'):FindFirstChild('Actions'):FindFirstChild('Install')
    
    if installBtn then
        installBtn.MouseButton1Click:Connect(function()
            print('[Executor] Install button clicked - triggering InstallMasters')
            if type(env.Nb.InstallMasters) == 'function' then
                local ok, err = pcall(env.Nb.InstallMasters)
                if not ok then
                    print('[Executor] InstallMasters error:', err)
                else
                    print('[Executor] InstallMasters completed successfully')
                end
            end
        end)
    end
    
    env.Nb.InstallMasters = function()
        print('[Executor] InstallMasters called')
        local masterServer = env.script.Parent.MainFile:FindFirstChild('Masters(Server)')
        local masterStorage = env.script.Parent.MainFile:FindFirstChild('Masters(Storage)')
        
        if masterServer then
            local cloned = masterServer:Clone()
            cloned.Name = 'Masters'
            cloned:AddChild = function(child)
                env.services.ServerScriptService._children[child.Name] = child
                child._parent = env.services.ServerScriptService
            end
            for _, child in ipairs(masterServer:GetChildren()) do
                local childCopy = child:Clone()
                env.services.ServerScriptService._children[childCopy.Name] = childCopy
                childCopy._parent = env.services.ServerScriptService
            end
            print('[Executor] Installed Masters(Server) children to ServerScriptService')
        end
        
        if masterStorage then
            local cloned = masterStorage:Clone()
            cloned.Name = 'Masters'
            for _, child in ipairs(masterStorage:GetChildren()) do
                local childCopy = child:Clone()
                env.services.ReplicatedStorage._children[childCopy.Name] = childCopy
                childCopy._parent = env.services.ReplicatedStorage
            end
            print('[Executor] Installed Masters(Storage) children to ReplicatedStorage')
        end
    end

    return env
end

M.createEnvironment = createEnvironment
return M

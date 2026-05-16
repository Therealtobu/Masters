local rootPath = "Masters_lua_tree/Masters"
local fake = dofile("Masters_executor/fake_roblox.lua")
local env = fake.createEnvironment(rootPath)

local pluginPath = rootPath .. "/Plugin.server.lua"
local chunk, err = loadfile(pluginPath, "t", env)
if not chunk then
    error("Failed to load plugin file: " .. tostring(err))
end

print("\n=== Masters Plugin Executor Runtime ===\n")

local ok, result = pcall(chunk)
if not ok then
    error("Plugin runtime error: " .. tostring(result))
end

print("\n=== Plugin loaded successfully ===")
print("[Executor] Simulating user clicking Install button...\n")

if env.script and env.script.Parent then
    local onboarding = env.script.Parent.Onboarding
    if onboarding then
        local interface = onboarding:FindFirstChild('Interface')
        if interface then
            local frame = interface:FindFirstChild('Frame')
            if frame then
                local pages = frame:FindFirstChild('Pages')
                if pages then
                    local installation = pages:FindFirstChild('Installation')
                    if installation then
                        local content = installation:FindFirstChild('Content')
                        if content then
                            local actions = content:FindFirstChild('Actions')
                            if actions then
                                local installBtn = actions:FindFirstChild('Install')
                                if installBtn and installBtn.MouseButton1Click then
                                    print("[Executor] Found Install button - firing MouseButton1Click event")
                                    installBtn.MouseButton1Click:Fire()
                                    print("\n=== Installation flow completed ===\n")
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end

local serverChildren = env.services.ServerScriptService:GetChildren()
local replicatedChildren = env.services.ReplicatedStorage:GetChildren()
print("✓ ServerScriptService installed children: " .. #serverChildren)
for _, child in ipairs(serverChildren) do
    print("  - " .. child.Name .. " (" .. child.ClassName .. ")")
end
print("\n✓ ReplicatedStorage installed children: " .. #replicatedChildren)
for _, child in ipairs(replicatedChildren) do
    print("  - " .. child.Name .. " (" .. child.ClassName .. ")")
end

print("\n=== Executor completed successfully ===\n")

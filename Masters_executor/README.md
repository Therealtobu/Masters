# Masters Executor Port

This folder contains a runnable Executor-compatible loader for the extracted `Masters.rbxmx` source tree. It simulates the full onboarding/installation flow as if running in a Roblox plugin executor.

## What is included

- `fake_roblox.lua`: a complete fake Roblox environment with:
  - Full `FakeInstance` system (Clone, Destroy, FindFirstChild, GetChildren, etc.)
  - Event system (MouseButton1Click, InputBegan, Changed, etc.)
  - All standard Roblox types (Enum, TweenInfo, Vector2/3, UDim/UDim2, Color3, Font, etc.)
  - Services: RunService, HttpService, GroupService, DataStoreService, Players, MarketplaceService, TweenService, Workspace, ReplicatedStorage, ServerScriptService, CoreGui, UserInputService
  - **Fake Onboarding/Interface UI tree** that matches plugin structure (Pages, Installation, etc.)

- `run_plugin.lua`: loads and executes the plugin with:
  1. Creates complete fake Onboarding UI with Install button
  2. Loads `Masters_lua_tree/Masters/Plugin.server.lua` 
  3. Simulates user clicking the Install button
  4. Clones extracted modules into fake ServerScriptService/ReplicatedStorage

## How to run

From the repository root, use Docker with Lua:

```bash
docker run --rm -v "$PWD":/workspace -w /workspace focal lua Masters_executor/run_plugin.lua
```

Or if you have Lua 5.4+ installed locally:

```bash
lua Masters_executor/run_plugin.lua
```

## Flow

1. Plugin loads and initializes with fake Roblox services
2. Fake Onboarding UI tree is created in `script.Parent.Onboarding`
3. UI Install button has event handler connected to `Nb.InstallMasters`
4. `run_plugin.lua` simulates clicking the Install button
5. `InstallMasters` clones Masters(Server) and Masters(Storage) into services
6. Installed modules are printed to console

## Notes

- The fake environment stubs all necessary Roblox APIs so plugin logic can execute
- UI object tree is built to match plugin's expected structure (Onboarding → Interface → Frame → Pages)
- Installation is "executor-safe" - modules are cloned into service folders, not actual Studio locations
- Flow is 100% simulated; no actual Roblox instance or Studio required

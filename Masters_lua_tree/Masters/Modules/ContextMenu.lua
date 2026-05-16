local InputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

local quick = TweenInfo.new(.25, Enum.EasingStyle.Exponential)
local normal = TweenInfo.new(.5, Enum.EasingStyle.Exponential)
local smooth = TweenInfo.new(.8, Enum.EasingStyle.Exponential)

local modules = script.Parent
local folder = modules.Parent

local ui = folder.Onboarding
local ContextMenu = ui.ContextMenu

-- Type

export type MastersContextMenu = {
	Header: string?,
	Options: any,
}

-- Functions

local module = {}

local function PositionContextMenu()
	local SizeRef = ContextMenu.SizeReference
	local Menu = ContextMenu.Frame

	local mouse = InputService:GetMouseLocation()
	local viewportSize = workspace.CurrentCamera.ViewportSize

	local padding = 8
	local offset = 12

	local finalSize = SizeRef.AbsoluteSize
	local multiplier = .2
	local ScaledDown = Vector2.new((finalSize.X * multiplier), (finalSize.Y * multiplier))

	local rawX = mouse.X + padding
	local rawY = mouse.Y + padding

	if rawX + finalSize.X > viewportSize.X then
		rawX = viewportSize.X - finalSize.X - padding
	end
	if rawY + finalSize.Y > viewportSize.Y then
		rawY = viewportSize.Y - finalSize.Y - padding
	end
	if rawX < padding then
		rawX = padding
	end
	if rawY < padding then
		rawY = padding
	end

	local fromY = rawY + (rawY + finalSize.Y > viewportSize.Y and offset or -offset)

	Menu.Position = UDim2.fromOffset(mouse.X - ScaledDown.X , mouse.Y)
	Menu.Size = UDim2.fromOffset(ScaledDown.X, ScaledDown.Y)
	Menu.ImageTransparency = 1
	Menu.Visible = true

	Menu.Content.padding.PaddingTop = UDim.new(0, 50)
	Menu.Content.list.Padding = UDim.new(1, 0)

	TweenService:Create(Menu, normal, {Position = UDim2.fromOffset(rawX - 30, rawY - 30)}):Play()
	TweenService:Create(Menu, normal, {ImageTransparency = 0}):Play()
	TweenService:Create(Menu, smooth, {Size = UDim2.fromOffset(finalSize.X, finalSize.Y)}):Play()

	TweenService:Create(Menu.Content.padding, quick, {PaddingTop = UDim.new(0, 10)}):Play()
	TweenService:Create(Menu.Content.list, normal, {Padding = UDim.new(0, 5)}):Play()
end

local Contexting = false
local MAX_ITEMS = 8

function module.PromptOptions(data: MastersContextMenu)
	if Contexting then return end
	Contexting = true

	local currentOptions = data.Options
	local remainingOptions = nil
	local isSplit = #data.Options > MAX_ITEMS

	if isSplit then
		currentOptions = {}
		remainingOptions = {}

		for i, v in data.Options do
			if i < MAX_ITEMS then
				table.insert(currentOptions, v)
			else
				table.insert(remainingOptions, v)
			end
		end

		table.insert(currentOptions, {
			Name = "More...",
			Icon = "",
			IsMoreButton = true
		})
	end

	local function Clear(parent)
		for _, residual in parent:GetChildren() do
			if residual:HasTag("MastersContextMenuOption") or residual.Name == "Separator" then
				residual:Destroy()
			end
		end
	end

	Clear(ContextMenu.Frame.Content)
	Clear(ContextMenu.Frame.Content.Primary)
	Clear(ContextMenu.SizeReference.Content)
	Clear(ContextMenu.SizeReference.Content.Primary)

	local ActionChosen = ""
	local ActionChosenExtraData = nil
	local ContextProceeded = false
	local ContextCancelled = false
	local OpenNextPage = false

	for i, entry in currentOptions do
		if entry == "SEPARATOR" then
			local SizeRefItem = ContextMenu.SizeReference.Content.list.Separator:Clone()
			SizeRefItem.LayoutOrder = i
			SizeRefItem.Parent = ContextMenu.SizeReference.Content 

			local item = ContextMenu.Frame.Content.list.Separator:Clone()
			
			item.LayoutOrder = i
			item.Parent = ContextMenu.Frame.Content
			
		elseif typeof(entry) == "table" and entry.Name and entry.Icon then
			local item
			local SizeRefItem

			if entry.Primary then
				SizeRefItem = ContextMenu.SizeReference.Content.list.PrimaryAction:Clone()
				SizeRefItem.Parent = ContextMenu.SizeReference.Content.Primary
				item = ContextMenu.Frame.Content.list.PrimaryAction:Clone()
				item.Parent = ContextMenu.Frame.Content.Primary
			else
				SizeRefItem = ContextMenu.SizeReference.Content.list.Action:Clone()
				SizeRefItem.Parent = ContextMenu.SizeReference.Content
				item = ContextMenu.Frame.Content.list.Action:Clone()
				item.Parent = ContextMenu.Frame.Content
			end

			SizeRefItem.LayoutOrder = i
			SizeRefItem.Name = entry.Name
			SizeRefItem.label.Text = entry.Name
			SizeRefItem.icon.Image = entry.Icon

			item.LayoutOrder = i
			item.Name = entry.Name
			item.label.Text = entry.Name
			item.icon.Image = entry.Icon

			item.MouseButton1Click:Connect(function()
				if entry.IsMoreButton then
					OpenNextPage = true
					ContextProceeded = true
				else
					ActionChosen = entry.Name
					ActionChosenExtraData = entry.ExtraData
					ContextProceeded = true
				end
			end)
		end
	end

	local hasHeader = data.Header ~= nil
	
	ContextMenu.SizeReference.Content.Header.Visible = hasHeader
	ContextMenu.Frame.Content.Header.Visible = hasHeader
	
	if hasHeader then
		ContextMenu.SizeReference.Content.Header.label.Text = data.Header
		ContextMenu.Frame.Content.Header.label.Text = data.Header
	end

	ContextMenu.SizeReference.Content.Primary.Visible = (#ContextMenu.SizeReference.Content.Primary:GetChildren() - 1) > 0
	ContextMenu.Frame.Content.Primary.Visible = (#ContextMenu.Frame.Content.Primary:GetChildren() - 1) > 0
	ContextMenu.Visible = true
	PositionContextMenu()

	local connections = {}

	table.insert(connections, ContextMenu.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.MouseButton2 then
			ContextCancelled = true
		end
	end))

	table.insert(connections, ContextMenu.InputEnded:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.Touch then
			ContextCancelled = true
		end
	end))

	repeat task.wait() until ContextProceeded or ContextCancelled

	for _, conn in connections do conn:Disconnect() end
	
	ContextMenu.Visible = false
	ContextMenu.Frame.Visible = false
	Contexting = false

	if OpenNextPage then
		return module.PromptOptions({
			Header = data.Header,
			Options = remainingOptions
		})
		
	elseif ContextProceeded then
		return ActionChosen, ActionChosenExtraData
	end

	return nil
end

return module
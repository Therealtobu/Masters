local plugin = plugin or script:FindFirstAncestorWhichIsA("Plugin")
local widget = plugin:CreateDockWidgetPluginGui("OnboardingExternal", DockWidgetPluginGuiInfo.new(
	Enum.InitialDockState.Float,
	false, true,
	10, 10,
	10, 10
	))

widget.Name = "MastersOnboarding"
widget.Title = "Masters Onboarding"

local module = {}

function module.PlaySound(soundId, volume, looped)
	local sound = Instance.new("Sound")
	sound.Name = tostring(soundId)
	sound.SoundId = "rbxassetid://" .. soundId
	sound.Volume = volume or .5
	sound.Looped = looped
	
	sound.Parent = widget

	if not looped then
		sound.Ended:Connect(function()
			sound:Destroy()
		end)
	end

	sound:Play()
end

function module.StopLoopedSound(soundId)
	for i, sound in pairs(widget:GetChildren()) do
		if sound.Name == tostring(soundId) then
			sound:Destroy()
		end
	end
end

return module
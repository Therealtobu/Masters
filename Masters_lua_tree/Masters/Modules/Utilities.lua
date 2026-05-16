local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local TextService = game:GetService("TextService")
local UserService = game:GetService("UserService")
local HapticService = game:GetService("HapticService")

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local info = TweenInfo.new(.5, Enum.EasingStyle.Exponential)
local slow = TweenInfo.new(.8, Enum.EasingStyle.Exponential)

local modules = script.Parent

local module = {}

-- Time

local monthNames = {"January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"}
local monthShort = {"Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"}

local function GetRelatives(epoch)
	local now = os.time()
	local diff = now - epoch

	local minutes = math.floor(math.abs(diff) / 60)
	local hours = math.floor(minutes / 60)
	local days = math.floor(hours / 24)
	local weeks = math.floor(days / 7)
	local months = math.floor(days / 30)
	local years = math.floor(days / 365)

	if diff == 0 then return "Now" end
	if diff > 0 then -- Past
		if years >= 1 then return years == 1 and "A year ago" or years .. " years ago" end
		if months >= 1 then return months == 1 and "A month ago" or months .. " months ago" end
		if weeks >= 1 then return weeks == 1 and "A week ago" or weeks .. " weeks ago" end
		if days == 1 then return "Yesterday" end
		if days > 1 then return days .. " days ago" end
		if hours >= 1 then return hours == 1 and "An hour ago" or hours .. " hours ago" end
		if minutes >= 1 then return minutes == 1 and "A minute ago" or minutes .. " minutes ago" end
		return "A moment ago"
	else -- Future
		diff = -diff
		if years >= 1 then return years == 1 and "Next year" or "In " .. years .. " years" end
		if months >= 1 then return months == 1 and "Next month" or "In " .. months .. " months" end
		if weeks >= 1 then return weeks == 1 and "Next week" or "In " .. weeks .. " weeks" end
		if days == 1 then return "Tomorrow" end
		if days > 1 then return "In " .. days .. " days" end
		if hours >= 1 then return hours == 1 and "In an hour" or "In " .. hours .. " hours" end
		if minutes >= 1 then return minutes == 1 and "In a minute" or "In " .. minutes .. " minutes" end
		return "Soon"
	end
end

function module.FormatEpochData(epoch)
	local timeTable = os.date("*t", epoch)
	local hour = timeTable.hour % 12
	local period = timeTable.hour < 12 and "AM" or "PM"

	if hour == 0 then hour = 12 end

	return {
		Time = {
			Hour = hour,
			Minutes = string.format("%02d", timeTable.min),
			Seconds = string.format("%02d", timeTable.sec),
			Period = period
		},

		Calender = {
			Month = {
				Short = monthShort[timeTable.month],
				Long = monthNames[timeTable.month],
				Numerical = timeTable.month
			},
			Day = timeTable.day,
			Year = {
				Short = timeTable.year % 100,
				Long = timeTable.year
			}
		},

		Relative = GetRelatives(epoch),

		Epoch = epoch
	}
end

function IsLeapYear(year)
	return (year % 4 == 0 and year % 100 ~= 0) or (year % 400 == 0)
end

function GetMonthDays(year)
	return {
		31, -- Jan
		IsLeapYear(year) and 29 or 28, -- Feb
		31, -- Mar
		30, -- Apr
		31, -- May
		30, -- Jun
		31, -- Jul
		31, -- Aug
		30, -- Sep
		31, -- Oct
		30, -- Nov
		31  -- Dec
	}
end

function GetYearDays(year)
	return IsLeapYear(year) and 366 or 365
end

function module.GetEpochStats(epoch, unit, within)
	local data = os.date("*t", epoch)
	local year, month, day = data.year, data.month, data.day
	local hour, min, sec = data.hour, data.min, data.sec
	local monthDays = GetMonthDays(year)
	local daysInMonth = monthDays[month]
	local daysInYear = GetYearDays(year)

	unit = unit:lower()
	within = within:lower()

	if within == "minute" then
		if unit == "seconds" then return sec end

	elseif within == "hour" then
		if unit == "minutes" then return min end
		if unit == "seconds" then return min * 60 + sec end

	elseif within == "day" then
		if unit == "hours" then return hour end
		if unit == "minutes" then return hour * 60 + min end
		if unit == "seconds" then return hour * 3600 + min * 60 + sec end

	elseif within == "week" then
		if unit == "days" then return data.wday - 1 end

	elseif within == "month" then
		if unit == "days" then return day end
		if unit == "hours" then return ((day - 1) * 24) + hour end
		if unit == "minutes" then return ((day - 1) * 24 * 60) + (hour * 60) + min end
		if unit == "seconds" then return ((day - 1) * 86400) + (hour * 3600) + (min * 60) + sec end

	elseif within == "year" then
		local dayOfYear = 0
		for m = 1, month - 1 do
			dayOfYear += monthDays[m]
		end
		dayOfYear += day

		if unit == "days" then return dayOfYear end
		if unit == "months" then return month end
		if unit == "hours" then return (dayOfYear - 1) * 24 + hour end
		if unit == "minutes" then return ((dayOfYear - 1) * 24 * 60) + (hour * 60) + min end
		if unit == "seconds" then return ((dayOfYear - 1) * 86400) + (hour * 3600) + (min * 60) + sec end
	end

	return nil
end

function module.FormatISO(ISO)
	local pattern = "(%d+)%-(%d+)%-(%d+)T(%d+):(%d+):(%d+)%.*(%d*)Z"
	local year, month, day, hour, min, sec, frac = ISO:match(pattern)

	if not (year and month and day and hour and min and sec) then
		error("Invalid ISO 8601 format")
	end

	local utcTime = os.time({
		year = tonumber(year),
		month = tonumber(month),
		day = tonumber(day),
		hour = tonumber(hour),
		min = tonumber(min),
		sec = tonumber(sec)
	})

	local localTime = os.date("*t", utcTime)
	local formattedTime = os.date("%B %d, %Y %I:%M:%S %p", utcTime)

	return formattedTime
end

function module.GetISO8601()
	local utcTime = os.time()
	local formattedTime = os.date("!%Y-%m-%dT%H:%M:%SZ", utcTime)

	return formattedTime
end

function module.FormatSecondsToHM(seconds)
	if not seconds or typeof(seconds) ~= "number" or seconds < 60 then
		return nil
	end

	local minutes = math.floor(seconds / 60)
	local hours = math.floor(minutes / 60)
	minutes = minutes % 60

	if hours > 0 then
		return string.format("%dh %dm", hours, minutes)
	else
		return string.format("%dm", minutes)
	end
end

function module.FormatSecondsToYM(days)
	if not days or typeof(days) ~= "number" or days < 30 then
		return nil
	end

	local months = math.floor(days / 30)
	local years = math.floor(months / 12)
	months = months % 12

	if years > 0 then
		if months > 0 then
			return string.format("%dy %dmos", years, months)
		else
			return string.format("%dy", years)
		end
	else
		return string.format("%dmos", months)
	end
end

function module.FormatTime(seconds)
	assert(typeof(seconds) == "number" and seconds >= 0, "seconds must be a non-negative number.")

	local days = math.floor(seconds / 86400)
	seconds = seconds % 86400
	local hours = math.floor(seconds / 3600)
	seconds = seconds % 3600
	local minutes = math.floor(seconds / 60)
	seconds = seconds % 60

	local function PadWithZero(value)
		return string.format("%02d", value)
	end

	return {
		Days = days,
		Hours = hours,
		Minutes = minutes,
		Seconds = PadWithZero(seconds)
	}
end

function module.FormatTimeStringToSeconds(timeString)
	local total = 0

	local patterns = {
		{ unit = "[wW]", multiplier = 7 * 24 * 60 * 60 },
		{ unit = "[dD]", multiplier = 24 * 60 * 60 },
		{ unit = "[hH]", multiplier = 60 * 60 },
		{ unit = "[mM]", multiplier = 60 },
	}

	for _, pattern in ipairs(patterns) do
		local value = timeString:match("(%d+)%s*" .. pattern.unit)
		if value then
			total = total + tonumber(value) * pattern.multiplier
		end
	end

	return math.clamp(total, 60, 999999999)
end

function module.FormatSecondsToRealDate(seconds)
	local now = os.time()
	local targetTime = now + seconds
	local targetDate = os.date("*t", targetTime)
	local daysDifference = os.difftime(targetTime, now) // (24 * 60 * 60)
	local formattedTime = os.date("%I:%M%p", targetTime):gsub("^0", "")

	if daysDifference == 0 then
		return string.format("Today, %s", formattedTime)
	elseif daysDifference == 1 then
		return string.format("Tomorrow, %s", formattedTime)
	else
		return string.format("%d/%d/%d, %s", targetDate.month, targetDate.day, targetDate.year % 100, formattedTime)
	end
end

function module.FormatSecondsToYWDHM(seconds)
	local timeUnits = {
		{ name = "y", seconds = 31536000 },
		{ name = "w", seconds = 604800 },
		{ name = "d", seconds = 86400 },
		{ name = "h", seconds = 3600 },
		{ name = "m", seconds = 60 },
	}

	local result = {}

	for _, unit in ipairs(timeUnits) do
		if #result < 3 and seconds >= unit.seconds then
			local value = math.floor(seconds / unit.seconds)
			seconds = seconds % unit.seconds
			table.insert(result, value .. unit.name)
		end
	end

	return #result > 0 and table.concat(result, " ") or nil
end

function module.FormateSecondsToWord(seconds)
	assert(typeof(seconds) == "number" and seconds >= 0, "Seconds must be a non-negative number.")

	local units = {
		{name = "year", seconds = 31536000},
		{name = "month", seconds = 2592000},
		{name = "week", seconds = 604800},
		{name = "day", seconds = 86400},
		{name = "hour", seconds = 3600},
		{name = "minute", seconds = 60},
		{name = "second", seconds = 1},
	}

	for _, unit in ipairs(units) do
		local value = math.floor(seconds / unit.seconds)

		if value >= 1 then
			return string.format("%d %s%s", value, unit.name, value > 1 and "s" or "")
		end
	end

	return "0 seconds"
end

function module.FormatSecondsToMSS(seconds)
	local minutes = math.floor(seconds / 60)
	local secs = seconds % 60

	return string.format("%d:%02d", minutes, secs)
end

-- Interface / Numbers

function module.SwitchToggle(Switch, State)
	if State then
		TweenService:Create(Switch, info, {ImageColor3 = Color3.fromRGB(0, 185, 62)}):Play()
		TweenService:Create(Switch.Knob, info, {Position = UDim2.fromScale(1, .5),
			ImageColor3 = Color3.fromRGB(0, 85, 28)}):Play()
	else
		TweenService:Create(Switch, info, {ImageColor3 = Color3.fromRGB(34, 34, 34)}):Play()
		TweenService:Create(Switch.Knob, info, {Position = UDim2.fromScale(0, .5),
			ImageColor3 = Color3.fromRGB(12, 12, 12)}):Play()
	end
end

function module.GetRelativePixels(DesiredVector2, ParentVector2)
	return DesiredVector2 - ParentVector2
end

function module.Map(Value, ValueMin, ValueMax, PostMin, PostMax)
	return PostMin + (Value - ValueMin) * (PostMax - PostMin) / (ValueMax - ValueMin)
end

function module.RandomOffRange(MinValue, OffMin, OffMax, MaxValue)
	if math.random() < .5 then
		return math.random() * (OffMin - MinValue) + MinValue
	else
		return math.random() * (MaxValue - OffMax) + OffMax
	end
end

function module.GetCoverForSong(SongId)
	return module.AssetToTexture(SongId)
end

function module.AssetToTexture(assetid)
	return "https://www.roblox.com/Thumbs/Asset.ashx?width=420&height=420&assetId=" .. assetid
end

function module.CapitalizeWords(text)
	return (text:gsub("(%a)([%w_']*)", function(first, rest)
		return first:upper() .. rest:lower()
	end))
end

function module.ResetScrollPosition(ui:GuiObject)
	for i, scroll in pairs(ui:GetDescendants()) do
		if scroll:IsA("ScrollingFrame") then
			scroll.CanvasPosition = Vector2.new(0, 0)
		end
	end
end

function module.GetPlayerThumbnail(id)
	return Players:GetUserThumbnailAsync(id or 1, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)
end

function module.AdjustColor(color)
	local r, g, b = color.R * 255, color.G * 255, color.B * 255
	local brightness = (r * 0.299 + g * 0.587 + b * 0.114) / 255
	local adjustmentFactor = brightness < .5 and .3 or -.3

	r = math.clamp(r + adjustmentFactor * 255, 0, 255)
	g = math.clamp(g + adjustmentFactor * 255, 0, 255)
	b = math.clamp(b + adjustmentFactor * 255, 0, 255)

	return Color3.fromRGB(r, g, b)
end

function module.TrimString(input, max)
	if #input > max then
		return input:sub(1, max)
	else
		return input
	end
end

function module.ShuffleString(input)
	local chars = {}

	for char in input:gmatch(".") do
		table.insert(chars, char)
	end

	for i = #chars, 2, -1 do
		local j = math.random(1, i)
		chars[i], chars[j] = chars[j], chars[i]
	end

	local shuffled = table.concat(chars)

	return shuffled
end

function module.AddBadgeToIdentifier(identifier, isVerified, Membership)
	local isPremium = Membership == Enum.MembershipType.Premium

	if isVerified and isPremium then
		return identifier .. utf8.char(0xE000) .. " " .. utf8.char(0xE001)
	elseif isVerified and not isPremium then
		return identifier .. utf8.char(0xE000)
	elseif not isVerified and isPremium then
		return identifier .. utf8.char(0xE001)
	elseif not isVerified and not isPremium then
		return identifier 
	end
end

-- Tables

function module.RemoveDuplicateFromTable(inputTable)
	local Seen = {}
	local Result = {}

	for _, value in inputTable do
		if not Seen[value] then
			table.insert(Result, value)
			
			Seen[value] = true
		end
	end

	return Result
end

function module.GetTagsBySongId(Audios, SongId, Title)
	for i, Chunk in pairs(Audios) do
		for i, Song in pairs(Chunk) do
			if Song.Id == SongId then
				return Song.Tags
			end
		end
	end
	
	local AudioSearchParams = Instance.new("AudioSearchParams")
	AudioSearchParams.Title = Title
end

function module.CombineTables(t1, t2)
	local result = {}

	for i, v in ipairs(t1) do
		result[i] = v
	end

	for i, v in ipairs(t2) do
		result[i] = v
	end

	return result
end

function module.GetElementsNumber(t)
	local copy = {}

	for i, v in pairs(t) do
		table.insert(copy, v)
	end

	return #copy
end

function module.SerializeNumberTable(t)
	return table.concat(t, ",")
end

function module.DeserializeNumberTable(serialized)
	local result = {}

	for number in serialized:gmatch("[^,]+") do
		table.insert(result, tonumber(number))
	end

	return result
end

function module.ExtractTableContents(t, start, last)
	local result = {}

	for i = start, last do
		table.insert(result, t[i])
	end

	return result
end

function module.RemoveRange(tbl, StartIndex, EndIndex)
	local t = {}

	for i, e in pairs(tbl) do
		table.insert(t, e)
	end

	for i = EndIndex, StartIndex, -1 do
		table.remove(t, i)
	end

	return t
end

-- Scripts

function module.SetStatusForScriptDescendants(item, status)
	for i, s in pairs(item:GetDescendants()) do
		if s:IsA("LocalScript") and not s:HasTag("MastersExcludeScript") then
			s.Enabled = status
		end
	end
end

-- Misc

function module.GetViewportRatio()
	local viewport = workspace.CurrentCamera.ViewportSize

	return viewport.X + viewport.Y
end

function module.GetNameByUserIdAsync(id, AddAt)
	local success, result = pcall(function()
		return Players:GetNameFromUserIdAsync(id)
	end)

	if success then
		if AddAt then
			return "@" .. result
		else
			return result
		end
	end

	return ""
end

function module.GetDisplayNameById(id)
	local success, result = pcall(function()
		return UserService:GetUserInfosByUserIdsAsync({id})[1]
	end)

	if success then
		if result then
			return result.DisplayName
		else
			return ""
		end
	end

	return ""
end

function module.GetUserInfoByUserId(id)
	local success, result = pcall(function()
		return UserService:GetUserInfosByUserIdsAsync({id})
	end)

	if success then
		return result[1]
	end

	return nil
end

function module.GetUserIdByNameAsync(name)
	local success, result = pcall(function()
		return Players:GetUserIdFromNameAsync(name)
	end)

	if success then
		return result
	end

	return nil
end

function module.PlayersToUserIds(PlayerTable)
	local UserIds = {}

	for i, plr in PlayerTable do
		table.insert(UserIds, plr.UserId)
	end

	return UserIds
end

return module
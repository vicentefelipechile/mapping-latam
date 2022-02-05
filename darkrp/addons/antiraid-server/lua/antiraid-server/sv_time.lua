-- local timing = os.date("%H%M%S", time)  <---  Esto incluia segundos

--[[
local time = os.time()
local timing = os.date("%H%M", time)

local time_start = 100
local time_end = 900

local blockedmodels = {}

if timing >= time_start then
	sbox_maxprops 20



elseif timing <= time_end then



else
	print("Wotefok?!")
end]]--

local time_cooldown = (24 * (60 * 60)) -- Each 24 hours
local function MP_RunTimer()
	local system_time = os.time() -- Current system's time
	local system_Time_next = cookie.GetNumber("MPCookie_ServerTime", 0) -- Saved next system's time for checking
	if (system_time >= system_time_next) then -- The cooldown ended?
		cookie.Set("MPCookie_ServerTime", system_time + time_cooldown) -- Okay, reset the cooldown back to 24 hours
	end
end
hook.Add("Tick", "MP_AutoTimer", MP_RunTimer) -- Hook to keep it running
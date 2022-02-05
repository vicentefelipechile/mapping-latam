-- local timing = os.date("%H%M%S", time)  <---  Esto incluia segundos

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
end
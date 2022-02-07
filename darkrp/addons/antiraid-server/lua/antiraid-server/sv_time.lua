local cooldown = 86400 -- 24 hours in seconds (24*60*60)

local function OneAmTime()
	RunConsoleCommand("sbox_maxprops", 20)
end

local function ElevenAmTime()
	RunConsoleCommand("sbox_maxprops", 50)
end

local function myFunc()
	local nextUse = cookie.GetNumber( "myFuncNextUse", 0 )
	local time = os.time()

	if time < nextUse then
		print( "The event is on cooldown and has not been triggered" )
		local nextUseString = os.date( "%Y/%m/%d - %H:%M:%S" , nextUse ) -- Format the next use time nicely
		print( "The event will be available for use again on: " .. nextUseString )
	else
		print( "The event has been successfully triggered!" )
		cookie.Set( "myFuncNextUse", time + cooldown )
	end
end


AddCSLuaFile()

if SERVER then
	CATEGORY_NAME = "LazMod-SimpleAdvert"
	ServerLog( CATEGORY_NAME..".lua reloaded. \n")

	LM = LM or {}
	LM.COLOR = LM.COLOR or {}
	LM.COLOR.ConMsgC = Color(100,255,100)
	LM.ADVS = LM.ADVS or {}
	LM.ADVS.pathFolder = "LazMod/SimpleAdvert"
	LM.ADVS.pathList = LM.ADVS.pathFolder.."/advlist.txt"
end
	
----------------------------------------------------
----- Settings
----------------------------------------------------
local cvar_enable = CreateConVar( "lm_advs_enable", 1, FCVAR_ARCHIVE+FCVAR_NOTIFY, "Enable the adverst or not" )
local cvar_delay = CreateConVar( "lm_advs_delay", 30, FCVAR_ARCHIVE+FCVAR_NOTIFY, "Time between advs being broadcasted" )
local cvar_random = CreateConVar( "lm_advs_random", 1, FCVAR_ARCHIVE+FCVAR_NOTIFY, "Randomly broadcast the advs" )
local cvar_debug = CreateConVar( "lm_advs_debug", 0, FCVAR_ARCHIVE+FCVAR_NOTIFY, "Enabling debug mode will also print the advert to server console" )
local cvar_color_r = CreateConVar( "lm_advs_color_r", 100, FCVAR_ARCHIVE+FCVAR_NOTIFY, "Color of advs (Red)" )
local cvar_color_g = CreateConVar( "lm_advs_color_g", 255, FCVAR_ARCHIVE+FCVAR_NOTIFY, "Color of advs (Green)" )
local cvar_color_b = CreateConVar( "lm_advs_color_b", 100, FCVAR_ARCHIVE+FCVAR_NOTIFY, "Color of advs (Blue)" )
local cvar_usecvar = CreateConVar( "lm_advs_color_usecvar", 0, FCVAR_ARCHIVE+FCVAR_NOTIFY, "Set to 1 to use colors from convars instead list" )


----------------------------------------------------
----- Commands - since idk how to hook client cmd event to server :P
----------------------------------------------------
concommand.Add( "reloadadvs", function(ply, cmd, args)
	if SERVER then
		for _,ply in pairs( player.GetHumans() ) do
			ply:SendLua( "chat.AddText( Color(255,255,255), \"[LazMod-SimpleAdvert] Delay changed, adverts will start soon\" )" )
		end
	
		LM.ADVS.Initialize()
	end
	
	if CLIENT then
		ply:ConCommand("say /reloadadvs")
	end
end)
if CLIENT then return end

hook.Add("PlayerSay", "LM.ADVS.RunCommands", function( ply, text, teamchat )
	
	text = string.lower(text)
	
	if string.StartWith( text, "/reloadadvs" ) then
		for _,ply in pairs( player.GetHumans() ) do
			ply:SendLua( "chat.AddText( Color(255,255,255), \"[LazMod-SimpleAdvert] Delay changed, adverts will start soon\" )" )
		end
		LM.ADVS.Initialize()
		return ""
	end
	
end )


----------------------------------------------------
----- Initialize the script and removes old timer
----------------------------------------------------
function LM.ADVS.Initialize()
	if timer.Exists( "LM.ADVS.AdvertTimer" ) then
		timer.Remove( "LM.ADVS.AdvertTimer" )
	end
	
	if !cvar_enable:GetBool() then return end
	
	if !LM.ADVS.CheckList() then return end
	if !LM.ADVS.ReadList() then return end
	LM.ADVS.Run()
end

function LM.ADVS.CheckList()
	
	if not file.Exists( LM.ADVS.pathList, "DATA" ) then
		
		MsgC( LM.COLOR.ConMsgC, "[LazMod-SimpleAdvert] Advert list not exist, creating default list...\n" )
		MsgC( LM.COLOR.ConMsgC, "[LazMod-SimpleAdvert] data/"..LM.ADVS.pathList.."\n" )
		
		if not file.Exists( LM.ADVS.pathFolder, "DATA" ) then
			file.CreateDir( LM.ADVS.pathFolder )
		end
		
		local tmpFile = {
			
			{
				color = "255 100 100 255",
				text = "[Info] This will print red info",
			},
			{
				color = "100 100 255 255",
				text = "[Info] This will print blue info",
			},
			{
				color = "100 255 100 255",
				text = "[Info] This will print green info, but wont be broadcasted since its disabled, you can set it to false or remove the line to enable it",
				disabled = true,
			},
		}
		
		-- file.Append( LM.ADVS.pathList, " \"__comment\" = \"Thanks for using LazMod\n please add the adverts with following examples,\",\n\n" )
		file.Append( LM.ADVS.pathList, util.TableToJSON(tmpFile,true) )
		
		if not file.Exists( LM.ADVS.pathList, "DATA" ) then
			Error( "[LazMod-SimpleAdvert] Failed to create default list, please check you have permission to create/write files\n" )
			return false
		end
		
	end
	
	return true
end


function LM.ADVS.ReadList()

	local listData = file.Read( LM.ADVS.pathList, "DATA" )
	local count = 0
	LM.ADVS.AdvList = util.JSONToTable( listData )
	
	
	for _, adv in pairs(LM.ADVS.AdvList) do
		if !adv.disabled then count = count+1 end
	end
	
	if #LM.ADVS.AdvList < 2 or count < 2 then
		Error( "[LazMod-SimpleAdvert] You need at least 2 enabled adverts!\n" )
		return false
	end
	
	return true
end

----------------------------------------------------
----- The code that running advertises
----------------------------------------------------
function LM.ADVS.Run()

	-- local current = math.Round( math.Rand( 1, #LM.ADVS.AdvList ) )
	local current = 0
	local last = -1
	
	timer.Create( "LM.ADVS.AdvertTimer", cvar_delay:GetInt(), 0, function()
		
		while( LM.ADVS.AdvList[current] == LM.ADVS.AdvList[last] or LM.ADVS.AdvList[current].disabled ) do
			if cvar_random:GetBool() then
				current = math.Round( math.Rand( 1, #LM.ADVS.AdvList ) )
				
			else
				current = current + 1
				if current > table.Count(LM.ADVS.AdvList) then current = 1 end
				
			end
		end
		last = current
		local curAdv = LM.ADVS.AdvList[current]
		
		local color
		if cvar_usecvar:GetBool() then
			color = Color( cvar_color_r:GetInt(), cvar_color_g:GetInt(), cvar_color_b:GetInt() )
		elseif !curAdv.color or !IsColor( string.ToColor(curAdv.color) ) then
			color = Color( cvar_color_r:GetInt(), cvar_color_g:GetInt(), cvar_color_b:GetInt() )
		else
			color = string.ToColor(curAdv.color)
		end
		
		local colorStr = string.format( "Color(%i,%i,%i)", color.r, color.g, color.b )
		
		for _,ply in pairs( player.GetHumans() ) do
			ply:SendLua( "chat.AddText( "..colorStr..", \""..curAdv.text.."\")" )
		end
		
		if cvar_debug:GetBool() then
			MsgC( colorStr.." - "..curAdv.text.. "\n" )
		end
	end )
	
end


----------------------------------------------------
----- Start the advertise whem map entity loaded
----------------------------------------------------
hook.Add( "InitPostEntity", "LM.ADVS.MapInit", LM.ADVS.Initialize )


----------------------------------------------------
----- When delay time changed, reload the timer
----------------------------------------------------
cvars.AddChangeCallback( "lm_advs_delay", function(cvarName, valueOld, valueNew)
	
	for _,ply in pairs( player.GetHumans() ) do
		ply:SendLua( "chat.AddText( Color(255,255,255), \"[LazMod-SimpleAdvert] Delay changed, adverts will start soon\" )" )
	end
	
	LM.ADVS.Initialize()
	
end, "LM.ADVS.DelayChanged")

----------------------------------------------------
----- When enable changed
----------------------------------------------------
cvars.AddChangeCallback( "lm_advs_enable", function(cvarName, valueOld, valueNew)
	
	LM.ADVS.Initialize()
	
end, "LM.ADVS.EnableChanged")



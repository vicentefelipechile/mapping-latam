------------------------------
// APromoteGUI by Lead4u    //
// Steam: Lead4u2           //
// Version: 2.1             //
// Date: 03-11-2015         //
// If your looking in here  //
// feel free to send me a   //
// message about any issues //
------------------------------

if ULib==nil or GetConVarString("utime_welcome")== "" then print("WARNING: Missing dependancy UTime/ULX/ULib APromote is now inactive.") return end

resource.AddFile("materials/gui/silkicons/cog.vmt")
resource.AddFile("materials/gui/silkicons/cog.vtf")
ULib.ucl.registerAccess( "apromote_settings", "superadmin", "Allows managing all settings related to APromote.", "XGUI" )

notglonbecausepeoplebitch = {}
notglonbecausepeoplebitch.encode = function(what)
	return util.TableToJSON(what)
end
notglonbecausepeoplebitch.decode = function(what)
	return util.JSONToTable(what)
end

local APromote = {};
local set = {} APromote["set"] = set
local grp = {} APromote["grp"] = grp


local function APUpdateGroups()
	//for added groups
		for k, v in pairs(ULib.ucl.groups) do
			if ( APromote["grp"][k] == nil and k != "user") then
				print("Added " .. k .. " to APromote.")
				APromote["grp"][k] = -1
			end
		end
		for k, v in pairs(APromote["grp"]) do
			if ( k != nil and !ULib.ucl.groups[k]) or k == "user" then
				print("Removed " .. k .. " from APromote.")
				APromote["grp"][k] = nil
			end
		end
		xgui.sendDataTable( {}, "AP_SendData" )
		file.Write("apromote/settings.txt", notglonbecausepeoplebitch.encode(APromote))
end

local function loadAP()
	xgui.addDataType( "AP_SendData", function() return APromote["grp"] end, "apromote_settings", 0, 0 )
	
// File Stuffs
	if (!file.Exists("apromote/settings.txt", "DATA")) then
		for k, v in pairs(ULib.ucl.groups) do
			APromote["grp"][k] = -1
		end
		APromote["set"]["ap_enabled"] = 1
		APromote["set"]["ap_snd_enabled"] = 1
		APromote["set"]["ap_snd_scope"] = 1
		APromote["set"]["ap_effect_enabled"] = 1
		APromote["set"]["ap_auto_demote"] = 0
		file.CreateDir("apromote")
		file.Write("apromote/settings.txt", notglonbecausepeoplebitch.encode(APromote))
	else 
		APromote = notglonbecausepeoplebitch.decode(file.Read( "apromote/settings.txt" ))
	end
// ConVars
	ULib.replicatedWritableCvar("ap_enabled","rep_ap_enabled", APromote["set"]["ap_enabled"],false,false,"apromote_settings")
	ULib.replicatedWritableCvar("ap_snd_enabled","rep_ap_snd_enabled",APromote["set"]["ap_snd_enabled"] ,false,false,"apromote_settings")
	ULib.replicatedWritableCvar("ap_snd_scope","rep_ap_snd_scope",APromote["set"]["ap_snd_scope"] ,false,false,"apromote_settings")
	ULib.replicatedWritableCvar("ap_effect_enabled","rep_ap_effect_enabled",APromote["set"]["ap_effect_enabled"] ,false,false,"apromote_settings")
	ULib.replicatedWritableCvar("ap_auto_demote","rep_ap_auto_demote",APromote["set"]["ap_auto_demote"] ,false,false,"apromote_settings")
// Data and Hook Add	
	xgui.sendDataTable( {}, "AP_SendData" )
	hook.Add( "UCLChanged", "doApUpdateSV", APUpdateGroups )
end

local function cVarChange( sv_cvar, cl_cvar, ply, old_val, new_val )
	if ( sv_cvar =="ap_enabled" or sv_cvar=="ap_snd_enabled" or sv_cvar=="ap_snd_scope" or sv_cvar=="ap_effect_enabled" or sv_cvar=="ap_auto_demote" ) then
		APromote["set"][sv_cvar] = new_val
		file.Write("apromote/settings.txt", notglonbecausepeoplebitch.encode(APromote))
	end
end

local function PlayRankSound( ply )
	if ( GetConVarNumber( "ap_effect_enabled" ) == 1 ) then
		umsg.Start("doApShinys")
			umsg.Entity( ply )
		umsg.End()
	end
	if ( GetConVarNumber( "ap_snd_enabled" ) == 1) then
		if ( GetConVarNumber( "ap_snd_scope" ) == 1 ) then
			for k, v in pairs(player.GetAll()) do
				v:SendLua("surface.PlaySound( \"/garrysmod/save_load1.wav\" )")
			end
		elseif ( GetConVarNumber( "ap_snd_scope" ) == 0) then
			ply:SendLua("surface.PlaySound( \"/garrysmod/save_load1.wav\" )")
		end
	end
end
	
local function isValidCommand( command, compare )
	for k, v in pairs( compare ) do
		if ( command[1] == k ) then
			if ( type( command[2] == "number")) then
				return true;
			end
		end
	end	
	return false;
end

concommand.Add("APGroup", function( ply, cmd, args )
	if (ply:query( "apromote_settings" ) and isValidCommand( args, APromote["grp"] )) then
		APromote["grp"][args[1]] = tonumber(args[2])
		xgui.sendDataTable( {}, "AP_SendData" )
		file.Write("apromote/settings.txt", notglonbecausepeoplebitch.encode(APromote))
	end
end)
 
local function checkPlayer( ply ) 
local plyhours = tonumber(math.floor((ply:GetUTime() + CurTime() - ply:GetUTimeStart())/60/60))
local usrgrp = ply:GetNWString("usergroup")
local Rank = ""
local Hours = 0

	for k, v in pairs(APromote["grp"]) do 
		if ( plyhours >= tonumber(v) and tonumber(v) >= Hours) then
			if (tonumber(v) >= 0) then
				Rank = k
				Hours = tonumber(v)
			end
		end
	end
	if (!ply:IsUserGroup(Rank) and Rank != "") then
		if (tonumber(APromote["grp"][usrgrp]) != -1) then
			if (( GetConVarNumber("ap_auto_demote") == 0) and APromote["grp"][usrgrp] != nil and Hours < APromote["grp"][usrgrp]) then
				return;
			else
				if ( ply:IsConnected() ) then 
					RunConsoleCommand("ulx", "adduser" , ply:Nick() , Rank)
					PlayRankSound( ply );
				end
			end
		end
	end
end

timer.Create("doAPUpdateTimer",10,0, function()
if( GetConVarNumber( "ap_enabled" ) != 1) then return end
	for k, v in pairs(player.GetAll()) do
		if (v:IsPlayer() and v:IsValid() and !v:IsBot()) then
			ULib.queueFunctionCall(	checkPlayer, v)
		end
	end
end)

xgui.addSVModule( "AP_LoadAP", loadAP )
hook.Add( "ULibReplicatedCvarChanged", "APGroupCVAR", cVarChange )
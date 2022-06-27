module("stats_mp", package.seeall)
if not SERVER then return end

if not sql.TableExists("stats_mp") then
	sql.Query([[CREATE TABLE IF NOT EXISTS stats_mp ( id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
		player INTEGER NOT NULL,
		kill INTEGER NOT NULL,
		death INTEGER NOT NULL,
		connection INTEGER NOT NULL,
		chat INTEGER NOT NULL,
		noclip INTEGER NOT NULL,
		physgun INTEGER NOT NULL )]])
end

local color = Color(0, 153, 255)
local scolor = Color( 156, 241, 255, 200 )

CreateConVar("stats_debug", 0, FCVAR_NONE, "", 0, 1)
stats_debug = GetConVar("stats_debug")

function statsOnJoin(ply)
	local id64 = ply:SteamID64()
	local row = sql.QueryRow("SELECT connection FROM stats_mp WHERE player = " .. id64 .. ";")

	if row then
		local connections = sql.Query("SELECT connection FROM stats_mp WHERE player = " .. sql.SQLStr(id64) .. ";")
		MsgC(color, "[STATS] ", scolor, ply:Name() .. " Connection number: " .. tonumber(connections[1]["connection"])+1 .. "\n")

		sql.Query("UPDATE stats_mp SET connection = " .. sql.SQLStr(tonumber(connections[1]["connection"])+1) .. " WHERE player = " .. id64 .. ";")
	else
		sql.Query("INSERT into stats_mp ( player, kill, death, connection, chat, noclip, physgun ) VALUES ( " .. id64 .. ", 0, 0, 0, 0, 0, 0 );")
		MsgC(color, "[STATS] ", scolor, ply:Name() .. " First time connection\n")
	end
end
hook.Add( "PlayerInitialSpawn", "Hook-StatsOnJoin", statsOnJoin )


---------------------------------------
---------------- Hooks ----------------
---------------------------------------


----------------------
-- Kills and Deaths --
----------------------
function statsOnDeath(victim, inflictor, attacker)
	-- Death
	local v_id64 = victim:SteamID64()
	local v_deaths = sql.Query("SELECT death FROM stats_mp WHERE player = " .. sql.SQLStr(v_id64) .. ";")
	local v_deaths_fix = v_deaths[1]["death"]
	sql.Query("UPDATE stats_mp SET death = " .. sql.SQLStr(tonumber(v_deaths_fix)+1) .. " WHERE player = " .. v_id64 .. ";")

	-- Kill
	local a_id64 = attacker:SteamID64()
	local a_kills = sql.Query("SELECT kill FROM stats_mp WHERE player = " .. sql.SQLStr(a_id64) .. ";")
	local a_kills_fix = a_kills[1]["kill"]

	if victim:GetName() ~= attacker:GetName() then
		sql.Query("UPDATE stats_mp SET kill = " .. sql.SQLStr(tonumber(a_kills_fix)+1) .. " WHERE player = " .. a_id64 .. ";")
		if stats_debug == 1 then
			MsgC(color, "[STATS] ", scolor, attacker:Name() .. " has now: " .. tonumber(a_kills[1]["kill"])+1 .. " kills.\n")
		end
	end

	--if stats_debug == 1 then
		MsgC(color, "[STATS] ", scolor, victim:Name() .. " has now: " .. tonumber(v_deaths[1]["death"])+1 .. " deaths.\n")
	--end

	return
end
hook.Add("PlayerDeath", "Hook-StatsOnDeath", statsOnDeath)


----------------------
-------- Chat --------
----------------------
function statsChat(ply)
	local id64 = ply:SteamID64()
	local chat = sql.Query("SELECT chat FROM stats_mp WHERE player = " .. sql.SQLStr(id64) .. ";")
	local chat_fix = chat[1]["chat"]
	sql.Query("UPDATE stats_mp SET chat = " .. sql.SQLStr(tonumber(chat_fix)+1) .. " WHERE player = " .. id64 .. ";")

	--if stats_debug == 1 then
		MsgC(color, "[STATS] ", scolor, ply:Name() .. " has now: " .. tonumber(chat[1]["chat"])+1 .. " chat uses.\n")
	--end

	return
end
hook.Add("PlayerSay", "Hook-StatsChat", statsChat)


----------------------
------- Noclip -------
----------------------
function statsNoclip(ply)
	local id64 = ply:SteamID64()
	local noclip = sql.Query("SELECT noclip FROM stats_mp WHERE player = " .. sql.SQLStr(id64) .. ";")
	local noclip_fix = noclip[1]["noclip"]
	sql.Query("UPDATE stats_mp SET noclip = " .. sql.SQLStr(tonumber(noclip_fix)+1) .. " WHERE player = " .. id64 .. ";")

	--if stats_debug == 1 then
		MsgC(color, "[STATS] ", scolor, ply:Name() .. " has now: " .. noclip_fix+1 .. " noclip uses.\n")
	--end

	return
end
hook.Add("PlayerNoClip", "Hook-StatsNoclip", statsNoclip)


----------------------
------- Physgun ------
----------------------
function statsPhysgun(ply)
	local id64 = ply:SteamID64()
	local physgun = sql.Query("SELECT physgun FROM stats_mp WHERE player = " .. sql.SQLStr(id64) .. ";")
	local physgun_fix = physgun[1]["physgun"]
	sql.Query("UPDATE stats_mp SET physgun = " .. sql.SQLStr(tonumber(physgun_fix)+1) .. " WHERE player = " .. id64 .. ";")

	--if stats_debug == 1 then
		MsgC(color, "[STATS] ", scolor, ply:Name() .. " has now: " .. tonumber(physgun[1]["physgun"])+1 .. " physgun uses.\n")
	--end

	return
end
hook.Add("OnPhysgunPickup", "Hook-StatsPhysgun", statsPhysgun)


-- Custom Hook
--[[
function statsCustomHook(ply)
	local id64 = ply:SteamID64()
	local custom = sql.Query("SELECT custom FROM stats_mp WHERE player = " .. sql.SQLStr(id64) .. ";")
	local custom_fix = custom[1]["custom"]
	sql.Query("UPDATE stats_mp SET use = " .. sql.SQLStr(custom+1) .. " WHERE player = " .. id64 .. ";")

	return -- ALWAYS PUT "return" AT THE END OF THE FUNCTION!!!!
end
hook.Add("PutYourHookHere", "Hook-StatsCustomHook", statsCustomHook)
--]]
-- default allowed ranks
local rank = {
	"superadmin",
	"admin",
	"mod",
	"modt",
	"mod+",
	"modt+",
	"vip"
}


-- Hooks
-- Desactivar sonido de muerte default de HL2
hook.Add("PlayerDeathSound", "NoHL2DeathSound", function(ply)
	return true
end)

-- Desactivar /sleep debido a la gente usandolo incorrectamente
hook.Add("canSleep", "NoSleep", function(ply, force)
	return false, DarkRP.getPhrase("locked")
end)

-- Desactiva el Suicidio
hook.Add( "CanPlayerSuicide", "AllowOwnerSuicide",function(ply)
	return ply:IsSuperAdmin()
end )

-- Desactiva el tomar la camara con la physgun
hook.Add( "PhysgunPickup", "AllowPlayerPickup",function(ply, ent)
	if ent:GetClass() == "gmod_cameraprop" then
		if ply:IsSuperAdmin() then
			return true
		else
			return false
		end
	end
end)

-- Solo Vicentefelipechile puede tener noclip aun sin superadmin
hook.Add( "PlayerNoClip", "FeelFreeToTurnItOff", function(ply, desiredState)
	if desiredState == false then
		return true
	elseif ply:SteamID() == "STEAM_0:1:194224658" then
		return true
	end
end)

-- Habilita el sprays solo a los vips y admins
hook.Add( "PlayerSpray", "DisablePlayerSpray", function(ply)
	-- check if the user is in the rank table
	if not table.HasValue(rank, ply:GetUserGroup()) then
		return false
	end
end)

-- Deshabilita el que los users normales tomen las armas
hook.Add( "PlayerCanPickupWeapon", "NoVipUsers", function(ply, weapon)
	if ply:IsAdmin() or ply:IsUserGroup("vip") or ply:IsUserGroup("mod+") or ply:IsUserGroup("modt+") then
		return true
	elseif weapon:GetClass() == ( "weapon_deagle_bornbeast" or "weapon_m4a1_beast" or "weapon_ak47_beast" ) then
		return false
	end
end)

-- Deshabilita el usar la herramienta creador si contiene una SteamID Exacta
hook.Add( "CanTool", "CanToolRemove", function(ply, tr, toolname)
   if toolname == "creator" and ply:SteamID() == "STEAM_0:1:61873778" then
      return false
   end
end)
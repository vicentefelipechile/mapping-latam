-- Convar para eventos u otras cosas
if SERVER then
	CreateConVar("mappinglatam_allowvehicles", 0, FCVAR_NONE, "Permite que los jugadores", 0, 1)
end

-- Hooks

-- Desactiva el Suicidio
hook.Add( "CanPlayerSuicide", "AllowOwnerSuicide", function( ply )
	return ply:IsSuperAdmin()
end )

-- Desactiva el tomar la camara con la physgun
hook.Add( "PhysgunPickup", "AllowPlayerPickup", function( ply, ent )
	if ent:GetClass() == "gmod_cameraprop" then
		if ply:IsSuperAdmin() then
			return true
		else
			return false
		end
	end
end )

-- Desactiva el entrar a vehiculos si se encuentra desactivado
hook.Add( "CanPlayerEnterVehicle", "AllowEnterVehicle", function( ply, vehicle, role )
	if GetConVar("mappinglatam_allowvehicles"):GetInt() == 0 then
		return false
	elseif GetConVar("mappinglatam_allowvehicles"):GetInt() == 1 then
		return true
	elseif ply:IsAdmin() or ply:IsUserGroup("mod") or ply:IsUserGroup("mod+") or ply:IsUserGroup("modt") or ply:IsUserGroup("modt+") then
		return true
	end
end)

-- Solo Vicentefelipechile puede tener noclip aun sin superadmin
hook.Add( "PlayerNoClip", "FeelFreeToTurnItOff", function( ply, desiredState )
	if desiredState == false then
		return true
	elseif ply:SteamID() == "STEAM_0:1:194224658" then
		return true
	end
end )

-- Habilita el sprays solo a los vips y admins
hook.Add( "PlayerSpray", "DisablePlayerSpray", function( ply )
	if ply:IsSuperAdmin() or ply:IsAdmin() or ply:IsUserGroup("vip") or ply:IsUserGroup("mod+") or ply:IsUserGroup("modt+") then
		return false
	else
		return true
	end
end )

-- Deshabilita el que los users normales tomen las armas
hook.Add( "PlayerCanPickupWeapon", "NoVipUsers", function( ply, weapon )
	if ply:IsSuperAdmin() or ply:IsAdmin() or ply:IsUserGroup("vip") or ply:IsUserGroup("mod+") or ply:IsUserGroup("modt+") then return end
    if weapon:GetClass() == ( "weapon_deagle_bornbeast" or "weapon_m4a1_beast" or "weapon_ak47_beast" ) then
		return false
	end
end )
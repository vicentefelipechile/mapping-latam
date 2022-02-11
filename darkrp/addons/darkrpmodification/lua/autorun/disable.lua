-- Convar para eventos u otras cosas
if SERVER then
	CreateConVar("mappinglatam_allowvehicles", 0, FCVAR_NONE, "Permite que los jugadores", 0, 1)
end

-- Hooks
hook.Add( "CanPlayerSuicide", "AllowOwnerSuicide", function( ply ) -- Desactiva el Suicidio
	return ply:IsSuperAdmin()
end )

hook.Add( "PhysgunPickup", "AllowPlayerPickup", function( ply, ent ) -- Desactiva el tomar la camara con la physgun
	if ent:GetClass() == "gmod_cameraprop" then
		if ply:IsSuperAdmin() then
			return true
		else
			return false
		end
	end
end )

hook.Add( "CanPlayerEnterVehicle", "AllowEnterVehicle", function( ply, vehicle, role ) -- Desactiva el entrar a vehiculos si se encuentra desactivado
	if GetConVar("mappinglatam_allowvehicles"):GetInt() == 0 then
		return false
	elseif GetConVar("mappinglatam_allowvehicles"):GetInt() == 1 then
		return true
	end
end)


hook.Add( "PlayerNoClip", "FeelFreeToTurnItOff", function( ply, desiredState ) -- Solo Vicentefelipechile puede tener noclip aun sin superadmin
	if desiredState == false then
		return true
	elseif ply:SteamID() == "STEAM_0:1:194224658" then
		return true
	end
end )
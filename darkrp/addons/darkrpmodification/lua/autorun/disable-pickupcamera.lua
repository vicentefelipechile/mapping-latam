hook.Add( "PhysgunPickup", "AllowPlayerPickup", function( ply, ent )
	if ent:GetClass() == "gmod_cameraprop" then
		if ply:IsSuperAdmin() then
			return true
		else
			return false
		end
	elseif ent:GetClass() == "player" then
		return false
	else
		return true
	end
end )
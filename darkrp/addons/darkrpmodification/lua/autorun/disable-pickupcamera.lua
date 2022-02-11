hook.Add( "PhysgunPickup", "AllowPlayerPickup", function( ply, ent )
	if ply:IsSuperAdmin() and ent:GetClass() == "gmod_cameraprop" then
		return true
	else
		return false
	end
end )
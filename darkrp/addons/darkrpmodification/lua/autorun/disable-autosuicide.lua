hook.Add( "CanPlayerSuicide", "AllowOwnerSuicide", function( ply )
	return ply:IsSuperAdmin()
end )
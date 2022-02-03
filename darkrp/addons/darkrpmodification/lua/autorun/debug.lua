-- Funciones de prueba

function IsPlayerTeam( ply, team )

end

-- Comandos de prueba

if CLIENT and LocalPlayer():IsSuperAdmin() then

	concommand.Add( "darkrp_setteam", function( ply, cmd, args)
		local Team = args[1] or 1
		ply:SetTeam( Team )
		ply:Spawn()
	end)

end
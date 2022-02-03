hook.Add( "PlayerDeath", "Auto-Demote", function( ply, wep, killer )
        if( ply:Team() == TEAM_MAYOR ) then
                if killer:Nick() ~= nil then
                ply:changeTeam( TEAM_CITIZEN, true )
        end
        for k,v in pairs( player.GetAll() ) do
                if killer:Nick() ~= nil then
                DarkRP.notify(v, 1, 4, "El Alcalde ha sido asesinado!" )
                else
                DarkRP.notify(v, 1, 4, "El Alcalde se murisio!" )
                end
        end
end
end)
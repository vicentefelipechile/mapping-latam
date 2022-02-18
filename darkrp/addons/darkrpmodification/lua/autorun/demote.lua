hook.Add("PlayerDeath", "DarkRP_Mayor_AutoDemote", function(ply, wep, killer)
    if ply:Team() == TEAM_MAYOR then
        if killer:Nick() then
            ply:changeTeam(TEAM_CITIZEN, true)
            ply:SetMaxArmor(100)
            ply:SetMaxHealth(100)
        end
        DarkRP.notifyAll(v, 4, killer:Nick() and "El Alcalde ha sido asesinado." or "El Alcalde se suicidó.")
    end
end)
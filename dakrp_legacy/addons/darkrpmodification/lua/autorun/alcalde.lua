hook.Add("player_spawn", "SetHealthMayor", function(ply)
	if ply:Team() == TEAM_MAYOR then
		ply:SetHealth(200)
		ply:SetMaxHealth(200)
		ply:SetArmor(200)
		ply:SetMaxArmor(200)
	end
end)
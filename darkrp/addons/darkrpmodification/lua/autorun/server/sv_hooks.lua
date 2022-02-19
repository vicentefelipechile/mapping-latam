-- La gente que compra armas vips automaticamente se les dara el arma
hook.Add("playerBoughtCustomEntity", "WeaponVipInstant", function(ply, eTable, ent, price)
	if eTable.ent == ("weapon_deagle_bornbeast" or "weapon_m4a1_beast" or "weapon_ak47_beast") then
		ent:Remove()
		ply:Give(eTable.ent)
	end
end)
local metaply = FindMetaTable( "Player" )

function metaply:GetDonatorBonus()
	local bonus = 1
	
	if not TCF.Config.EnableDonatorBonus then
		return 1
	end
	
	for k, v in pairs( TCF.Config.DonatorBonuses ) do
		if v.ULXGroup == self:GetUserGroup() then
			return v.Bonus
		end
	end
	
	return bonus
end
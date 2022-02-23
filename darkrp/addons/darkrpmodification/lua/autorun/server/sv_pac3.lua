local ranks = {
	["vip"] = true,
	["mod+"] = true,
	["modt+"] = true,
	["admin"] = true,
	["superadmin"] = true,
}
hook.Add("PrePACConfigApply", "PACRankRestrict", function(ply)
	if not ranks[ply:GetUserGroup()] then
		return false,"Rango insuficiente para usar el Pac3"
	end
end)

hook.Add( "PrePACEditorOpen", "PACRankRestrictOpen", function(ply)
	if not ranks[ply:GetUserGroup()] then
		return false,"Rango insuficiente para usar el Pac3"
	end
end )
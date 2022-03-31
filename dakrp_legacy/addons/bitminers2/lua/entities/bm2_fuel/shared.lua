ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName = "Fuel"
ENT.Spawnable = true
ENT.Category = "Bitminers 2"

function ENT:SetupDataTables()
	self:NetworkVar( "Entity", 0, "owning_ent" )
end
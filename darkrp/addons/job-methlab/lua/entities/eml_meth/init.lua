AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")

function ENT:Initialize()
	self:SetModel("models/props_junk/rock001a.mdl")
	self:PhysicsInit(SOLID_VPHYSICS)

	self:SetMaterial("models/shiny")
	self:SetColor(Color(1, 241, 249, 255))	
	
	self:SetCollisionGroup(COLLISION_GROUP_PASSABLE_DOOR)
	self:SetMoveType(MOVETYPE_VPHYSICS)
	self:SetSolid(SOLID_VPHYSICS)
	
	self:SetNWInt("distance", EML.DrawDistance)
	self:SetNWInt("amount", 0)
	self:SetNWInt("maxAmount", 0)
	self:SetNWInt("value", 0)
	self:SetNWInt("valueMod", EML.Meth.ValueModifier)
	self:SetNWBool("salesman", EML.Meth.UseSalesman)
end
 
function ENT:SpawnFunction(ply, trace)
	local ent = ents.Create("eml_meth")
	ent:SetPos(trace.HitPos + trace.HitNormal * 16)
	ent:Spawn()
	ent:Activate()
     
	return ent
end

function ENT:Use(activator, caller)
	local curTime = CurTime()

	if (!self.nextUse or curTime >= self.nextUse) then
		if !EML.Meth.UseSalesman then
			activator:addMoney( (self:GetNWInt("amount") * math.random( EML.Meth.ValueMin, EML.Meth.ValueMax ) ) )
			self:VisualEffect()
			self.nextUse = curTime + 0.5

			hook.Call("EML.PlayerSellMeth", nil, caller, amount, money)
		else
			activator:SetNWInt("meth.amount", activator:GetNWInt("meth.amount") + self:GetNWInt("amount") )

			hook.Call("EML.PlayerPickupMeth", nil, caller, self:GetNWInt("amount"), activator:GetNWInt("meth.amount"))

			net.Start("EML.SendToCV")
				net.WriteString("Has recogido " .. self:GetNWInt("amount") .. " libras de meta." )
			net.Send(activator)

			self:VisualEffect()
			self.nextUse = curTime + 0.5
		end
	end
end

function ENT:OnTakeDamage(dmginfo)
	self:VisualEffect()
end

function ENT:VisualEffect()
	local effectData = EffectData()	
	effectData:SetStart(self:GetPos())
	effectData:SetOrigin(self:GetPos())
	effectData:SetScale(8)	
	util.Effect("GlassImpact", effectData, true, true)
	self:Remove()
end


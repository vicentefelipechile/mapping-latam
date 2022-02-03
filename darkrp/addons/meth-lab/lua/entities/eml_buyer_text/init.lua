AddCSLuaFile("cl_init.lua");
AddCSLuaFile("shared.lua");
include("shared.lua");

function ENT:Initialize()
	self:SetModel("models/props_junk/rock001a.mdl");
	self:PhysicsInit(SOLID_NONE);

	self:SetRenderMode(RENDERMODE_TRANSALPHA);
	self:SetMaterial("models/effects/vol_light001")
	self:SetColor(Color(0, 0, 0, 10))
	
	--self:SetMoveType(MOVETYPE_VPHYSICS);
	--self:SetSolid(SOLID_VPHYSICS);
	
	self:SetNWInt("distance", EML_DrawDistance);
end;
 
function ENT:SpawnFunction(ply, trace)
	local ent = ents.Create("eml_buyer_text");
	ent:SetPos(trace.HitPos + trace.HitNormal * 16);
	ent:Spawn();
	ent:Activate();
     
	return ent;
end;

function ENT:OnTakeDamage(dmginfo)
	self:VisualEffect();
end;

function ENT:VisualEffect()
	local effectData = EffectData();	
	effectData:SetStart(self:GetPos());
	effectData:SetOrigin(self:GetPos());
	effectData:SetScale(8);	
	util.Effect("GlassImpact", effectData, true, true);
	self:Remove();
end;


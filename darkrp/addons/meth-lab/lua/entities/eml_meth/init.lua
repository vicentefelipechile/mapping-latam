AddCSLuaFile("cl_init.lua");
AddCSLuaFile("shared.lua");
include("shared.lua");

function ENT:Initialize()
	self:SetModel("models/props_junk/rock001a.mdl");
	self:PhysicsInit(SOLID_VPHYSICS);

	self:SetMaterial("models/shiny");
	self:SetColor(Color(1, 241, 249, 255));	
	
	self:SetMoveType(MOVETYPE_VPHYSICS);
	self:SetSolid(SOLID_VPHYSICS);
	
	self:SetNWInt("distance", EML_DrawDistance);
	self:SetNWInt("amount", 0);
	self:SetNWInt("maxAmount", 0);
	self:SetNWInt("value", 0);
	self:SetNWInt("valueMod", EML_Meth_ValueModifier);
	self:SetNWBool("salesman", EML_Meth_UseSalesman);
end;
 
function ENT:SpawnFunction(ply, trace)
	local ent = ents.Create("eml_meth");
	ent:SetPos(trace.HitPos + trace.HitNormal * 16);
	ent:Spawn();
	ent:Activate();
     
	return ent;
end;

function ENT:Use(activator, caller)
local curTime = CurTime();
	if (!self.nextUse or curTime >= self.nextUse) then
		if !EML_Meth_UseSalesman then
			activator:addMoney((self:GetNWInt("amount")*EML_Meth_ValueModifier));
			self:VisualEffect();
			self.nextUse = curTime + 0.5;
		else
			activator:SetNWInt("player_meth", activator:GetNWInt("player_meth")+(self:GetNWInt("amount")*EML_Meth_ValueModifier));
			activator:SendLua("local tab = {Color(255,255,255), [[You picked up ]], Color(1,241,249,255), [["..math.Round(self:GetNWInt("amount")).."]], Color(255, 255, 255), [[ lbs of Crystal Meth.]] } chat.AddText(unpack(tab))");
			self:VisualEffect();
			self.nextUse = curTime + 0.5;		
		end;
	end;
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


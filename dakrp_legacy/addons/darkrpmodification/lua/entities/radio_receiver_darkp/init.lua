-- VoiceRadio 
-- Copyright (c) 2010 sk89q <http://www.sk89q.com> 
-- Copyright (c) 2010 BoJaN 
--  
-- This program is free software: you can redistribute it and/or modify 
-- it under the terms of the GNU General Public License as published by 
-- the Free Software Foundation, either version 2 of the License, or 
-- (at your option) any later version. 
--  
-- This program is distributed in the hope that it will be useful, 
-- but WITHOUT ANY WARRANTY; without even the implied warranty of 
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the 
-- GNU General Public License for more details. 
--  
-- You should have received a copy of the GNU General Public License 
-- along with this program.  If not, see <http://www.gnu.org/licenses/>. 
--  
-- $Id$

require("voicechannel")

AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

include("shared.lua")

function ENT:SpawnFunction(ply, tr)
    if not tr.HitWorld then return end
    
    local ent = ents.Create("radio_receiver")
    ent:SetPos(tr.HitPos + Vector(0, 0, 50))
    ent:Spawn()
    
    return ent
end

function ENT:OnRemove()
    self.Band:Unregister(0, self)
end

function ENT:Initialize()
    self.Band = voicechannel.GetBand("Radio")
    self.Band:Register(0, self, true, false)

    self:CPPISetOwner( self:Getowning_ent() )
    
    self:SetModel("models/props_lab/citizenradio.mdl")
    self:PhysicsInit(SOLID_VPHYSICS)
    self:SetMoveType(MOVETYPE_VPHYSICS)
    self:SetSolid(SOLID_VPHYSICS)
    self:SetUseType(USE_TOGGLE)
    
    local phys = self:GetPhysicsObject()
    if phys:IsValid() then
        phys:Wake()
    end
    
    self.dt.On = true
end

function ENT:InSpeakerRange(ply)
    return self.dt.On and ply:GetShootPos():Distance(self:LocalToWorld(Vector(0, 0, 64))) < 500
end

function ENT:Use(activator, caller)
    if not activator:IsPlayer() then return end
    
    self.dt.On = not self.dt.On
end

function ENT:Think()
end

function ENT:OnTakeDamage(dmg)
    if self.burningup then return end

    self.damage = (self.damage or 500) - dmg:GetDamage()
    if self.damage <= 0 then
        local rnd = math.random(1, 10)
        if rnd < 3 then
            self:BurstIntoFlames()
        else
            self:Remove()
        end
    end
end
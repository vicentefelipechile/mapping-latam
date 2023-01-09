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

ENT.Type            = "anim"
ENT.Base            = "base_gmodentity"

ENT.PrintName       = "Microphone"
ENT.Author          = "sk89q, BoJaN"
ENT.Contact         = ""
ENT.Purpose         = "For a radio station"
ENT.Instructions    = "Broadcasts nearby voice to radios"

ENT.Spawnable = true
ENT.AdminSpawnable = true

ENT.DeleteOnClassChange = true

function ENT:SetupDataTables()
    self:DTVar("Bool", 0, "On")
    self:NetworkVar( "Entity", 0, "owning_ent" )
end
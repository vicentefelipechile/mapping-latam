include("shared.lua")
ENT.RenderGroup = RENDERGROUP_BOTH

function ENT:Draw()
	self:DrawModel();
end;

function ENT:DrawTranslucent()
	self:Draw()
end

function ENT:BuildBonePositions( NumBones, NumPhysBones )
end
 
function ENT:SetRagdollBones( bIn )
	self.m_bRagdollSetup = bIn
end

function ENT:DoRagdollBone( PhysBoneNum, BoneNum )
--self:SetBonePosition( BoneNum, Pos, Angle )
end

--[[
size = 128;
draw_set_blend_mode(bm_subtract);
surface_set_target(light);
draw_ellipse_color(x-(size/2)-view_xview,y-(size/2)-view_yview,x+(size/2)-view_xview,y+(size/2)-view_yview, c_white, c_black, false);

surface_reset_target();
draw_set_blend_mode(bm_normal);
]]--
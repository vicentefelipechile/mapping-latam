include("shared.lua");

surface.CreateFont("methFontAddicted", {
	font = "Arial",
	size = 35,
	weight = 600,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = false,
});

function ENT:Initialize()	

end;

function ENT:Draw()
	self:DrawModel();
	
	local pos = self:GetPos()
	local ang = self:GetAngles()

	
	ang:RotateAroundAxis(ang:Up(), 90);
	ang:RotateAroundAxis(ang:Forward(), 90);	
	if LocalPlayer():GetPos():Distance(self:GetPos()) < EML_DrawDistance then
		cam.Start3D2D(pos + ang:Up(), Angle(0, LocalPlayer():EyeAngles().y-90, 90), 0.25)
				draw.SimpleTextOutlined(EML_Meth_Salesman_Name, "methFontAddicted", 0, -48, EML_Meth_Salesman_Name_Color, TEXT_ALIGN_CENTER, TEXT_ALIGN_LEFT, 1, Color(25, 25, 25, 100));			
		cam.End3D2D()	
	end;
end;

-- maxAmount = 60
-- amount = x


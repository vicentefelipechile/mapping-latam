include("shared.lua")

surface.CreateFont("methFont", {
	font = "Arial",
	size = 30,
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
})

function ENT:Initialize()	

end

function ENT:Draw()
	self:DrawModel()
	
	local pos = self:GetPos()
	local ang = self:GetAngles()

	local waterColor = EML.Water.Color
	
	if (self:GetNWInt("amount")>0) then
		waterColor = EML.Water.Color
	else
		waterColor = Color(100, 100, 100, 255)
	end
	
	ang:RotateAroundAxis(ang:Up(), 90)
	ang:RotateAroundAxis(ang:Forward(), 90)	
	if LocalPlayer():GetPos():Distance(self:GetPos()) < EML.DrawDistance then
		cam.Start3D2D(pos+ang:Up()*3.25, ang, 0.06)
			draw.SimpleTextOutlined("Agua", "methFont", 0, 0, waterColor, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, Color(25, 25, 25, 100))
			draw.SimpleTextOutlined(""..self:GetNWInt("amount").."l", "methFont", 0, 24, waterColor, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, Color(25, 25, 25, 100))
		cam.End3D2D()

	ang:RotateAroundAxis(ang:Up(), 0)
	ang:RotateAroundAxis(ang:Forward(), -90)
	ang:RotateAroundAxis(ang:Right(), 90)		
		cam.Start3D2D(pos+ang:Up()*3.25, ang, 0.1)
			surface.SetDrawColor(0, 0, 0, 200)
			surface.DrawRect(-96, -8, 152, 16)
			
			surface.SetDrawColor(EML.Water.Color)
			surface.DrawRect(-94, -6, math.Round((self:GetNWInt("amount")*148)/self:GetNWInt("maxAmount")), 12)				
		cam.End3D2D()
	end
		
end
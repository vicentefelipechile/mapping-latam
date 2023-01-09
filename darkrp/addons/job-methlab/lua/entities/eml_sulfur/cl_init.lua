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

	local sulfurColor = EML.Sulfur.Color
	
	if (self:GetNWInt("amount")>0) then
		sulfurColor = EML.Sulfur.Color
	else
		sulfurColor = Color(100, 100, 100, 255)
	end
	
	ang:RotateAroundAxis(ang:Up(), 90)
	ang:RotateAroundAxis(ang:Forward(), 90)	
	if LocalPlayer():GetPos():Distance(self:GetPos()) < EML.DrawDistance then
		cam.Start3D2D(pos+ang:Up()*3.35, ang, 0.07)
			draw.SimpleTextOutlined("Sulfuro", "methFont", 0, -14, sulfurColor, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, Color(25, 25, 25, 100))
			draw.SimpleTextOutlined("Liquido", "methFont", 0, 10, sulfurColor, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, Color(25, 25, 25, 100))
			draw.SimpleTextOutlined(""..self:GetNWInt("amount").."l", "methFont", 0, 34, sulfurColor, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, Color(25, 25, 25, 100))
		cam.End3D2D()

	ang:RotateAroundAxis(ang:Up(), 0)
	ang:RotateAroundAxis(ang:Forward(), -90)
	ang:RotateAroundAxis(ang:Right(), 90)		
		cam.Start3D2D(pos+ang:Up()*3.35, ang, 0.1)
			surface.SetDrawColor(0, 0, 0, 200)
			surface.DrawRect(-40, -8, 64, 16)
			
			surface.SetDrawColor(EML.Sulfur.Color)
			surface.DrawRect(-38, -6, math.Round((self:GetNWInt("amount")*60)/self:GetNWInt("maxAmount")), 12)				
		cam.End3D2D()
	end
end

-- maxAmount = 60
-- amount = x


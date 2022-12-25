AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )
include("shared.lua")

function ENT:Initialize()
	self:SetModel("models/Humans/Group02/male_03.mdl")
	self:SetHullType(HULL_HUMAN)
	self:SetHullSizeNormal()
	self:SetNPCState(NPC_STATE_SCRIPT)
	self:SetSolid(SOLID_BBOX)
	self:SetUseType(SIMPLE_USE)
	self:SetBloodColor(BLOOD_COLOR_RED)
	
	self.Removed = true
	
	if EML.Meth.SalesmanText then
		local buyerText = ents.Create("eml_buyer_text")
		buyerText:SetPos(self:GetPos() + Vector(0, 0, 72))
		buyerText:SetParent(self)
		buyerText:Spawn()
	end
end

function ENT:AcceptInput(name, activator, caller)	
	if (!self.nextUse or CurTime() >= self.nextUse) then
		if name == "Use" and caller:IsPlayer() then

			local NoMeth = EML.Meth.Salesman.NoMeth
			local NoMeth_Sound = EML.Meth.Salesman.NoMeth_Sound
			local GotMeth = EML.Meth.Salesman.GotMeth
			local GotMeth_Sound = EML.Meth.Salesman.GotMeth_Sound

			if ( caller:GetNWInt("meth.amount") == 0 ) then

				net.Start("EML.SendToCL")
					net.WriteString( NoMeth[ math.random(1, #NoMeth) ] )
				net.Send(caller)

				timer.Simple(0.25, function()
					self:EmitSound( NoMeth_Sound[ math.random(1, #NoMeth_Sound) ], 100, 100)
				end)

			elseif ( caller:GetNWInt("meth.amount") > 0 ) then

				local amount = caller:GetNWInt("meth.amount")				
				local money = 0

				for i=1, amount do

					money = money + ( amount * math.Round( math.random(EML.Meth.ValueMin, EML.Meth.ValueMax) ) )

				end

				hook.Call("EML.PlayerSellMeth", nil, caller, amount, money)

				caller:addMoney( money )

				net.Start("EML.SendToCL")
					net.WriteString( GotMeth[ math.random(1, #GotMeth) ] .. ", toma " .. money .. " $" )
				net.Send(caller)

				caller:SetNWInt("meth.amount", 0)

				if ( EML.Meth.MakeWanted ) then
					caller:wanted(nil, "Esta vendiendo weas ilegales")
				end
	
				timer.Simple(0.25, function()
					self:EmitSound( GotMeth_Sound[ math.random(1, #GotMeth_Sound) ], 100, 100 ) 
				end)

				timer.Simple(2.5, function()
					self:EmitSound( "vo/npc/male01/moan0"..math.random(1, 5)..".wav" )
				end)
			end

		end
		self.nextUse = CurTime() + 1
	end
end

function ENT:OnTakeDamage(dmginfo)
	return false
end

function ENT:OnTakeDamage(dmginfo)
	return false
end
    AddCSLuaFile()

    ENT.Base = "base_gmodentity"
    ENT.Type = "anim"

    ENT.Category		= "ted.lua"
    ENT.Spawnable		= true

    ENT.PrintName		= "Phone Box"
    ENT.Author			= "ted.lua"
    ENT.Purpose			= "Call your local hitman."
    ENT.Instructions	= ""

    if CLIENT then
        surface.CreateFont( "rHit.Font.PhoneBox", { font = "BFHUD", size = 90, weight = 800, bold = true } )
        local v = Vector()

    	function ENT:Draw()
    	    self:DrawModel()
    	    v.z = math.sin( CurTime() ) * 60
    	    if LocalPlayer():GetPos():Distance( self:GetPos() ) < 500 then
        		  local ang = self:GetAngles()
        		  ang:RotateAroundAxis(self:GetAngles():Right(), 90)
        		  ang:RotateAroundAxis(self:GetAngles():Forward(), 90)
        		  cam.Start3D2D(self:GetPos() + ang:Up(), Angle(0, LocalPlayer():EyeAngles().y - 90, 90), 0.1)
            		  Graphics.DrawRect( v.x - 250, ( v.z / 2 ) - 550, 500, 130, Color( 22, 22, 22, 255 ) )
            		  Graphics.DrawOutline( v.x - 250, ( v.z / 2 ) - 550, 500, 130, 4, Color( 0, 0, 0 ) )

            		  Graphics.DrawText( Executioner.Config.Phone.Text_On_Entity, "rHit.Font.PhoneBox", -10, ( v.z / 2 ) - 535, Color( 200, 0, 0 ))
        		  cam.End3D2D()
    	    end
    	end
    else
        function ENT:Initialize()
            self:SetModel( "models/props_trainstation/payphone001a.mdl" )
            self:PhysicsInit( SOLID_VPHYSICS )
            self:SetMoveType( MOVETYPE_VPHYSICS )
            self:SetSolid( SOLID_VPHYSICS )
            --self:SetRenderFX( kRenderFxSolidFast )
            self:SetUseType( SIMPLE_USE )
            local phys = self:GetPhysicsObject()
            if phys:IsValid() then phys:Wake() end
        end

        function ENT:Use( null, caller, type )
            if !IsValid( caller ) or !caller:IsPlayer() then return end
            if caller.My_Hitman then caller.My_Hitman = nil end
            if not caller:Alive() or caller:isArrested() then return end
            if Executioner.Config.No_Place_Teams[ team.GetName( caller:Team() ) ] then Executioner.SendMessage( caller, 'You can not place a hit as this job.' ) return end
            if Executioner.Config.BlackList_Teams[ team.GetName( caller:Team() ) ] then 
                Executioner.SendMessage( caller, Executioner.Language.PhoneNotInService ) 
                return 
            end
            if not Executioner.Config.PhoneEnabled then
                if caller:IsSuperAdmin() or caller:IsAdmin() then
                    Executioner.SendMessage( caller, "As you are an Admin, only you can see this. If you are trying to use the phone, you must enable it in the config: Executioner.Config.PhoneEnabled = true" )
                else
                    Executioner.SendMessage( caller, Executioner.Language.PhoneNotInService ) 
                end
                return
            end
            if Executioner.Config.Hitman_Teams[ team.GetName( caller:Team() ) ] then Executioner.SendMessage( caller, Executioner.Language.HitmanOnUsePhone ) return end
            if caller.rHit_PlaceCooldown and caller.rHit_PlaceCooldown > CurTime() then Executioner.SendMessage( caller, Executioner.Language.HitTooSoon ) return end
            if caller.rHit_PlacedHit or caller:GetNWBool( 'rHit_ActiveHit' ) then Executioner.SendMessage( caller, Executioner.Language.HitmanActiveHit ) return end
            net.Start( 'rHit.Open.Placement' )
                net.WriteTable( Executioner.PhoneTracker )
            net.Send( caller )
        end

        hook.Add( 'CanTool', 'rHit.Prevent.Tool', function( self, trace, tool )
            if tool == 'remover' and IsValid( trace.Entity ) and trace.Entity:GetClass() == "phone_box" then
                if self:IsSuperAdmin() then return true else return false end
            end
        end )

        hook.Add( 'PhysgunPickup', 'rHit.Prevent.Pickup', function( self, ent )
            if self:IsSuperAdmin() and ent:GetClass() == 'phone_box' then return true end
        end )
    end

    if not CLIENT then return end

    surface.CreateFont( "rHit.Font.HUD", { font = "BFHUD", size = 32, weight = 800, bold = true } )
    surface.CreateFont( "rHit.Font.Info", { font = "BFHUD", size = 48, weight = 800, bold = true } )
    surface.CreateFont( "rHit.Font.Walls", { font = "BFHUD", size = 32, weight = 800, bold = true } )

    local _a, _t = {}, nil

    net.Receive( 'rHit.Send.a', function() _a = net.ReadTable() end )
    net.Receive( 'rHit.Send.t', function() _t = net.ReadEntity() end )

    local function SecondsToClock( seconds )
        local seconds = tonumber( seconds )
        if seconds <= 0 then
            return "00:00"
        else
            mins = string.format( "%02.f", math.floor( seconds / 60 ) )
            secs = string.format( "%02.f", math.floor( seconds - mins * 60 ) )
            return mins.. ":" .. secs
        end
    end

    function Executioner.OnComplete()
        local price = net.ReadInt( 32 ) or -1
        local frame = vgui.Create( 'base_panel' )
        frame:SetSize( 425, 170 )
        frame:SetDraggable( false )
        frame:SetPos( ScrW() / 2 - frame:GetWide() / 2, ScrH() - frame:GetTall() )
        frame:MoveTo( ScrW() / 2 - frame:GetWide() / 2, ScrH() / 2 - frame:GetTall() / 2, 0.3, 0, 1 )
        timer.Simple( 3, function()
            if IsValid( frame ) then
                frame:MoveTo( ScrW() + frame:GetWide(), ScrH() / 2 - frame:GetTall() / 2, 0.3, 0, 1 )
                timer.Simple( 1, function() if IsValid( frame ) then frame:Remove() _t = nil end end )
            end
        end  )
        frame:Deploy( false, true )
        frame.Paint = function( me, w, h )
            Graphics.DrawText( Executioner.Config.Hit_Completed, 'rHit.Font.Large', w / 2, 10, Executioner.Config.Hit_Completed_Color )
            Graphics.DrawText( string.format( '%s%s', '+', DarkRP.formatMoney( price ) ), 'rHit.Font.Large', w / 2, 75, Executioner.Config.Confirmation.Money_Text_Color )
        end
    end
    net.Receive( 'rHit.Send.ScreenMessage', Executioner.OnComplete )

    function Executioner.PaintDisplay()
        if not _a[ LocalPlayer():SteamID() ] or not IsValid( _t ) then return end
        Graphics.DrawRect( ScrW() - 407, 93, 384, Executioner.Config.EnableDistance and 167 or 109, Executioner.Config.Background )
        Graphics.DrawRect( ScrW() - 405, 125, 380, 75, Executioner.Config.Foreground )
        Graphics.DrawOutline( ScrW() - 405, 125, 380, 75, 2, Executioner.Config.HUD_Outline )
        Graphics.DrawRect( ScrW() - 405, 94, 380, 30, Executioner.Config.Foreground )
        Graphics.DrawText( Executioner.Config.EnableHitTime and Executioner.Config.Time_Left .. SecondsToClock( LocalPlayer():GetNWInt( 'rHit_HitTime', 0 ) ) or Executioner.Config.Active_Hit, 'rHit.Font.HUD', ScrW() - 220, 90, Color( 200, 0, 0 ) )
        Graphics.DrawText( Executioner.Config.Phone.Target .. _t:Nick(), 'rHit.Font.HUD', ScrW() - 395, 128, Color( 255, 255, 255 ), TEXT_ALIGN_LEFT )
        Graphics.DrawText( Executioner.Config.Occupation .. team.GetName( _t:Team() ), 'rHit.Font.HUD', ScrW() - 395, 159, Color( 255, 255, 255 ), TEXT_ALIGN_LEFT )
        if Executioner.Config.EnableDistance then
            Graphics.DrawRect( ScrW() - 405, 201, 380, 57, Executioner.Config.Foreground )
            Graphics.DrawText( Executioner.Config.Distance_Text, 'rHit.Font.HUD', ScrW() - 347, 200, Color( 255, 255, 255 ) )
            Graphics.DrawText( LocalPlayer():GetPos():Distance( _t:GetPos() ) > Executioner.Config.RangeDistance and math.Round( LocalPlayer():GetPos():Distance( _t:GetPos() ), 0 ) .. 'm' or '?????', 'rHit.Font.HUD', ScrW() - 75, 220, Color( 255, 255, 255 ) )
        end
    end
    hook.Add( 'HUDPaint', 'rHit.Render.Display', Executioner.PaintDisplay )

    function Executioner.PaintInfo()
        if not Executioner.Config.Draw_Info then hook.Remove( 'HUDPaint', 'rHit.Render.Info' ) return end
        local trace = LocalPlayer():GetEyeTrace().Entity
        if not trace then return end
        if IsValid( trace ) and trace:IsPlayer() and Executioner.Config.Hitman_Teams[ team.GetName( trace:Team() ) ] then
            if LocalPlayer():GetPos():Distance( trace:GetPos() ) > 120 then return end
            local w, h = ScrW(), ScrH()
            Graphics.DrawText( Executioner.Config.Hitman_Text, 'rHit.Font.Info', w / 2 - 5, h / 2 + 15, Color( 255, 255, 255 ) )
            Graphics.DrawText( _a[ trace:SteamID() ] and Executioner.Config.Busy_Text or Executioner.Config.Enable_Face_To_Face and Executioner.Config.Request_Hit_Text or '', 'rHit.Font.Info', w / 2, h / 2 + 50, _a[ trace:SteamID() ] and Color( math.abs( math.sin( CurTime() * 2 ) * 255 ), 0, 0 ) or Color( 200, 0, 0 ) )
        end
    end
    hook.Add( 'HUDPaint', 'rHit.Render.Info', Executioner.PaintInfo )

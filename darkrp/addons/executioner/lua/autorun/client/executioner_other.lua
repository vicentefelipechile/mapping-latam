    --[[
        Script: Executioner
        Developer: ted.lua
        Profile: http://steamcommunity.com/id/tedlua/
    ]]

    if not CLIENT then return end

    surface.CreateFont( "rHit.Font.Large", { font = "BFHUD", size = 80, weight = 800, bold = true } )
    surface.CreateFont( "rHit.Font.Phone", { font = "Calibri", size = 30, weight = 700 } )

    --> This is the default DarkRP alternative (Small menu pops up.) <--
    function Executioner.DeployConfirmation()
        local data = net.ReadTable()
        local price, target, name = data.price, data.target, ''
        local frame = vgui.Create( 'base_panel' )
        frame:SetSize( 355, 510 )
        frame:SetDraggable( false )
        frame:SetPos( ScrW() / 2 - frame:GetWide() / 2, 0 )
        frame:MoveTo( ScrW() / 2 - frame:GetWide() / 2, ScrH() / 2 - frame:GetTall() / 2, 0.1, 0, 1 )
        frame:Deploy()

        frame.Paint = function( self, w, h )
            Graphics.DrawRect( 0, 0, self:GetWide(), self:GetTall(), Executioner.Config.Confirmation.Background )
            if Executioner.Config.EnableBlur then Graphics.BlurMenu( self, 10, 15, 245 ) end
            Graphics.DrawText( Executioner.Config.Confirmation.Main_Title, 'rHit.Font.Generic', self:GetWide() / 2, 3, Executioner.Config.Confirmation.Main_Title_Color )
        end

        local base_canvis = vgui.Create( 'DPanel', frame )
        base_canvis:SetSize( 335, frame:GetTall() - 48 )
        base_canvis:SetPos( 10, 40 )
        base_canvis.Paint = function( me, w, h )
            name, job = IsValid( target ) and target:Nick() or 'Unknown', IsValid( target ) and team.GetName( target:Team() ) or 'Unknown'
            Graphics.DrawRect( 0, 0, w, h, Executioner.Config.Confirmation.Data_Canvis_Color )
            Graphics.DrawOutline( 0, 0, w, h, 2, Executioner.Config.Outline_Colors ) -- 42, 42, 42, 200
            Graphics.DrawText( Executioner.Config.Confirmation.Header_Title, 'rHit.Font.Other', me:GetWide() / 2, 5, Executioner.Config.Name_Colors )
            Graphics.DrawText( name, 'rHit.Font.Generic', me:GetWide() / 2 - 10, 31, Executioner.Config.Name_Colors )
            Graphics.DrawText( job, 'rHit.Font.Generic', w / 2 - 5, 294, IsValid( target ) and team.GetColor( target:Team() ) or Color( 255, 255, 255 ) )
            Executioner.RenderDisplay( me, w, h, target, 25 )
        end

        local model_panel = vgui.Create( 'DModelPanel', base_canvis )
        model_panel:SetSize( 210, 225 )
        model_panel:SetPos( 57, 65 )
        model_panel:SetModel( target:GetModel() )
        model_panel:SetAnimated( true )
        model_panel.LayoutEntity = function() return end
        model_panel:SetCamPos( Vector( 55, 0, 63 ) )
        model_panel:SetLookAt( Vector( 45, 0, 58 ) )
        Graphics.PlaySequence( model_panel, table.Random( Executioner.emoteTable ) )

        model_panel.Paint = function( me, w, h )
            Graphics.DrawRect( 0, 0, w, h, Executioner.Config.Placement.Row_Hovers.mainColor )
            Graphics.DrawOutline( 0, 0, w, h, 2, Executioner.Config.Outline_Colors )
            baseclass.Get( 'DModelPanel' ).Paint( me, w, h )
            Graphics.DrawRect( 2, h - 27, w - 4, 25, Executioner.Config.Confirmation.Money_Bar_Color )
            Graphics.DrawText( DarkRP.formatMoney( price ), 'rHit.Font.Generic', w / 2, h - 32, Executioner.Config.Confirmation.Money_Text_Color )
        end

        Graphics.CreateIconObject( base_canvis, Executioner.materials[ 'heart' ], 30, 329, 32, 32, false )
        Graphics.CreateIconObject( base_canvis, Executioner.materials[ 'armor' ], 30, 358, 32, 32, false )

        local accept_offer = vgui.Create( 'DButton', base_canvis )
        accept_offer:SetSize( 120, 31 )
        accept_offer:SetPos( 40, base_canvis:GetTall() - 55 )
        accept_offer:SetText( Executioner.Config.Confirmation.Accept_Hit )
        accept_offer:SetFont( 'rHit.Font.Small' )
        accept_offer:SetTextColor( Executioner.Config.Component_Colors[ 'button_accept' ].text )
        accept_offer.Paint = function( me, w, h )
            if me:IsHovered() then
                Graphics.DrawRect( 0, 0, w, h, Executioner.Config.Component_Colors[ 'button_accept' ].hover )
            else
                Graphics.DrawRect( 0, 0, w, h, Executioner.Config.Component_Colors[ 'button_accept' ].normal )
            end
        end

        local deny_offer = vgui.Create( 'DButton', base_canvis )
        deny_offer:SetSize( 120, 31 )
        deny_offer:SetPos( 50 + accept_offer:GetWide(), base_canvis:GetTall() - 55 )
        deny_offer:SetText( Executioner.Config.Confirmation.Deny_Hit )
        deny_offer:SetFont( 'rHit.Font.Small' )
        deny_offer:SetTextColor( Executioner.Config.Component_Colors[ 'button_deny' ].text )
        deny_offer.Paint = function( me, w, h )
            if me:IsHovered() then
                Graphics.DrawRect( 0, 0, w, h, Executioner.Config.Component_Colors[ 'button_deny' ].hover )
            else
                Graphics.DrawRect( 0, 0, w, h, Executioner.Config.Component_Colors[ 'button_deny' ].normal )
            end
        end

        accept_offer.DoClick = function( me, w, h ) net.Start( 'rHit.Config.OrderHit' ) net.SendToServer() frame:Close() end
        deny_offer.DoClick = function( me, w, h ) net.Start( 'rHit.Confirm.Rejection' ) net.SendToServer() frame:Close() end

        timer.Simple( Executioner.Config.ResponseTime, function() if IsValid( frame ) then frame:Close()  end end )
    end
    net.Receive( 'rHit.Open.Confirmation', Executioner.DeployConfirmation )

    function Executioner.UnPackMessage( message )
        message = message or ''
        chat.AddText( Color( 230, 32, 25 ), Executioner.Config.ChatPrefix, Executioner.Config.PrefixColor, net.ReadString() or message )
    end
    net.Receive( 'rHit.Send.Message', Executioner.UnPackMessage )

    function Executioner.DeployBonus()
        local frame = vgui.Create( 'base_panel' )
        frame:SetSize( 425, 170 )
        frame:SetDraggable( false )
        frame:SetPos( -frame:GetWide(), 125 )
        frame:MoveTo( 10, 125, 0.1, 0, 1 )
        frame:Deploy( false, true )

        frame.Paint = function( self, w, h )
            Graphics.DrawRect( 0, 0, w, h, Color( 60, 60, 60, 220 ) )
            Graphics.DrawRect( 0, 0, self:GetWide(), self:GetTall(), Executioner.Config.Bonus.Background )
            Graphics.DrawOutline( 0, 0, w, h, 2, Executioner.Config.Outline_Colors )
            Graphics.DrawText( Executioner.Config.Bonus.Main_Title, 'rHit.Font.Generic', self:GetWide() / 2, 1, Color( math.abs( math.sin( CurTime() * 2 ) * 255 ), 0, 0 ) )
            Graphics.DrawText( Executioner.Config.Bonus.Header, 'rHit.Font.Generic', self:GetWide() / 2, 32, Executioner.Config.Bonus.Header_Color )
            Graphics.DrawText( Executioner.Config.Bonus.Description, 'rHit.Font.Medium', 11, 66, Executioner.Config.Bonus.Description_Color, TEXT_ALIGN_LEFT )
            Graphics.DrawText( Executioner.Config.Bonus.Detail, 'rHit.Font.Medium', w / 2, 93, Executioner.Config.Bonus.Detail_Color  )
        end

        local accept_offer = vgui.Create( 'DButton', frame )
        accept_offer:SetSize( 120, 31 )
        accept_offer:SetPos( 80, frame:GetTall() - 42 )
        accept_offer:SetText( Executioner.Config.Bonus.Accept_Offer )
        accept_offer:SetFont( 'rHit.Font.Small' )
        accept_offer:SetTextColor( Executioner.Config.Component_Colors[ 'button_accept' ].text )
        accept_offer.Paint = function( me, w, h )
            if me:IsHovered() then
                Graphics.DrawRect( 0, 0, w, h, Executioner.Config.Component_Colors[ 'button_accept' ].hover )
            else
                Graphics.DrawRect( 0, 0, w, h, Executioner.Config.Component_Colors[ 'button_accept' ].normal )
            end
        end
        accept_offer.DoClick = function()
            net.Start( 'rHit.Bonus.Accept' ) net.SendToServer()
            frame:MoveTo( 0 - frame:GetWide(), 125, 0.2, 0, 1 )
            timer.Simple( 1, function() if IsValid( frame ) then frame:Remove() end end )
        end

        local deny_offer = vgui.Create( 'DButton', frame )
        deny_offer:SetSize( 120, 31 )
        deny_offer:SetPos( 90 + accept_offer:GetWide(), frame:GetTall() - 42 )
        deny_offer:SetText( Executioner.Config.Bonus.Deny_Offer )
        deny_offer:SetFont( 'rHit.Font.Small' )
        deny_offer:SetTextColor( Executioner.Config.Component_Colors[ 'button_deny' ].text )
        deny_offer.Paint = function( me, w, h )
            if me:IsHovered() then
                Graphics.DrawRect( 0, 0, w, h, Executioner.Config.Component_Colors[ 'button_deny' ].hover )
            else
                Graphics.DrawRect( 0, 0, w, h, Executioner.Config.Component_Colors[ 'button_deny' ].normal )
            end
        end
        deny_offer.DoClick = function( self, w, h ) frame:Close() end
        timer.Simple( Executioner.Config.BonusTime, function()
            if IsValid( frame ) then
                Executioner.UnPackMessage( Executioner.Language.BonusNoReply )
                frame:MoveTo( 0 - frame:GetWide(), 125, 0.2, 0, 1 )
                timer.Simple( 1, function() if IsValid( frame ) then frame:Remove() end end )
            end
        end )
    end
    net.Receive( 'rHit.Open.Bonus', Executioner.DeployBonus )

    function Executioner.OpenPhone()
        local data = net.ReadTable()
        local frame = vgui.Create( 'base_panel' )
        frame:SetSize( 650, 550 )
        frame:SetDraggable( false )
        frame:SetPos( ScrW() / 2 - frame:GetWide() / 2, 0 )
        frame:MoveTo( ScrW() / 2 - frame:GetWide() / 2, ScrH() / 2 - frame:GetTall() / 2, 0.1, 0, 1 )
        frame:Deploy( true )

        frame.Paint = function( self, w, h )
            Graphics.DrawRect( 0, 0, self:GetWide(), self:GetTall(), Executioner.Config.Phone.Background )
            if Executioner.Config.EnableBlur then Graphics.BlurMenu( self, 10, 15, 240 ) end
            Graphics.DrawText( Executioner.Config.Phone.Main_Title, 'rHit.Font.Generic', self:GetWide() / 2, 3, Color( 255, 255, 255 ) )
        end

        local background = vgui.Create( 'DPanel', frame )
        background:SetSize( frame:GetWide() - 20, frame:GetTall() - 48 )
        background:SetPos( 10, 40 )
        background.Paint = function( me, w, h )
            Graphics.DrawOutline( 0, 0, w, h, 2, Executioner.Config.Outline_Colors ) -- 42, 42, 42, 200
        end

        local base_canvis = vgui.Create( 'DPanelList', frame )
        base_canvis:SetSize( frame:GetWide() - 24, frame:GetTall() - 52 )
        base_canvis:SetPos( 12, 42 )
        base_canvis:SetSpacing( 2 )
        base_canvis:EnableVerticalScrollbar( true )
        base_canvis.Paint = function( me, w, h )
            Graphics.DrawRect( 0, 0, w, h, Executioner.Config.Phone.Data_Canvis_Color )
            Graphics.DrawOutline( 0, 0, w, h, 2, Executioner.Config.Outline_Colors ) -- 42, 42, 42, 200
            Graphics.PaintBar( me, Color( 30, 30, 30, 220 ), Color( 28, 28, 28 ), Color( 26, 26, 26 ) )
        end

        for k, v in pairs( data ) do
            local player_index = vgui.Create( 'DPanel', base_canvis )
            player_index:SetSize( 0, 90 )
            player_index.Paint = function( me, w, h )
                Graphics.DrawRect( 0, 0, w, h, k % 2 == 0 and Executioner.Config.Placement.Row_Hovers.onSecond or Executioner.Config.Placement.Row_Hovers.mainColor )
                Graphics.DrawText( IsValid( v.target ) and Executioner.Config.Phone.Target .. v.target:Nick() or Executioner.Config.Phone.Target .. 'Disconnected', 'rHit.Font.Phone', 95, 8, Color( 255, 255, 255 ), TEXT_ALIGN_LEFT )
                Graphics.DrawText( type( v.customer ) == 'Player' and IsValid( v.customer ) and Executioner.Config.Phone.Customer .. v.customer:Nick() or type( v.customer ) == 'string' and Executioner.Config.Phone.Customer .. v.customer or Executioner.Config.Phone.Customer 'Disconnected.', 'rHit.Font.Phone', 95, 31, Color( 255, 255, 255 ), TEXT_ALIGN_LEFT )
                Graphics.DrawText( IsValid( v.target ) and Executioner.Config.Phone.Price .. DarkRP.formatMoney( v.price ) or 'N/A', 'rHit.Font.Phone', 95, 55, Color( 255, 255, 255 ), TEXT_ALIGN_LEFT )
            end

            local model_panel = vgui.Create( 'DModelPanel', player_index )
            model_panel:SetSize( 80, 80 )
            model_panel:SetPos( 4, 5 )
            model_panel:SetModel( v.target and v.target:GetModel() or '' )
            model_panel:SetAnimated( true )
            model_panel.LayoutEntity = function() return end
            model_panel:SetCamPos( Vector( 50, 0, 60 ) )

            model_panel.Paint = function( me, w, h )
                Graphics.DrawRect( 0, 0, w, h, k % 2 ~= 0 and Executioner.Config.Placement.Row_Hovers.onSecond or Executioner.Config.Placement.Row_Hovers.mainColor )
                Graphics.DrawOutline( 0, 0, w, h, 2, Executioner.Config.Outline_Colors )
                baseclass.Get( 'DModelPanel' ).Paint( me, w, h )
            end

            local accept_offer = vgui.Create( 'DButton', player_index )
            accept_offer:SetSize( 120, 40 )
            accept_offer:SetPos( base_canvis:GetWide() - accept_offer:GetWide() - 25, 27 )
            accept_offer:SetText( Executioner.Config.Confirmation.Accept_Hit )
            accept_offer:SetFont( 'rHit.Font.Small' )
            accept_offer:SetTextColor( Color( 255, 255, 255 ) )
            accept_offer.Paint = function( me, w, h )
                if me:IsHovered() then
                    Graphics.DrawRect( 0, 0, w, h, Executioner.Config.Component_Colors[ 'button_accept' ].hover )
                else
                    Graphics.DrawRect( 0, 0, w, h, Executioner.Config.Component_Colors[ 'button_accept' ].normal )
                end
            end
            accept_offer.DoClick = function()
                net.Start( 'rHit.Confirm.PhoneAccept' )
                    net.WriteEntity( v.target )
                net.SendToServer()
                frame:Close()
            end

            base_canvis:AddItem( player_index )
        end
    end
    net.Receive( 'rHit.Open.Phonebox', Executioner.OpenPhone )

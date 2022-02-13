    --[[
        Script: Executioner
        Developer: ted.lua
        Profile: http://steamcommunity.com/id/tedlua/
    ]]

    if not CLIENT then return end

    surface.CreateFont( "rHit.Font.Generic", { font = "BFHUD", size = 30, weight = 700 } )
    surface.CreateFont( "rHit.Font.Medium", { font = "Calibri", size = 27, weight = 700 } )
    surface.CreateFont( "rHit.Font.Small", { font = "Calibri", size = 21, weight = 700 } )
    surface.CreateFont( "rHit.Font.Inbetween", { font = "Calibri", size = 24, weight = 700 } )
    surface.CreateFont( "rHit.Font.Other", { font = "BFHUD", size = 23, weight = 700 } )

    Executioner.emoteTable = { 'pose_standing_01', 'pose_standing_02', 'pose_standing_03', 'pose_standing_04' }
    Executioner.materials = { ['heart'] = 'like.png', ['armor'] = 'rawr.png', [ 'oink' ] = 'oink.png' } -- :D

    local function CreateTextEntry( dock, x, y, w, h, txt, font, numeric )
        local object = vgui.Create( 'DTextEntry', dock )
        object:SetSize( w, h )
        object:SetPos( x, y )
        object:SetText( txt )
        object:SetFont( font )
        object:SetNumeric( numeric )
        object:SetVisible( false )
        local base = baseclass.Get( 'DTextEntry' )
        object.Paint = function( me, w, h )
            if me:IsHovered() then
                Graphics.DrawRoundedBox( 6, 0, 0, w, h, Executioner.Config.Component_Colors[ 'hit_price_entry' ].hover )
            else
                Graphics.DrawRoundedBox( 6, 0, 0, w, h, Executioner.Config.Component_Colors[ 'hit_price_entry' ].normal )
            end
            me:DrawTextEntryText( Executioner.Config.Component_Colors[ 'hit_price_entry' ].text, Color( 28, 28, 28 ), Color( 255, 255, 255 ) )
        end
        return object
    end

    local function ShowComponents( component_tree )
        for x = 1, #component_tree do
            if IsValid( component_tree[ x ] ) then component_tree[ x ]:SetVisible( true ) end
        end
    end

    function Executioner.RenderDisplay( parent, w, h, selection, y )
        local bar_width = w - 64
        if not y then y = 0 end
        local health, armor = IsValid( selection ) and selection:Health() or 100, IsValid( selection ) and selection:Armor() or 0
        local heatlhSize = ( bar_width / 100 ) * health > bar_width and bar_width or ( bar_width / 100 ) * health
        local armorSize = ( bar_width / 100 ) * armor > bar_width and bar_width or ( bar_width / 100 ) * armor
        Graphics.DrawRect( 32, h / 2 + 77 + y, bar_width, 25, Executioner.Config.Component_Colors[ 'health_armor_display' ].barBackground )
        Graphics.DrawRect( 32, h / 2 + 77 + y, heatlhSize, 25, Executioner.Config.Component_Colors[ 'health_armor_display' ].healthBar )
        Graphics.DrawText( string.format( '%i%s', health < 0 and 0 or health, '%' ), 'rHit.Font.Inbetween', w / 2 - 5, h / 2 + 75 + y, Executioner.Config.Component_Colors[ 'health_armor_display' ].healthColor )
        Graphics.DrawRect( 32, h / 2 + 103 + y, bar_width, 25, Executioner.Config.Component_Colors[ 'health_armor_display' ].barBackground )
        Graphics.DrawRect( 32, h / 2 + 103 + y, armorSize, 25, Executioner.Config.Component_Colors[ 'health_armor_display' ].armorBar )
        Graphics.DrawText( string.format( '%i%s', armor, '%' ), 'rHit.Font.Inbetween', w / 2 - 5, h / 2 + 102 + y, Executioner.Config.Component_Colors[ 'health_armor_display' ].armorColor )
        Graphics.DrawOutline( 30, h / 2 + 75 + y, w - 60, 55, 2, Executioner.Config.Component_Colors[ 'health_armor_display' ].outline )
    end

    local function CreatePanelReplica( parent, default_paint, side, scroll, func )
        local static_gap, player_pane = 10
        local base_canvis = vgui.Create( 'DPanel', parent )
        base_canvis:SetSize( 355, parent:GetTall() - 47 )
        base_canvis:SetPos( side == 1 and static_gap or parent:GetWide() - base_canvis:GetWide() - static_gap, 40 )
        if default_paint then
            base_canvis.Paint = function( me, w, h )
                Graphics.DrawRect( 0, 0, w, h, Executioner.Config.Placement.Data_Canvis_Color )
                Graphics.DrawOutline( 0, 0, w, h, 2, Executioner.Config.Outline_Colors ) -- 42, 42, 42, 200
            end
        else base_canvis.Paint = func end

        if scroll then
            player_pane = vgui.Create( 'DPanelList', base_canvis )
            player_pane:SetSize( base_canvis:GetWide() - 4, base_canvis:GetTall() )
            player_pane:SetPos( 2, 2 )
            player_pane:SetSpacing( 1 )
            player_pane:EnableVerticalScrollbar( scroll )
            Graphics.PaintBar( player_pane, Color( 30, 30, 30, 220 ), Color( 28, 28, 28 ), Color( 26, 26, 26 ) )
        end

        return base_canvis, player_pane
    end

    function Executioner.DeployPlacer()
        local self = LocalPlayer()
        local frame = vgui.Create( 'base_panel' )
        frame:SetSize( 750, 520 )
        frame:SetDraggable( false )
        frame:SetPos( ( ScrW() / 2 - frame:GetWide() / 2 ) + frame:GetWide(), ( ScrH() / 2 - frame:GetTall() / 2 ) )
        frame:MoveTo( ScrW() / 2 - frame:GetWide() / 2, ScrH() / 2 - frame:GetTall() / 2, 0.2, 0, 1 )
        frame:Deploy( true )

        frame.Paint = function( me, w, h )
            --Graphics.GenerateScreenBlur( self, self.Start )
            Graphics.DrawRect( 0, 0, me:GetWide(), me:GetTall(), Executioner.Config.Placement.Background )
            if Executioner.Config.EnableBlur then Graphics.BlurMenu( me, 10, 15, 245 ) end
            Graphics.DrawText( 'Executioner', 'rHit.Font.Generic', 75, 3, Color( 230, 32, 25 ) )
            Graphics.DrawText( Executioner.Config.Placement.Main_Title, 'rHit.Font.Generic', me:GetWide() / 2, 3, Executioner.Config.Placement.Main_Title_Color )
            Graphics.DrawRect( w / 2 - 3, 40, 5, h - 47, Executioner.Config.Placement.Split_Bar )
        end

        local player_canivs, player_pane = CreatePanelReplica( frame, true, 1, true )
        local data_canvis = CreatePanelReplica( frame, true, 2, false )
        player_canivs:SetDisabled( true )

        local hasSelection, current_selection, color_selection = false, nil, Executioner.Config.Placement.Row_Hovers.mainColor

        data_canvis.Paint = function( me, w, h )
            Graphics.DrawRect( 0, 0, w, h, Executioner.Config.Placement.Data_Canvis_Color )
            Graphics.DrawOutline( 0, 0, w, h, 2, Executioner.Config.Outline_Colors  ) -- 42, 42, 42, 200
            if hasSelection and IsValid( current_selection ) then
                Graphics.DrawText( current_selection:Nick(), 'rHit.Font.Generic', w / 2 - 5, 6, Executioner.Config.Name_Colors )
                Graphics.DrawText( team.GetName( current_selection:Team() ), 'rHit.Font.Generic', w / 2 - 5, 273, team.GetColor( current_selection:Team() ) )
                Executioner.RenderDisplay( frame, w, h, current_selection )
            else
                Graphics.DrawText( Executioner.Config.Placement.No_Preview, 'rHit.Font.Generic', w / 2, 210, Executioner.Config.Placement.No_Preview_Color )
            end
        end

        local model_panel = vgui.Create( 'DModelPanel', data_canvis )
        model_panel:SetSize( 210, 225 )
        model_panel:SetPos( 70, 45 )
        model_panel:SetModel( current_selection and current_selection:GetModel() or '' )
        model_panel:SetAnimated( true )
        model_panel:SetVisible( false )
        model_panel.LayoutEntity = function() return end
        model_panel:SetCamPos( Vector( 50, 0, 60 ) )

        model_panel.Paint = function( me, w, h )
            Graphics.DrawRect( 0, 0, w, h, color_selection )
            Graphics.DrawOutline( 0, 0, w, h, 2, Executioner.Config.Outline_Colors )
            baseclass.Get( 'DModelPanel' ).Paint( me, w, h )
        end

        local price_range = CreateTextEntry( data_canvis, 30, data_canvis:GetTall() - 80, 293, 25, 'Hit Price', 'rHit.Font.Inbetween', true )
        price_range.OnMousePressed = function( me, w, h ) me:SetValue( '' ) end

        local request_hit = vgui.Create( 'DButton', data_canvis )
        request_hit:SetSize( 120, 35 )
        request_hit:SetPos( data_canvis:GetWide() / 2 - 60, data_canvis:GetTall() - 50 )
        request_hit:SetText( Executioner.Config.Placement.Request_Hit )
        request_hit:SetFont( 'rHit.Font.Small' )
        request_hit:SetTextColor( Executioner.Config.Component_Colors[ 'button_request' ].text )
        request_hit:SetVisible( false )

        request_hit.Paint = function( me, w, h )
            if me:IsHovered() then
                Graphics.DrawRect( 0, 0, w, h, Executioner.Config.Component_Colors[ 'button_request' ].hover )
            else
                Graphics.DrawRect( 0, 0, w, h, Executioner.Config.Component_Colors[ 'button_request' ].normal )
            end
        end

        request_hit.DoClick = function( me )
            local conversion = tonumber( price_range:GetValue() )
            if not isnumber( conversion ) or conversion <= 0 or conversion > Executioner.Config.Max_Hit_Price or conversion < Executioner.Config.Min_Hit_Price then Executioner.UnPackMessage( string.format( Executioner.Language.HitPriceFormatError, DarkRP.formatMoney( Executioner.Config.Max_Hit_Price ), DarkRP.formatMoney( Executioner.Config.Min_Hit_Price ) ) ) frame:Close() return end
            if not self:canAfford( conversion ) then
                Executioner.UnPackMessage( string.format( Executioner.Language.HitPriceCantAfford, DarkRP.formatMoney( conversion ), DarkRP.formatMoney( self:getDarkRPVar( 'money' ) ) ) )
                frame:Close()
                return
            end
            net.Start( 'rHit.Confirm.Placement' )
                net.WriteInt( conversion, 32 )
                net.WriteEntity( current_selection )
            net.SendToServer()
            --if Executioner.Config.PlaySound then surface.PlaySound( 'buttons/button14.wav' ) end
            frame:Close()
        end

        local objects, locked, choice, emote = {}, false, nil, nil

        local targets = {}
        -- This stops the rows being fucked up colors. If someone is hidden and we continue, k's value remains the same even though we can't see specific rows.
        -- This way we don't need to continue in the player.GetAll() loop when creating the panels
        -- So the color will always retain the correct color as only those who are valid we be in the loop.
        for k, v in pairs( player.GetAll() ) do
            if v ~= self and v:Alive() and not v:isArrested() and not v:GetNWBool( 'rHit_ActiveHit' ) and not Executioner.Config.Hitman_Teams[ team.GetName( v:Team() ) ] then
                if not Executioner.Config.Banned_Groups[ v:GetUserGroup() ] and not Executioner.Config.BlackList_Teams[ team.GetName( v:Team() ) ] then
                    table.insert( targets, v )
                end
            end
        end

        for k, v in pairs( targets ) do
            local player_index = vgui.Create( 'DPanel', player_pane )
            player_index:SetSize( 0, 50 )
            player_index.Paint = function( me, w, h )
                local name, group = IsValid( v ) and v:Nick() or 'Disconnected', Executioner.Config.Clean_Ranks[ v:GetUserGroup() ] or 'User' -- CHANGE
                Graphics.DrawRect( 0, 0, w, h, k % 2 == 0 and Executioner.Config.Placement.Row_Hovers.onSecond or Executioner.Config.Placement.Row_Hovers.mainColor )
                Graphics.DrawText( name, 'rHit.Font.Medium', 5, -1, Executioner.Config.Name_Colors, TEXT_ALIGN_LEFT )
                Graphics.DrawText( group, 'rHit.Font.Medium', 5, 21, Executioner.Config.GroupConfiguration[ v:GetUserGroup() ] or Executioner.Config.Name_Colors, TEXT_ALIGN_LEFT )
                if me.Selected then Graphics.DrawOutline( 0, 0, w, h, 2, Executioner.Config.Outline_Colors ) end
            end
            player_index.OnCursorEntered = function( me, w, h )
                if locked then return end
                if not IsValid( model_panel ) then return end
                hasSelection, current_selection, emote = true, v, table.Random( Executioner.emoteTable )
                model_panel:SetModel( v:GetModel() or 'models/player/group01/male_01.mdl' )
                Graphics.PlaySequence( model_panel, emote )
                color_selection = k % 2 == 0 and Executioner.Config.Placement.Row_Hovers.onSecond or Executioner.Config.Placement.Row_Hovers.mainColor
                ShowComponents( { model_panel, price_range, request_hit } )
                Graphics.CreateIconObject( data_canvis, Executioner.materials[ 'heart' ], 30, 309, 32, 32, false )
                Graphics.CreateIconObject( data_canvis, Executioner.materials[ 'armor' ], 30, 337, 32, 32, false )
            end
            player_index.OnMousePressed = function( me, w, h )
                if not me.Selected and choice ~= k then
                    for k, v in pairs( objects ) do
                        if IsValid( v ) then v.Selected, locked, choice = false, false, nil end
                    end
                    me.Selected, locked, choice = true, true, k
                elseif me.Selected and choice == k then
                     me.Selected, locked, choice = false, false, k
                elseif not me.Selected and choice == k then
                    me.Selected, locked, choice = true, true, k
                end
                current_selection = v
                model_panel:SetModel( v:GetModel() )
                Graphics.PlaySequence( model_panel, emote )
            end
            player_pane:AddItem( player_index )
            table.insert( objects, player_index )
        end
        --> Issue with the panel being entered on start? No idea why, cursor doesn't even hit the panel. This is a small fix. <--
        timer.Simple( 0.3, function() if IsValid( player_canivs ) then player_canivs:SetDisabled( false ) end end )
    end
    net.Receive( 'rHit.Open.Placement', Executioner.DeployPlacer )

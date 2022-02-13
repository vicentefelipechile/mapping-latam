    --[[
        Script: Executioner
        Developer: ted.lua
        Profile: http://steamcommunity.com/id/tedlua/
    ]]

    if not Graphics then Graphics = {} end

    function Graphics.DrawRect( x, y, w, h, col )
        surface.SetDrawColor( col )
        surface.DrawRect( x, y, w, h )
    end

    function Graphics.DrawText( msg, fnt, x, y, c, align )
        draw.SimpleText( msg, fnt, x, y, c, align and align or TEXT_ALIGN_CENTER )
    end

    function Graphics.DrawOutline( x, y, w, h, t, c )
       surface.SetDrawColor( c )
       for i = 0, t - 1 do
           surface.DrawOutlinedRect( x + i, y + i, w - i * 2, h - i * 2 )
       end
    end

    function Graphics.PlaySequence( parent, id )
        local model_entity = parent:GetEntity()
        local sequence = model_entity:LookupSequence( id )
        model_entity:SetSequence( sequence )
    end

    function Graphics.DrawRoundedBox( rad, x, y, w, h, col )
        draw.RoundedBox( rad, x, y, w, h, col )
    end

    function Graphics.GenerateScreenBlur( parent, startTime ) Derma_DrawBackgroundBlur( parent, startTime ) end

    function Graphics.CreateIconObject( self, icon, x, y, w, h, button )
        local image = vgui.Create( button and 'DImageButton' or 'DImage', self )
        image:SetSize( w, h )
        image:SetPos( x, y )
        image:SetMaterial( icon )
        --image:SetKeepAspect( true )
        if not button then return image end
        image.Paint = function( me ) me:SetColor( me:IsHovered() and Color( 230, 32, 25 ) or Color( 255, 255, 255 ) ) end
        image.DoClick = function() self:SetVisible( false ) end
    end

    function Graphics.PaintBar( parent, base_color, switch_color, bar_color )
        if not parent.VBar then print( 'No VBar found.' ) return end
        parent.VBar.Paint = function( me, w, h ) Graphics.DrawRect( 0, 0, w, h, base_color ) end
        parent.VBar.btnUp.Paint = function( me, w, h ) Graphics.DrawRect( 0, 0, w, h, switch_color ) end
        parent.VBar.btnDown.Paint = function( me, w, h ) Graphics.DrawRect( 0, 0, w, h, switch_color ) end
        parent.VBar.btnGrip.Paint = function( me, w, h ) Graphics.DrawRect( 0, 0, w, h, bar_color ) end
    end

    local blur = Material( "pp/blurscreen" )
    function Graphics.BlurMenu( panel, layers, density, alpha )
        -- Its a scientifically proven fact that blur improves a script
        local x, y = panel:LocalToScreen( 0, 0 )

        surface.SetDrawColor( 255, 255, 255, alpha )
        surface.SetMaterial( blur )

        for i = 1, 3 do
            blur:SetFloat( "$blur", ( i / layers ) * density )
            blur:Recompute()

            render.UpdateScreenEffectTexture()
            surface.DrawTexturedRect( -x, -y, ScrW(), ScrH() )
        end
    end

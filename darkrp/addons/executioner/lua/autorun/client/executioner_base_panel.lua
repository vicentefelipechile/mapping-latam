    --[[
        Script: Executioner
        Developer: ted.lua
        Profile: http://steamcommunity.com/id/tedlua/
    ]]

    local PANEL, materials ={}, { ['cross'] = Material( 'cross.png' ) }

    function PANEL:Init()
        self.Start = CurTime()
        self.Reject = false
        self:SetSize( 900, 600 )
        self:Center()
        self:SetTitle( '' )
        self:SetDraggable( false )
        self:ShowCloseButton( false )
    end

    function PANEL:Deploy( render, block_popup )
        if render then Graphics.CreateIconObject( self, materials[ 'cross' ], self:GetWide() - 28, 10, 16, 16, true ) end
        if not block_popup then self:MakePopup() else self:SetVisible( true ) end
    end

    function PANEL:Paint()
        Derma_DrawBackgroundBlur( self, self.Start )
        Graphics.DrawRect( 0, 0, self:GetWide(), self:GetTall(), Color( 32, 32, 32, Executioner.Config.GlobalAlpha ) )
        Graphics.BlurMenu( self, 10, 15, 240 )
    end

    vgui.Register( 'base_panel', PANEL, 'DFrame' )

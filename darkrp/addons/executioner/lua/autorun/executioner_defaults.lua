    --[[
        Disables the Default DarkRP Hit shit.
        Do not touch this file unless you know what you're doing.
        Want help with something?
        Feel free to add me on Steam; http://steamcommunity.com/id/tedlua/ before you touch anything in here.
    --]]

    if CLIENT then
        local _t = {
            { _hook = 'HUDPaint', _string = 'DrawHitOption' },
            { _hook = 'KeyPress', _string = 'openHitMenu' },
            { _hook = 'PostPlayerDraw', _string = 'drawHitInfo' },
            { _hook = 'InitPostEntity', _string = 'HitmanMenu' }
        }

        hook.Add( 'Initialize', 'rHit.Disable.Default', function()
            for k, v in pairs( _t ) do hook.Remove( v._hook, v._string ) end
        end )
    else
        local _c = { 'requesthit', 'hitprice' }
        hook.Add( 'Initialize', 'rHit.Disable.Commands', function()
            for k, v in pairs( _c ) do DarkRP.removeChatCommand( v ) end
        end )
    end

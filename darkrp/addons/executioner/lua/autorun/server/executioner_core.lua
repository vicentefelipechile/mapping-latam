        --[[
            Script: Executioner
            Developer: ted.lua
            Profile: http://steamcommunity.com/id/tedlua/
        ]]

        if not SERVER then return end

        resource.AddFile( 'resource/fonts/bfhud.ttf' )
        resource.AddWorkshop( '1300407557' )

        Executioner.HitTracker = Executioner.HitTracker or {}
        Executioner.BonusTracker = Executioner.BonusTracker or {}
        Executioner.PhoneTracker = Executioner.PhoneTracker or {}
        Executioner.Saves = Executioner.Saves or {}

        --> Opens the menu in which people can place hits. <--
        util.AddNetworkString( 'rHit.Open.Placement' )
        function Executioner.OrderPlacement( self )
            net.Start( 'rHit.Open.Placement' )
            net.Send( self )
        end
        --> Opens the menu which ask the Hitman if he would like to accept or decline the offer. <--
        util.AddNetworkString( 'rHit.Open.Confirmation' )
        function Executioner.OrderConfirmation( hitman, tbl )
            net.Start( 'rHit.Open.Confirmation' )
                net.WriteTable( tbl )
            net.Send( hitman )
        end
        --> Opens the menu which shows all of the currently active hits <--
        util.AddNetworkString( 'rHit.Open.CurrentHits' )
        function Executioner.OrderCurrentHits( self )
            net.Start( 'rHit.Open.CurrentHits' )
            net.Send( self )
        end

        --> Sends a message to connected client(s) <--
        util.AddNetworkString( 'rHit.Send.Message' )
        function Executioner.SendMessage( target, message )
            if type( target ) == 'table' and type( message ) == 'table' then
                for k, v in pairs( target ) do
                    net.Start( 'rHit.Send.Message' )
                        net.WriteString( message[ k ] )
                    net.Send( v )
                end
            else
                net.Start( 'rHit.Send.Message' )
                    net.WriteString( message )
                net.Send( target )
            end
        end

        util.AddNetworkString( 'rHit.Send.ScreenMessage' )
        function Executioner.SendCompleteMessage( target, price )
            net.Start( 'rHit.Send.ScreenMessage' )
                net.WriteInt( price, 32 )
            net.Send( target )
        end

        function Executioner.GetHitmen( onlyFree, onlyActive, steamOnly )
            local keep = {}
            for k, v in pairs( player.GetAll() ) do
                if IsValid( v ) then
                    if Executioner.Config.Hitman_Teams[ team.GetName( v:Team() ) ] then
                        if onlyActive and v.rHit_ActiveHit then
                            if steamOnly then keep[ v:SteamID() ] = true else table.insert( keep, v ) end
                        elseif onlyFree and not v.rHit_ActiveHit then
                            table.insert( keep, steamOnly and v:SteamID() or v )
                        else -- If both are false, then let's just get all Hitman indefinitely.
                            table.insert( keep, steamOnly and v:SteamID() or v )
                        end
                    end
                end
            end
            return keep
        end

        function Executioner.FindHitTable( key, phoneTable )
            for k, v in pairs( not phoneTable and Executioner.HitTracker or Executioner.PhoneTracker ) do
                if key == v.target or key == v.hitman or key == v.customer then return v end
            end
        end

        --> Sends the Bonus Weapon interface to a Hitman <--
        util.AddNetworkString( 'rHit.Open.Bonus' )
        function Executioner.OrderBonus( self )
            net.Start( 'rHit.Open.Bonus' )
            net.Send( self )
        end

        util.AddNetworkString( 'rHit.Send.t' )
        function Executioner.SendTarget( self, target )
            net.Start( 'rHit.Send.t' )
                net.WriteEntity( target )
            net.Send( self )
        end

        util.AddNetworkString( 'rHit.Send.a' )
        function Executioner.SendHitmen()
            net.Start( 'rHit.Send.a' )
                net.WriteTable( Executioner.GetHitmen( false, true, true ) )
            net.Broadcast()
        end

        function Executioner.ClearHit( hitman, customer, target, strip, refund, price, phoneTable )
            if IsValid( hitman ) then
                hitman.rHit_ActiveHit = false
                if Executioner.HitTracker[ hitman:SteamID() ] then Executioner.HitTracker[ hitman:SteamID() ] = nil end
                if Executioner.BonusTracker[ hitman:SteamID() ] then
                    if strip then
                        timer.Simple( 1, function()
                            if IsValid( hitman ) and Executioner.BonusTracker[ hitman:SteamID() ] then
                                hitman:StripWeapon( Executioner.BonusTracker[ hitman:SteamID() ].ent )
                                hitman:SelectWeapon( Executioner.BonusTracker[ hitman:SteamID() ].current )
                                Executioner.BonusTracker[ hitman:SteamID() ] = nil
                            end
                        end )
                    else
                        Executioner.BonusTracker[ hitman:SteamID() ] = nil
                    end
                end
                if timer.Exists( 'rHit_HitTime ' .. hitman:SteamID() ) then timer.Remove( 'rHit_HitTime ' .. hitman:SteamID() ) end
                hitman.rHit_Busy = false -- Just in case he gets fucked with the 2nd menu opencustomer.rHit_PlaceCooldown.
                if type( customer ) == 'Player' and IsValid( customer) and customer.My_Hitman then customer.My_Hitman = nil end
                Executioner.SendHitmen()
            end
            if IsValid( target ) then
                target.rHit_ActiveTarget = false
                if not refund then target.rHit_Grace = Executioner.Config.Grace_Cooldown + CurTime() else target.rHit_Grace = 0 end
            end
            if type( customer ) == 'Player' and IsValid( customer ) then
                -- Enforce wait cooldown now.
                customer.rHit_PlaceCooldown = Executioner.Config.HitCooldown + CurTime()
                if refund then
                    customer:addMoney( price )
                    customer.rHit_PlaceCooldown = 0
                end
                customer.rHit_PlacedHit = false
            end
            if phoneTable and table.HasValue( Executioner.PhoneTracker, phoneTable ) then table.RemoveByValue( Executioner.PhoneTracker, phoneTable ) end
        end

        util.AddNetworkString( 'rHit.Bonus.Accept' )
        function Executioner.AcceptBonus( size, self )
            if not Executioner.HitTracker[ self:SteamID() ] or not Executioner.Config.Hitman_Teams[ team.GetName( self:Team() ) ] or Executioner.BonusTracker[ self:SteamID() ] then return end
            local index = Executioner.BonusWeapons[ math.random( 1, #Executioner.BonusWeapons ) ]
            Executioner.BonusTracker[ self:SteamID() ] = { name = index.name, ent = index.ent, current = self:GetActiveWeapon():GetClass() }
            Executioner.SendMessage( self, string.format( Executioner.Language.BonusWeaponAccepted, index.name ) )
            self:Give( index.ent )
            self:SelectWeapon( index.ent )
        end
        net.Receive( 'rHit.Bonus.Accept', Executioner.AcceptBonus )

        function Executioner.StartTimer( self )
            if not timer.Exists( 'rHit_HitTime ' .. self:SteamID() ) then
                local start, time = CurTime(), math.random( Executioner.Config.Hit_Time_Min, Executioner.Config.Hit_Time_Max )
                self:SetNWInt( 'rHit_HitTime', time )
                timer.Create( 'rHit_HitTime ' .. self:SteamID(), 1, time + 1, function()
                    if IsValid( self ) then
                        if self:GetNWInt( 'rHit_HitTime' ) <= 0 and self.rHit_ActiveHit then
                            Executioner.SendMessage( player.GetAll(), string.format( Executioner.Language.HitTimeReached, self:Nick() ) )
                            local data = Executioner.FindHitTable( self )
                            if not data then return end
                            hook.Run( 'Executioner.OnHitExpired', data, data.hitman:Nick() .. ' ran out of time to complete the hit. The hit has failed!' )
                            Executioner.ClearHit( self, data.customer, data.target, true, true, data.price, nil )
                        else
                            self:SetNWInt( 'rHit_HitTime', math.Round( self:GetNWInt( 'rHit_HitTime' ) - 1, 0 ) )
                        end
                    end
                end )
            end
        end

        function Executioner.TraceEyes( self, key )
            if not Executioner.Config.Enable_Face_To_Face then return end
            if key ~= IN_USE or self:isArrested() then return end
            local trace = self:GetEyeTrace().Entity
            if trace and not trace:IsPlayer() then return end
            if self:GetPos():Distance( trace:GetPos() ) > 85 or trace:isArrested() then return end
            if Executioner.Config.Hitman_Teams[ team.GetName( self:Team() ) ] or Executioner.Config.No_Place_Teams[ team.GetName( self:Team() ) ] or not Executioner.Config.Hitman_Teams[ team.GetName( trace:Team() ) ]  then return end
            -- We don't care if it's the first time, we'll declare it if they actually accept the hit. From there cooldown is in force.
            if self.rHit_PlaceCooldown and self.rHit_PlaceCooldown > CurTime() or self.rHit_PlacedHit then Executioner.SendMessage( self, Executioner.Language.HitTooSoon ) return end
            if Executioner.HitTracker[ trace:SteamID() ] then Executioner.SendMessage( self, string.format( Executioner.Language.HitmanBusy, trace:Nick() ) ) return end
            self.My_Hitman = trace
            Executioner.OrderPlacement( self )
        end
        hook.Add( 'KeyPress', 'rHit.Trace.Eyes', Executioner.TraceEyes )

        function Executioner.CanPlaceHit( price, target, customer, hitman, phoneEnabled )
            --> Customer Section <--
            if not IsValid( target ) then Executioner.SendMessage( customer, Executioner.Language.InvalidTargets ) return false end
            if customer.rHit_PlaceCooldown and customer.rHit_PlaceCooldown > CurTime() then Executioner.SendMessage( customer, Executioner.Language.HitTooSoon ) return false end
            if customer.rHit_PlacedHit then Executioner.SendMessage( customer, Executioner.Language.HitmanActiveHit ) return false end
            if not isnumber( price ) or price <= 0 or price > Executioner.Config.Max_Hit_Price or price < Executioner.Config.Min_Hit_Price then Executioner.SendMessage( customer, string.format( Executioner.Language.HitPriceFormatError, DarkRP.formatMoney( Executioner.Config.Max_Hit_Price ), DarkRP.formatMoney( Executioner.Config.Min_Hit_Price ) ) ) return false end
            if not customer:canAfford( price ) then Executioner.SendMessage( customer, string.format( Executioner.Language.HitPriceCantAfford, DarkRP.formatMoney( price ), DarkRP.formatMoney( customer:getDarkRPVar( 'money' ) ) ) ) return false end
            if Executioner.Config.Hitman_Teams[ team.GetName( customer:Team() ) ] or Executioner.Config.No_Place_Teams[ team.GetName( customer:Team() ) ] or Executioner.Config.BlackList_Teams[ team.GetName( customer:Team() ) ] then Executioner.SendMessage( customer, Executioner.Language.TargetRejectHit ) return false end
            if customer:isArrested() or not customer:Alive() then Executioner.SendMessage( customer, Executioner.Language.TargetRejectHit ) return false end
            --> Start of Target Section <--
            if not IsValid( target ) then Executioner.SendMessage( customer, Executioner.Language.InvalidTargets ) return false end
            if Executioner.Config.Hitman_Teams[ team.GetName( target:Team() ) ] or Executioner.Config.BlackList_Teams[ team.GetName( target:Team() ) ] or Executioner.Config.Banned_Groups[ target:GetUserGroup() ] then Executioner.SendMessage( customer, Executioner.Language.TargetRejectHit ) return false end
            if target:isArrested() or not target:Alive() then Executioner.SendMessage( customer, Executioner.Language.TargetRejectHit ) return false end
            if target.rHit_ActiveTarget then Executioner.SendMessage( customer, Executioner.Language.HitActive ) return false end
            if target.rHit_Grace and target.rHit_Grace > CurTime() then Executioner.SendMessage( customer, Executioner.Language.SameTargetTooSoon ) return false end
            if Executioner.Config.EnableUTimeSupport and target:GetUTimeTotalTime() < 3600 * Executioner.Config.Min_Play_Time then Executioner.SendMessage( customer, 'This person\'s total time does not meet the required play time for a hit.' ) return false end
            --> Start of Hitman Section <--
            if not phoneEnabled then
                if not IsValid( hitman ) then Executioner.SendMessage( customer, Executioner.Language.InvalidTargets ) return false end
                if customer:GetPos():Distance( hitman:GetPos() ) > 200 then Executioner.SendMessage( customer, 'Your Hitman is too far away.' ) return false end
                if hitman.rHit_Busy or hitman.rHit_ActiveHit then Executioner.SendMessage( customer, string.format( Executioner.Language.HitmanBusy, hitman:Nick() ) ) return false end
                if hitman:isArrested() or not hitman:Alive() then Executioner.SendMessage( customer, Executioner.Language.TargetRejectHit ) return false end
            end
            return true
        end

        ----------------------------------------------------------------------------------------
        --> The block that is checked when the user presses 'Request Hit' on the first menu. <--
        ----------------------------------------------------------------------------------------
        util.AddNetworkString( 'rHit.Confirm.Placement' )
        function Executioner.OnHitRequested( size, self )
            local price, target, customer, hitman = net.ReadInt( 32 ), net.ReadEntity(), self, self.My_Hitman
            if Executioner.CanPlaceHit( price, target, customer, hitman, not IsValid( hitman ) and Executioner.Config.PhoneEnabled ) then
                if not IsValid( hitman ) and Executioner.Config.PhoneEnabled then
                    Executioner.HandlePhoneRequest( price, target, customer )
                else
                    if not IsValid( hitman ) then Executioner.SendMessage( customer, Executioner.Language.InvalidTargets ) return end
                    Executioner.HitTracker[ hitman:SteamID() ] = { price = price, target = target, customer = customer, hitman = hitman }
                    Executioner.OrderConfirmation( hitman, { price = price, target = target } )
                    Executioner.SendMessage( self, string.format( Executioner.Language.RequestSent, hitman:Nick() ) )
                    hitman.rHit_Busy = true
                    hitman.rHit_NotAccepted = true
                    -- How long the server will wait for a response.
                    timer.Create( 'rHitPlaceTime ' .. hitman:SteamID(), Executioner.Config.ResponseTime, 1, function()
                        if IsValid( hitman ) and IsValid( self ) and Executioner.HitTracker[ hitman:SteamID() ] and not hitman.rHit_ActiveHit then
                            Executioner.SendMessage( self, string.format( Executioner.Language.CustomerNoResponse, hitman:Nick() ) )
                            Executioner.SendMessage( hitman, Executioner.Language.HitmanNoResponse )
                            hook.Run( 'Executioner.OnHitExpired', Executioner.HitTracker[ hitman:SteamID() ], Executioner.HitTracker[ hitman:SteamID() ].hitman:Nick() .. ' ran out of time to accept the hit. The hit has been cancelled!' )
                            Executioner.HitTracker[ hitman:SteamID() ], hitman.rHit_Busy = nil, false
                        end
                    end )
                end
            else
                print( 'Not sure why we are here. Something went wrong.' )
            end
        end
        net.Receive( 'rHit.Confirm.Placement', Executioner.OnHitRequested )

        ----------------------------------------------------------------
        --> The function that is called when a Hitman accepts a hit. <--
        ----------------------------------------------------------------
        util.AddNetworkString( 'rHit.Config.OrderHit' )
        function Executioner.OnAccepted( size, self )
            local data = Executioner.HitTracker[ self:SteamID() ]
            if not data then self.rHit_Busy = false return end
            Executioner.SendMessage( data.customer, string.format( Executioner.Language.CustomerOnHitAccepted, self:Nick(), data.target:Nick() ) )
            Executioner.SendMessage( self, string.format( Executioner.Language.HitmanOnHitAccepted, data.customer:Nick(), data.target:Nick(), DarkRP.formatMoney( data.price ) ) )
            data.customer:addMoney( - data.price )
            data.target.rHit_ActiveTarget, self.rHit_ActiveHit = true, true -- This is no longer used as a NWBool, so now players can not tell who has a hit against them.
            if math.random( 1, 100 ) <= Executioner.Config.BonusChance then timer.Simple( 1, function() if IsValid( self ) then Executioner.OrderBonus( self ) end end ) end
            Executioner.SendTarget( self, data.target )
            if Executioner.Config.EnableHitTime then Executioner.StartTimer( self ) end
            self.rHit_Busy, data.customer.rHit_PlacedHit = true, true
            Executioner.SendMessage( player.GetAll(), Executioner.Language.MessageAllOnAccepted )
            Executioner.SendHitmen() -- This is purely so we know who has a Hit to draw 'Busy' on the Hitman. No other info is sent.
            hook.Run( 'Executioner.OnHitAccepted', data )
            self.rHit_NotAccepted = false
        end
        net.Receive( 'rHit.Config.OrderHit', Executioner.OnAccepted )

        -----------------------------------------------------------------------
        --> The function that is called when a Hitman declines a hit offer. <--
        -----------------------------------------------------------------------
        util.AddNetworkString( 'rHit.Confirm.Rejection' )
        function Executioner.OnReject( size, self )
            local data = Executioner.HitTracker[ self:SteamID() ]
            if not data then return end -- Something went wrong.
            -- Hitman is self, so no need to null check here.
            if not IsValid( data.customer ) then
                Executioner.SendMessage( self, Executioner.Language.InvalidTargets )
            else
                Executioner.SendMessage( { self, data.customer }, {
                    string.format( string.format( Executioner.Language.HitmanOnHitDeclined, data.customer:Nick() ) ),
                    string.format( string.format( Executioner.Language.CustomerOnHitDeclined, self:Nick() ) )
                })
            end
            hook.Run( 'Executioner.OnHitDeclined', data )
            self.rHit_Busy, Executioner.HitTracker[ self:SteamID() ] = false, nil
            self.rHit_NotAccepted = false
        end
        net.Receive( 'rHit.Confirm.Rejection', Executioner.OnReject )

        ------------------------------------------------------
        --> The function that is called when a player dies <--
        ------------------------------------------------------
        function Executioner.OnDeath( victim, inflictor, attacker )
            if Executioner.FindHitTable( victim ) and IsValid( victim ) and victim:IsPlayer() and IsValid( attacker ) and attacker:IsPlayer() then
                local data, refund, bonus = Executioner.FindHitTable( victim ), false, false
                if IsValid( data.hitman ) and IsValid( data.target ) then
                    if data.hitman == attacker and data.target == victim then
                        local weapon = IsValid( inflictor ) and inflictor:IsPlayer() and inflictor:GetActiveWeapon():GetClass()
                        if Executioner.BonusTracker[ data.hitman:SteamID() ] and Executioner.BonusTracker[ attacker:SteamID() ].ent == weapon then
                            Executioner.SendMessage( player.GetAll(), string.format( Executioner.Language.BonusWeaponHitComplete, attacker:Nick(), Executioner.BonusTracker[ attacker:SteamID() ].name, victim:Nick(), DarkRP.formatMoney( data.price ), DarkRP.formatMoney( Executioner.Config.BonusMoney ) ) )
                            data.price = data.price + Executioner.Config.BonusMoney
                            bonus = true
                        else
                            Executioner.SendMessage( player.GetAll(), string.format( Executioner.Language.HitCompletedNoBonus, attacker:Nick(), victim:Nick(), DarkRP.formatMoney( data.price ) ) )
                        end
                        if Executioner.Config.TaxOnKill > 0 then
                        data.price = data.price - data.price / 100 * Executioner.Config.TaxOnKill
                        Executioner.SendMessage( attacker, Executioner.Language.TaxOnKill )
                        end
                        data.hitman:addMoney( data.price )
                        Executioner.SendCompleteMessage( data.hitman, data.price )
                        hook.Run( 'Executioner.OnHitCompleted', data, victim, attacker, bonus )
                else
                        if attacker == victim or type( data.customer ) == 'Player' and IsValid( data.customer ) and data.customer == victim then return end
                        if attacker == data.target and victim == data.hitman then
                            Executioner.SendMessage( player.GetAll(), string.format( Executioner.Language.TargetKilledHitman, data.hitman:Nick(), data.target:Nick() ) )
                        end
                        if attacker ~= data.target and victim == data.hitman then
                            Executioner.SendMessage( player.GetAll(), string.format( Executioner.Language.HitmanDied, data.hitman:Nick() ) )
                        end
                        if victim == data.target then
                            Executioner.SendMessage( player.GetAll(), string.format( Executioner.Language.TargetDiedBeforeHit, data.hitman:Nick(), data.target:Nick() ) )
                        end
                        hook.Run( 'Executioner.OnHitFailed', data, victim, attacker, bonus )
                        refund = true
                    end
                end
                Executioner.ClearHit( data.hitman, data.customer, data.target, data.hitman == attacker, refund, data.price, false )
            end
            if Executioner.FindHitTable( victim, true ) then
                local data = Executioner.FindHitTable( victim, true )
                Executioner.ClearHit( nil, data.customer, data.target, false, true, data.price, data )
            end
        end
        hook.Add( 'PlayerDeath', 'rHit.Handle.OnDeath', Executioner.OnDeath )


        function Executioner.OnDisconnect( self )
            if Executioner.FindHitTable( self ) then
                local data = Executioner.FindHitTable( self )
                if IsValid( data.target ) and self == data.target then -- Target has booked it.
                    Executioner.SendMessage( player.GetAll(), string.format( Executioner.Language.TargetDisconnected, self:Nick() ) )
                elseif IsValid( data.hitman ) and self == data.hitman then -- Hitman has booked it.
                    Executioner.SendMessage( player.GetAll(), string.format( Executioner.Language.HitmanDisconnected, self:Nick(), DarkRP.formatMoney( data.price ) ) )
                else
                    if type( data.customer ) == 'Player' and IsValid( data.customer ) and self == data.customer then
                        Executioner.SendMessage( player.GetAll(), string.format( Executioner.Language.CustomerDisconnected, self:Nick(), DarkRP.formatMoney( data.price ) ) )
                    end
                end
                hook.Run( 'Executioner.OnHitDisconnected', self, data )
                local condition = self ~= data.customer
                if self == data.hitman and self.rHit_NotAccepted == true then
                    condition = false
                end
                Executioner.ClearHit( data.hitman, data.customer, data.target, self ~= data.hitman, condition, data.price, false )
            end
            if Executioner.FindHitTable( self, true ) then
                local data = Executioner.FindHitTable( self, true )
                Executioner.ClearHit( nil, data.customer, data.target, false, self ~= data.customer, data.price, data )
            end
        end
        hook.Add( 'PlayerDisconnected', 'rHit.Handle.Disconnect', Executioner.OnDisconnect )

        function Executioner.ClearJobSwitch( self, old, new )
            if Executioner.FindHitTable( self ) then
                local data = Executioner.FindHitTable( self )
                if Executioner.Config.BlackList_Teams[ team.GetName( new ) ] or self == data.hitman or Executioner.Config.Hitman_Teams[ team.GetName( self:Team() ) ] then
                    Executioner.SendMessage( player.GetAll(), string.format( Executioner.Language.OnSwitchTeam, self:Nick(), team.GetName( new ) ) )
                    Executioner.ClearHit( data.hitman, data.customer, data.target, self ~= data.hitman, self ~= data.customer, data.price, false )
                end
            end
            if Executioner.FindHitTable( self, true ) then
                local data = Executioner.FindHitTable( self, true )
                if Executioner.Config.BlackList_Teams[ team.GetName( new ) ] or Executioner.Config.Hitman_Teams[ team.GetName( self:Team() ) ] then
                    Executioner.ClearHit( nil, data.customer, data.target, self ~= data.hitman, self ~= data.customer, data.price, data )
                end
            end
        end
        hook.Add( 'OnPlayerChangedTeam', 'rHit.Handle.SwitchTeam', Executioner.ClearJobSwitch )

        function Executioner.ClearArrest( target, time, arrestor )
            if Executioner.FindHitTable( target ) then
                local data = Executioner.FindHitTable( target )
                if IsValid( data.hitman ) and data.hitman == target then
                    Executioner.SendMessage( player.GetAll(), string.format( Executioner.Language.HitmanArrested, target:Nick(), arrestor:Nick() ) )
                elseif IsValid( data.target ) and data.target == target then
                    Executioner.SendMessage( player.GetAll(), string.format( Executioner.Language.TargetArrested, target:Nick(), arrestor:Nick() ) )
                else
                    return -- Don't end the hit if the customer is arrested, he already paid.
                end
                hook.Run( 'Executioner.OnHitArrested', data, target, time, arrestor )
                Executioner.ClearHit( data.hitman, data.customer, data.target, target ~= data.hitman, target ~= data.customer, data.price, false )
            end
            if Executioner.FindHitTable( target, true ) then
                local data = Executioner.FindHitTable( target, true )
                Executioner.ClearHit( data.hitman, data.customer, data.target, target ~= data.hitman, target ~= data.customer, data.price, data )
            end
        end
        hook.Add( 'playerArrested', 'rHit.Handle.Arrest', Executioner.ClearArrest )

        function Executioner.DenyWeaponDrop( self, ent )
            if Executioner.FindHitTable( self ) then
                if Executioner.BonusTracker[ self:SteamID() ] then
                    if ent:GetClass() == Executioner.BonusTracker[ self:SteamID() ].ent then
                        Executioner.SendMessage( self, Executioner.Language.CantDrop )
                        return false
                    end
                end
            end
        end
        hook.Add( 'canDropWeapon', 'rHit.Block.WeaponDrop', Executioner.DenyWeaponDrop )

        function Executioner.ChatScanner( self, txt )
            if string.sub( string.lower( txt ), 1, #Executioner.Config.Phone_Command ) == Executioner.Config.Phone_Command then
                Executioner.OrderPhoneList( self, Executioner.PhoneTracker )
                return ''
            elseif string.sub( string.lower( txt ), 1, #Executioner.Config.Phone_Save ) == Executioner.Config.Phone_Save and self:IsSuperAdmin() then
                Executioner.HandleSave( self )
                return ''
            elseif string.sub( string.lower( txt ), 1, #Executioner.Config.Reset_Phones ) == Executioner.Config.Reset_Phones and self:IsSuperAdmin() then
                Executioner.ResetPhones( self )
                return ''
            elseif string.sub( string.lower( txt ), 1, #Executioner.Config.Cancel_Hit ) == Executioner.Config.Cancel_Hit then
                if Executioner.FindHitTable( self ) then
                    local data = Executioner.FindHitTable( self )
                    if self == data.hitman or data.customer == self then
                        if type( data.customer ) == 'Player' then
                            Executioner.SendMessage( { data.hitman, data.customer }, { 'This hit has been cancelled by ' .. self:Nick() .. '.', 'This hit has been cancelled by ' .. self:Nick() .. '.' } )
                        else
                            Executioner.SendMessage( data.hitman, 'You have cancelled the automated hit.' )
                        end
                        Executioner.ClearHit( data.hitman, data.customer, data.target, true, true, data.price, false )
                    end
                else
                    if Executioner.FindHitTable( self, true ) then
                        local data = Executioner.FindHitTable( self, true )
                        if type( data.customer ) == 'Player' and data.customer == self then
                            Executioner.SendMessage( self, 'You have cancelled the automated hit.' )
                            Executioner.ClearHit( nil, data.customer, data.target, true, true, data.price, data )
                        end
                    end
                end
                return ''
            end
        end
        hook.Add( 'PlayerSay', 'rHit.Handle.Commands', Executioner.ChatScanner )

        --if not Executioner.Config.Developer_Mode then return end

        concommand.Add( 'rHit.Table', function( self, cmd, args, argStr ) if self:IsSuperAdmin() then PrintTable( Executioner.HitTracker ) end end )
        concommand.Add( 'rHit.Phone', function( self, cmd, args, argStr ) if self:IsSuperAdmin() then PrintTable( Executioner.PhoneTracker ) end end )

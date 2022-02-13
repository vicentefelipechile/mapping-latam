    --[[
        Script: Executioner
        Developer: ted.lua
        Profile: http://steamcommunity.com/id/tedlua/
    ]]

    if not SERVER then return end

    util.AddNetworkString( 'rHit.Open.Phonebox' )
    function Executioner.OrderPhoneList( self, data )
        if not Executioner.Config.Hitman_Teams[ team.GetName( self:Team() ) ] then return end
        net.Start( 'rHit.Open.Phonebox' )
            net.WriteTable( data )
        net.Send( self )
    end

    function Executioner.GetTargets()
        local targets = {}
        for k, v in pairs( player.GetAll() ) do
            if Executioner.Config.Hitman_Teams[ team.GetName( v:Team() ) ] or Executioner.Config.BlackList_Teams[ team.GetName( v:Team() ) ] or Executioner.Config.Banned_Groups[ v:GetUserGroup() ] then continue end
            if v:isArrested() or not v:Alive() or v.rHit_ActiveTarget then continue end
            if Executioner.Config.EnableUTimeSupport and v:GetUTimeTotalTime() < 3600 * Executioner.Config.Min_Play_Time then continue end
            table.insert( targets, v )
        end
        return targets
    end

    function Executioner.GenerateHit()
        if Executioner.Config.EnableHitGeneration then
            timer.Create( 'rHit_Random_Generation', Executioner.Config.Generate_Hit_Intervals, 0, function()
                if not Executioner.Config.EnableHitGeneration then timer.Remove( 'rHit_Random_Generation' ) end -- Just in case of Lua refresh.
                if #player.GetAll() >= Executioner.Config.Minimum_Players then
                    local targets = Executioner.GetTargets()
                    local choice = table.Random( targets )
                    if #Executioner.GetHitmen() >= 1 and IsValid( choice ) then
                        Executioner.SendMessage( Executioner.GetHitmen(), Executioner.Language.OnRandomHit )
                        choice.rHit_ActiveTarget = true
                        local tbl = { price = math.random( Executioner.Config.Min_Hit_Price, Executioner.Config.Max_Hit_Price ), target = choice, customer = 'Anonymous', start = CurTime() }
                        table.insert( Executioner.PhoneTracker, tbl )
                        timer.Simple( Executioner.Config.Generate_Remove_Time, function()
                            if table.HasValue( Executioner.PhoneTracker, tbl ) then table.RemoveByValue( Executioner.PhoneTracker, tbl ) end
                        end )
                    end
                end
            end )
        end
    end
    hook.Add( 'PostGamemodeLoaded', 'rHit.Random.Generation', Executioner.GenerateHit )



    function Executioner.HandlePhoneRequest( price, target, customer )
        if IsValid( target ) and IsValid( customer ) then
            if #Executioner.GetHitmen() >= 1 then
                Executioner.SendMessage( { customer, Executioner.GetHitmen() },
                {
                    string.format( Executioner.Language.CustomerOnPhoneHitPlaced, target:Nick(), DarkRP.formatMoney( price ) ),
                    string.format( Executioner.Language.HitmanNotifyRequest, customer:Nick() )
                })
                local tbl = { price = price, target = target, customer = customer, start = CurTime() }
                table.insert( Executioner.PhoneTracker, tbl )
                target.rHit_ActiveTarget = true
                customer:addMoney( - price )
                customer.rHit_PlacedHit, customer.rHit_PlaceCooldown = true, Executioner.Config.HitCooldown + CurTime()
            else
                Executioner.SendMessage( customer, Executioner.Language.NotEnoughHitmen )
            end
        end
    end


    util.AddNetworkString( 'rHit.Confirm.PhoneAccept' )
    function Executioner.HitmanHandlePhone( size, self )
        local target = net.ReadEntity()
        if IsValid( target ) and Executioner.FindHitTable( target, true ) then
            -- We don't need to check much here, everything has already been checked prior to creating the data.
            if Executioner.Config.Hitman_Teams[ team.GetName( self:Team() ) ] and not self.rHit_ActiveHit then -- Just to be safe.
                local data = Executioner.FindHitTable( target, true )
                if data.customer and type( data.customer ) == 'string' then
                    Executioner.HitTracker[ self:SteamID() ] = { price = data.price, target = data.target, customer = 'Anonymous', hitman = self }
                    Executioner.SendMessage( self, string.format( Executioner.Language.OnRadomHitAccepted, data.target:Nick(), DarkRP.formatMoney( data.price ) ) )
                end
                if data.customer and type( data.customer ) == 'Player' and IsValid( data.customer ) then
                    Executioner.HitTracker[ self:SteamID() ] = { price = data.price, target = data.target, customer = data.customer, hitman = self }
                    Executioner.SendMessage( self, string.format( Executioner.Language.HitmanOnHitAccepted, data.customer:Nick(), data.target:Nick(), DarkRP.formatMoney( data.price ) ) )
                end
                data.target.rHit_ActiveTarget, self.rHit_ActiveHit = true, true
                if Executioner.Config.EnableHitTime then Executioner.StartTimer( self ) end
                if math.random( 1, 100 ) <= Executioner.Config.BonusChance then Executioner.OrderBonus( self ) end
                Executioner.SendMessage( player.GetAll(), Executioner.Language.MessageAllOnAccepted )
                Executioner.SendTarget( self, data.target )
                Executioner.SendHitmen()
                hook.Run( 'Executioner.OnHitAccepted', Executioner.HitTracker[ self:SteamID() ] )
                table.RemoveByValue( Executioner.PhoneTracker, data )
            end
        end
    end
    net.Receive( 'rHit.Confirm.PhoneAccept', Executioner.HitmanHandlePhone )

    function Executioner.HandleSave( self )
        local phone_data = {}
        for k, v in pairs( ents.GetAll() ) do
            if v:GetClass() == 'phone_box' then
                table.insert( phone_data,
                {
                    pos = v:GetPos(), angles = v:GetAngles()
                } )
            end
        end
        if #phone_data < 1 then Executioner.SendMessage( self, Executioner.Language.PhoneNoSave ) return '' end
        file.Write( 'executioner/phones.txt', util.TableToJSON( phone_data ) )
        Executioner.SendMessage( self, string.format( Executioner.Language.PhoneOnSave, #phone_data ) )
    end

    function Executioner.PlacePhones()
        if !file.IsDir( 'executioner', 'DATA' ) then file.CreateDir( 'executioner' ) end
        if !file.Exists( 'executioner/phones.txt', 'DATA' ) then file.Write( 'executioner/phones.txt', '[]' ) end
        Executioner.Saves = util.JSONToTable( file.Read( 'executioner/phones.txt', 'DATA' ) ) or {}
        for k, v in pairs( Executioner.Saves ) do
            local phone_box = ents.Create( 'phone_box' )
            phone_box:SetPos( v.pos )
            phone_box:SetAngles( v.angles )
            phone_box:Spawn()
            local phys = phone_box:GetPhysicsObject()
            if IsValid( phys ) then phys:EnableMotion( false ) end
        end
    end
    hook.Add( 'Initialize', 'rHit.Place.Phones', Executioner.PlacePhones )

    function Executioner.ResetPhones( self )
        Executioner.Saves, count = {}, 0
        file.Write( 'executioner/phones.txt', '[]' )
        for k, v in pairs( ents.GetAll() ) do
            if v:GetClass() == 'phone_box' then
                SafeRemoveEntity( v )
                count = count + 1
            end
        end
        if count > 0 then Executioner.SendMessage( self, string.format( Executioner.Language.PhoneOnReset, count ) ) end
    end

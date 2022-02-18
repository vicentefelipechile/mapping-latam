    --[[
        Script: Executioner
        Developer: ted.lua
        Profile: http://steamcommunity.com/id/tedlua/
    ]]

    Executioner = Executioner or {}
    Executioner.Config = Executioner.Config or {}

    Executioner.Config.Placement = {}
    Executioner.Config.Confirmation = {}
    Executioner.Config.Bonus = {}
    Executioner.Config.Phone = {}
    Executioner.Config.Language = {}

    ---------------------------------
    --> Start of Server Settings <---
    ---------------------------------

    Executioner.Config.Developer_Mode = false

    --> Language Support <--
    -- Languages Supported: english, dutch, norwegian, spanish
    Executioner.Config.Language.Choice = 'spanish'

    Executioner.Config.ChatPrefix = '[Executioner] '
    Executioner.Config.PrefixColor = Color( 255, 255, 255 )

    Executioner.Config.Phone_Command = '/solicitudes'
    Executioner.Config.Phone_Save = '/guardar_telefonos'
    Executioner.Config.Reset_Phones = '/reset_telefonos'
    Executioner.Config.Cancel_Hit = '/cancelar_hit'

    Executioner.Config.Hitman_Teams = { -- These are your Hitman teams. Use the name of the job you want as a Hitman (case sensitive)
        [ 'Sicario' ] = true
    }

    Executioner.Config.Banned_Groups = { -- Which groups can not have a hit placed against them?
        [ 'superadmin' ] = false,
        [ 'owner' ] = false
    }

    Executioner.Config.No_Place_Teams = { -- These can still have a hit against them, but they not place hits at all.
        [ 'Policia' ] = true,
        [ 'Grupo Anti-Disturbios' ] = true,
        [ 'Teniente Protección Civil' ] = true
    }

    Executioner.Config.BlackList_Teams = { -- Which teams can not have a hit placed against them? These teams also can't use the Phone.
        [ 'STAFF' ] = true,
        [ 'Alcalde' ] = true,
        --[ 'Mob boss' ] = true
    }

    Executioner.Config.Clean_Ranks = { -- Translates a usergroup into a nicer string for the first interface.
        [ 'superadmin' ] = 'Super Admin',
        [ 'admin' ] = 'Admin',
        [ 'mod+' ] = 'Mod+',
        [ 'mod' ] = 'Mod',
        [ 'modt+' ] = 'Sub Mod+',
        [ 'modt' ] = 'Sub Mod',
        [ 'vip' ] = 'Vip',
        [ 'user' ] = 'Usuario'
    }

    --[[
        Bonus Weapons are removed when the Hitman has attempted the hit.
        You can put anything in here, as long as it's capable of killing someone.
        Dildo Launcher, frying pan, whatever the fuck you want.
    --]]
    Executioner.BonusWeapons = {
        { name = 'Mossberg 590', ent = 'm9k_mossberg590' },
        { name = 'Tec-9', ent = 'm9k_tec9' },
        { name = 'SVT40', ent = 'm9k_svt40' },
        { name = 'Scout', ent = 'bb_scout_alt' },
        { name = 'MP9', ent = 'm9k_mp9' }
    }

    Executioner.Config.BonusChance = 25 -- The chance 1 - 100% that a Hitman is offered a bonus.
    Executioner.Config.BonusMoney = 10000 -- How much money is given on a bonus hit? From a bonus weapon
    Executioner.Config.TaxOnKill = 0 -- What percentage is taken when a hit is completed? 0 to disable.

    Executioner.Config.Max_Hit_Price = 50000 -- The maximum price the customer can place
    Executioner.Config.Min_Hit_Price = 5000 -- The minimum price the customer can place

    Executioner.Config.PhoneEnabled = false -- If this enabled, you may only place hits via the phone.
    Executioner.Config.Enable_Face_To_Face = true -- Can people place hits on a Hitman by pressing 'E'?

    Executioner.Config.EnableDistance = true -- Enable a Distance tracker for the Hitman to see?
    Executioner.Config.EnableHitTime = true -- Enable random time limits the hit must be done in?
    Executioner.Config.EnableHitGeneration = false -- Enable random hits? (Now works for both face to face and phone hits)

    Executioner.Config.EnableUTimeSupport = false -- Enable uTime support?
    Executioner.Config.Min_Play_Time = 4 -- Minimum time until a hit can be placed on them? (In hours)

    Executioner.Config.Hit_Time_Min = 60 -- (Seconds). Default: Start at a minimum of 60 seconds
    Executioner.Config.Hit_Time_Max = 300 --(Seconds). Default: Max of 300 seconds

    Executioner.Config.RangeDistance = 1800 -- The distance before distance turns into ???? (Too close)
    Executioner.Config.HitCooldown = 60 * 5 -- How long must the customer place before placing another Hit?
    Executioner.Config.Grace_Cooldown = 60 * 10 -- How long until a hit can be placed on the same person?
    Executioner.Config.Draw_Info = false -- When close to a Hitman, show that they're a hitman and their status?

    Executioner.Config.Generate_Hit_Intervals = 60 * 15 -- How long for a hit to be placed? In seconds?
    Executioner.Config.Generate_Remove_Time = 60 * 40 -- How long until a hit is removed as nobody has taken it?
    Executioner.Config.Minimum_Players = 6 -- How many people need to be on the server for a random hit to take place?
    -- This number also required a hitman to be on the server, with no active hit.
    --------------------------------
    --> Start of Client Settings <--
    --------------------------------
    --> Interface Settings <--
    Executioner.Config.ResponseTime = 60 -- How long does the Hitman have to reply to a Hit that a customer has directly requested? (Seconds)
    Executioner.Config.BonusTime = 15 -- How long does the Hitman have to accept the Bonus Weapon Offer?
    Executioner.Config.MenuSounds = true -- Do you want there to be sounds in the interfaces?
    Executioner.Config.GlobalAlpha = 255 -- The Alpha of all the interfaces.
    Executioner.Config.Name_Colors = Color( 255, 255, 255 ) -- The color of all the names.
    Executioner.Config.EnableBlur = true -- Enable blur on all of the interfaces?
    Executioner.Config.Component_Colors = { -- All the colors for components. Normal = default look, no hover. Hover = color on hover, text = color of text.
        [ 'button_request' ] = { normal = Color( 22, 22, 22 ), hover = Color( 18, 18, 18 ), text = Color( 255, 255, 255 ) },
        [ 'button_accept' ] = { normal = Color( 46, 200, 113 ), hover = Color( 46, 230, 113 ), text = Color( 255, 255, 255 ) },
        [ 'button_deny' ] = { normal = Color( 170, 32, 25 ), hover = Color( 230, 32, 25 ), text = Color( 255, 255, 255 ) },
        [ 'hit_price_entry' ] = { normal = Color( 22, 22, 22 ), hover = Color( 18, 18, 18 ), text = Color( 255, 255, 255, 200 ) },
        [ 'health_armor_display' ] = { -- This is a bit of a bitch.
            barBackground = Color( 22, 22, 22 ),
            healthBar = Color( 46, 204, 133 ),
            armorBar = Color( 52, 152, 219, 170 ),
            outline = Color( 24, 24, 24 ),
            healthColor = Color( 255, 255, 255 ),
            armorColor = Color( 255, 255, 255 )
        }
    }
    Executioner.Config.GroupConfiguration = { -- Rank colors in the menu.
        [ 'superadmin' ] = Color( 200, 0, 0 ),
        [ 'admin' ] = Color( 155, 89, 182 )
    }
    Executioner.Config.Outline_Colors = Color( 42, 42, 42, 200 ) -- This will change the outline of every grey outline.
    Executioner.Config.Main_Text_Color = Color( 52, 152, 219 )
    ---------------------------------------------
    --> Start of Placement Menu Configuration <--
    ---------------------------------------------
    --> Strings <--
    Executioner.Config.Placement.Main_Title = 'Menu de hits'
    Executioner.Config.Placement.No_Preview = 'No hay previsualizacion disponible!'
    Executioner.Config.Placement.Request_Hit = 'Pedir hit'
    --> Colors <--
    Executioner.Config.Placement.Background = Color( 34, 34, 34, 250 )
    Executioner.Config.Placement.Main_Title_Color = Color( 255, 255, 255 )
    Executioner.Config.Placement.Split_Bar = Color( 42, 42, 42, 240 ) -- The line down the middle of the first screen.
    Executioner.Config.Placement.No_Preview_Color = Color( 230, 32, 25 )
    ---------------------------------------------------------------------
    -- mainColor = the default color in row renders. onSecond = for every set of 2 use this color..
    Executioner.Config.Placement.Row_Hovers = { mainColor = Color( 23, 23, 23 ), onSecond = Color( 20, 20, 20 ) }
    Executioner.Config.Placement.Data_Canvis_Color = Color( 28, 28, 28, 220 )
    ------------------------------------------------
    --> Start of Confirmation Menu Configuration <--
    ------------------------------------------------
    --> Strings <--
    Executioner.Config.Confirmation.Main_Title = 'Menu de confirmacion'
    Executioner.Config.Confirmation.Header_Title = 'Te han pedido que asesines a'
    Executioner.Config.Confirmation.Accept_Hit = 'Aceptar Hit'
    Executioner.Config.Confirmation.Deny_Hit = 'Rechazar Hit'
    --> Colors <--
    Executioner.Config.Confirmation.Background = Color( 30, 30, 30 )
    Executioner.Config.Confirmation.Main_Title_Color = Color( 255, 255, 255 )
    Executioner.Config.Confirmation.Data_Canvis_Color = Color( 28, 28, 28, 220 )
    Executioner.Config.Confirmation.Money_Bar_Color = Color( 20, 20, 20 )
    Executioner.Config.Confirmation.Money_Text_Color = Color( 46, 204, 113 )
    -----------------------------------------
    --> Start of Bonus Menu Configuration <--
    -----------------------------------------
    --> Strings <--
    Executioner.Config.Bonus.Main_Title = 'Oferta de arma de bonificacion'
    Executioner.Config.Bonus.Header = 'Misterio'
    Executioner.Config.Bonus.Description = 'Mata a tu objetivo con esto para obtener una mayor recompensa'
    Executioner.Config.Bonus.Detail = 'Arma entregada temporalmente'
    Executioner.Config.Bonus.Accept_Offer = 'Aceptar Oferta'
    Executioner.Config.Bonus.Deny_Offer = 'Rechazar Offer'
    --> Colors <--
    Executioner.Config.Bonus.Background = Color( 8, 8, 8, 240 )
    Executioner.Config.Bonus.Header_Color = Color( 156, 136, 255 )
    Executioner.Config.Bonus.Description_Color = Color( 255, 255, 255 )
    Executioner.Config.Bonus.Detail_Color = Color( 255, 255, 255 )
    -----------------------------------------
    --> Start of Phone Menu Configuration <--
    -----------------------------------------
    --> Strings <--
    Executioner.Config.Phone.Main_Title = 'Hits activos'
    Executioner.Config.Phone.Text_On_Entity = 'Cabina telefonica'
    Executioner.Config.Phone.Target = 'Objetivo: '
    Executioner.Config.Phone.Customer = 'Cliente: '
    Executioner.Config.Phone.Price = 'Precio: '
    --> Colors <--
    Executioner.Config.Phone.Background = Color( 30, 30, 30 )
    Executioner.Config.Phone.Main_Title_Color = Color( 255, 255, 255 )
    Executioner.Config.Phone.Data_Canvis_Color = Color( 28, 28, 28, 220 )

    -----------------------------------------
    --> Start of Hitman HUD Conifguration <--
    -----------------------------------------
    --> Strings <--
    --> The panel on the right of the screen for Hitmen when they have an active hit <--
    -- Target: inherts from Executioner.Config.Phone.Target --
    Executioner.Config.Occupation = 'Ocupacion: '
    Executioner.Config.Time_Left = 'Tiempo restante: '
    Executioner.Config.Active_Hit = 'Hit activo'
    Executioner.Config.Distance_Text = 'Distancia'
    ----------------------------------------------------------
    Executioner.Config.Background = Color( 60, 60, 60, 220 )
    Executioner.Config.Foreground = Color( 8, 8, 8, 245 )
    Executioner.Config.Main_Title_Color = Color( 255, 255, 255 )
    Executioner.Config.HUD_Outline = Color( 30, 30, 30, 245 )
    --> The text which appears in the middle of the screen <--
    Executioner.Config.Hit_Completed = 'Hit Completado'
    Executioner.Config.Hit_Completed_Color = Color( 255, 255, 255 )
    --> The Text which appears when looking at a Hitman <--
    Executioner.Config.Hitman_Text = 'Asesino a sueldo'
    Executioner.Config.Busy_Text = 'Ocupado'
    Executioner.Config.Request_Hit_Text = 'Pedir hit'
    --> The Green color is taken from the Money Green <--
    -- Executioner.Config.Confirmation.Money_Text_Color -
    -----------------------------------------------------

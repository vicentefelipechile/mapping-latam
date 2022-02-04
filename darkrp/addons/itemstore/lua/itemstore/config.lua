-- The maximum allowable size for stacked items. Set to math.huge for infinite stacks.
-- SOME ITEMS DO NOT OBEY THIS CONFIG OPTION!! Ammo and money are exempt for obvious reasons.
itemstore.config.MaxStack = 10

-- Where to save player data. Values are none, text, mysqloo (recommended) and tmysql4 (deprecated)
itemstore.config.DataProvider = "text"

-- If true, saves the player's inventory every time it's changed.
itemstore.config.SaveOnWrite = true

-- The gamemode to enable support for. Valid values are darkrp and darkrp24.
itemstore.config.GamemodeProvider = "darkrp"

-- Prefix for chat commands
itemstore.config.ChatCommandPrefix = "/"

-- The jobs that have access to an inventory. If this is empty, all teams have access.
-- Admins will still have access to their inventory though.
-- Names must be exact.
-- example: itemstore.config.LimitToTeams = { TEAM_CITIZEN, TEAM_COP }
itemstore.config.LimitToJobs = {}

-- The interval at which the inventory saves all players automatically, in seconds.
itemstore.config.SaveInterval = 180

-- The language of the inventory.
-- There are two languages by default, en (English), fr (French), de (German) and ru (Russian)
itemstore.config.Language = "en"

-- Enable quick inventory viewing by holding the context menu key, default C.
itemstore.config.ContextInventory = true

-- If context inventory is enabled, this defines where it appears on the player's screen.
-- Valid values are "top", "bottom", "left", "right", "topleft", "topright", "bottomleft" and "bottomright"
itemstore.config.ContextInventoryPosition = "bottom"

-- Allow the use of the /invholster command
itemstore.config.EnableInvholster = true

-- Force player to holster all of their ammo as well as their gun when they use /invholster, ala DarkRP.
itemstore.config.InvholsterTakesAmmo = false

-- Split ammo on spawned_weapons instead of giving all ammo at once when used
itemstore.config.SplitWeaponAmmo = true

-- Force player to retrieve their items from the bank before being able to use them.
itemstore.config.PickupsGotoBank = false

-- The distance that the player is able to "reach" when picking up items.
itemstore.config.PickupDistance = 100

-- The distance that items will drop at relative to the player
itemstore.config.DropDistance = 100

-- The key to use in combination with +use (E) to pick up items.
-- A list of keys for this option is here: http://wiki.garrysmod.com/page/Enums/IN
-- Set this to -1 to disable the key combo.
itemstore.config.PickupKey = -1

-- Whether or not trading should be enabled. Set this to false to disable.
itemstore.config.TradingEnabled = true

-- How long in seconds the player needs to wait after a trade to trade again
itemstore.config.TradeCooldown = 60

-- How close in hammer units two players need to be to trade. 0 means infinite.
itemstore.config.TradeDistance = 0

-- Whether or not the player should drop their inventory on death.
itemstore.config.DeathLoot = false

-- How long in seconds the player's dropped inventory should exist for.
itemstore.config.DeathLootTimeout = 60 * 5

-- Makes boxes breakable if enough damage is inflicted
itemstore.config.BoxBreakable = false

-- Amount of health for boxes to have
itemstore.config.BoxHealth = 100

-- Should users be able to pick up other users' entities
itemstore.config.IgnoreOwner = true

-- Fixes an old duplication exploit. This shouldn't be required anymore but is here in case it is still somehow possible.
itemstore.config.AntiDupe = true

-- Migrates text data from 2.0 to the current format.
-- This is experimental and may not function correctly. Please be careful if you decide to use this.
-- !!IMPORTANT!!
-- PLEASE make backups of your data -- this process is DESTRUCTIVE and will delete old data files 
-- and overwrite any inventory data that players currently have.
itemstore.config.MigrateOldData = false

-- Set to true to use the new container UI including search bar
itemstore.config.UseNewUI = false

-- Delay loading the player's inventory by this amount of seconds.
-- Use this if your ranks load from MySQL or other asynchronous sources (ie they won't be available right as the player initializes)
itemstore.config.LoadDelay = 1

-- Inventory sizes according to rank.
-- The format for this table is:
-- [ "<rank>" ] = { <width>, <height>, <pages> }
-- If a player's rank is not contained within this table, it defaults to default.
-- DO NOT REMOVE DEFAULT! If you remove it, there will be errors!
itemstore.config.InventorySizes = {
	[ "default" ] = { 4, 1, 1 },
	--[ "superadmin" ] = { 10, 5, 1 },
	--[ "admin" ] = { 10, 3, 1 },
}

-- Same as above, for banks. Same format. DON'T REMOVE DEFAULT!
itemstore.config.BankSizes = {
	["default"] = { 4, 1, 1 },
	["vip"] = { 8, 2, 2},
	["mod+"] = { 8, 2, 1},
	["mod"] = { 4, 2, 1},
	["admin"] = { 4, 2, 1},
	["superadmin"] = { 4, 2, 1},
}

-- Whether or not to print ItemStore's log to the server console. Set this to true to enable.
itemstore.config.PrintLog = false

-- Log when players move their items around. Will create a lot of log noise that would not be very useful. Set this to true to enable.
itemstore.config.VerboseLogging = false

-- Whether or not to enable bLogs support. Having this enabled if you don't have bLogs shouldn't create any problems, but just in case it does, set this to false.
itemstore.config.bLogs = true

-- The skin to use. Preinstalled skins are "flat" and "classic".
itemstore.config.Skin = "flat"

-- The various colours of the VGUI in R, G, B, A 0-255 format.
-- Not available when using the flat skin
itemstore.config.Colours = {
	Slot = Color( 0, 0, 0, 150 ),
	HoveredSlot = Color( 255, 255, 255, 150 ),
	Title = Color( 255, 255, 255 ),

	TitleBackground = Color( 0, 0, 0, 200 ),
	Upper = Color( 100, 100, 100, 100 ),
	Lower = Color( 30, 30, 30, 150 ),
	InnerBorder = Color( 0, 0, 0, 0 ),
	OuterBorder = Color( 0, 0, 0, 200 )
}

-- The style of the item highlight. Options are "old", "border", "corner", subtle" and "full"
-- This is deprecated and will probably be removed in a later version
itemstore.config.HighlightStyle = "subtle"

-- Highlight colours for the various types of items. 
itemstore.config.HighlightColours = {
	Weapons = Color( 231, 76, 60 ),
	Ammo = Color( 241, 196, 15 ),
	Shipments = Color( 230, 126, 34 ),
	Factories = Color( 52, 152, 219 ), -- printers, gunlabs, microwaves, etc
	Consumables = Color( 26, 188, 156 ), -- drugs, food
	Money = Color( 46, 204, 113 ),
	Other = Color( 236, 240, 241 ), -- never delete this!
}

-- A table of disabled items. Set any value in this table to true to disallow picking up the item.
itemstore.config.DisabledItems = {
	drug = false,
	drug_lab = false,
	food = false,
	gunlab = false,
	microwave = false,
	money_printer = true,
	spawned_food = false,
	spawned_shipment = true,
	spawned_weapon = false,
	spawned_money = true,

	durgz_alcohol = false,
	durgz_aspirin = false,
	durgz_cigarette = false,
	durgz_cocaine = false,
	durgz_heroine = false,
	durgz_lsd = false,
	durgz_mushroom = false,
	durgz_pcp = false,
	durgz_weed = false,

    ["fadmin_jail"] = true,
    ["meteor"] = true,
    ["door"] = true,
    ["func_"] = true,
    ["player"] = true,
    ["beam"] = true,
    ["worldspawn"] = true,
    ["env_"] = true,
    ["path_"] = true,
    ["prop_physics"] = true,
    ["money_printer"] = true,
    ["gunlab"] = true,
    ["prop_dynamic"] = true,
    ["prop_vehicle_prisoner_pod"] = true,
    ["keypad_wire"] = true,
    ["gmod_button"] = true,
    ["gmod_rtcameraprop"] = true,
    ["gmod_cameraprop"] = true,
    ["gmod_dynamite"] = true,
    ["gmod_thruster"] = true,
    ["gmod_light"] = true,
    ["gmod_lamp"] = true,
    ["gmod_emitter"] = true,

    ["weapon_m4a1_beast"] = true,
    ["weapon_deagle_bornbeast"] = true,
    ["weapon_ak47_beast"] = true,
    ["bb_glock_cp"] = true,
    ["bb_m4a1_cp"] = true,
    ["riot_shield"] = true,
    ["heavy_shield"] = true,
    ["deployable_shield"] = true,
    ["cityworker_config"] = true,
    ["cityworker_pliers"] = true,
    ["cityworker_shovel"] = true,
    ["cityworker_wrench"] = true,
    ["g_handcuffed"] = true,
    ["g_handcuffs"] = true,
    ["g_handcuffs_lockpick"] = true,

    ["riot_shield"] = true,
    ["weapon_m42_cp"] = true,
    ["bb_glock_cp"] = true,
    ["weapon_r_cuffed"] = true,
    ["weapon_r_handcuffs"] = true,
    ["bm2_bitminer_1"] = true,
    ["bm2_bitminer_2"] = true,
    ["bm2_bitminer_rack"] = true,
    ["bm2_bitminer_server"] = true,
    ["bm2_bitminer_extention_lead"] = true,
    ["bm2_bitminer_fuel"] = true,
    ["bm2_bitminer_generator"] = true,
    ["bm2_bitminer_plug_1"] = true,
    ["bm2_bitminer_power_lead"] = true,
    ["bfarm_plant"] = true,
    ["bfarm_pot_01"] = true,
    ["bfarm_pot_04"] = true,
    ["bfarm_seed_carrot"] = true,
    ["bfarm_seed_lettuce"] = true,
    ["bfarm_seed_potato"] = true,
    ["bfarm_shipping_crate"] = true,
    ["bfarm_soil_bag"] = true,
    ["bfarm_water_can"] = true,
    ["ent_chess_board"] = true,
    ["ent_draughts_board"] = true,
    ["zpiz_animbase"] = true,
    ["zpiz_customertable"] = true,
    ["zpiz_fridge"] = true,
    ["zpiz_ingredient"] = true,
    ["zpiz_opensign"] = true,
    ["zpiz_oven"] = true,
    ["zpiz_pizza"] = true,
    ["zpiz_plate"] = true,
    ["bs_dshield"] = true,
    ["bs_hshield"] = true,
    ["bs_rshield"] = true,
    ["bs_shield"] = true,
    ["sent_streamradio_darkrp"] = true,
    ["radio_microphone_darkp"] = true,
    ["radio_receiver_darkp"] = true,
    ["bm2_generator_vip"] = true,

    ["eml_buyer"] = true,
    ["eml_buyer_text"] = true,
    ["eml_ciodine"] = true,
    ["eml_gas"] = true,
    ["eml_iodine"] = true,
    ["eml_jar"] = true,
    ["eml_macid"] = true,
    ["eml_meth"] = true,
    ["eml_pot"] = true,
    ["eml_redp"] = true,
    ["eml_spot"] = true,
    ["eml_stove"] = true,
    ["eml_sulfur"] = true,
    ["eml_water"] = true,
}

-- Custom items. Defining these will allow server owners to make certain
-- entities pickupable... but may not work 100%. If this is the case, you will probably
-- need to code the item definition yourself.
-- Format for each entry is:
-- <entity class> = { "<name>", "<description>", <stackable (optional)> }
itemstore.config.CustomItems = {
	sent_ball = { "Bouncy Ball", "A bouncy ball!", true },
    spawned_weapon = { "Item", "Es lo que ves", false }
}

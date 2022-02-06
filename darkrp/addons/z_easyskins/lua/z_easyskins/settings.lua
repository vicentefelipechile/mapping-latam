-- [[ CREATED BY ZOMBIE EXTINGUISHER ]]

/*
	The settings in this file should not be touched since they will have no effect on the actual loaded settings.
*/

// Settings
SH_EASYSKINS.SETTINGS = {}
SH_EASYSKINS.SETTINGS.ADMINS = {}
SH_EASYSKINS.SETTINGS.DONATORS = {}
SH_EASYSKINS.SETTINGS.NPCPOSITIONS = {}
SH_EASYSKINS.SETTINGS.MENUKEY = "F6"
SH_EASYSKINS.SETTINGS.ADMINREMOTESHOP = true
SH_EASYSKINS.SETTINGS.DONATORREMOTESHOP = false
SH_EASYSKINS.SETTINGS.PLAYERREMOTESHOP = false
SH_EASYSKINS.SETTINGS.SHOPMODEL = "models/vortigaunt_slave.mdl"
SH_EASYSKINS.SETTINGS.CURRENCYSYMBOL = "$"
SH_EASYSKINS.SETTINGS.STEAMGROUPLINK = ""
SH_EASYSKINS.SETTINGS.STEAMGROUPDISCOUNT = 0.1 -- price X STEAMGROUPDISCOUNT = discount
SH_EASYSKINS.SETTINGS.TAG = ""
SH_EASYSKINS.SETTINGS.TAGDISCOUNT = 0.1 -- price X TAGDISCOUNT = discount
SH_EASYSKINS.SETTINGS.SELLRATE = 0.7 -- price X SELLRATE = sellprice
SH_EASYSKINS.SETTINGS.WORLDMODELSKINS = true -- see the skins from other players
SH_EASYSKINS.SETTINGS.ENABLENOTIFICATIONS = true -- buy skin notifications ?
SH_EASYSKINS.SETTINGS.ADDSKINTOWEAPONAME = true -- weapon | skin name
SH_EASYSKINS.SETTINGS.BASESKINMATERIAL = "" -- material
SH_EASYSKINS.SETTINGS.SHOWSHOPCATEGORIES = true
SH_EASYSKINS.SETTINGS.ALLOWSKINGIFTING = true

// Various
SH_EASYSKINS.VAR = {}
SH_EASYSKINS.VAR.UNCATEGORIZED = "Uncategorized" -- DO NOT CHANGE
SH_EASYSKINS.VAR.DEFAULTPRICE = 1000 -- default price when creating a new skin
SH_EASYSKINS.VAR.MAXPRICE = 999999999 -- DO NOT CHANGE -> max price DNumberWang can handle
SH_EASYSKINS.VAR.MAP = game.GetMap()
SH_EASYSKINS.VAR.LATESTVERSION = true
SH_EASYSKINS.VAR.ADMINMODS = { -- for referencing only
	["ULX"] = true,
	["XAdmin"] = true,
	["ServerGuard"] = true,
	["SAM"] = true
}

// Colors
SH_EASYSKINS.COL = {}
SH_EASYSKINS.COL.RED = Color(231, 76, 60)
SH_EASYSKINS.COL.GREEN = Color(46, 204, 113)
SH_EASYSKINS.COL.BLUE = Color(52, 152, 219)
SH_EASYSKINS.COL.GOLD = Color(255 ,215 ,0 )
SH_EASYSKINS.COL.LIGHTBLACK = Color(25, 25, 25)
SH_EASYSKINS.COL.LIGHTBLACK_150 = ColorAlpha(SH_EASYSKINS.COL.LIGHTBLACK, 150)
SH_EASYSKINS.COL.LIGHTBLACK_200 = ColorAlpha(SH_EASYSKINS.COL.LIGHTBLACK, 200)
SH_EASYSKINS.COL.GREY = Color(50, 50, 50)
SH_EASYSKINS.COL.GREY_150 = ColorAlpha(SH_EASYSKINS.COL.GREY, 150)
SH_EASYSKINS.COL.LIGHTGREY = Color(150, 150, 150)
SH_EASYSKINS.COL.DARKGREY = Color(40, 40, 40)
SH_EASYSKINS.COL.DARKGREY_150 = ColorAlpha(SH_EASYSKINS.COL.DARKGREY, 150)
SH_EASYSKINS.COL.SILVER = Color(192, 192, 192)
SH_EASYSKINS.COL.PURPLEHAZE = Color(224, 86, 253)
SH_EASYSKINS.COL.STEAM = SH_EASYSKINS.COL.BLUE
SH_EASYSKINS.COL.NAMETAG = Color(76, 209, 55)

// Shop Models
SH_EASYSKINS.SHOPMODELS = {
	["Alyx"] = "models/alyx.mdl",
	["Barney"] = "models/barney.mdl",
	["Breen"] = "models/breen.mdl",
	["Citizen (F)"] = "models/humans/group01/female_01.mdl",
	["Citizen (M)"] = "models/humans/group01/male_01.mdl",
	["Eli"] = "models/eli.mdl",
	["Gman"] = "models/gman_high.mdl",
	["Kleiner"] = "models/kleiner.mdl",
	["Metro Police"] = "models/police.mdl",
	["Monk"] = "models/monk.mdl",
	["Mossman"] = "models/mossman.mdl",
	["Odessa"] ="models/odessa.mdl",
	["Rebel (F)"] = "models/humans/group03/female_01.mdl",
	["Rebel (M)"] = "models/humans/group03/male_01.mdl",
	["Vorigaunt"] = "models/vortigaunt_slave.mdl",
	["Zombie"] = "models/zombie/classic.mdl",
	["Zombie Fast"] = "models/zombie/fast.mdl",
	["Zombie Poison"] = "models/zombie/poison.mdl"
}

// Currency Symbols
SH_EASYSKINS.CURRENCYSYMBOLS = {
	"$",
	"€",
	"£",
	"¥",
	"₽",
	"zł",
	"₺",
	"₴"
}

// Keybinds
SH_EASYSKINS.KEYBINDS = {
	[KEY_F1] = "F1",
	[KEY_F2] = "F2",
	[KEY_F3] = "F3",
	[KEY_F4] = "F4",
	[KEY_F5] = "F5",
	[KEY_F6] = "F6",
}

// Weapon Models

-- https://wiki.garrysmod.com/page/Common_Weapon_Models
-- classes with non retrievable models + missing the function DrawWorldModel
SH_EASYSKINS.NONLINKEDMODELS = {

	-- hl2
	["weapon_357"] = {ViewModel = "models/weapons/c_357.mdl", WorldModel = "models/weapons/w_357.mdl"},
	["weapon_ar2"] = {ViewModel = "models/weapons/c_irifle.mdl", WorldModel = "models/weapons/w_irifle.mdl"},
	["weapon_bugbait"] = {ViewModel = "models/weapons/c_bugbait.mdl", WorldModel = "models/weapons/w_bugbait.mdl"},
	["weapon_crossbow"] = {ViewModel = "models/weapons/c_crossbow.mdl", WorldModel = "models/weapons/w_crossbow.mdl"},
	["weapon_crowbar"] = {ViewModel = "models/weapons/c_crowbar.mdl", WorldModel = "models/weapons/w_crowbar.mdl"},
	["weapon_frag"] = {ViewModel = "models/weapons/c_grenade.mdl", WorldModel = "models/weapons/w_grenade.mdl"},
	["weapon_physcannon"] = {ViewModel = "models/weapons/c_physcannon.mdl", WorldModel = "models/weapons/w_Physics.mdl"},
	["weapon_pistol"] = {ViewModel = "models/weapons/c_pistol.mdl", WorldModel = "models/weapons/w_pistol.mdl"},
	["weapon_rpg"] = {ViewModel = "models/weapons/c_rpg.mdl", WorldModel = "models/weapons/w_rocket_launcher.mdl"},
	["weapon_shotgun"] = {ViewModel = "models/weapons/c_shotgun.mdl", WorldModel = "models/weapons/w_shotgun.mdl"},
	["weapon_slam"] = {ViewModel = "models/weapons/c_slam.mdl", WorldModel = "models/weapons/w_slam.mdl"},
	["weapon_smg1"] = {ViewModel = "models/weapons/c_smg1.mdl", WorldModel = "models/weapons/w_smg1.mdl"},
	["weapon_stunstick"] = {ViewModel = "models/weapons/c_stunstick.mdl", WorldModel = "models/weapons/w_stunbaton.mdl"},
	
	-- hl1
	["weapon_357_hl1"] = {ViewModel = "models/v_357.mdl", WorldModel = "models/weapons/w_357_hls.mdl"},
	["weapon_crossbow_hl1"] = {ViewModel = "models/v_crossbow.mdl", WorldModel = "models/weapons/w_crossbow_hls.mdl"},
	["weapon_crowbar_hl1"] = {ViewModel = "models/v_crowbar.mdl", WorldModel = "models/weapons/w_crowbar_hls.mdl"},
	["weapon_glock_hl1"] = {ViewModel = "models/v_9mmhandgun.mdl", WorldModel = "models/weapons/w_9mmhandgun.mdl"},
	["weapon_egon"] = {ViewModel = "models/v_egon.mdl", WorldModel = "models/weapons/w_egon_hls.mdl"},
	["weapon_handgrenade"] = {ViewModel = "models/v_grenade.mdl", WorldModel = "models/weapons/w_grenade_hls.mdl"},
	["weapon_hornetgun"] = {ViewModel = "models/v_hgun.mdl", WorldModel = "models/weapons/w_hgun_hls.mdl"},
	["weapon_mp5_hl1"] = {ViewModel = "models/v_9mmAR.mdl", WorldModel = "models/weapons/w_9mmar.mdl"},
	["weapon_rpg_hl1"] = {ViewModel = "models/v_rpg.mdl", WorldModel = "models/weapons/w_rpg_hls.mdl"},
	["weapon_satchel"] = {ViewModel = "models/v_satchel.mdl", WorldModel = "models/weapons/w_satchel_hls.mdl"},
	["weapon_snark"] = {ViewModel = "models/v_squeak.mdl", WorldModel = "models/weapons/w_squeak_hls.mdl"},
	["weapon_shotgun_hl1"] = {ViewModel = "models/v_shotgun.mdl", WorldModel = "models/weapons/w_shotgun_hls.mdl"},
	["weapon_gauss"] = {ViewModel = "models/v_gauss.mdl", WorldModel = "models/weapons/w_gauss_hls.mdl"},
	["weapon_tripmine"] = {ViewModel = "models/v_tripmine.mdl", WorldModel = "models/weapons/w_tripmine_hls.mdl"},
	
	-- gmod
	["weapon_physgun"] = {ViewModel = "models/weapons/c_superphyscannon.mdl", WorldModel = "models/weapons/w_Physics.mdl"}
	
}

// Special Materials
SH_EASYSKINS.SPECIALMATERIALS = {
	["Dayofdead"] = true,
	["Diamond"] = true,
	["Elite_ghost"] = true,
	["Gold"] = true,
	["Greenscreen"] = true,
	["Weed"] = true,
	["Wireframe"] = true,
	["Tf2_gold"] = true,
	["Tf2_ice"] = true,
	["Chrome"] = true
}

// Extra Custom materials
SH_EASYSKINS.EXTRAMATERIALS = {
	["z_easyskins/extra/tf2_gold.vmt"] = {
		icon = "z_easyskins/extra/tf2_gold_icon.vmt"
	},
	["z_easyskins/extra/tf2_ice.vmt"] = {
		icon = "z_easyskins/extra/tf2_ice_icon.vmt"
	},
	["z_easyskins/extra/chrome.vmt"] = {
		icon = "z_easyskins/extra/chrome_icon.vmt"
	}
}

// Extra Default Materials
SH_EASYSKINS.EXTRADEFAULTMATERIALS = {
	["models/shiny.vmt"] = "Shiny White",
	["models/wireframe.vmt"] = "Wireframe",
	["models/spawn_effect2.vmt"] = "Spawn Effect",
	["models/props_combine/com_shield001a.vmt"] = "Combine Shield",
	["models/props_lab/Tank_Glass001.vmt"] = "Jelly",
	["models/props_combine/stasisshield_sheet.vmt"] = "Stasis",
	["effects/combinedisplay001b.vmt"] = "Cyber Attack",
	["effects/combinedisplay002b.vmt"] = "Cyber Hack"
}

// Extra Weapons in the selection list
SH_EASYSKINS.EXTRASELECTABLEWEAPONS = {
	["RetroBoombox"] = { Category = "Retro Boombox", ClassName = "retroboombox_base", PrintName = "Retro Boombox", Spawnable = false, ForceInList = true }
}

// Weapon Blacklist
SH_EASYSKINS.WEPBLACKLIST = {

	-- dark RP
	["keys"] = true,
	["pocket"] = true,
	["arrest_stick"] = true,
	["unarrest_stick"] = true,
	["weaponchecker"] = true,

	-- santos RP
	["weapon_srphands"] = true,
	["weapon_phone"] = true,
	["weapon_idcard_weapon"] = true,
	["weapon_idcard"] = true,
	["weapon_ems_clipboard"] = true
	
}

// Material Blacklist
SH_EASYSKINS.MATBLACKLIST = {
	
	["v_hands"] = true,
	
	-- gmod
	["screen"] = true,
	["toolgun2"] = true,
	["toolgun3"] = true,
	["___error"] = true,
	
	-- hl2
	["handle"] = true,
	["blackseal"] = true,
	["head_uvw"] = true,
	["v_irifle_core"] = true,
	["texture4"] = true,
	["texture5"] = true,
	["smg_crosshair"] = true,
	["bugbait_inside"] = true,
	["string"] = true,
	
	-- hl1
	["lasersight"] = true,
	["glove_handpak"] = true,
	["gloved_knuckle"] = true,
	["rubberglovechrome"] = true,
	["gloved_sleeve"] = true,
	["pythoncylrear2"] = true,
	["pythonhandle"] = true,
	["bulletchrome"] = true,
	["grip"] = true,
	["stock"] = true,
	["lenschrome"] = true,
	["clipside"] = true,
	["ladder"] = true,
	["xbow_sleeve"] = true,
	["chrome"] = true,
	["gclipinside"] = true,
	["gclip"] = true,
	["top"] = true,
	["collarsides_work"] = true,
	["ringchrome"] = true,
	["controls_work"] = true,
	["ring_attach_work"] = true,
	["ring_work"] = true,
	["grenchrome"] = true,
	["spoont"] = true,
	["hgun_bottom1"] = true,
	["hgun_horn1"] = true,
	["glback"] = true,
	["handleback"] = true,
	["hk_chrome"] = true,
	["silencerback"] = true,
	["buttstockrear"] = true,
	["player_chrome2"] = true,
	["player_forearm1"] = true,
	["player_cuff1"] = true,
	["sighttop"] = true,
	["rocket"] = true,
	["rocketmotor"] = true,
	["join"] = true,
	["m6cl"] = true,
	["m10cl"] = true,
	["m11cl"] = true,
	["m9cl"] = true,
	["m8cl"] = true,
	["m7cl"] = true,
	["m4cl"] = true,
	["m12cl"] = true,
	["sboxback"] = true,
	["m13cl"] = true,
	["m16cl"] = true,
	["m18cl"] = true,
	["m3cl"] = true,
	["expl"] = true,
	["bucklechrome"] = true,
	["radioside"] = true,
	["strap"] = true,
	["sqk_mouth1"] = true,
	["chrome1"] = true,
	["sqk_eye1"] = true,
	["shell"] = true,
	["barrel_chrome"] = true,
	["hand_forearm1"] = true,
	["spinnerbright"] = true,
	["nuspinner"] = true,
	["nuspinner2"] = true,
	["spinner_rear"] = true,
	["barrelchrome"] = true,
	["bottle"] = true,
	["wire_chrome"] = true,
	["battery"] = true,
	["batteryend"] = true,
	["batterybox"] = true,
	["light"] = true,

	-- stalker
	["lenta"] = true,
	
	-- swep construction kit
	["v_hand_sheet"] = true,
	
	-- tfa
	["lightning_chamber_glass_c"] = true,
	["lightning_chamber_main_c"] = true,
	["vacuum_tube_c"] = true,
	["vacuum_tube_c0"] = true,
	["~-gzombie_teleporter_glow_c"] = true,
	["weapon_red_dot_c"] = true,
	["battery_c"] = true,
	["~-gmtl_t5_weapon_zom_sniper_lens_c"] = true,
	["zombie_sniper_glow_c"] = true,
	["freezegunammo_d"] = true,
	["~-gmtl_t6_wpn_zmb_raygun2_col3"] = true,
	["mtl_t6_wpn_zmb_raygun2_glow2"] = true,
	["_-gzombie_teleporter_glow_c"] = true,
	["~-gt5_weapon_human_gun_glass_c"] = true,
	["~-gt5_weapon_human_gun_arm_c"] = true,
	["_-gmtl_t6_attach_optic_acog_lens_col"] = true,
	["_-gt5_weapon_shrinkray_dragon_c"] = true,
	["coyotee_d"] = true,
	["flashlight_d"] = true,
	["lens"] = true,
	["bullet_d"] = true,

	-- cw 2.0
	["sleeve_diff"] = true,
	["sleeve_diffuse"] = true,
	["t_phoenix"] = true,
	["new light1"] = true,
	["null"] = true,
	["rt"] = true,
	["fullstock"] = true,
	["foregrip"] = true,
	["30roundmag_col"] = true,
	["extendedmag_col"] = true,
	["b1rail"] = true,
	["speedloader"] = true,
	["wa2000_scope"] = true,
	["wa2000_lense"] = true,	
	["elcan_d"] = true,
	["lens_d"] = true,
	["strap_d"] = true,
	["sightsdown_ao"] = true,
	["sightsup_ao"] = true,
	["reflectmap"] = true,
	["clip"] = true,
	["misc"] = true,
	["weapon_rounds_dm"] = true,
	["scope"] = true,
	["mag"] = true,
	["sil"] = true,
	["rpk"] = true,
	["v_g3a3_stock"] = true,
	["l96_scope"] = true,

	-- fa:s 2.0
	["furniture"] = true,
	["bizon"] = true,
	["rpk_parts"] = true,
	["sitex"] = true,
	["sleeve"] = true,
	["akscopemount"] = true,
	["picatinny"] = true,
	["wristwatch"] = true,
	["watch_glass"] = true,
	["watch_hand_min"] = true,
	["watch_hand_hr"] = true,
	["watch_hand_sec"] = true,
	["watch_dig_sec"] = true,
	["watch_dig_min"] = true,
	["hand"] = true,
	["lens_envsolid"] = true,
	["vignette"] = true,
	["scope_leo"] = true,
	["lens_special"] = true,
	["leupold_mk4"] = true,
	["w_leupold"] = true,
	["w_lens"] = true,
	["w_lens_env"] = true,
	["w_harris"] = true,
	["nomex"] = true,
	["cartridges"] = true,
	["m24_parts"] = true,
	["w_m24_parts"] = true,
	["eotech_lens_env_transparent"] = true,
	["eotech_reticle"] = true,
	["pso1"] = true,
	["scope_pso"] = true,
	["eotech553"] = true,
	["aimpoint_reticle"] = true,
	["lens_env_transparent"] = true,
	["aimpointcompm4s"] = true,
	["suppressor_pbs1"] = true,
	["suppressor_pbs5"] = true,
	["stockbits"] = true,
	["suppressor_tx8"] = true,
	["scopemount"] = true,
	["suppressor_gemtech"] = true,
	["tritium"] = true,
	["harris_bipod"] = true,
	["suppressor_surefire"] = true,
	["harris_bipod"] = true,
	["suppressor_surefire"] = true,
	["handguard"] = true,
	["hk_rail"] = true,
	["ragingbull_rubber"] = true,
	["ragingbullmount"] = true,
	["sako_rk95_foregrip"] = true,
	["sako_rk95_parts"] = true,
	["sks_magazine"] = true,
	["sks_receiver"] = true,
	
	-- css alt
	["scopebrain"] = true,
	["stuff"] = true,
	["boxmag"] = true,
	["receiveraddons"] = true,
	["upper"] = true,
	["sights"] = true,
	["bullet"] = true,
	["magazine"] = true,
	
	-- vapes
	["metal"] = true,
	["glass"] = true,
	
	-- ballistic shields
	["hshield_custom"] = true,
	["hshield_window"] = true,
	["dshield_sides"] = true,
	["rshield_glass"] = true,
	
	-- tf2 weapon pack
	["engineer_handr_red"] = true,
	["engineer_handl"] = true,
	["engineer_red"] = true,
	["engineer_handr_red"] = true,
	["engineer_handl"] = true,
	["engineer_red"] = true,
	["medic_red"] = true,
	["medic_hands_red"] = true,
	["scout_hands"] = true,
	["demoman_red"] = true,
	["demoman_hands"] = true,
	["pyro_hands_red"] = true,
	["pyro_red"] = true,
	["spy_hands_red"] = true,
	["hvyweapon_hands"] = true,
	["soldier_sleeves_red"] = true,
	["soldier_hands"] = true,
	["v_rocket"] = true,
	["sniper_red"] = true,
	["sniper_handl_red"] = true,
	["v_sniperrifle_scope"] = true,
	
	-- retro boombox
	["retro_boombox_vol_light_09"] = true,
	["retro_boombox_vol_light_08"] = true,
	["retro_boombox_vol_light_07"] = true,
	["retro_boombox_vol_light_06"] = true,
	["retro_boombox_vol_light_05"] = true,
	["retro_boombox_vol_light_04"] = true,
	["retro_boombox_vol_light_03"] = true,
	["retro_boombox_vol_light_02"] = true,
	["retro_boombox_vol_light_01"] = true,
	["retro_boombox_bar_02"] = true,
	["retro_boombox_bar_01"] = true,
	["retro_boombox_lights_main"] = true,
	["retro_boombox_glass"] = true,
	["retro_boombox_light_tube"] = true,
	["retro_boombox_speaker_main"] = true,
	["retro_boombox_metalic"] = true,
	
	-- custom: 76561198348715045

}
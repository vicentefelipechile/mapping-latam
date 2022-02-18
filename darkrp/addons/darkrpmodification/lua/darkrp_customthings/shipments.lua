--[[---------------------------------------------------------------------------
DarkRP custom shipments and guns
---------------------------------------------------------------------------

This file contains your custom shipments and guns.
This file should also contain shipments and guns from DarkRP that you edited.

Note: If you want to edit a default DarkRP shipment, first disable it in darkrp_config/disabled_defaults.lua
    Once you've done that, copy and paste the shipment to this file and edit it.

The default shipments and guns can be found here:
https://github.com/FPtje/DarkRP/blob/master/gamemode/config/addentities.lua

For examples and explanation please visit this wiki page:
https://darkrp.miraheze.org/wiki/DarkRP:CustomShipmentFields


Add shipments and guns under the following line:
---------------------------------------------------------------------------]]

only_vips       = function(ply) return ply:IsUserGroup("vip") or ply:IsSuperAdmin() end
only_vips_adms  = function(ply) return ply:IsUserGroup("vip") or ply:IsUserGroup("mod") or ply:IsUserGroup("mod+") or ply:IsAdmin() or ply:IsSuperAdmin() end
only_adms       = function(ply) return ply:IsUserGroup("mod") or ply:IsUserGroup("mod+") or ply:IsAdmin() or ply:IsSuperAdmin() end

--------------------
-- Custom Weapons --
--------------------

-- Armas M9k
------Armero normal--------

---pistolas

DarkRP.createShipment("bren ten", {
    model = "models/weapons/bren_ten/w_pist_p228.mdl",
    entity = "m9k_bren_ten",
    price = 4500,
    amount = 10,
    separate = false,
    noship = false,
    allowed = {TEAM_GUN, TEAM_STAFF},
    category = "Pistolas",
})
DarkRP.createShipment("Colt1911", {
    model = "models/weapons/colts/w_pist_fiveseven.mdl",
    entity = "m9k_colt1911",
    price = 7500,
    amount = 10,
    separate = false,
    noship = false,
    allowed = {TEAM_GUN, TEAM_STAFF},
    category = "Pistolas",
})
DarkRP.createShipment("HK usp", {
    model = "models/weapons/3_pist_usp.mdl",
    entity = "m9k_usp",
    price = 6700,
    amount = 10,
    separate = false,
    noship = false,
    allowed = {TEAM_GUN, TEAM_STAFF},
    category = "Pistolas",
})
DarkRP.createShipment("model Omega 500", {
    model = "models/weapons/3_pist_usp.mdl",
    entity = "m9k_usp",
    price = 500000,
    amount = 5,
    separate = false,
    noship = false,
    allowed = {TEAM_GUN, TEAM_STAFF},
    category = "Pistolas",
})


-------Sub-Fusiles-----------

DarkRP.createShipment("HK MP5", {
    model = "models/weapons/w_hk_mp5.mdl",
    entity = "m9k_mp5",
    price = 15000,
    amount = 10,
    separate = false,
    noship = false,
    allowed = {TEAM_GUN, TEAM_STAFF},
    category = "Sub-fusil",
})
DarkRP.createShipment("UPM45", {
    model = "models/weapons/w_hk_ump45.mdl",
    entity = "m9k_ump45",
    price = 14500,
    amount = 10,
    separate = false,
    noship = false,
    allowed = {TEAM_GUN, TEAM_STAFF},
    category = "Sub-fusil",
})
DarkRP.createShipment("kac pdw", {
    model = "models/weapons/w_kac_pdw.mdl",
    entity = "m9k_kac_pdw",
    price = 16000,
    amount = 10,
    separate = false,
    noship = false,
    allowed = {TEAM_GUN, TEAM_STAFF},
    category = "Sub-fusil",
})
DarkRP.createShipment("mp9", {
    model = "models/weapons/w_brugger_thomet_mp9.mdl",
    entity = "m9k_mp9",
    price = 17500,
    amount = 10,
    separate = false,
    noship = false,
    allowed = {TEAM_GUN, TEAM_STAFF},
    category = "Sub-fusil",
})

-------Rifles-------

DarkRP.createShipment("Winchester", {
    model = "models/weapons/w_winchester_1873.mdl",
    entity = "m9k_winchester73",
    price = 25000,
    amount = 10,
    separate = false,
    noship = false,
    allowed = {TEAM_GUN, TEAM_GUN_CLANDESTINO, TEAM_STAFF},
    category = "Rifle Francotirador",
})
DarkRP.createShipment("ACR", {
    model = "models/weapons/w_masada_acr.mdl",
    entity = "m9k_acr",
    price = 23500,
    amount = 10,
    separate = false,
    noship = false,
    allowed = {TEAM_GUN, TEAM_STAFF},
    category = "Rifles",
})
DarkRP.createShipment("AS Val", {
    model = "models/weapons/w_dmg_vally.mdl",
    entity = "m9k_val",
    price = 24500,
    amount = 10,
    separate = false,
    noship = false,
    allowed = {TEAM_GUN, TEAM_STAFF},
    category = "Rifles",
})
DarkRP.createShipment("m14", {
    model = "models/weapons/w_snip_m14sp.mdl",
    entity = "m9k_m14sp",
    price = 22500,
    amount = 10,
    separate = false,
    noship = false,
    allowed = {TEAM_GUN, TEAM_STAFF},
    category = "Rifles",
})

-----francontiradores-----

DarkRP.createShipment("M24", {
    model = "models/weapons/w_snip_m24_6.mdl",
    entity = "m9k_m24",
    price = 28000,
    amount = 10,
    separate = false,
    noship = false,
    allowed = {TEAM_GUN, TEAM_STAFF},
    category = "Rifle Francotirador",
})
DarkRP.createShipment("ALT Scout", {
    model = "models/weapons/3_snip_scout.mdl",
    entity = "bb_scout_alt",
    price = 26000,
    amount = 10,
    separate = false,
    noship = false,
    allowed = {TEAM_GUN, TEAM_STAFF},
    category = "Rifle Francotirador",
})

-----escopetas-----

DarkRP.createShipment("remington870", {
    model = "models/weapons/w_remington_870_tact.mdl",
    entity = "m9k_remington870",
    price = 26000,
    amount = 10,
    separate = false,
    noship = false,
    allowed = {TEAM_GUN, TEAM_STAFF},
    category = "Escopetas",
})
DarkRP.createShipment("Ithacam37", {
    model = "models/weapons/w_ithaca_m37.mdl",
    entity = "m9k_ithacam37",
    price = 27000,
    amount = 10,
    separate = false,
    noship = false,
    allowed = {TEAM_GUN, TEAM_STAFF},
    category = "Escopetas",
})

-----armero clandestino-----

-----pistolas-----

DarkRP.createShipment("MINI Guardian", {
    model = "models/weapons/guardian/w_pist_p228.mdl",
    entity = "m9k_guardian",
    price = 4500,
    amount = 10,
    separate = false,
    noship = false,
    allowed = {TEAM_GUN_CLANDESTINO, TEAM_STAFF},
    category = "Pistolas",
})
DarkRP.createShipment("model627", {
    model = "models/weapons/w_sw_model_627.mdl",
    entity = "m9k_model627",
    price = 6500,
    amount = 10,
    separate = false,
    noship = false,
    allowed = {TEAM_GUN_CLANDESTINO, TEAM_STAFF},
    category = "Pistolas",
})
DarkRP.createShipment("Mr96", {
    model = "models/weapons/mr96/w_pist_deagle.mdl",
    entity = "m9k_mr96",
    price = 6000,
    amount = 10,
    separate = false,
    noship = false,
    allowed = {TEAM_GUN_CLANDESTINO, TEAM_STAFF},
    category = "Pistolas",
})
DarkRP.createShipment("ATL P228", {
    model = "models/weapons/3_pist_p228.mdl",
    entity = "bb_p228_alt",
    price = 30200,
    amount = 10,
    separate = false,
    noship = false,
    allowed = {TEAM_GUN_CLANDESTINO, TEAM_STAFF},
    category = "Pistolas",
})
DarkRP.createShipment("Luger", {
    model = "models/weapons/w_luger_p08.mdl",
    entity = "m9k_luger",
    price = 8500,
    amount = 10,
    separate = false,
    noship = false,
    allowed = {TEAM_GUN_CLANDESTINO, TEAM_STAFF},
    category = "Pistolas",
})
DarkRP.createShipment("ruger", {
    model = "models/weapons/ruger/w_pist_fiveseven.mdl",
    entity = "m9k_ruger",
    price = 12000,
    amount = 10,
    separate = false,
    noship = false,
    allowed = {TEAM_GUN_CLANDESTINO, TEAM_STAFF},
    category = "Pistolas",
})

-----Sub-Fusiles-----

DarkRP.createShipment("bizonp19", {
    model = "models/weapons/w_pp19_bizon.mdl",
    entity = "m9k_bizonp19",
    price = 24000,
    amount = 10,
    separate = false,
    noship = false,
    allowed = {TEAM_GUN, TEAM_STAFF},
    category = "Sub-fusil",
})
DarkRP.createShipment("Thompson", {
    model = "models/weapons/us_thompson.mdl",
    entity = "m9k_thompson",
    price = 26000,
    amount = 10,
    separate = false,
    noship = false,
    allowed = {TEAM_GUN, TEAM_STAFF},
    category = "Sub-fusil",
})
DarkRP.createShipment("Tec 9", {
    model = "models/weapons/w_intratec_tec9.mdl",
    entity = "m9k_tec9",
    price = 27000,
    amount = 10,
    separate = false,
    noship = false,
    allowed = {TEAM_GUN, TEAM_STAFF},
    category = "Sub-fusil",
})
DarkRP.createShipment("Mac10", {
    model = "models/weapons/3_smg_mac10.mdl",
    entity = "bb_mac10_alt",
    price = 24000,
    amount = 10,
    separate = false,
    noship = false,
    allowed = {TEAM_GUN, TEAM_STAFF},
    category = "Sub-fusil",
})

-----Rifles-----

DarkRP.createShipment("AK47", {
    model = "models/weapons/w_ak47_m9k.mdl",
    entity = "m9k_ak47",
    price = 31000,
    amount = 10,
    separate = false,
    noship = false,
    allowed = {TEAM_GUN_CLANDESTINO, TEAM_STAFF},
    category = "Rifles",
})
DarkRP.createShipment("AK74", {
    model = "models/weapons/w_tct_ak47.mdl",
    entity = "m9k_ak74",
    price = 36000,
    amount = 10,
    separate = false,
    noship = false,
    allowed = {TEAM_GUN_CLANDESTINO, TEAM_STAFF},
    category = "Rifles",
})
DarkRP.createShipment("Fal", {
    model = "models/weapons/w_fn_fal.mdl",
    entity = "m9k_fal",
    price = 38000,
    amount = 10,
    separate = false,
    noship = false,
    allowed = {TEAM_GUN_CLANDESTINO, TEAM_STAFF},
    category = "Rifles",
})
DarkRP.createShipment("Vikhr", {
    model = "models/weapons/w_dmg_vikhr.mdl",
    entity = "m9k_vikhr",
    price = 33000,
    amount = 10,
    separate = false,
    noship = false,
    allowed = {TEAM_GUN_CLANDESTINO, TEAM_STAFF},
    category = "Rifles",
})
DarkRP.createShipment("Galil", {
    model = "models/weapons/3_rif_galil.mdl",
    entity = "bb_galil_alt",
    price = 30000,
    amount = 10,
    separate = false,
    noship = false,
    allowed = {TEAM_GUN_CLANDESTINO, TEAM_STAFF},
    category = "Rifles",
})

-----Rifles Franco Tirador-----

DarkRP.createShipment("Svt 40", {
    model = "models/weapons/w_svt_40.mdl",
    entity = "m9k_svt40",
    price = 39500,
    amount = 10,
    separate = false,
    noship = false,
    allowed = {TEAM_GUN_CLANDESTINO, TEAM_STAFF},
    category = "Rifle Francotirador",
})
DarkRP.createShipment("Barret m82", {
    model = "models/weapons/w_barret_m82.mdl",
    entity = "m9k_barret_m82",
    price = 48000,
    amount = 5,
    separate = false,
    noship = false,
    allowed = {TEAM_GUN_CLANDESTINO, TEAM_STAFF},
    category = "Rifle Francotirador",
})
DarkRP.createShipment("Contender", {
    model = "models/weapons/w_g2_contender.mdl",
    entity = "m9k_contender",
    price = 42000,
    amount = 10,
    separate = false,
    noship = false,
    allowed = {TEAM_GUN_CLANDESTINO, TEAM_STAFF},
    category = "Rifle Francotirador",
})

-----Escopestas-----

DarkRP.createShipment("Browning auto", {
    model = "models/weapons/w_browning_auto.mdl",
    entity = "m9k_browningauto5",
    price = 38000,
    amount = 10,
    separate = false,
    noship = false,
    allowed = {TEAM_GUN_CLANDESTINO, TEAM_STAFF},
    category = "Escopetas",
})
DarkRP.createShipment("Winchester 1897", {
    model = "models/weapons/w_winchester_1897_trench.mdl",
    entity = "m9k_1897winchester",
    price = 90000,
    amount = 5,
    separate = false,
    noship = false,
    allowed = {TEAM_GUN_CLANDESTINO, TEAM_STAFF},
    category = "Escopetas",
})
DarkRP.createShipment("Spas12", {
    model = "models/weapons/w_spas_12.mdl",
    entity = "m9k_spas12",
    price = 70000,
    amount = 5,
    separate = false,
    noship = false,
    allowed = {TEAM_GUN_CLANDESTINO, TEAM_STAFF},
    category = "Escopetas",
})

-- Otros

DarkRP.createShipment("Ganzúas", {
	model = "models/craphead_scripts/armory_robbery2/w_lockpick.mdl",
	entity = "armory_lockpick",
	price = 5000,
	amount = 10,
	seperate = true,
	pricesep = 500,
	noship = false,
	allowed = {TEAM_GUN_CLANDESTINO},
})
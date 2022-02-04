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

-- Armas CSS M9k

DarkRP.createShipment("AK-47", {
    model = "models/weapons/3_rif_ak47.mdl",
    entity = "bb_ak47_alt",
    price = 6000,
    amount = 10,
    separate = false,
    noship = false,
    allowed = {TEAM_GUN, TEAM_GUN_CLANDESTINO, TEAM_STAFF},
    category = "Rifles",
})

DarkRP.createShipment("M4A1", {
    model = "models/weapons/3_rif_m4a1.mdl",
    entity = "bb_m4a1_alt",
    price = 6000,
    amount = 10,
    separate = false,
    noship = false,
    allowed = {TEAM_GUN, TEAM_GUN_CLANDESTINO, TEAM_STAFF},
    category = "Rifles",
})

DarkRP.createShipment("AWP", {
    model = "models/weapons/3_snip_awp.mdl",
    entity = "bb_awp_alt",
    price = 10000,
    amount = 10,
    separate = false,
    noship = false,
    allowed = {TEAM_GUN, TEAM_GUN_CLANDESTINO, TEAM_STAFF},
    category = "Rifle Francotirador",
})

DarkRP.createShipment("Winchester", {
    model = "models/weapons/w_winchester_1873.mdl",
    entity = "m9k_winchester73",
    price = 12000,
    amount = 10,
    separate = false,
    noship = false,
    allowed = {TEAM_GUN, TEAM_GUN_CLANDESTINO, TEAM_STAFF},
    category = "Rifle Francotirador",
})

DarkRP.createShipment("Desert Eagle", {
    model = "models/weapons/3_pist_deagle.mdl",
    entity = "bb_deagle_alt",
    price = 4700,
    amount = 10,
    separate = false,
    noship = false,
    allowed = {TEAM_GUN, TEAM_GUN_CLANDESTINO, TEAM_STAFF},
    category = "Pistolas",
})

DarkRP.createShipment("Famas", {
    model = "models/weapons/3_rif_famas.mdl",
    entity = "bb_famas_alt",
    price = 6800,
    amount = 10,
    separate = false,
    noship = false,
    allowed = {TEAM_GUN, TEAM_GUN_CLANDESTINO, TEAM_STAFF},
    category = "Rifles",
})

DarkRP.createShipment("Five Seven", {
    model = "models/weapons/3_pist_fiveseven.mdl",
    entity = "bb_fiveseven_alt",
    price = 3450,
    amount = 10,
    separate = false,
    noship = false,
    allowed = {TEAM_GUN, TEAM_GUN_CLANDESTINO, TEAM_STAFF},
    category = "Pistolas",
})

DarkRP.createShipment("P90", {
    model = "models/weapons/3_smg_p90.mdl",
    entity = "bb_p90_alt",
    price = 9100,
    amount = 10,
    separate = false,
    noship = false,
    allowed = {TEAM_GUN, TEAM_GUN_CLANDESTINO, TEAM_STAFF},
    category = "Sub-fusil",
})

DarkRP.createShipment("G3SG1", {
    model = "models/weapons/3_snip_g3sg1.mdl",
    entity = "bb_g3sg1_alt",
    price = 13000,
    amount = 10,
    separate = false,
    noship = false,
    allowed = {TEAM_GUN, TEAM_GUN_CLANDESTINO, TEAM_STAFF},
    category = "Rifle Francotirador",
})

DarkRP.createShipment("Galil", {
    model = "models/weapons/3_rif_galil.mdl",
    entity = "bb_galil_alt",
    price = 8700,
    amount = 10,
    separate = false,
    noship = false,
    allowed = {TEAM_GUN, TEAM_GUN_CLANDESTINO, TEAM_STAFF},
    category = "Rifles",
})

DarkRP.createShipment("Glock", {
    model = "models/weapons/3_pist_glock18.mdl",
    entity = "bb_glock_alt",
    price = 4800,
    amount = 10,
    separate = false,
    noship = false,
    allowed = {TEAM_GUN, TEAM_GUN_CLANDESTINO, TEAM_STAFF},
    category = "Pistolas",
})

DarkRP.createShipment("HK UMP45", {
    model = "models/weapons/3_smg_ump45.mdl",
    entity = "bb_ump45_alt",
    price = 7400,
    amount = 10,
    separate = false,
    noship = false,
    allowed = {TEAM_GUN, TEAM_GUN_CLANDESTINO, TEAM_STAFF},
    category = "Sub-fusil",
})

DarkRP.createShipment("HK USP", {
    model = "models/weapons/3_pist_usp.mdl",
    entity = "bb_usp_alt",
    price = 4550,
    amount = 10,
    separate = false,
    noship = false,
    allowed = {TEAM_GUN, TEAM_GUN_CLANDESTINO, TEAM_STAFF},
    category = "Pistolas",
})

DarkRP.createShipment("Cuchillo", {
    model = "models/weapons/3_knife_t.mdl",
    entity = "bb_css_knife_alt",
    price = 3000,
    amount = 10,
    separate = false,
    noship = false,
    allowed = {TEAM_GUN, TEAM_GUN_CLANDESTINO, TEAM_STAFF},
    category = "Cuchillos",
})

DarkRP.createShipment("M249.", {
    model = "models/weapons/3_mach_m249para.mdl",
    entity = "bb_m249_alt",
    price = 14000,
    amount = 4,
    separate = false,
    noship = false,
    allowed = {TEAM_GUN, TEAM_GUN_CLANDESTINO, TEAM_STAFF},
    category = "Submetralladoras",
    customCheck = function(ply) return ply:IsUserGroup("vip") or ply:IsUserGroup("mod+") or ply:IsAdmin() or ply:IsSuperAdmin() end,
    customCheckFailMsg = "Necesitas ser vip para comprar este producto."
})

DarkRP.createShipment("M3", {
    model = "models/weapons/3_shot_m3super90.mdl",
    entity = "bb_m3_alt",
    price = 7000,
    amount = 10,
    separate = false,
    noship = false,
    allowed = {TEAM_GUN, TEAM_GUN_CLANDESTINO, TEAM_STAFF},
    category = "Escopetas",
})

DarkRP.createShipment("ACR", {
    model = "models/weapons/w_masada_acr.mdl",
    entity = "m9k_acr",
    price = 8300,
    amount = 10,
    separate = false,
    noship = false,
    allowed = {TEAM_GUN, TEAM_GUN_CLANDESTINO, TEAM_STAFF},
    category = "Rifles",
})

DarkRP.createShipment("MAC10", {
    model = "models/weapons/3_smg_mac10.mdl",
    entity = "bb_mac10_alt",
    price = 4500,
    amount = 10,
    separate = false,
    noship = false,
    allowed = {TEAM_GUN, TEAM_GUN_CLANDESTINO, TEAM_STAFF},
    category = "Sub-fusil",
})

DarkRP.createShipment("AUG A3", {
    model = "models/weapons/w_auga3.mdl",
    entity = "m9k_auga3",
    price = 10300,
    amount = 10,
    separate = false,
    noship = false,
    allowed = {TEAM_GUN, TEAM_GUN_CLANDESTINO, TEAM_STAFF},
    category = "Rifles",
})

DarkRP.createShipment("M14", {
    model = "models/weapons/w_snip_m14sp.mdl",
    entity = "m9k_m14sp",
    price = 11000,
    amount = 10,
    separate = false,
    noship = false,
    allowed = {TEAM_GUN, TEAM_GUN_CLANDESTINO, TEAM_STAFF},
    category = "Rifles",
})

DarkRP.createShipment("Colt Scoped", {
    model = "models/weapons/colts/w_pist_fiveseven.mdl",
    entity = "m9k_coltscoped",
    price = 4500,
    amount = 10,
    separate = false,
    noship = false,
    allowed = {TEAM_GUN, TEAM_GUN_CLANDESTINO, TEAM_STAFF},
    category = "Pistolas",
})

DarkRP.createShipment("Ruger", {
    model = "models/weapons/ruger/w_pist_fiveseven.mdl",
    entity = "m9k_ruger",
    price = 5100,
    amount = 10,
    separate = false,
    noship = false,
    allowed = {TEAM_GUN, TEAM_GUN_CLANDESTINO, TEAM_STAFF},
    category = "Pistolas",
})

DarkRP.createShipment("Magnunson 4000", {
    model = "models/weapons/w_sw_model_500.mdl",
    entity = "m9k_model500",
    price = 200000,
    amount = 3,
    separate = false,
    noship = false,
    allowed = {TEAM_GUN, TEAM_GUN_CLANDESTINO, TEAM_STAFF},
    category = "Pistolas",
})

DarkRP.createShipment("Glock (VIP)", {
    model = "models/weapons/w_dmg_glock.mdl",
    entity = "m9k_glock18_extclip",
    price = 20000,
    amount = 10,
    separate = false,
    noship = false,
    allowed = {TEAM_GUN, TEAM_GUN_CLANDESTINO, TEAM_STAFF},
    category = "Pistolas",
    customCheck = function(ply) return ply:IsUserGroup("vip") or ply:IsUserGroup("mod+") or ply:IsAdmin() or ply:IsSuperAdmin() end,
    customCheckFailMsg = "Necesitas ser vip para comprar este producto."
})

DarkRP.createShipment("Winchester Doom", {
    model = "models/weapons/w_winchester_1897_trench.mdl",
    entity = "m9k_1897winchester",
    price = 70000,
    amount = 3,
    separate = false,
    noship = false,
    allowed = {TEAM_GUN, TEAM_GUN_CLANDESTINO, TEAM_STAFF},
    category = "Escopetas",
})

DarkRP.createShipment("Spas 12", {
    model = "models/weapons/w_spas_12.mdl",
    entity = "m9k_spas12",
    price = 25000,
    amount = 10,
    separate = false,
    noship = false,
    allowed = {TEAM_GUN, TEAM_GUN_CLANDESTINO, TEAM_STAFF},
    category = "Escopetas",
})

DarkRP.createShipment("Jack Hammer", {
    model = "models/weapons/w_pancor_jackhammer.mdl",
    entity = "m9k_jackhammer",
    price = 21000,
    amount = 10,
    separate = false,
    noship = false,
    allowed = {TEAM_GUN, TEAM_GUN_CLANDESTINO, TEAM_STAFF},
    category = "Escopetas",
})

DarkRP.createShipment("Tompson", {
    model = "models/weapons/w_tommy_gun.mdl",
    entity = "m9k_thompson",
    price = 21000,
    amount = 10,
    separate = false,
    noship = false,
    allowed = {TEAM_GUN_CLANDESTINO, TEAM_STAFF},
    category = "Sub-fusil",
})

-- Otros

DarkRP.createShipment("Chaleco Antibalas", {
    model = "models/combine_vests/militaryvest.mdl",
    entity = "chaleco",
    price = 6000,
    amount = 4,
    separate = false,
    pricesep = nil,
    noship = false,
    allowed = {TEAM_GUN, TEAM_GUN_CLANDESTINO, TEAM_STAFF},
    category = "Other",
})

DarkRP.createShipment("Chaleco Antibalas - VIP", {
    model = "models/combine_vests/militaryvest_vip.mdl",
    entity = "chaleco_vip",
    price = 10000,
    amount = 4,
    separate = false,
    pricesep = nil,
    noship = false,
    allowed = {TEAM_GUN, TEAM_GUN_CLANDESTINO, TEAM_STAFF},
    category = "Other",
    customCheck = function(ply) return ply:IsUserGroup("vip") or ply:IsUserGroup("mod+") or ply:IsUserGroup("admin+") or ply:IsSuperAdmin() end,
})

DarkRP.createEntity("Radio de Musica", {
    ent = "sent_streamradio_darkrp",
    model = "models/props/cs_office/tv_plasma.mdl",
    price = 500,
    max = 2,
    cmd = "comprarradiomusica",
    allowed = {TEAM_RADIO, TEAM_STAFF},
    category = "Locutor de Radio"
})

DarkRP.createEntity("Radio", {
    ent = "radio_receiver_darkp",
    model = "models/props_lab/citizenradio.mdl",
    price = 100,
    max = 8,
    cmd = "comprarradio",
    allowed = {TEAM_RADIO, TEAM_STAFF},
    category = "Locutor de Radio"
})

DarkRP.createEntity("Microfono", {
    ent = "radio_microphone_darkp",
    model = "models/mic.mdl",
    price = 100,
    max = 1,
    cmd = "comprarmicrofono",
    allowed = {TEAM_RADIO, TEAM_STAFF},
    category = "Locutor de Radio"
})

DarkRP.createEntity("Televisión", {
    ent = "mediaplayer_tv_darkrp",
    model = "models/gmod_tower/suitetv_large.mdl",
    price = 5000,
    max = 4,
    cmd = "comprartelevisor",
    allowed = {TEAM_RADIO, TEAM_STAFF},
    category = "Locutor de Radio"
})
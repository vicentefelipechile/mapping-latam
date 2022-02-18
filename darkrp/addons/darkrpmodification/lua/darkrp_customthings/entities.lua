--[[---------------------------------------------------------------------------
DarkRP custom entities
---------------------------------------------------------------------------

This file contains your custom entities.
This file should also contain entities from DarkRP that you edited.

Note: If you want to edit a default DarkRP entity, first disable it in darkrp_config/disabled_defaults.lua
    Once you've done that, copy and paste the entity to this file and edit it.

The default entities can be found here:
https://github.com/FPtje/DarkRP/blob/master/gamemode/config/addentities.lua

For examples and explanation please visit this wiki page:
https://darkrp.miraheze.org/wiki/DarkRP:CustomEntityFields

Add entities under the following line:
---------------------------------------------------------------------------]]

-- Cocina de Meta --

DarkRP.createEntity("Cocina", {
    ent = "eml_stove",
    model = "models/props_c17/furnitureStove001a.mdl",
    price = 500,
    max = 2,
    cmd = "comprarcocinailegal",
    allowed = {TEAM_FARMEROILEGAL, TEAM_STAFF},
    category = "Cocina Meta"
})

DarkRP.createEntity("Olla Normal", {
    ent = "eml_pot",
    model = "models/props_c17/metalPot001a.mdl",
    price = 100,
    max = 2,
    cmd = "comprarollailegal",
    allowed = {TEAM_FARMEROILEGAL, TEAM_STAFF},
    category = "Cocina Meta"
})

DarkRP.createEntity("Olla Especial", {
    ent = "eml_spot",
    model = "models/props_c17/metalPot001a.mdl",
    price = 100,
    max = 2,
    cmd = "comprarollaespecialilegal",
    allowed = {TEAM_FARMEROILEGAL, TEAM_STAFF},
    category = "Cocina Meta"
})

DarkRP.createEntity("Agua", {
    ent = "eml_water",
    model = "models/props_junk/garbage_plasticbottle003a.mdl",
    price = 30,
    max = 5,
    cmd = "compraraguailegal",
    allowed = {TEAM_FARMEROILEGAL, TEAM_STAFF},
    category = "Cocina Meta"
})

DarkRP.createEntity("Sulfuro Liquido", {
    ent = "eml_sulfur",
    model = "models/props_lab/jar01b.mdl",
    price = 50,
    max = 5,
    cmd = "comprarsulfuroilegal",
    allowed = {TEAM_FARMEROILEGAL, TEAM_STAFF},
    category = "Cocina Meta"
})

DarkRP.createEntity("Acido Muriatico", {
    ent = "eml_macid",
    model = "models/props_lab/jar01b.mdl",
    price = 70,
    max = 5,
    cmd = "compraracidoilegal",
    allowed = {TEAM_FARMEROILEGAL, TEAM_STAFF},
    category = "Cocina Meta"
})

DarkRP.createEntity("Jarra", {
    ent = "eml_jar",
    model = "models/props_lab/jar01b.mdl",
    price = 80,
    max = 2,
    cmd = "comprarjarrailegal",
    allowed = {TEAM_FARMEROILEGAL, TEAM_STAFF},
    category = "Cocina Meta"
})

DarkRP.createEntity("Yodo Liquido", {
    ent = "eml_iodine",
    model = "models/props_lab/jar01b.mdl",
    price = 80,
    max = 5,
    cmd = "compraryodoilegal",
    allowed = {TEAM_FARMEROILEGAL, TEAM_STAFF},
    category = "Cocina Meta"
})

DarkRP.createEntity("Gas", {
    ent = "eml_gas",
    model = "models/props_c17/canister01a.mdl",
    price = 100,
    max = 2,
    cmd = "comprargasilegal",
    allowed = {TEAM_FARMEROILEGAL, TEAM_STAFF},
    category = "Cocina Meta"
})


-- Armas VIPs

DarkRP.createEntity("Deagle - VIP", {
    ent = "weapon_deagle_bornbeast",
    model = "models/cf/w_deagle_beast.mdl",
    price = 12000,
    max = 1,
    cmd = "comprardeaglevip",
    category = "Cocina Meta"
    customCheck = function(ply) return ply:IsUserGroup("vip") or ply:IsUserGroup("mod+") or ply:IsUserGroup("modt+") or ply:IsAdmin() end,
})

DarkRP.createEntity("M4A1 - VIP", {
    ent = "weapon_m4a1_beast",
    model = "models/cf/w_m4a1_beast.mdl",
    price = 24000,
    max = 1,
    cmd = "comparm4a1vip",
    category = "Cocina Meta"
    customCheck = function(ply) return ply:IsUserGroup("vip") or ply:IsUserGroup("mod+") or ply:IsUserGroup("modt+") or ply:IsAdmin() end,
})

DarkRP.createEntity("AK47 - VIP", {
    ent = "weapon_ak47_beast",
    model = "models/cf/w_ak47_beast.mdl",
    price = 24000,
    max = 1,
    cmd = "comprarak47vip",
    category = "Cocina Meta"
    customCheck = function(ply) return ply:IsUserGroup("vip") or ply:IsUserGroup("mod+") or ply:IsUserGroup("modt+") or ply:IsAdmin() end,
})


-- Jobs

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
    customCheck = function(ply) return ply:IsUserGroup("vip") or ply:IsUserGroup("mod+") or ply:IsUserGroup("modt+") or ply:IsAdmin() end,
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
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

DarkRP.createEntity("Cocina", {
    ent = "eml_stove",
    model = "models/props_c17/furnitureStove001a.mdl",
    price = 500,
    max = 1,
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
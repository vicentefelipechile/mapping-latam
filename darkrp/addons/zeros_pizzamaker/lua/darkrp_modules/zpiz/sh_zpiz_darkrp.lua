TEAM_ZPIZ_CHEF = DarkRP.createJob("Pizzero", {
    color = Color(0, 128, 255, 255),
    model = {
        "models/kuhnya/barinov.mdl",
        "models/fearless/chef1.mdl",
        "models/fearless/chef2.mdl",
        "models/dannio/noahg/gordonramsay.mdl"
    },
    description = "Pizzero que haces pizzas\n\n- Tus pizzas no curan gente.\n- Puedes crear locales para vender pizzas.\n- Compra mesas para atender a los NPCs.\n- Te puedes comer los ingredientes.",
    weapons = {},
    command = "pizzero",
    max = 4,
    salary = GAMEMODE.Config.normalsalary * 4,
    admin = 0,
    vote = false,
    category = "Citizens",
    hasLicense = false
})

DarkRP.createCategory{
    name = "Pizzero",
    categorises = "entities",
    startExpanded = true,
    color = Color(255, 107, 0, 255),
    canSee = function(ply) return true end,
    sortOrder = 104
}

DarkRP.createEntity("Horno", {
    ent = "zpiz_oven",
    model = "models/zerochain/props_pizza/zpizmak_oven.mdl",
    price = 250,
    max = 3,
    cmd = "buyzpiz_PizzaOven",
    allowed = TEAM_ZPIZ_CHEF,
    category = "Pizzero"
})

DarkRP.createEntity("Refrigerador", {
    ent = "zpiz_fridge",
    model = "models/props_c17/FurnitureFridge001a.mdl",
    price = 100,
    max = 1,
    cmd = "buyzpiz_fridge",
    allowed = TEAM_ZPIZ_CHEF,
    category = "Pizzero"
})

DarkRP.createEntity("Mesa", {
    ent = "zpiz_customertable",
    model = "models/props_c17/FurnitureTable001a.mdl",
    price = 200,
    max = 3,
    cmd = "buyzpiz_customertable",
    allowed = TEAM_ZPIZ_CHEF,
    category = "Pizzero"
})

DarkRP.createEntity("Letrero", {
    ent = "zpiz_opensign",
    model = "models/props_trainstation/TrackSign02.mdl",
    price = 50,
    max = 1,
    cmd = "buyzpiz_opensign",
    allowed = TEAM_ZPIZ_CHEF,
    category = "Pizzero"
})

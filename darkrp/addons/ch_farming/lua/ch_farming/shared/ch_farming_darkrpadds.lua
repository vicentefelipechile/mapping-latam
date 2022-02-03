function CH_Farming_DarkRPAdds()
	
	-- Add farmer job
	TEAM_FARMER = DarkRP.createJob( "Farmero", {
		color = Color( 249, 141, 66, 255 ),
		model = {
			"models/humans/groupap/mapert_02.mdl",
			"models/humans/groupap/mapert_04.mdl",
			"models/humans/groupap/mapert_06.mdl",
			"models/humans/groupap/mapert_08.mdl",
			},
		description = "Eres un Farmero\n\n- Tienes una pala para plantar cultivos\n- Puedes comprar herramientas para farmear\n- Puedes comprar una casa con pasto para plantar tus cultivos",
		weapons = { "ch_farming_shovel", "ch_farming_weeding_tool" },
		command = "farmer",
		max = 4,
		salary = 75 * 3,
		admin = 0,
		vote = false,
		hasLicense = false,
    	category = "Citizens"
	} )
	
	--[[
		Add farming entities
	--]]
	-- Categories
	DarkRP.createCategory{
		name = "Cultivos",
		categorises = "entities",
		startExpanded = false,
		color = Color( 255, 128, 0, 255 ),
		canSee = function( ply ) return true end,
		sortOrder = 70,
	}
	
	DarkRP.createCategory{
		name = "Cultivos",
		categorises = "shipments",
		startExpanded = false,
		color = Color( 255, 128, 0, 255 ),
		canSee = function( ply ) return true end,
		sortOrder = 70,
	}
	
	-- Entities
	DarkRP.createEntity("Caja", {
        ent = "ch_farming_crate",
        model = "models/craphead_scripts/ch_farming/utility/crate.mdl",
        price = 250,
        max = 5,
		category = "Cultivos",
		allowed = {TEAM_FARMER, TEAM_STAFF},
        cmd = "buycropscrate",
    })
	
	DarkRP.createEntity("Semillas de Maiz", {
        ent = "ch_farming_seed_corn",
        model = "models/craphead_scripts/ch_farming/seeds/seeds_package.mdl",
        price = 150,
        max = 5,
		category = "Cultivos",
		allowed = {TEAM_FARMER, TEAM_STAFF},
        cmd = "buycornseeds",
    })
	
	DarkRP.createEntity("Semillas de Lechuga", {
        ent = "ch_farming_seed_lettuce",
        model = "models/craphead_scripts/ch_farming/seeds/seeds_package.mdl",
        price = 150,
        max = 5,
		category = "Cultivos",
		allowed = {TEAM_FARMER, TEAM_STAFF},
        cmd = "buylettuce",
    })
	
	DarkRP.createEntity("Semillas de Papas", {
        ent = "ch_farming_seed_pepper",
        model = "models/craphead_scripts/ch_farming/seeds/seeds_package.mdl",
        price = 150,
        max = 5,
		category = "Cultivos",
		allowed = {TEAM_FARMER, TEAM_STAFF},
        cmd = "buypepperseeds",
    })
	
	DarkRP.createEntity("Semillas de Tomates", {
        ent = "ch_farming_seed_tomato",
        model = "models/craphead_scripts/ch_farming/seeds/seeds_package.mdl",
        price = 150,
        max = 5,
		category = "Cultivos",
		allowed = {TEAM_FARMER, TEAM_STAFF},
        cmd = "buytomatoseeds",
    })
	
	DarkRP.createEntity("Semillas de Trigo", {
        ent = "ch_farming_seed_wheat",
        model = "models/craphead_scripts/ch_farming/seeds/seeds_package.mdl",
        price = 150,
        max = 5,
		category = "Cultivos",
		allowed = {TEAM_FARMER, TEAM_STAFF},
        cmd = "buywheatseeds",
    })
	
	
	DarkRP.createEntity("Lampara", {
        ent = "ch_farming_plant_lamp",
        model = "models/craphead_scripts/ch_farming/utility/lamp.mdl",
        price = 3000,
        max = 5,
		category = "Cultivos",
		allowed = {TEAM_FARMER, TEAM_STAFF},
        cmd = "buyplantlamp",
    })
	
	DarkRP.createEntity("Saco de plantas", {
        ent = "ch_farming_plant_sack",
        model = "models/craphead_scripts/ch_farming/utility/sack.mdl",
        price = 300,
        max = 5,
		category = "Cultivos",
		allowed = {TEAM_FARMER, TEAM_STAFF},
        cmd = "buyplantsack",
    })
	
	DarkRP.createEntity("Batería de Lámpara", {
        ent = "ch_farming_util_battery",
        model = "models/craphead_scripts/ch_farming/utility/battery.mdl",
        price = 500,
        max = 5,
		category = "Cultivos",
		allowed = {TEAM_FARMER, TEAM_STAFF},
        cmd = "buylampbattery",
    })
	
	DarkRP.createEntity("Tierra de Calidad", {
        ent = "ch_farming_util_dirt",
        model = "models/craphead_scripts/ch_farming/utility/dirtbag.mdl",
        price = 250,
        max = 5,
		category = "Cultivos",
		allowed = {TEAM_FARMER, TEAM_STAFF},
        cmd = "buyqualitysoil",
    })
	
	-- Weapons
	/*
	DarkRP.createShipment("Herramienta de Deshierbe", {
		model = "models/craphead_scripts/ch_farming/weapons/w_weedingtool.mdl",
		entity = "ch_farming_weeding_tool",
		price = 5000,
		amount = 10,
		separate = true,
		pricesep = 600,
		noship = false,
		allowed = {TEAM_CITIZEN, TEAM_FARMER, TEAM_SOMETHING, TEAM_ADMIN},
		category = "Cultivos",
	})
	
	DarkRP.createShipment("Shovel", {
		model = "models/craphead_scripts/ch_farming/weapons/w_shovel.mdl",
		entity = "ch_farming_shovel",
		price = 5000,
		amount = 10,
		separate = true,
		pricesep = 600,
		noship = false,
		allowed = {TEAM_CITIZEN, TEAM_FARMER, TEAM_SOMETHING, TEAM_ADMIN},
		category = "Cultivos",
	})
	*/
	
	DarkRP.createShipment("Regadera", {
		model = "models/craphead_scripts/ch_farming/weapons/w_wateringcan.mdl",
		entity = "ch_farming_water_can",
		price = 5000,
		amount = 10,
		separate = true,
		pricesep = 600,
		noship = false,
		allowed = {TEAM_FARMER, TEAM_STAFF},
		category = "Cultivos",
	})
end
hook.Add( "loadCustomDarkRPItems", "CH_Farming_DarkRPAdds", CH_Farming_DarkRPAdds )
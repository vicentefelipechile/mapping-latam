-- Add all categories and DarkRP entities here automatically.

function SH_COCAINE_DarkRPAdds()
	-- Category
	DarkRP.createCategory{
		name = "Cocina de Coca",
		categorises = "entities",
		startExpanded = true,
		color = Color(0, 107, 0, 255),
		canSee = function(ply) return true end,
		sortOrder = 80,
	}

	-- Entities
	DarkRP.createEntity("Agua", {
        ent = "cocaine_water",
        model = "models/craphead_scripts/the_cocaine_factory/utility/water.mdl",
        price = 20000,
        max = 2,
		category = "Cocina de Coca",
        cmd = "buywater",
	allowed = TEAM_FARMEROCOCA
    })

    DarkRP.createEntity("Cocina", {
        ent = "cocaine_stove",
        model = "models/craphead_scripts/the_cocaine_factory/stove/gas_stove.mdl",
        price = 50000,
        max = 1,
		category = "Cocina de Coca",
        cmd = "buystove",
	allowed = TEAM_FARMEROCOCA
    })

    DarkRP.createEntity("Olla", {
        ent = "cocaine_cooking_pot",
        model = "models/craphead_scripts/the_cocaine_factory/utility/pot.mdl",
        price = 5000,
        max = 8,
		category = "Cocina de Coca",
        cmd = "buypot",
	allowed = TEAM_FARMEROCOCA
    })
	
	DarkRP.createEntity("Cubo", {
        ent = "cocaine_bucket",
        model = "models/craphead_scripts/the_cocaine_factory/utility/bucket.mdl",
        price = 10000,
        max = 1,
		category = "Cocina de Coca",
        cmd = "buybucket",
	allowed = TEAM_FARMEROCOCA
    })

    DarkRP.createEntity("Hojas Especiales", {
        ent = "cocaine_leaves",
        model = "models/craphead_scripts/the_cocaine_factory/utility/leaves.mdl",
        price = 10000,
        max = 10,
		category = "Cocina de Coca",
        cmd = "buyleaves",
	allowed = TEAM_FARMEROCOCA
    })

    DarkRP.createEntity("Gas", {
        ent = "cocaine_gas",
        model = "models/craphead_scripts/the_cocaine_factory/utility/gas_tank.mdl",
        price = 5000,
        max = 4,
		category = "Cocina de Coca",
        cmd = "buygas",
	allowed = TEAM_FARMEROCOCA
    })

    DarkRP.createEntity("Secador", {
        ent = "cocaine_drying_rack",
        model = "models/craphead_scripts/the_cocaine_factory/drying_rack/drying_rack.mdl",
        price = 35000,
        max = 1,
		category = "Cocina de Coca",
        cmd = "buydryingrack",
	allowed = TEAM_FARMEROCOCA
    })

    DarkRP.createEntity("Caja de Coca", {
        ent = "cocaine_box",
        model = "models/craphead_scripts/the_cocaine_factory/utility/cocaine_box.mdl",
        price = 4000,
        max = 1,
		category = "Cocina de Coca",
		cmd = "buycocainebox",
	allowed = TEAM_FARMEROCOCA
	})

	DarkRP.createEntity("Puerto de Gas", {
        ent = "cocaine_cooking_plate",
        model = "models/craphead_scripts/the_cocaine_factory/utility/stove_upgrade.mdl",
        price = 10000,
        max = 4,
		category = "Cocina de Coca",
        cmd = "buyplateupgrade",
	allowed = TEAM_FARMEROCOCA
    })

    DarkRP.createEntity("Extractor de Coca", {
        ent = "cocaine_extractor",
        model = "models/craphead_scripts/the_cocaine_factory/extractor/extractor.mdl",
        price = 30000,
        max = 1,
		category = "Cocina de Coca",
        cmd = "buyextractor",
	allowed = TEAM_FARMEROCOCA
    })

    DarkRP.createEntity("Soda de Coca", {
        ent = "cocaine_baking_soda",
        model = "models/craphead_scripts/the_cocaine_factory/utility/soda.mdl",
        price = 6000,
        max = 5,
		category = "Cocina de Coca",
        cmd = "buybakingsoda",
	allowed = TEAM_FARMEROCOCA
    })
end
hook.Add( "loadCustomDarkRPItems", "SH_COCAINE_DarkRPAdds", SH_COCAINE_DarkRPAdds )
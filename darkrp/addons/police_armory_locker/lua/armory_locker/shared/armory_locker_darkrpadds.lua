function ARMORY_AddDarkRPEntities()
	AddCustomShipment("Armory Lockpick", {
		model = "models/craphead_scripts/armory_robbery2/w_lockpick.mdl",
		entity = "armory_lockpick",
		price = 5000,
		amount = 10,
		seperate = true,
		pricesep = 500,
		noship = false,
		allowed = {TEAM_GUN, TEAM_GANG, TEAM_MOB},
	})
end
hook.Add( "loadCustomDarkRPItems", "ARMORY_AddDarkRPEntities", ARMORY_AddDarkRPEntities )
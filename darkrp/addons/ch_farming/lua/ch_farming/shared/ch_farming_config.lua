CH_Farming = CH_Farming or {}
CH_Farming.Config = CH_Farming.Config or {}

-- SET LANGUAGE
-- Available languages: English: en - Danish: da - French: fr - German: de - Turkish: tr - Spanish: es - Russian: ru
CH_Farming.Config.Language = "es" -- Set the language of the script.

--[[
	General
--]]
CH_Farming.Config.NotificationTime = 10 -- Amount of seconds notifications will show.
CH_Farming.Config.EnableHungermod = false -- Should grown crops be eat-able or not?
CH_Farming.Config.DistanceTo3D2D = 60000 -- Distance to any 3d2d element before it is no longer drawn.

CH_Farming.Config.CrosshairColor = Color( 255, 255, 255, 255 ) -- Color of the crosshair on farming tools.

CH_Farming.Config.FarmingTeams = { -- These teams are allowed to sell crates of crops to the farmer NPCs.
	"Citizen",
	"Farmero",
	"Hobo"
}

CH_Farming.Config.EntitiesHealth = { -- Set healths for different entities in the table below.
	["Crate"] = 150,
	["Lamp"] = 250,
	["PlantSack"] = 100,
	["SeedPacks"] = 50,
	["Crops"] = 25,
	["LampBattery"] = 75,
	["DirtBag"] = 125,
}

--[[
	Shovel
--]]
-- To get a grass material on the map, take out the shovel as superadmin & right click on the grass you found. (then add to the list below)
CH_Farming.Config.DistanceToDigHole = 3500 -- Distance between players aim and their position before allowing to dig a hole in grass.
CH_Farming.Config.NearbyHoleDistance = 1000 -- Distance between holes before being able to dig one. If there is a hole too close.
CH_Farming.Config.PlayerMaxHoles = 8 -- How many holes is a player allowed to dig at once?

-- List of actual materials you can dig in. This works somewhere, and sometimes it does not (depending on the map).
-- You can use the shovel as an admin to debug what material and material type the surface you're aiming at is. Press 'Reload' while aiming at a surface.
CH_Farming.Config.GrassMaterials = {
	["CS_HAVANA/GROUND01GRASS"] = true,
	["DE_TRAIN/TRAIN_GRASS_FLOOR_01"] = true,
	["NATURE/GRASSFLOOR002A"] = true,
	["DE_TRAIN/TRAIN_CEMENT_FLOOR_01"] = true,
	["GROUND/SNOW01"] = true,
	["NATURE/BLENDGRASSGRAVEL001A"] = true -- NO COMMA ON LAST LINE!
}

-- List of material types that you can dig in. true means you can dig, false means you can't. Full list: https://wiki.facepunch.com/gmod/Enums/MAT
CH_Farming.Config.MaterialTypes = {
	[65] = false, -- ANTLION
	[66] = false, -- BLOODYFLESH
	[67] = false, -- CONCRETE / NODRAW
	[68] = true,  -- DIRT
	[70] = false, -- FLESH
	[71] = false, -- GRATE
	[72] = false, -- ALIENFLESH
	[73] = false, -- CLIP
	[76] = false, -- PLASTIC
	[77] = false, -- METAL
	[78] = false, -- SAND
	[79] = false, -- FOLIAGE
	[80] = false, -- COMPUTER
	[83] = false, -- SLOSH
	[84] = false, -- TILE
	[85] = true,  -- GRASS
	[86] = false, -- VENT
	[87] = false, -- WOOD
	[89] = false  -- GLASS
}

-- NEED MORE HELP WITH MATERIALS TO DIG HOLES IN? View this knowledge base article: https://www.gmodstore.com/help/addon/7487/shovel/topics/configurating-materials-that-the-shovel-accepts

--[[
	Crop Hole/Pot
--]]
CH_Farming.Config.RemoveInactiveHoleTimer = 600 -- Amount of seconds before an inactive hole is removed.

-- Adjusting sun level (These are the same configs used for the lamp when growing inside)
CH_Farming.Config.AdjustSunLevelTimer = 3 -- Adjust the sun level every x second.

CH_Farming.Config.DecreaseSunLevelMin = 2 -- Minimum amount to decrease if the hole/pot is inside.
CH_Farming.Config.DecreaseSunLevelMax = 4 -- Maximum amount to decrease. It is randomized.

CH_Farming.Config.IncreaseSunLevelMin = 2 -- Minimum amount to increase if the hole/pot is outside.
CH_Farming.Config.IncreaseSunLevelMax = 4 -- Maximum amount to increase. It is randomized.

-- Adjusting water level
CH_Farming.Config.AdjustWaterLevelTimer = 20 -- Decrease the water level in hole/pot every x second.

CH_Farming.Config.DecreaseWaterLevelMin = 2 -- Minimum amount to decrease if the hole/pot is inside.
CH_Farming.Config.DecreaseWaterLevelMax = 3 -- Maximum amount to decrease. It is randomized.

-- Adjusting weeds in hole
CH_Farming.Config.AddWeedsTimer = 600 -- Increase the amount of weeds in the hole every x second. (Default: 10 minutes)
CH_Farming.Config.ExtraSecondsPerWeed = 7 -- There is a total of 5 stages of weeds in a hole. For every stage of weeds, this is the amount of seconds to add of extra time. So stage 2 weeds (40%) will add 14 extra seconds to grow time.

CH_Farming.Config.DeadPlantDieTime = 30 -- WHEN A PLANT HAS DIED how many seconds does it take to vanish?

--[[
	Weeding Tool
--]]
CH_Farming.Config.CleanWeedsDelay = 5 -- Amount of seconds delay to use the weeding tool to remove weeds from holes. (MINIMUM 5 SECONDS SO THE ANIMATION CAN PLAY)

--[[
	Watering Can
--]]
CH_Farming.Config.UseWaterCanDelay = 2 -- Amount of seconds delay to water holes or pots.

--[[
	Lamp / Battery
--]]
CH_Farming.Config.BatteryDecreaseInterval = 10 -- Amount of seconds interval between decreasing battery
CH_Farming.Config.DecreaseBatteryMin = 3 -- Minimum amount to decrease battery charge with.
CH_Farming.Config.DecreaseBatteryMax = 7 -- Maximum amount to decrease battery charge with. This is randomized.

CH_Farming.Config.LampToSackDistance = 12500 -- Distance between a plant sack and a lamp. Within this distance it will increase the sun/light level of the sack.

--[[
	Crate
--]]
CH_Farming.Config.CrateDefaultWeight = 3500 -- How many grams can the crate hold by default.

-- Crate donator weights
CH_Farming.Config.CrateDonatorWeight = {
	{ UserGroup = "user", CrateGrams = 2000 },
	{ UserGroup = "vip", CrateGrams = 4000 },
	{ UserGroup = "mod", CrateGrams = 2000 },
	{ UserGroup = "mod+", CrateGrams = 4000 },
	{ UserGroup = "admin", CrateGrams = 8000 },
	{ UserGroup = "superadmin", CrateGrams = 2000 },
}

--[[
	Crops
--]]
CH_Farming.Config.CropsGramsAmount = { -- This defines the MINIMUM and MAXIMUM amount of grams the crops can weight when harvested.
	["Lettuce"] = { 50, 200 }, -- So for example lettuce will weight between 50 and 200 grams (randomly) when harvested.
	["Pepper"] = { 50, 180 },
	["Corn"] = { 50, 100 },
	["Tomato"] = { 25, 75 },
	["Wheat"] = { 25, 50 }
}

CH_Farming.Config.CropsGrowTime = { -- How long does it take (by default, before weeds) for each crop to grow 100% - IN SECONDS
	["Lettuce"] = 240,
	["Pepper"] = 220,
	["Corn"] = 240,
	["Tomato"] = 210,
	["Wheat"] = 240
}

--[[
	Sell Crops NPC
--]]
CH_Farming.Config.SellDistance = 40000 -- Distance between crate of crops, player and NPC to be able to sell crops.

CH_Farming.Config.RandomizePayoutInterval = 300 -- Every 300 second it will randomize how much crops are worth (per gram) - see table below!

CH_Farming.Config.CropsGramsWorth = { -- How much ONE gram is worth for the different crops. Minimum and maximum and it randomizes the payout.
	["Lettuce"] = { 20, 25 },
	["Pepper"] = { 20, 28 },
	["Corn"] = { 22, 29 },
	["Tomato"] = { 22, 30 },
	["Wheat"] = { 24, 31 }
}

-- XP SUPPORT
CH_Farming.Config.DarkRPLevelSystemEnabled = false -- DARKRP LEVEL SYSTEM BY vrondakis https://github.com/uen/Leveling-System
CH_Farming.Config.SublimeLevelSystemEnabled = false -- Sublime Levels by HIGH ELO CODERS https://www.gmodstore.com/market/view/6431
CH_Farming.Config.EssentialsXPSystemEnabled = false -- Brick's Essentials and/or DarkRP Essentials by Brickwall https://www.gmodstore.com/market/view/5352 & https://www.gmodstore.com/market/view/7244
CH_Farming.Config.EXP2SystemEnabled = false -- Elite XP SYstem (EXP2) By Axspeo https://www.gmodstore.com/market/view/4316
CH_Farming.Config.GlorifiedLevelingXPSystem = false -- GlorifiedLeveling by GlorifiedPig https://www.gmodstore.com/market/view/7254

CH_Farming.Config.SellXPAmountMin = 20 -- Minimum amount of experience to give to the player when selling crops.
CH_Farming.Config.SellXPAmountMax = 50 -- Maximum amount of experience to give to the player when selling crops.

--[[
	Advanced
--]]
-- It should not be necessary for you (the customer) to edit these configurations.
CH_Farming.Config.CropList = {
	["ch_farming_crop_lettuce"] = true,
	["ch_farming_crop_pepper"] = true,
	["ch_farming_crop_corn"] = true,
	["ch_farming_crop_tomato"] = true,
	["ch_farming_crop_wheat"] = true
}

CH_Farming.Config.SeedList = {
	["ch_farming_seed_lettuce"] = true,
	["ch_farming_seed_pepper"] = true,
	["ch_farming_seed_corn"] = true,
	["ch_farming_seed_tomato"] = true,
	["ch_farming_seed_wheat"] = true
}
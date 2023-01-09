TCF = {}
TCF.Config = {}

-- SET LANGUAGE
-- Available languages: English: en - Danish: da - German: de - Polish: pl - Russian: ru - Spanish: es - French: fr - Chinese: cn
TCF.Config.Language = "es" -- Set the language of the script.
 
-- GENERAL TEAM CONFIGURATION
TCF.Config.CriminalTeams = { -- These teams are allowed to interact with the cocaine buyer NPC.
	"Lider Criminal Xetas",
	"Lider Criminal Yetas",
	"Criminal",
	"Farmero de Coca"
}

TCF.Config.PoliceTeams = { -- Police teams. These teams are NOT allowed to use the cocaine buyer NPC and can also confiscate packed boxes with cocaine.
	"Teniente Protección Civil",
	"Alcalde",
	"Policia",
	"Grupo Anti-Disturbios"
}

-- COCAINE BUYER NPC
TCF.Config.NPCDisplayName = "Comprador de Coca" -- The display name shown above the NPC
TCF.Config.NPCDisplayDescription = "dame harina" -- The description displayed above the NPC.

TCF.Config.SellDistance = 150 -- How far away can the NPC detect your drug holder.
TCF.Config.RandomPayoutInterval = 300 -- How many seconds before the randomized payout is changed again. It randomizes the settings below.

TCF.Config.PayPerPackMin = 2550 -- How much should each cocaine pack be worth? Minimum value (without any donator bonuses)
TCF.Config.PayPerPackMax = 3550 -- How much should each cocaine pack be worth? Maximum value (without any donator bonuses)

-- STOVE ENTITY
TCF.Config.StoveHealth = 250 -- The amount of health the stove entity have.
TCF.Config.GasButtonDelay = 0.75 -- The amount of seconds delay there is when switching gas on/off on the stove.

TCF.Config.StoveExplosion = true -- Should the stove explode when destroyed. true/false

TCF.Config.StoveSmokeEffect = true -- Should the pots on the stove emit smoke effect when cooking/turned on. true/false
TCF.Config.MinTemperatureForSmoke = 10 -- Minimum temperature the pot has to have before the smoke appears. It goes from 0 - 100.

-- EXTRACTOR ENTITY
TCF.Config.ExtractorHealth = 200 -- The amount of health the barrel entity have.
TCF.Config.ExtractorSound = "ambient/gas/steam2.wav" -- Sound that plays while extracting the cocaine from the extractor entity.

TCF.Config.MinLeafAmount = 10 -- Minimum amount of leaf percentage added when adding leafs.
TCF.Config.MaxLeafAmount = 20 -- Maximum amount of leaf percentage added when adding leafs.

TCF.Config.MinCarbonateAmount = 25  -- Minimum amount of carbonate added when you add your finished pot.
TCF.Config.MaxCarbonateAmount = 25  -- Maximum amount of carbonate added when you add your finished pot.

TCF.Config.ExtractionTime = 30 -- Amount of seconds it takes for the extractor to finish.

TCF.Config.ExtractorExplosion = true -- Should the extractor explode when destroyed. true/false

-- POT/PAN ENTITY
TCF.Config.CookingPanHealth = 50 -- The amount of health the pot/pan entity have.

-- DRYING RACK ENTITY
TCF.Config.DryingRackHealth = 150 -- The amount of health the drying rack entity have.
TCF.Config.DryingTime = 20 -- Amount of seconds it takes for the drying rack to finish.

-- COCAINE BOX ENTITY
TCF.Config.CocaineBoxHealth = 75 -- The amount of health the drug holder/cocaine box entity have.
TCF.Config.PoliceConfiscateAmount = 200 -- Amount if money the police officers gets for confiscating a police box PER cocaine pack it contains.

-- BAKING SODA ENTITY
TCF.Config.BakingSodaHealth = 50 -- The amount of health the baking soda entity have.

-- COCAINE ENTITY
TCF.Config.CocaineHealth = 25 -- The amount of health the cocaine entity have.

-- GAS ENTITY
TCF.Config.GasHealth = 100 -- The amount of health the gas entity have.

TCF.Config.GasExplosion = true -- Should the gas canister explode when destroyed. true/false

-- LEAF ENTITY
TCF.Config.LeafHealth = 50 -- The amount of health the leaf entity have.

-- WATER ENTITY
TCF.Config.WaterHealth = 50 -- The amount of health the water entity have.

-- BUCKET ENTITY
TCF.Config.BucketHealth = 50 -- The amount of health the bucket entity have.

-- COOKING PLATE ENTITY
TCF.Config.CookingPlateHealth = 50 -- The amount of health the cooking plate entity have.

-- DONATOR SETTINGS
TCF.Config.EnableDonatorBonus = true -- If this feature should be enabled or not (WORKS ONLY WITH ULX GROUPS).

TCF.Config.DonatorBonuses = {
	{ ULXGroup = "vip", Bonus = 2 },
	{ ULXGroup = "mod+", Bonus = 2 },
	{ ULXGroup = "modt+", Bonus = 2 },
	{ ULXGroup = "admin", Bonus = 2 },
}

-- DarkRP Fire System ( https://www.gmodstore.com/market/view/302 )
-- Spawn fire when stove, extractor or gas canisters explode.
TCF.Config.CreateFireOnExplode = false -- false = disabled / true = enabled

-- Vrondakis Leveling System ( https://github.com/vrondakis/Leveling-System )
-- Give XP in different situations. Configure different entities and amount of XP given below.
TCF.Config.DryingRackGiveXP = false -- Should we give XP after completely drying a portion of cocaine?
TCF.Config.DryingRackXPAmount = 25 -- Amount of XP to give if enabled.

TCF.Config.FinishCookGiveXP = false -- Should we give XP after each pot has finished cooking?
TCF.Config.FinishCookXPAmount = 10 -- Amount of XP to give if enabled.

TCF.Config.ExtractorGiveXP = false -- Should we give XP after completing the extracting process? (once the bucket is full)
TCF.Config.ExtractorXPAmount = 25 -- Amount of XP to give if enabled.

TCF.Config.OnSellGiveXP = false -- Should we give XP once they sell a box of cocaine to the druggie NPC?
TCF.Config.OnSellXPAmount = 50 -- Amount of XP to give if enabled.
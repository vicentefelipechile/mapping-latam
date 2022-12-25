--[[
	
	DO NOT EDIT ANYTHING BELOW THIS
	You can edit the real config in game by typing !brickscreditstore

]]--

BRICKSCREDITSTORE.BASECONFIG = {}

BRICKSCREDITSTORE.BASECONFIG.Categories = {}
BRICKSCREDITSTORE.BASECONFIG.Categories["Boosts"] = "https://i.imgur.com/SrDj1Id.png"

BRICKSCREDITSTORE.BASECONFIG.Groups = {}
BRICKSCREDITSTORE.BASECONFIG.Groups["VIP"] = { ["vip"] = true, ["mod+" ] = true }

BRICKSCREDITSTORE.BASECONFIG.NPCs = {}
BRICKSCREDITSTORE.BASECONFIG.NPCs["Credit Store"] = {
	icon = "https://i.imgur.com/eUKo7d4.png",
	model = "models/breen.mdl",
	currency = "Credits",
	CMD = "/creditstore",
	Items = {}
}
if( BRICKSCREDITSTORE.LUACONFIG.DarkRP ) then
	BRICKSCREDITSTORE.BASECONFIG.NPCs["Perma Weapons"] = {
		icon = "https://i.imgur.com/bFTtPXs.png",
		model = "models/breen.mdl",
		currency = "DarkRP Money",
		Items = {}
	}
	BRICKSCREDITSTORE.BASECONFIG.NPCs["Health/Armor"] = {
		icon = "https://i.imgur.com/eUKo7d4.png",
		model = "models/breen.mdl",
		currency = "DarkRP Money",
		Items = {}
	}

	--[[ Health/Armor ]]--
	BRICKSCREDITSTORE.BASECONFIG.NPCs["Health/Armor"].Items[1] = {
		Name = "15 Armor",
		Description = "Gives you 15 armor!",
		Category = "Boosts",
		Price = 1,
		icon = "https://i.imgur.com/92JTd70.png",
		Type = "Armor",
		TypeInfo = { 15, 100 }
	}

	BRICKSCREDITSTORE.BASECONFIG.NPCs["Health/Armor"].Items[2] = {
		Name = "25 Armor",
		Description = "Gives you 25 armor!",
		Category = "Boosts",
		Price = 3,
		icon = "https://i.imgur.com/JeVnPM7.png",
		Type = "Armor",
		TypeInfo = { 25, 100 }
	}

	BRICKSCREDITSTORE.BASECONFIG.NPCs["Health/Armor"].Items[3] = {
		Name = "50 Armor",
		Description = "Gives you 50 armor!",
		Category = "Boosts",
		Price = 5,
		icon = "https://i.imgur.com/jC5nyZO.png",
		Type = "Armor",
		TypeInfo = { 50, 100 }
	}

	BRICKSCREDITSTORE.BASECONFIG.NPCs["Health/Armor"].Items[4] = {
		Name = "15 Health",
		Description = "Gives you 15 health!",
		Category = "Boosts",
		Price = 1,
		icon = "https://i.imgur.com/scZZIVF.png",
		Type = "Health",
		TypeInfo = { 15, 100 }
	}

	BRICKSCREDITSTORE.BASECONFIG.NPCs["Health/Armor"].Items[5] = {
		Name = "25 Health",
		Description = "Gives you 25 health!",
		Category = "Boosts",
		Price = 3,
		icon = "https://i.imgur.com/z33p0n8.png",
		Type = "Health",
		TypeInfo = { 25, 100 }
	}

	BRICKSCREDITSTORE.BASECONFIG.NPCs["Health/Armor"].Items[6] = {
		Name = "50 Health",
		Description = "Gives you 50 health!",
		Category = "Boosts",
		Price = 5,
		icon = "https://i.imgur.com/Hj3WqkN.png",
		Type = "Health",
		TypeInfo = { 50, 100 }
	}

	--[[ Perma weapons ]]--
	BRICKSCREDITSTORE.BASECONFIG.NPCs["Perma Weapons"].Items[1] = {
		Name = "Permanent AK47",
		Description = "Gives you a permanent AK47!",
		Price = 1500,
		model = "models/weapons/w_rif_ak47.mdl",
		Type = "PERM_SWEP",
		TypeInfo = { "weapon_ak472" }
	}
	BRICKSCREDITSTORE.BASECONFIG.NPCs["Perma Weapons"].Items[2] = {
		Name = "Perm Crossbow",
		Description = "Gives you a permanent Crossbow!",
		Price = 25000,
		model = "models/weapons/w_crossbow.mdl",
		Type = "PERM_SWEP",
		TypeInfo = { "weapon_crossbow" }
	}
	BRICKSCREDITSTORE.BASECONFIG.NPCs["Perma Weapons"].Items[3] = {
		Name = "Perm Shotgun",
		Description = "Gives you a permanent Shotgun!",
		Price = 5000,
		model = "models/weapons/w_shotgun.mdl",
		Type = "PERM_SWEP",
		TypeInfo = { "weapon_shotgun" }
	}

	--[[ Credit Store ]]--
	BRICKSCREDITSTORE.BASECONFIG.NPCs["Credit Store"].Items[1] = {
		Name = "$500,000",
		Description = "Gives you $500,000!",
		Price = 1500,
		model = "models/props/cs_assault/money.mdl",
		Type = "Currency",
		TypeInfo = { "DarkRP Money", 500000 }
	}
end
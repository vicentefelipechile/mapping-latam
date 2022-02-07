CH_Armory_Locker = {}
CH_Armory_Locker.Config = {}
CH_Armory_Locker.Design = {}

-- TEAM CONFIGURATION
CH_Armory_Locker.Config.GovernmentTeams = { -- These are your government teams. They will receive messages of robbery and can access the police locker. Use the actual team name, as shown below.
	"Police Officer",
	"Sheriff",
	"FBI Agent",
	"S.W.A.T",
	"S.W.A.T Sniper",
	"Vault Guard",
	"Mayor" -- THE LAST LINE SHOULD NOT HAVE A COMMA AT THE END. BE AWARE OF THIS WHEN EDITING THIS!
}

CH_Armory_Locker.Config.AllowedTeams = { -- These are the teams that are allowed to rob the armory.
	"Citizen",
	"Gangster",
	"Mob boss",
	"Gun Dealer",
	"Medic",
	"Hobo" -- THE LAST LINE SHOULD NOT HAVE A COMMA AT THE END. BE AWARE OF THIS WHEN EDITING THIS!
}

-- General Config
CH_Armory_Locker.Config.WeaponsArmoryEnabled = true -- Should the weapon armory for police jobs be enabled or not? true/false option. [Default = true]
CH_Armory_Locker.Config.RetrieveCooldown = 0.1 -- Amount of minutes between being able to retrieve a weapon from the police armory as a government official. [Default = 5]
CH_Armory_Locker.Config.PoliceKillRobberReward = 1250 -- Amount of money police officers get when killing someone that is lockpicking the armory. [Default = 1250]
CH_Armory_Locker.Config.KillRobberReward = 250 -- Amount of money anyone else get when killing someone that is lockpicking the armory. [Default = 250]

-- Lockpicking Config
CH_Armory_Locker.Config.LockpickTime = 1 -- Amount of seconds to lockpick the armory. [Default = 15]
CH_Armory_Locker.Config.LockpickCooldown = 2 -- Amount of seconds after having lockpicked a door, before being able to lockpick another door. [Default = 60]
CH_Armory_Locker.Config.DoorCooldown = 120 -- Amount of seconds a door is on a cooldown after being lockpicked. The above config still applies for the individual user. [Default = 120]
CH_Armory_Locker.Config.NotifyPolice = true -- Should police jobs be notified when someone has lockpicked the armory and leaves? true/false.

-- Display 3D2D Config
CH_Armory_Locker.Config.DisplayHeaderText = true -- Should the text above the armory be displayed?
CH_Armory_Locker.Config.HeaderText = "Police Armory" -- Header text above armory/locker.
CH_Armory_Locker.Config.DistanceToHeader = 1000 -- Distance between player and police locker before the title appears.
CH_Armory_Locker.Config.DistanceToIcons = 500 -- Distance before lockpick/cooldown icons appear.

CH_Armory_Locker.Design.ArmoryHeaderColor = Color( 48, 151, 209, 255 ) -- Header text color (gmodstore blue color)
CH_Armory_Locker.Design.ArmoryHeaderBoarder = Color( 0, 0, 0, 255 ) -- Header text boarder color

-- DEFAULT ARMORY WEAPONS
CH_Armory_Locker.Weapons = {
	-- Default Weapons
	---- M9K Rifles
	{ Weapon = "m9k_ak47", Name = "AK47 Rifle", Desc = "Officially known as the Avtomat Kalashnikova is an assault rifle, developed in the Soviet Union.", EntType = "weapon", Model = "models/weapons/w_ak47_m9k.mdl", AmmoType = "m9k_ammo_ar2", AmmoAmt = 60  },
	{ Weapon = "m9k_acr", Name = "ACR Rifle", Desc = "A semi-automatic rifle. Officials of the U.S Army often use this weapon.", EntType = "weapon", Model = "models/weapons/w_masada_acr.mdl", AmmoType = "m9k_ammo_ar2", AmmoAmt = 60 },
	{ Weapon = "m9k_m416", Name = "M4-16 Rifle", Desc = "The United States Army's Delta Forco developed the new carbine in the early 1990s in a collaboration with Heckler & Koch.", EntType = "weapon", Model = "models/weapons/w_hk_416.mdl", AmmoType = "m9k_ammo_ar2", AmmoAmt = 60 },
	{ Weapon = "m9k_scar", Name = "SCAR Rifle", Desc = "The FN SCAR is a gas-operated (short-stroke gas piston) self-loading rifle with a rotating bolt.", EntType = "weapon", Model = "models/weapons/w_fn_scar_h.mdl", AmmoType = "m9k_ammo_ar2", AmmoAmt = 60 },
	
	----- M9K Pistols
	{ Weapon = "m9k_m92beretta", Name = "M29 Baretta", Desc = "A strong semi-automatic pistol from Italy.", EntType = "weapon", Model = "models/weapons/w_beretta_m92.mdl", AmmoType = "m9k_ammo_ar2", AmmoAmt = 30 },
	{ Weapon = "m9k_hk45", Name = "HK45-C", Desc = "A very powerful semi-automatic pistol.", EntType = "weapon", Model = "models/weapons/w_hk45c.mdl", AmmoType = "m9k_ammo_ar2", AmmoAmt = 30 },
	{ Weapon = "m9k_ragingbull", Name = "Raging Bull", Desc = "In its larger calibers it is marketed as a hunter's sidearm because it is a potent weapon with plenty of stopping power.", EntType = "weapon", Model = "models/weapons/w_taurus_raging_bull.mdl", AmmoType = "m9k_ammo_ar2", AmmoAmt = 30 },
	
	----- M9K Shotguns
	{ Weapon = "m9k_jackhammer", Name = "Jack Hammer", Desc = "A 12-gauge, blow-forward gas-operated bullpup automatic shotgun.", EntType = "weapon", Model = "models/weapons/w_pancor_jackhammer.mdl", AmmoType = "buckshot", AmmoAmt = 16 },
	{ Weapon = "m9k_ithacam37", Name = "Ithaca M37", Desc = "Pump-action shotgun made in large numbers for the civilian, military, and police markets.", EntType = "weapon", Model = "models/weapons/w_ithaca_m37.mdl", AmmoType = "buckshot", AmmoAmt = 16 },
	{ Weapon = "m9k_mossberg590", Name = "Mossberg", Desc = "The name Mossberg covers an entire family of pump shotguns designed to chamber 3-inch (76 mm) magnum shells.", EntType = "weapon", Model = "models/weapons/w_mossberg_590.mdl", AmmoType = "buckshot", AmmoAmt = 16 },
	
	-- Default Ammo
	{ Weapon = "ammo_pistol", Name = "Pistol Rounds", Desc = "Pistol ammunition.", EntType = "ammo", Model = "models/Items/357ammo.mdl", AmmoType = "pistol", AmmoAmt = 50 },
	{ Weapon = "ammo_buckshot", Name = "Buckshots", Desc = "Shotgun & Pump-shotun ammunition.", EntType = "ammo", Model = "models/Items/BoxBuckshot.mdl", AmmoType = "buckshot", AmmoAmt = 24 },
	{ Weapon = "ammo_smg1", Name = "SMG Rounds", Desc = "Submachine gun ammunition.", EntType = "ammo", Model = "models/Items/BoxMRounds.mdl", AmmoType = "smg1", AmmoAmt = 25 },
	{ Weapon = "ammo_ar2", Name = "Rifle Rounds", Desc = "Automatic & semi-automatic rifle ammunition.", EntType = "ammo", Model = "models/Items/BoxSRounds.mdl", AmmoType = "ar2", AmmoAmt = 50 },
	{ Weapon = "ammo_rpg", Name = "RPG Rounds", Desc = "Rocket Launcher ammunition.", EntType = "ammo", Model = "models/weapons/w_missile_closed.mdl", AmmoType = "rpg_round", AmmoAmt = 2 },
	
	-- Default Health & Armor
	{ Weapon = "armor_100", Name = "Full Body Armor", Desc = "Protective clothing designed to absorb or deflect physical attacks.", EntType = "armor", Model = "models/Items/combine_rifle_ammo01.mdl", AmmoType = "none", AmmoAmt = 100 },
	{ Weapon = "armor_50", Name = "Half Armor", Desc = "Protective clothing designed to absorb or deflect physical attacks.", EntType = "armor", Model = "models/Items/combine_rifle_ammo01.mdl", AmmoType = "none", AmmoAmt = 50 },
	{ Weapon = "health_50", Name = "Health Kit", Desc = "This medkit partly restores your health when used.", EntType = "health", Model = "models/craphead_scripts/ocrp2/props_meow/weapons/w_medpack.mdl", AmmoType = "none", AmmoAmt = 50 },
	{ Weapon = "health_75", Name = "Health Kit", Desc = "This medkit partly restores your health when used.", EntType = "health", Model = "models/craphead_scripts/ocrp2/props_meow/weapons/w_medpack.mdl", AmmoType = "none", AmmoAmt = 75 },
	{ Weapon = "health_100", Name = "Health Kit", Desc = "This medkit fully restores your health when used.", EntType = "health", Model = "models/craphead_scripts/ocrp2/props_meow/weapons/w_medpack.mdl", AmmoType = "none", AmmoAmt = 100 },
}
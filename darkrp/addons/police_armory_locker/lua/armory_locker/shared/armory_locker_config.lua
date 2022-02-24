CH_Armory_Locker = {}
CH_Armory_Locker.Config = {}
CH_Armory_Locker.Design = {}

-- TEAM CONFIGURATION
CH_Armory_Locker.Config.GovernmentTeams = { -- These are your government teams. They will receive messages of robbery and can access the police locker. Use the actual team name, as shown below.
	"Policia",
	"Alcalde",
	"Grupo Anti-Disturbios",
	"Teniente Protección Civil"
}

CH_Armory_Locker.Config.AllowedTeams = { -- These are the teams that are allowed to rob the armory.
	"Criminal",
	"Lider Criminal Yetas",
	"Lider Criminal Xetas"
}

-- General Config
CH_Armory_Locker.Config.WeaponsArmoryEnabled = true -- Should the weapon armory for police jobs be enabled or not? true/false option. [Default = true]
CH_Armory_Locker.Config.RetrieveCooldown = 1 -- Amount of minutes between being able to retrieve a weapon from the police armory as a government official. [Default = 5]
CH_Armory_Locker.Config.PoliceKillRobberReward = 5000 -- Amount of money police officers get when killing someone that is lockpicking the armory. [Default = 1250]
CH_Armory_Locker.Config.KillRobberReward = 250 -- Amount of money anyone else get when killing someone that is lockpicking the armory. [Default = 250]

-- Lockpicking Config
CH_Armory_Locker.Config.LockpickTime = 15 -- Amount of seconds to lockpick the armory. [Default = 15]
CH_Armory_Locker.Config.LockpickCooldown = 300 -- Amount of seconds after having lockpicked a door, before being able to lockpick another door. [Default = 60]
CH_Armory_Locker.Config.DoorCooldown = 120 -- Amount of seconds a door is on a cooldown after being lockpicked. The above config still applies for the individual user. [Default = 120]
CH_Armory_Locker.Config.NotifyPolice = true -- Should police jobs be notified when someone has lockpicked the armory and leaves? true/false.

-- Display 3D2D Config
CH_Armory_Locker.Config.DisplayHeaderText = true -- Should the text above the armory be displayed?
CH_Armory_Locker.Config.HeaderText = "Armario policial" -- Header text above armory/locker.
CH_Armory_Locker.Config.DistanceToHeader = 1000 -- Distance between player and police locker before the title appears.
CH_Armory_Locker.Config.DistanceToIcons = 500 -- Distance before lockpick/cooldown icons appear.

CH_Armory_Locker.Design.ArmoryHeaderColor = Color( 48, 151, 209, 255 ) -- Header text color (gmodstore blue color)
CH_Armory_Locker.Design.ArmoryHeaderBoarder = Color( 0, 0, 0, 255 ) -- Header text boarder color

-- DEFAULT ARMORY WEAPONS
CH_Armory_Locker.Weapons = {
	-- Default Weapons
	{ Weapon = "m9k_m416", Name = "M4 Rifle de asalto", Desc = "Estados Unidos desarrolló la nueva carabina a principios de la década de 1990 en colaboración con Heckler & Koch..", EntType = "weapon", Model = "models/weapons/w_hk_416.mdl", AmmoType = "m9k_ammo_ar2", AmmoAmt = 60 },	
	----- M9K Pistols
	{ Weapon = "m9k_m92beretta", Name = "M29 Baretta", Desc = "Una fuerte pistola semiautomática de Italia.", EntType = "weapon", Model = "models/weapons/w_beretta_m92.mdl", AmmoType = "m9k_ammo_ar2", AmmoAmt = 30 },

	----- M9K Shotguns
	{ Weapon = "m9k_mossberg590", Name = "Mossberg", Desc = "El nombre Mossberg cubre toda una familia de escopetas correderas diseñadas para cartuchos magnum de 3 pulgadas (76 mm).", EntType = "weapon", Model = "models/weapons/w_mossberg_590.mdl", AmmoType = "buckshot", AmmoAmt = 16 },
	
	-- Default Ammo
	{ Weapon = "ammo_pistol", Name = "Cartuchos de Pistola", Desc = "Munición de Pistola.", EntType = "ammo", Model = "models/Items/357ammo.mdl", AmmoType = "pistol", AmmoAmt = 350 },
	{ Weapon = "ammo_buckshot", Name = "Perdigones", Desc = "Munición de Escopeta.", EntType = "ammo", Model = "models/Items/BoxBuckshot.mdl", AmmoType = "buckshot", AmmoAmt = 350 },
	{ Weapon = "ammo_smg1", Name = "Cartuchos de Subfusil", Desc = "Munición de Arma Subfusil.", EntType = "ammo", Model = "models/Items/BoxMRounds.mdl", AmmoType = "smg1", AmmoAmt = 350 },
	{ Weapon = "ammo_ar2", Name = "Cartuchos de Rifle", Desc = "Munición de Rifle Automatico y Semi-Automatico.", EntType = "ammo", Model = "models/Items/BoxSRounds.mdl", AmmoType = "ar2", AmmoAmt = 350 },

	-- Default Health & Armor
	{ Weapon = "armor_100", Name = "Armadura completa", Desc = "Ropa protectora diseñado para absorder o desviar ataques fisicos.", EntType = "armor", Model = "models/Items/combine_rifle_ammo01.mdl", AmmoType = "none", AmmoAmt = 100 },
	{ Weapon = "health_100", Name = "Botiquin de Salud", Desc = "El botiquin restaura completamente tu vida al usarse.", EntType = "health", Model = "models/craphead_scripts/ocrp2/props_meow/weapons/w_medpack.mdl", AmmoType = "none", AmmoAmt = 100 },
}
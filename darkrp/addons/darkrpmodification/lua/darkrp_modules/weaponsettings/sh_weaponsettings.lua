-- Ignore these two lines:
local weapon = weapons.GetStored
local function edit()
--[[
---------------------------------------------------------------------------
Weapon setting changer module
---------------------------------------------------------------------------

This module allows you to change the settings of weapons. Here's how it works.
Per weapon and setting a line is added in this format:
weapon "WEAPON CLASS NAME HERE".SETTING_HERE = VALUE_HERE



IMPORTANT:
    - Note the quotation marks around the weapon class name!
    - Note the '.' between the class name and the setting!
    - Casing MATTERS. PrintName IS NOT THE SAME AS printname!
    - CHANGING THE SETTINGS IS NOT RECODING THE WEAPON. PLEASE LEAVE THE AUTHORS FIELD INTACT. THANK YOU.
    - Technically you can set any field of the weapon. Advanced users can even override e.g. PrimaryAttack with this.
    - This system is not limited to weapons that come with the DarkRP gamemode.

Examples:

-- This essentially works by replacing "SWEP" at the start of each setting like "SWEP.Primary.Ammo = "pistol""
with your customization in this file being "weapon_deagle2".Primary.Ammo = "ar2"

-- Set the printname of the stunstick to "bash baton". Note: the quotation marks are important!
weapon "stunstick".PrintName = "Bash baton"

-- Set the instructions of the arrest baton. Note the quotation marks! Also, the '\n' is an enter.
weapon "arrest_stick".Instructions = "Left click to arrest\nRight click to switch batons"

-- Set the damage of the p228 to 20 per shot. Note: NO quotes around 20 because it's just a number.
weapon "weapon_p2282".Primary.Damage = 20


LIST OF DEFAULT DARKRP WEAPONS:
The class names of the default DarkRP weapons are listed on this page:
https://github.com/FPtje/DarkRP/tree/master/entities/weapons

You can find extra documentation for weapon functions here on this page:
https://github.com/FPtje/darkrpmodification/blob/master/lua/weapons/weapon_ak47custom/shared.lua

Note that it's the folder names that matter here(the folders that contain the shared.lua for the weapons), e.g. keys, med_kit, door_ram, weapon_m42 etc.

SOME EXAMPLE SETTINGS THAT CAN BE CHANGED USING THIS METHOD:
    - PrintName
    - Instructions
    - Contact
    - Purpose
    - Category
    - Recoil
    - Damage
    - NumShots
    - Cone
    - ClipSize
    - Delay
    - DefaultClip

This list is not complete.

-- ADD WEAPON SETTINGS BELOW THIS LINE
]] -----------------------------------------

-- Armas CSS M9K

-- AK47
weapon "bb_ak47_alt".Primary.Damage = 20
weapon "bb_ak47_alt".Primary.Spread = .17
weapon "bb_ak47_alt".Primary.NumShots = 0.7
weapon "bb_ak47_alt".Primary.RPM = 400
weapon "bb_ak47_alt".Primary.Delay = 0.1
weapon "bb_ak47_alt".ViewModelFOV = 90
weapon "bb_ak47_alt".SelectiveFire = false

-- AWP
weapon "bb_awp_alt".Primary.KickUp = 10
weapon "bb_awp_alt".Primary.KickHorizontal = 10
weapon "bb_awp_alt".Primary.Damage = 30
weapon "bb_awp_alt".Primary.Spread = .7
weapon "bb_awp_alt".Primary.RPM = 50
weapon "bb_awp_alt".Primary.Ammo = "SniperRound"
weapon "bb_awp_alt".ViewModelFOV = 90
weapon "bb_awp_alt".SelectiveFire = false

-- DESERT DEAGEL
weapon "bb_deagle_alt".Primary.Damage = 10
weapon "bb_deagle_alt".Primary.Spread = .17
weapon "bb_deagle_alt".ViewModelFOV = 90
weapon "bb_deagle_alt".SelectiveFire = false

-- FAMAS
weapon "bb_famas_alt".Primary.Damage = 20
weapon "bb_famas_alt".Primary.Spread = .2
weapon "bb_famas_alt".Primary.RPM = 650
weapon "bb_famas_alt".ViewModelFOV = 90
weapon "bb_famas_alt".SelectiveFire = false

-- FIVE SEVEN
weapon "bb_fiveseven_alt".Primary.Damage = 10
weapon "bb_fiveseven_alt".Primary.Spread = .17
weapon "bb_fiveseven_alt".ViewModelFOV = 90
weapon "bb_fiveseven_alt".SelectiveFire = false

-- P90
weapon "bb_p90_alt".Primary.Damage = 17
weapon "bb_p90_alt".Primary.Spread = .25
weapon "bb_p90_alt".Primary.RPM = 700
weapon "bb_p90_alt".ViewModelFOV = 90
weapon "bb_p90_alt".SelectiveFire = false

-- G3SG1
weapon "bb_g3sg1_alt".Primary.Damage = 20
weapon "bb_g3sg1_alt".Primary.Spread = .4
weapon "bb_g3sg1_alt".Primary.ClipSize = 10
weapon "bb_g3sg1_alt".Primary.KickUp = 4
weapon "bb_g3sg1_alt".Primary.KickHorizontal = 6
weapon "bb_g3sg1_alt".Primary.RPM = 100
weapon "bb_g3sg1_alt".Secondary.ScopeZoom = 4
weapon "bb_g3sg1_alt".ViewModelFOV = 90
weapon "bb_g3sg1_alt".SelectiveFire = false

-- GALIG
weapon "bb_galil_alt".Primary.Damage = 20
weapon "bb_galil_alt".Primary.Spread = .17
weapon "bb_galil_alt".ViewModelFOV = 90
weapon "bb_galil_alt".SelectiveFire = false

-- GLOCK
weapon "bb_glock_alt".Primary.Damage = 8
weapon "bb_glock_alt".Primary.Spread = .1
weapon "bb_glock_alt".Primary.RPM = 500
weapon "bb_glock_alt".Primary.ClipSize = 7
weapon "bb_glock_alt".ViewModelFOV = 90
weapon "bb_glock_alt".Slot = 2
weapon "bb_glock_alt".SelectiveFire = false

weapon "bb_glock_cp".Primary.Damage = 8
weapon "bb_glock_cp".Primary.Spread = .08
weapon "bb_glock_cp".Primary.RPM = 550
weapon "bb_glock_cp".Primary.ClipSize = 14
weapon "bb_glock_cp".Slot = 2
weapon "bb_glock_cp".ViewModelFOV = 90
weapon "bb_glock_cp".SelectiveFire = false

-- HK UMP45
weapon "bb_ump45_alt".Primary.Damage = 12
weapon "bb_ump45_alt".Primary.Spread = .18
weapon "bb_ump45_alt".ViewModelFOV = 90
weapon "bb_ump45_alt".SelectiveFire = false

-- HK USP
weapon "bb_usp_alt".Primary.Damage = 5
weapon "bb_usp_alt".Primary.Spread = .14
weapon "bb_usp_alt".ViewModelFOV = 90
weapon "bb_usp_alt".SelectiveFire = false

-- KNIFE
weapon "bb_css_knife_alt".Primary.Damage = 8
weapon "bb_css_knife_alt".FiresUnderwater = true
weapon "bb_css_knife_alt".ViewModelFOV = 90
weapon "bb_css_knife_alt".SelectiveFire = false

-- M249 (VIPs)
weapon "bb_m249_alt".Primary.Damage = 12
weapon "bb_m249_alt".Primary.Spread = .1
weapon "bb_m249_alt".ViewModelFOV = 90
weapon "bb_m249_alt".SelectiveFire = false

-- M3
weapon "bb_m3_alt".Primary.Damage = 10
weapon "bb_m3_alt".Primary.NumShots = 3
weapon "bb_m3_alt".Primary.Spread = .17
weapon "bb_m3_alt".ViewModelFOV = 90
weapon "bb_m3_alt".SelectiveFire = false

-- M4A1
weapon "bb_m4a1_alt".Primary.Damage = 20
weapon "bb_m4a1_alt".Primary.Spread = .17
weapon "bb_m4a1_alt".Primary.NumShots = 0.7
weapon "bb_m4a1_alt".Primary.RPM = 400
weapon "bb_m4a1_alt".Primary.Delay = 0.1
weapon "bb_m4a1_alt".ViewModelFOV = 90
weapon "bb_m4a1_alt".SelectiveFire = false

weapon "bb_m4a1_cp".Primary.Damage = 22
weapon "bb_m4a1_cp".Primary.Spread = .08
weapon "bb_m4a1_cp".Primary.NumShots = 0.7
weapon "bb_m4a1_cp".Primary.RPM = 500
weapon "bb_m4a1_cp".Primary.Delay = 0.1
weapon "bb_m4a1_cp".ViewModelFOV = 90
weapon "bb_m4a1_cp".SelectiveFire = false

-- MAC10
weapon "bb_mac10_alt".Primary.Damage = 8
weapon "bb_mac10_alt".Primary.Spread = .22
weapon "bb_mac10_alt".ViewModelFOV = 90
weapon "bb_mac10_alt".SelectiveFire = false

-- Armas M9K

-- Winchester
weapon "m9k_winchester73".Primary.Damage = 20
weapon "m9k_winchester73".Primary.Spread = .4
weapon "m9k_winchester73".Primary.RPM = 500
weapon "m9k_winchester73".Primary.ClipSize = 4
weapon "m9k_winchester73".Primary.Ammo = "SniperRound"
weapon "m9k_winchester73".ViewModelFOV = 90
weapon "m9k_winchester73".SelectiveFire = false

-- Winchester
weapon "m9k_acr".Primary.Damage = 15
-- weapon "m9k_acr".Primary.Spread = .4
weapon "m9k_acr".Primary.RPM = 500
weapon "m9k_acr".Primary.ClipSize = 25
weapon "m9k_acr".ViewModelFOV = 90
weapon "m9k_acr".SelectiveFire = false

-- F2000
weapon "m9k_f2000".Primary.Damage = 9
weapon "m9k_f2000".Primary.RPM = 1000
weapon "m9k_f2000".Primary.Ammo = "AR2"
weapon "m9k_f2000".ViewModelFOV = 90

-- AUG
weapon "m9k_auga3".Primary.Damage = 8
weapon "m9k_auga3".Primary.RPM = 1000
weapon "m9k_auga3".ViewModelFOV = 90

-- ACR
weapon "m9k_acr".Primary.Damage = 8
weapon "m9k_acr".Primary.RPM = 600
weapon "m9k_acr".ViewModelFOV = 90

-- SPAS
weapon "m9k_spas12".Primary.Damage = 2
weapon "m9k_spas12".Primary.RPM = 55
weapon "m9k_spas12".ViewModelFOV = 90

-- Magnunson 4000
weapon "m9k_model500".Primary.Damage = 250
weapon "m9k_model500".Primary.RPM = 30
weapon "m9k_model500".Primary.Spread = 0
weapon "m9k_model500".ViewModelFOV = 90

-- Jack Hammer
weapon "m9k_jackhammer".Primary.Damage = 5
weapon "m9k_jackhammer".Primary.RPM = 180
weapon "m9k_jackhammer".Primary.Spread = 0.18
weapon "m9k_jackhammer".ViewModelFOV = 90

-- Winchester Doom
weapon "m9k_1897winchester".Primary.Damage = 6
weapon "m9k_1897winchester".Primary.RPM = 50
weapon "m9k_1897winchester".ViewModelFOV = 90

-- Colt Scoped
weapon "m9k_coltscoped".Primary.Damage = 8
weapon "m9k_coltscoped".Primary.RPM = 600
weapon "m9k_coltscoped".ViewModelFOV = 90

-- Colt VIP
weapon "m9k_glock18_extclip".Primary.Damage = 3
weapon "m9k_glock18_extclip".Primary.RPM = 900
weapon "m9k_glock18_extclip".ViewModelFOV = 90

-- M14
weapon "m9k_m14sp".Primary.Damage = 10
weapon "m9k_m14sp".Primary.RPM = 750
weapon "m9k_m14sp".Primary.ClipSize = 8
weapon "m9k_m14sp".ViewModelFOV = 90

-- Armas VIPs

weapon "weapon_ak47_beast".Primary.Damage = 20
weapon "weapon_ak47_beast".Primary.RPM = 450
weapon "weapon_ak47_beast".Primary.Spread = .24
weapon "weapon_ak47_beast".MeleeDamage = 3
weapon "weapon_ak47_beast".MeleeAttack = 0.4

weapon "weapon_deagle_bornbeast".Primary.Damage = 20
weapon "weapon_deagle_bornbeast".Primary.Spread = .24
weapon "weapon_deagle_bornbeast".MeleeDamage = 3
weapon "weapon_deagle_bornbeast".MeleeAttack = 0.4

weapon "weapon_m4a1_beast".Primary.Damage = 20
weapon "weapon_m4a1_beast".Primary.Spread = .24
weapon "weapon_m4a1_beast".MeleeDamage = 3
weapon "weapon_m4a1_beast".MeleeAttack = 0.4

weapon "pocket".PrintName = "Bolsillo"
weapon "itemstore_pickup".PrintName = "Inventario"
weapon "keys".PrintName = "Llaves"

--------------------------------------------
-- ADD WEAPON SETTINGS ABOVE THIS LINE
-- Also ignore the lines below. They are needed to make this work.
end
hook.Add("OnGamemodeLoaded", "weaponsettings", edit)
hook.Add("OnReloaded", "weaponsettings", edit)

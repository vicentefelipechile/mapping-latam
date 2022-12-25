EML = {}

EML.Stove = {}
EML.Pot = {}
EML.SpecialPot = {}
EML.Sulfur = {}
EML.MuriaticAcid = {}
EML.Iodine = {}
EML.Water = {}
EML.Meth = {}
EML.Meth.Salesman = {}
EML.Jar = {}
EML.Gas = {}

EML.DrawDistance = 256

-- Stove consumption on heat amount.
EML.Stove.Consumption = 1
-- Stove heat amount.
EML.Stove.Heat = 1
-- Amount of gas inside.
EML.Stove.Storage = 600
-- Can grab with gravity gun?
EML.Stove.GravityGun = true
-- 0 - Can't be exploded/destroyed 1 - Can be destroyed without explosion 2 - Explodes after taking amount of damage.
EML.Stove.ExplosionType = 2
-- Stove health if type 1 or 2.
EML.Stove.Health = 400
-- Stove explosion damage if type 2.
EML.Stove.ExplosionDamage = 100
-- Stove smoke color.
EML.Stove.SmokeColor_R = 100
EML.Stove.SmokeColor_G = 100
EML.Stove.SmokeColor_B = 0
-- Stove indicator color.
EML.Stove.IndicatorColor = Color(255, 222, 0, 255)

-- Pot default time.
EML.Pot.StartTime = 60
-- Default time, which will be added to pot on collision with Muriatic Acid.
EML.Pot.OnAdd_MuriaticAcid = 10
-- Default time, which will be added to pot on collision with Liquid Sulfur.
EML.Pot.OnAdd_LiquidSulfur = 10
-- Change to false if you won't water/iodine/acid/sulfur disappear on empty.
EML.Pot.DestroyEmpty = true

-- Special Pot default time.
EML.SpecialPot.StartTime = 60
-- Default time, which will be added to pot on collision with Red Phosphorus.
EML.SpecialPot.OnAdd_RedPhosphorus = 20
-- Default time, which will be added to pot on collision with Crystallized Iodine.
EML.SpecialPot.OnAdd_CrystallizedIodine = 20
-- Change to false if you won't Red Phosphorus/Crystallized Iodine disappear on empty.
EML.SpecialPot.DestroyEmpty = true

-- Default Liquid Sulfur amount.
EML.Sulfur.Amount = 2
EML.Sulfur.Color = Color(243, 213, 19, 255)
-- Default Muriatic Acid amount.
EML.MuriaticAcid.Amount = 3
EML.MuriaticAcid.Color = Color(160, 221, 99, 255)
-- Default Liquid Iodine amount.
EML.Iodine.Amount = 2
EML.Iodine.Color = Color(137, 69, 54, 255)
-- Default Water amount.
EML.Water.Amount = 3
EML.Water.Color = Color(133, 202, 219, 255)

-- Meth value modifier. (1500/lbs)
EML.Meth.ValueMin = 1000
EML.Meth.ValueMax = 3000
-- Meth addicted person (I don't like NPCs at all).
EML.Meth.UseSalesman = true

-- Type 'methbuyer_setpos <name>' to add NPC on map (at your target position and faces to you).
-- Type 'methbuyer_remove <name>' to remove NPC from map.

-- Use text above salesman's head?
EML.Meth.SalesmanText = true
-- Salesman name.
EML.Meth.Salesman.Name = "Traficante de polvo magico"
-- Salesman name color.
EML.Meth.Salesman.Name_Color = Color(1, 241, 249, 255)
-- Salesman phrases if player don't have meth.
EML.Meth.Salesman.NoMeth = {
    "¡No tienes metanfetamina! ¡Fuera de aquí!",
    "¡Tráeme más de esta cosa azul!",
    "Meta, meta, meta?",
    "¡Meta!"
    }
-- Salesman sounds if player don't have meth.
EML.Meth.Salesman.NoMeth_Sound = {
    "vo/npc/male01/gethellout.wav",
    "vo/npc/male01/no02.wav",
    "vo/npc/male01/no01.wav",
    "vo/npc/male01/ohno.wav"    
    }
-- Salesman phrases if player got meth.
EML.Meth.Salesman.GotMeth = {
    "¡Vaya que increible!",
    "Aaagh, se siente bien.",
    "¡Carajo!",
    "¡Eres genial! ¡Traer más!"
    }    
-- Salesman phrases if player don't have meth.    
EML.Meth.Salesman.GotMeth_Sound = {
    "vo/npc/male01/yeah02.wav",
    "vo/npc/male01/finally.wav",
    "vo/npc/male01/oneforme.wav",
    }

-- It starts on 0%.
EML.Jar.StartProgress = 0
-- Minimal speed on shaking. (25 is ok)
EML.Jar.MinShake = 25
-- Minimal speed on shaking. (1000 is ok)
EML.Jar.MaxShake = 1000
-- Progress on correct shaking.
EML.Jar.CorrectShake = 4
-- Progress on correct shaking.
EML.Jar.WrongShake = 1
-- Change to false if you won't acid/iodine/water disappear on empty.
EML.Jar.DestroyEmpty = true

-- Default gas amount in gas canister.
EML.Gas.Amount = 900
-- 0 - Can't be exploded/destroyed 1 - Can be destroyed without explosion 2 - Explodes instantly.
EML.Gas.ExplosionType = 0
-- Removes when out of gas.
EML.Gas.Remove = true

AddCSLuaFile("eml_init.lua")
include("eml_init.lua")
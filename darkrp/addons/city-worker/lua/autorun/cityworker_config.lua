CITYWORKER = CITYWORKER or {}

CITYWORKER.Config = CITYWORKER.Config or {}

--[[
  /$$$$$$  /$$   /$$                     /$$      /$$                     /$$                          
 /$$__  $$|__/  | $$                    | $$  /$ | $$                    | $$                          
| $$  \__/ /$$ /$$$$$$   /$$   /$$      | $$ /$$$| $$  /$$$$$$   /$$$$$$ | $$   /$$  /$$$$$$   /$$$$$$ 
| $$      | $$|_  $$_/  | $$  | $$      | $$/$$ $$ $$ /$$__  $$ /$$__  $$| $$  /$$/ /$$__  $$ /$$__  $$
| $$      | $$  | $$    | $$  | $$      | $$$$_  $$$$| $$  \ $$| $$  \__/| $$$$$$/ | $$$$$$$$| $$  \__/
| $$    $$| $$  | $$ /$$| $$  | $$      | $$$/ \  $$$| $$  | $$| $$      | $$_  $$ | $$_____/| $$      
|  $$$$$$/| $$  |  $$$$/|  $$$$$$$      | $$/   \  $$|  $$$$$$/| $$      | $$ \  $$|  $$$$$$$| $$      
 \______/ |__/   \___/   \____  $$      |__/     \__/ \______/ |__/      |__/  \__/ \_______/|__/      
                         /$$  | $$                                                                     
                        |  $$$$$$/                                                                     
                         \______/                                                                      
                                
                                                v1.0.4
                                    By: Silhouhat (76561198072551027)
                                      Licensed to: 76561198348715045

--]]

-- How often should we check (in seconds) for City Workers with no assigned jobs, so we can give them?
CITYWORKER.Config.Time = 15

-- Configuration for the DarkRP job.
CITYWORKER.Config.Job = {
    name = "Reparador",

    color = Color( 20, 150, 20, 255 ),
    model = "models/huevo/hueito.mdl",
    description = "El reparador que repara\n\n- Tienes que reparar los diferentes puntos del mapa.\n- Tienes herramientas que te pueden ayudar a arreglar esos problemas.\n- Explora zonas que nunca antes habias visto en el mapa.\n- Por cada trabajo bien hecho se te paga.",
    weapons = { "cityworker_pliers", "cityworker_shovel", "cityworker_wrench" },
    command = "cityworker",
    max = 6,
    salary = 75,
    admin = 0,
    vote = false,
    hasLicense = false,
    candemote = false,
    category = "Citizens",
}

------------
-- RUBBLE --
------------

CITYWORKER.Config.Rubble = {}

-- Whether or not rubble is enabled or disabled.
CITYWORKER.Config.Rubble.Enabled = true

-- Rubble models and the range of time (in seconds) it takes to clear them.
CITYWORKER.Config.Rubble.Models = {
    ["models/props_debris/concrete_debris128pile001a.mdl"] = { min = 20, max = 30 },
    ["models/props_debris/concrete_debris128pile001b.mdl"] = { min = 10, max = 15 },
    ["models/props_debris/concrete_floorpile01a.mdl"] = { min = 10, max = 20 },
    ["models/props_debris/concrete_cornerpile01a.mdl"] = { min = 10, max = 20 },
    ["models/props_debris/concrete_spawnplug001a.mdl"] = { min = 5, max = 10 },
    ["models/props_debris/plaster_ceilingpile001a.mdl"] = { min = 10, max = 15 },
}

-- Payout per second it takes to clear a given pile of rubble.
-- (i.e. 10 seconds = 10 * 30 = 300)
CITYWORKER.Config.Rubble.Payout = 35

-------------------
-- FIRE HYDRANTS --
-------------------

CITYWORKER.Config.FireHydrant = {}

-- Whether or not fire hydrants are enabled or disabled.
CITYWORKER.Config.FireHydrant.Enabled = true

-- The range for how long it takes to fix a fire hydrant.
-- Maximum value: 255 seconds.
CITYWORKER.Config.FireHydrant.Time = { min = 30, max = 40 }

-- Payout per second it takes to fix a fire hydrant.
CITYWORKER.Config.FireHydrant.Payout = 10

-----------
-- LEAKS --
-----------

CITYWORKER.Config.Leak = CITYWORKER.Config.Leak or {}

-- Whether or not leaks are enabled or disabled.
CITYWORKER.Config.Leak.Enabled = true

-- The range for how long it takes to fix a leak.
-- Maximum value: 255 seconds.
CITYWORKER.Config.Leak.Time = { min = 10, max = 30 }

-- Payout per second it takes to fix a leak.
CITYWORKER.Config.Leak.Payout = 15

--------------
-- ELECTRIC --
--------------

CITYWORKER.Config.Electric = CITYWORKER.Config.Electric or {}

-- Whether or not electrical problems are enabled or disabled.
CITYWORKER.Config.Electric.Enabled = true

-- The range for how long it takes to fix an electrical problem.
-- Maximum value: 255 seconds.
CITYWORKER.Config.Electric.Time = { min = 40, max = 60 }

-- Payout per second it takes to fix an electrical problem.
CITYWORKER.Config.Electric.Payout = 12

----------------------------
-- LANGUAGE CONFIGURATION --
----------------------------

CITYWORKER.Config.Language = {
    ["FireHydrant"]         = "Reparando boca de incendios...",
    ["Leak"]                = "Arreglando fuga...",
    ["Electric"]            = "Arreglando problema electrico...",
    ["Rubble"]              = "Limpiando escombros...",

    ["CANCEL"]              = "Presiona F2 para cancelar el trabajo.",
    ["PAYOUT"]              = "¡Has ganado %s por tu trabajo!",
    ["CANCELLED"]           = "¡Has cancelado tu trabajo!",
    ["NEW_JOB"]             = "¡Tienes nuevo trabajo que hacer!",
    ["NOT_CITY_WORKER"]     = "¡No eres el reparador de la ciudad!",
    ["JOB_WORKED"]          = "¡Este trabajo ya se est� trabajando!",
    ["ASSIGNED_ELSE"]       = "¡Este trabajo ha sido asignado a otra persona.!",
}
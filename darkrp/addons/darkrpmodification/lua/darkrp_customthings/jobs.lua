--[[---------------------------------------------------------------------------
DarkRP custom jobs
---------------------------------------------------------------------------
This file contains your custom jobs.
This file should also contain jobs from DarkRP that you edited.

Note: If you want to edit a default DarkRP job, first disable it in darkrp_config/disabled_defaults.lua
      Once you've done that, copy and paste the job to this file and edit it.

The default jobs can be found here:
https://github.com/FPtje/DarkRP/blob/master/gamemode/config/jobrelated.lua

For examples and explanation please visit this wiki page:
https://darkrp.miraheze.org/wiki/DarkRP:CustomJobFields

Add your custom jobs under the following line:
---------------------------------------------------------------------------]]
-----------------------legales-------------------
TEAM_CITIZEN = DarkRP.createJob("Ciudadano", {
    color = Color(20, 150, 20, 255),
    model = {
        "models/player/Group01/Female_01.mdl",
        "models/player/Group01/Female_02.mdl",
        "models/player/Group01/Female_03.mdl",
        "models/player/Group01/Female_04.mdl",
        "models/player/Group01/Female_06.mdl",
        "models/player/group01/male_01.mdl",
        "models/player/Group01/Male_02.mdl",
        "models/player/Group01/male_03.mdl",
        "models/player/Group01/Male_04.mdl",
        "models/player/Group01/Male_05.mdl",
        "models/player/Group01/Male_06.mdl",
        "models/player/Group01/Male_07.mdl",
        "models/player/Group01/Male_08.mdl",
        "models/player/Group01/Male_09.mdl"
    },
    description = "El ciudadano\n\n- Es el nivel más básico de la sociedad.\n- No tienes un papel específico en la vida de la ciudad.\n- Puedes escoger cualquier camino que se te de la gana-",
    weapons = {},
    command = "ciudadano",
    max = 0,
    salary = GAMEMODE.Config.normalsalary,
    admin = 0,
    vote = false,
    hasLicense = false,
    candemote = false,
    category = "Citizens",
})

TEAM_RADIO = DarkRP.createJob("Locutor de radio", {
    color = Color(20, 150, 20, 255),
    model = {
        "models/kerosenn/daftpunk/thomas/playermodel/thomas_pm.mdl",
        "models/kerosenn/daftpunk/manuel/playermodel/manuel_pm.mdl"
    },
    description = "El locutor de radio del pueblo\n\n- Puedes comprar una radio con una playlist predeterminada.\n- La musica que retrasmites desde la radio hasta el microfono no se escuchara.\n- Puedes comprar un microfono para trasmitir lo que tengas que decir.\n- Puedes trabajar de manera privada con gente que te necesite.",
    weapons = {},
    command = "locutorradio",
    max = 1,
    salary = GAMEMODE.Config.normalsalary * 4,
    admin = 0,
    vote = false,
    hasLicense = false,
    candemote = true,
    category = "Citizens",
})

TEAM_CITIZEN_VIP = DarkRP.createJob("Ciudadano Clase Alta", {
	color = Color(30, 0, 100, 255),
	model = {
        "models/custom/cmankarthecat/helluvaboss/moxxie_pm.mdl",
        "models/player/raphtalia_low/default_p.mdl"
    },
    description = [[Ciudadanos fachas.]],
    weapons = {},
    command = "citizenvip",
    max = 0,
    salary = GAMEMODE.Config.normalsalary * 2,
    admin = 0,
    vote = false,
    hasLicense = false,
    candemote = false,
    category = "Citizens",
    customCheck = function(ply) return ply:IsUserGroup("vip") or ply:IsUserGroup("mod+") or ply:IsAdmin() or ply:IsSuperAdmin() end,
    CustomCheckFailMsg = "Este trabajo es solo pa vips po."
})
TEAM_GUN = DarkRP.createJob("Armero", {
    color = Color(255, 140, 0, 255),
    model = "models/player/monk.mdl",
    description = "Un comerciante de armas\n\n- Eres la única persona que puede vender armas a otras personas.",
    weapons = {},
    command = "armero",
    max = 3,
    salary = GAMEMODE.Config.normalsalary * 2,
    admin = 0,
    vote = false,
    hasLicense = true,
    category = "Citizens",
})

TEAM_HOBO = DarkRP.createJob("Vagabundo", {
    color = Color(80, 45, 0, 255),
    model = "models/player/corpse1.mdl",
    description = "Persona de escasos recursos\n\n- Todo el mundo se ríe de ti.\n- No tienes hogar.\n- Ruega por tu comida y dinero.\n- Crea tu propia casa de madera en algún lugar en una esquina o afuera de la casa de otra persona",
    weapons = {"weapon_bugbait"},
    command = "vagabundo",
    max = 0,
    salary = 0,
    admin = 0,
    vote = false,
    hasLicense = false,
    candemote = false,
    hobo = true,
    category = "Citizens",
})

TEAM_MEDIC = DarkRP.createJob("Medico", {
    color = Color(47, 79, 79, 255),
    model = "models/player/kleiner.mdl",
    description = "Medico que cura a la gente\n\n- Con tu conocimiento médico, trabaja para restaurar la salud de los jugadores.\n- Sin un médico, la gente no se puede curar.\n- Clic izquierdo con el Kit médico para curar a otros jugadores.\n- Clic derecho con el Kit médico para curarte.",
    weapons = {"med_kit"},
    command = "medico",
    max = 3,
    salary = GAMEMODE.Config.normalsalary * 2,
    admin = 0,
    vote = false,
    hasLicense = false,
    medic = true,
    category = "Citizens",
})
---------------------Ilegales---------------------
TEAM_MOB = DarkRP.createJob("Lider Criminal Xetas", {
    color = Color(25, 25, 25, 255),
    model = "models/player/niko/niko_bellic/nik0.mdl",
    description = "El jefe de la mafia es el jefe de los delincuentes en la ciudad de la banda: Los Xetas\n\n- Puedes cambiar el nombre de la banda si lo deseas con: /job Lider Criminal Banda\n- Con tu poder, coordina a los criminales y forma una organización criminal eficiente.\n- Tienes la capacidad de entrar en casas usando un lockpick.\n- El jefe de la mafia posee la capacidad de desarrestar.",
    weapons = {
        "lockpick",
        "unarrest_stick",
        "keypad_cracker"
    },
    command = "lidercriminalx",
    max = 1,
    salary = GAMEMODE.Config.normalsalary * 1.1,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Gangsters",
})

TEAM_MOB = DarkRP.createJob("Lider Criminal Yetas", {
    color = Color(25, 25, 25, 255),
    model = "models/player/niko/niko_bellic/niko.mdl",
    description = "El jefe de la mafia es el jefe de los delincuentes en la ciudad de la banda: Los Yetas\n\n- Puedes cambiar el nombre de la banda si lo deseas con: /job Lider Criminal Banda\n- Con tu poder, coordina a los criminales y forma una organización criminal eficiente.\n- Tienes la capacidad de entrar en casas usando un lockpick.\n- El jefe de la mafia posee la capacidad de desarrestar.",
    weapons = {
        "lockpick",
        "unarrest_stick",
        "keypad_cracker"
    },
    command = "lidercriminaly",
    max = 1,
    salary = GAMEMODE.Config.normalsalary * 1.1,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Gangsters",
})

TEAM_SICARIO = DarkRP.createJob("Sicario", {
    color = Color(25, 25, 25, 255),
    model = "models/player/custom_player/legacy/tm_jungle_variantb0.mdl",
    description = "El Sicario, Alias Hitman.\n\n- Eres la persona mas odiada de todas.\n- Puedes hacer peticiones de asesinato de cualquier persona.\n- No puedes asesinar al Alcalde/Presidente\n- Puedes usar tus herramientas para entrar a las propiedades por la fuerza si es necesario.\n- Tienes que esperar 5 Minutos antes de volver hacer algun hit.\n- Si fallas en tu hit, debes esperar los 5 minutos de igual manera.",
    weapons = {
        "lockpick",
        "keypad_cracker"
    },
    command = "sicario",
    max = 1,
    salary = GAMEMODE.Config.normalsalary * 1.05,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Gangsters",
})

TEAM_GUN_CLANDESTINO = DarkRP.createJob("Armero Clandestino", {
    color = Color(255, 140, 0, 255),
    model = {
        "models/merchant.mdl",
        "models/player/phoenix.mdl"
    },
    description = "Un comerciante de armas clandestino\n\n- Eres la única persona que puede vender armas a los criminales.\n- No tienes licencia asique ten cuidado cuando vendas tus armas.\n- Solo te limitas a crear una tienda cerca o dentro del grupo de criminales.\n- No puedes asistir en raids, pero puedes proveerles armas y demas a los criminales.",
    weapons = {},
    command = "armeroclandestino",
    max = 2,
    salary = GAMEMODE.Config.normalsalary * 1.1,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Gangsters",
})


TEAM_MEDIC_CRIMINAL = DarkRP.createJob("Medico Clandestino", {
    color = Color(47, 79, 79, 255),
    model = "models/player/guerilla.mdl",
    description = "Medico clandestino que trabaja en las sombras\n\n- Con tu conocimiento médico, trabaja para restaurar la salud de los criminales.\n- Debes curar a los criminales o sino te mataran.\n- A diferencia del medico, tu deber es estar trabajando para los criminales.\n- Los criminales te pueden contratar por tus servicios.\n- Puedes portar armas para ayudar a los criminales en sus actividades.\n- Clic izquierdo con el Kit médico para curar a otros jugadores.\nClic derecho con el Kit médico para curarte.",
    weapons = {"med_kit"},
    command = "medicocriminal",
    max = 2,
    salary = GAMEMODE.Config.normalsalary * 0.75,
    admin = 0,
    vote = false,
    hasLicense = false,
    medic = true,
    category = "Gangsters",
})
TEAM_GANG = DarkRP.createJob("Criminal", {
    color = Color(75, 75, 75, 255),
    model = {
        "models/gang_groove/gang_1.mdl",
        "models/gang_chem/gang_groove_chem.mdl",
        "models/gang_groove/gang_1_blu.mdl",
        "models/gang_chem/gang_groove_chem_blu.mdl"
    },
    description = "La persona más baja del crimen\n\n- Un criminal que trabaja para el Mob Boss, quien dirige la familia del crimen.",
    weapons = {
        "lockpick",
        "keypad_cracker"
    },
    command = "criminal",
    max = 10,
    salary = GAMEMODE.Config.normalsalary * 0.75,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Gangsters",
})

TEAM_FARMEROILEGAL = DarkRP.createJob("Farmero Ilegal", {
    color = Color(75, 75, 75, 255),
    model = "models/player/hostage/hostage_04.mdl",
    description = "El farmero de polvo magico\n\n- Trabajas solo o para cualquier grupo criminal.\n- Puedes comprar materiales para hacer tus polvitos magicos.\n- Puedes ser contratado por el grupo de trabajo CRIMINALES.",
    weapons = {
        "lockpick",
        "keypad_cracker"
    },
    command = "farmeroilegal",
    max = 4,
    salary = GAMEMODE.Config.normalsalary,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Gangsters",
})
--------------------------gubernamentales----------------------
TEAM_CHIEF = DarkRP.createJob("Teniente Protección Civil", {
    color = Color(20, 20, 255, 255),
    model = "models/player/combine_soldier_prisonguard.mdl",
    description = "Líder de la unidad de Protección Civil.\n\n- Coordina la fuerza policial para hacer cumplir la ley en la ciudad.\n- Golpea a un jugador con el stunstick y puede que aprenda a obedecer la ley.\n- Como jefe de la policia, no necesitas un permiso para tirar abajo una puerta con el ariete.\n- Escribe /wanted <nombre> para alertar al público de la presencia de un delincuente.",
    weapons = {
        "bb_glock_cp",
        "bb_m4a1_cp",
        "door_ram",
        "weaponchecker",
        "weapon_cuff_police",
        "riot_shield"
    },
    command = "lidercp",
    max = 1,
    salary = GAMEMODE.Config.normalsalary * 4,
    admin = 0,
    vote = true,
    hasLicense = true,
    chief = true,
    ammo = {
        ["pistol"] = 120,
        ["ar2"] = 450
    },
    category = "Civil Protection",
})

TEAM_MAYOR = DarkRP.createJob("Alcalde", {
    color = Color(150, 20, 20, 255),
    model = {
        "models/player/breen.mdl",
        "models/player/ilbe/seun.mdl",
        "models/player/putin.mdl",
        "models/Lenoax/MauricioMacri_PM.mdl"
    },
    description = "El alcalde de la ciudad\n\n- Crea leyes para gobernar la ciudad.\n- El alcalde, puede crear y aceptar órdenes judiciales.\n- Escribe /wanted <name>  para crear una orden judicial a un jugador.\n- Escribe /lockdown Para iniciar un toque de queda.\n- La policía patrulla la zona.\n- Escribe /unlockdown para terminar un toque de queda.",
    weapons = {
        "bb_glock_cp",
        "bb_m4a1_cp",
        "weapon_cuff_police",
    },
    command = "alcalde",
    max = 1,
    salary = GAMEMODE.Config.normalsalary * 5,
    admin = 0,
    vote = true,
    hasLicense = true,
    mayor = true,
    ammo = {
        ["pistol"] = 200,
        ["ar2"] = 900
    },
    category = "Civil Protection",
    PlayerSpawn = function(ply)
        ply:SetMaxArmor(200)
        ply:SetMaxHealth(200)
        ply:SetHealth(200)
        ply:SetArmor(200)
    end,
})

TEAM_POLICE = DarkRP.createJob("Policia", {
    color = Color(25, 25, 170, 255),
    model = {
        "models/gta5/player/armoredcitycoppm.mdl",
        "models/gta5/player/citycoppm.mdl",
        "models/gta5/player/deputypm.mdl"
    },
    description = "El protector de la ciudad.\n\n- Tienes el poder de arrestar a criminales y proteger a los inocentes.\n- Esposa a un jugador y llevalo a la comisaria para arrestarlo.\n- Golpea a un jugador con el bastón paralizante y puede que aprenda a obedecer la ley.\n- El ariete puede derribar la puerta de un criminal, con una orden de arresto.\n- El ariete también puede descongelar props congelados.\n- Escribe /wanted <nombre> para alertar al público de la presencia de un delincuente.",
    weapons = {
        "bb_glock_cp",
        "bb_m4a1_cp",
        "door_ram",
        "weaponchecker",
        "weapon_cuff_police"
    },
    command = "policia",
    max = 10,
    salary = GAMEMODE.Config.normalsalary * 3,
    admin = 0,
    vote = false,
    hasLicense = true,
    ammo = {
        ["pistol"] = 100,
        ["ar2"] = 300
    },
    category = "Civil Protection",
})

TEAM_DISTURBE = DarkRP.createJob("Grupo Anti-Disturbios", {
    color = Color(25, 25, 170, 255),
    model = {
        "models/gta5/player/swatpm.mdl",
        "models/bloocobalt/player/l4d/riot_01.mdl",
        "models/bloocobalt/player/l4d/riot_02.mdl",
        "models/bloocobalt/player/l4d/riot_03.mdl",
        "models/bloocobalt/player/l4d/riot_04.mdl",
        "models/bloocobalt/player/l4d/riot_05.mdl",
        "models/bloocobalt/player/l4d/riot_06.mdl",
        "models/bloocobalt/player/l4d/riot_07.mdl",
        "models/bloocobalt/player/l4d/riot_08.mdl",
        "models/bloocobalt/player/l4d/riot_09.mdl"
    },
    description = "Cuerpo Anti-Disturbios\n\nEL USO INNECESARIO O NINGUNA SEÑAL CRIMINAL SERA SANCIONADO\n- Cuando haya golpe de estado o intentos de derrocar al gobierno, debes usar este job.\n- Cuando el alcalde pida que este el Grupo Anti-Disturbios debes usar este job.\n- Tienes el deber de controlar todos los disturbios en la ciudad.\n- Obedece las ordenes del alcalde para realizar tus actividades.\n- Golpea a un jugador con el bastón paralizante y puede que aprenda a obedecer la ley.\n- El ariete puede derribar la puerta de un criminal, con una orden de arresto.\n- El ariete también puede descongelar props congelados.\n- Escribe /wanted <nombre> para alertar al público de la presencia de un delincuente.",
    weapons = {
        "bb_glock_cp",
        "bb_m4a1_cp",
        "door_ram",
        "weaponchecker",
        "weapon_cuff_police",
        "riot_shield"
      "heavy_shield"
    },
    command = "ad",
    max = 10,
    salary = GAMEMODE.Config.normalsalary * 4,
    admin = 0,
    vote = false,
    hasLicense = true,
    ammo = {
        ["pistol"] = 120,
        ["ar2"] = 900
    },
    category = "Civil Protection",
        PlayerSpawn = function(ply)
        ply:SetMaxHealth(100)
        ply:SetHealth(100)
        ply:SetArmor(200)
    end
})
---------------otros------------
TEAM_STAFF = DarkRP.createJob("STAFF", {
    color = Color(30, 30, 30, 255),
    model = {
        "models/player/combine_super_soldier.mdl",
        "models/custom/cmankarthecat/helluvaboss/moxxie_pm.mdl",
        "models/player/raphtalia_low/default_p.mdl"
    },
    description = [[Este job es para administrar el servidor, nada mas.]],
    weapons = {
        "door_ram",
        "arrest_stick",
        "unarrest_stick",
        "stunstick",
        "weaponchecker"
    },
    command = "staff",
    max = 0,
    salary = 0,
    admin = 0,
    vote = false,
    hasLicense = true,
    candemote = false,
    category = "Staff y Moderación",
    customCheck = function(ply) return ply:IsUserGroup("mod") or ply:IsUserGroup("mod+") or ply:IsAdmin() or ply:IsSuperAdmin() end,
    CustomCheckFailMsg = "El pepe"
})
MaxPlayers = game.MaxPlayers()

TEAM_NONE = DarkRP.createJob("none", {
    color = Color(0, 0, 0, 255),
    model = "models/player/raphtalia_low/default_p.mdl",
    description = "None",
    command = "none",
    max = 0,
    salary = 0,
    admin = 1,
    customCheck = function(ply) return ply:IsSuperAdmin() end,
    category = "non_exist"
})
--[[---------------------------------------------------------------------------
Define which team joining players spawn into and what team you change to if demoted
---------------------------------------------------------------------------]]
GAMEMODE.DefaultTeam = TEAM_CITIZEN
--[[---------------------------------------------------------------------------
Define which teams belong to civil protection
Civil protection can set warrants, make people wanted and do some other police related things
---------------------------------------------------------------------------]]
GAMEMODE.CivilProtection = {
    [TEAM_POLICE] = true,
    [TEAM_CHIEF] = true,
    [TEAM_MAYOR] = true,
    [TEAM_DISTURBE] = true,
}
--[[---------------------------------------------------------------------------
Jobs that are hitmen (enables the hitman menu)
---------------------------------------------------------------------------]]
DarkRP.addHitmanTeam(TEAM_SICARIO)
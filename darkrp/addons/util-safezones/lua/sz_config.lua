/**
* General configuration
**/

-- Usergroups allowed to add/modify Safe Zones
SH_SZ.Usergroups = {
	["admin"] = true,
	["superadmin"] = true,
	["owner"] = true,
}

-- If the "Block players from attacking" Safe Zone option is activated,
-- this is the whitelist of SWEPs players are allowed to attack with inside a Safe Zone.
-- Admins are not affected by this option; they can attack with any weapon.
SH_SZ.WeaponWhitelist = {
	["gmod_camera"] = true,
	["weapon_physcannon"] = true,
	["weapon_medkit"] = true,
}

-- Commands to bring up the Safe Zone Editor menu
-- Case/whitespace insensitive, ! commands are automatically replaced by /
SH_SZ.Commands = {
	["/safezones"] = true,
	["/safezone"] = true,
	["/sz"] = true,
}

-- Use Steam Workshop for the content instead of FastDL?
SH_SZ.UseWorkshop = true

-- Controls for the Editor camera.
-- See a full list here: http://wiki.garrysmod.com/page/Enums/KEY
SH_SZ.CameraControls = {
	forward = KEY_W,
	left = KEY_A,
	back = KEY_S,
	right = KEY_D,
}

/**
* HUD configuration
**/

-- Where to display the Safe Zone Indicator on the screen.
-- Possible options: topleft, top, topright, left, center, right, bottomleft, bottom, bottomright
SH_SZ.HUDAlign = "top"

-- Offset of the Indicator relative to its base position.
-- Use this if you want to move the indicator by a few pixels.
SH_SZ.HUDOffset = {
	x = 0,
	y = 0,
	scale = false, -- Set to false/true to enable offset scaling depending on screen resolution.
}

/**
* Advanced configuration
* Edit at your own risk!
**/

SH_SZ.WindowSize = {w = 800, h = 300}

SH_SZ.DefaultOptions = {
	name = "Safe Zone",
	namecolor = "52,152,219",
	hud = true,
	noatk = true,
	nonpc = true,
	noprop = true,
	noveh = true,
	pusg = "",
	ptime = 5,
	entermsg = "",
	leavemsg = "",
}

SH_SZ.MaximumSize = 1024

SH_SZ.DataDirName = "sh_safezones"

SH_SZ.ZoneHitboxesDeveloper = false

SH_SZ.TeleportIdealDistance = 512

/**
* Theme configuration
**/

-- Font to use for normal text throughout the interface.
SH_SZ.Font = "Circular Std Medium"

-- Font to use for bold text throughout the interface.
SH_SZ.FontBold = "Circular Std Bold"

-- Color sheet. Only modify if you know what you're doing
SH_SZ.Style = {
	header = Color(52, 152, 219, 255),
	bg = Color(52, 73, 94, 255),
	inbg = Color(44, 62, 80, 255),

	close_hover = Color(231, 76, 60, 255),
	hover = Color(255, 255, 255, 10, 255),
	hover2 = Color(255, 255, 255, 5, 255),

	text = Color(255, 255, 255, 255),
	text_down = Color(0, 0, 0),
	textentry = Color(236, 240, 241),
	menu = Color(127, 140, 141),

	success = Color(46, 204, 113),
	failure = Color(231, 76, 60),
}

/**
* Language configuration
**/

-- Various strings used throughout the chatbox. Change them to your language here.
-- %s and %d are special strings replaced with relevant info, keep them in the string!

SH_SZ.Language = {
	safezone = "Zona-Segura",
	safezone_type = "Tipo de Zona-Segura",
	cube = "Cubo",
	sphere = "Esfera",

	select_a_safezone = "Selecciona una Zona-Segura",

	options = "Opciones",
	name = "Nombre",
	name_color = "Color del nombre",
	enable_hud_indicator = "Activar HUD indicador",
	delete_non_admin_props = "Eliminar non-admin props",
	delete_vehicles = "Eliminar non-admin vehiculos",
	prevent_attacking_with_weapons = "Bloquear usuarios no-admins de atacar",
	automatically_remove_npcs = "Eliminar NPCs",
	time_until_protection_enables = "Tiempo (en segundos) antes de que la proteccion se active",
	usergroups_with_protection = "Usergroups protegidos (separar con comas, dejalo en blanco para todos)",
	enter_message = "Mensaje de bienvenida",
	leave_message = "Mensaje de despedida",

	will_be_protected_in_x = "Estaras protegido en %d segundos.",
	safe_from_damage = "Estas protegido de cualquier daño.",

	place_point_x = "Place point num. %d with mouse",
	size = "Size",
	finalize_placement = "Finalize placement and then press Confirm",

	add = "Añadir",
	edit = "Editar",
	fill_vertically = "Rellenar verticalmente",
	reset = "Restablecer",
	confirm = "Confirmar",
	teleport_there = "Teletransportarse allí",
	save = "Guardar",
	delete = "Eliminar",
	cancel = "Cancelar",
	move_camera = "Mover Camera",
	rotate_camera = "CLICK-DERECHO: Girar cámara",

	an_error_has_occured = "An error has occured. Please restart the server and try again.",
	not_allowed = "You are not allowed to perform this action.",
	safe_zone_created = "Safe Zone successfully created!",
	safe_zone_edited = "Safe Zone successfully edited!",
	safe_zone_deleted = "Safe Zone successfully deleted!",
}
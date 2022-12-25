return {
	Name = "Español",
	Flag = "flags16/cl.png",
	Phrases = function() return {

		module_name = "Admin Sits",

		NotAllowedInSit = "No puedes hacer esto durante una sit!",
		PlayerMayBeStuck = "PLY_NAME ha sido teletransportado, pero se quedo atrapado!",
		DisconnectedPlayerReconnected = "PLY_NAME PLY_STEAMID de la sit SIT_ID se ha reconectado!",
		NoSitPosition = "No hay ningun lugar sit establecido en este mapa! Escribe !sitpos para establecer una sit.",

		AdminSit = "Admin Sit",
		Unknown = "Desconocido",
		Dismiss = "Ocultar",
		Error = "Error",
		Yes = "Si",
		No = "No",

		LeaveSit = "Irse de Sit",

		Hours = "%s Horas",
		Never = "Nunca",
		VACBans = "Baneos VAC: %s",
		LastBan = "Días desde el ultimo ban: %s",
		GameBans = "Baneos de Juegos: %s",
		TradeBanned = "Baneo de intercambios: %s",
		MemberSince = "Miembro desde: %s",
		CheckPocketNone = "No hay items en el bolsillo",
		NoSteamAPIKey = "El propietario del servidor no ha configurado su clave API de Steam, por lo que esta característica no está disponible :(\nPida al propietario/desarrollador del servidor que configure el archivo gmodadminsuite_steam_apikey.lua en su addon de configuración GmodAdminSuite.",
		CheckSteamFamilySharing_Error = "Se produjo un error al intentar recuperar datos de los servidores de Steam. Estos podrían no estar disponibles.\nAsegúrese de que el propietario del servidor haya configurado la clave API de Steam correcta en el archivo gmodadminsuite_steam_apikey.lua en su addon de configuración GmodAdminSuite.",
		CheckSteamFamilySharingYes = "%s is Steam Family Sharing Garry's Mod with %s.",
		CheckSteamFamilySharingNo = "%s is NOT Steam Family Sharing Garry's Mod with anyone.",

		SteamFriendStatusYes = "%s es amigo de %s en Steam!",
		SteamFriendStatusNo = "%s NO es amigo de %s en Steam!",
		PlayerOfflineError = "El jugador objetivo debe estar en el servidor para realizar esta acción.",

		SteamProfile_Failure = "Error al recuperar el perfil de Steam! (%s)\nVerifique el estado de Steam o su conexión de internet.",
		SteamProfile_CheckGmodPlaytime_Failed = "No se pudo recuperar el tiempo de juego de Gmod del perfil de Steam.\nEs posible que el usuario no haya configurado su perfil de steam o que tenga su configuración de privacidad configurada para ocultar estos datos.",
		SteamProfile_CheckSteamAge_Failed = "No se pudo recuperar la antigüedad de la cuenta de Steam desde el perfil de Steam.\nEs posible que el usuario no haya configurado su perfil de steam o que tenga su configuración de privacidad configurada para ocultar estos datos.",

		NoWeapons = "Sin Armas",
		Screenshot = "Captura de pantalla",
		ScreenshotTip = "Captura de pantalla de %s [%s] tomada en %s",
		ScreenshotTip2 = "Si la captura de pantalla es negra, es posible que un hack esté impidiendo que se tome la captura de pantalla.",

		PlayerLine_Active = "Activo",
		PlayerLine_Inactive = "AFK / Juego minimizado",
		PlayerLine_Unreachable = "Tiempo de espera",

		RemoveFromSit      = "Eliminar de Sit",
		TeleportToSit      = "Teletransportarse a Sit",
		MuteMicrophone     = "Desactivar Micrófono",
		UnmuteMicrophone   = "Activar micrófono",
		DisableTextChat    = "Deshabilitar chat de texto",
		EnableTextChat     = "Habilitar chat de texto",
		SteamProfile       = "Perfil de Steam",
		CopySteamID        = "Copiar SteamID",
		CopySteamID64      = "Copiar SteamID64",
		CopyIPAddress      = "Copiar Dirección IP",
		TakeScreenshot     = "Tomar captura de pantalla",
		CheckWeapons       = "Comprobar Armas",
		CheckSteamFriends  = "Comprobar Amigos de Steam",
		CheckSteamGroups   = "Comprobar Grupos de Steam",
		CheckSteamAge      = "Comprobar Antigüedad de la cuenta de Steam",
		CheckWallet        = "Comprobar Billetera",
		CheckPocket        = "Comprobar Bolsillo",
		CheckValveBans     = "Comprobar Baneos VAC",
		CheckGmodPlaytime  = "Comprobar Tiempo de juego de GMod",
		CheckSteamFamShare = "Comprobar Prestamo Familiar",
		FlashWindow        = "Parpadear Barra de tareas Windows",

		NoPermission = "No tienes permiso para usar el sistema sit!",
		NoPermission_TargetStaff = "No tienes permiso para eliminar a PLY_NAME de una sit.",
		ChatCommand_MultipleMatches = "Encontrado ARG_COUNT en conflicto con nombres de jugadores: MATCH_FAILS - Intenta ser más específico",
		ChatCommand_MatchFailed = "No se pudo encontrar al jugador MATCH_COUNT con nombre que contiene: MATCH_FAILS",
		ChatCommand_MatchFailed_Plural = "No se pudo encontrar a los jugadores MATCH_COUNT con nombres que contengan: MATCH_FAILS",
		ChatCommand_AlreadyInSit = "PLY_NAME ya esta en una sit! Escribe !sits para ver una lista de las sits actualmente activas.",
		ChatCommand_Clash = "No pudimos averiguar qué querías hacer con estos jugadores porque están en diferentes situaciones. - Escribe !sit con un jugador a la vez.",
		ChatCommand_Clash_AddToSit = "PLY_NAME NO esta en sit (MATCH_FAIL)",
		ChatCommand_Clash_RemoveFromSit = "PLY_NAME esta en sit (MATCH_FAIL)",
		ChatCommand_NoResitArgs = "No tiene un sit anterior conocido, o su sit anterior se volvió obsoleto (todos los jugadores se desconectaron)",
		ChatCommand_InviteSent = "Se ha enviado una invitación para unirse a la sesión a PLY_NAME!",

		SitInviteReceivedTitle = "Invitación Admin Sit",
		SitInviteReceived = "%s te ha invitado a una sit, haz clic para unirte!",
		JoinSit = "ENTRAR",

		AddPlayer = "Añadir Jugador",
		AddPlayerEllipsis = "Añadir Jugador...",
		EndSit = "Terminar Sit",
		EndSitAreYouSure = "¿Estás seguro que quieres finalizar esta sit?",
		PlayerAlreadyInSit = "Este jugador ya esta en una sit; Escribe !sits para ver en que sit estan.",
		PlayerInvitedToSit = "El jugador ha sido invitado a la sit!",

		ScreenshotFailedText = "No se pudo cargar la captura de pantalla en el servidor!\nPuede ser que el servidor de capturas de pantalla está inactivo o la red del jugador/servidor está bloqueando las conexiones al servidor de capturas de pantalla.\nLos tramposos pueden causar esto bloqueando el servidor de capturas de pantalla en su red o rompiendo esta función a través de Lua.",
		ScreenshotFailed = "Captura de pantalla fallida",

		AllStaffDisconnected = "Todo el Staff de la sit se han desconectado; la sit ha finalizado.",
		AllPlayersDisconnected = "Todos los jugadores en la sit se han desconectado, se volverán a agregar si se reconectan.",
		AllPlayersDisconnected2 = "Si finaliza la sit, si los jugadores se reconectan, se te notificará.",

		TakingScreenshot = "Tomando captura de pantalla...",
		Staff = "Staff",

		ShowDisconnectReason = "PLY_NAME desconectado del servidor durante una sit (DISCONNECT_REASON)",
		ShowDisconnectReason_NoReason = "PLY_NAME desconectado del servidor durante sit",

		ReloadTip = "Pecargar para admin sit",
		ReloadTipRemove = "Recargar para eliminar de sit",

		SitID = "Sit #%d",
		JoinSitLine = "Entrar a Sit",

		Refresh = "Recargar",

		SitPosFailed = "¡Error al establecer la posición de la sit! Asegúrate de estar en el mundo y no estar atrapado.",
		SitPosSuccess = "Se ha Establecido correctamente la posición de la sit!",

		NoActiveSits = "No hay sits activas",

		--## Admin Prison ##--

		AdminPrison = "Prisión Admin",
		AdminPrison_ChatCommand_NoMatches = "No se pudo encontrar un jugador que coincida con ese nombre, SteamID o SteamID64!",
		AdminPrison_ChatCommand_OverQualified = "Se encontraron ARG_COUNT nombres de jugadores en conflicto: MATCH_FAILS - intenta ser más específico",
		AdminPrison_Prisoner = "Prisionero",
		AdminPrison_ImprisonmentTime = "Tiempo de jail",
		AdminPrison_Reason = "Razón",
		AdminPrison_Imprison = "Encarcelar",
		AdminPrison_PlayerDisconnected = "El jugador se desconectó cuando estabas a punto de encarcelarlo :(",
		AdminPrison_ClickToFocus = "Haga clic para enfocar",
		AdminPrison_NoPermission = "No tienes permiso para usar esto!",
		AdminPrison_SentToPrison_Success = "PLY_NAME ha sido enviado a prisión por RELEASE_TIME",
		AdminPrison_ReleasedFromPrison = "¡Has sido liberado de la jail!",

} end }
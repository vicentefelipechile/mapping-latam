-- Translation by Vicentefelipechile
-- https://www.gmodstore.com/users/Livaco
UltimatePartySystem.Languages["es"] = {
    netCooldown = "Estas enviando demasiadas solicitudes al servidor. Por favor espere un poco.", -- Message to a user who is trying to spam net messages like a bad boi.

    --
    -- Chat Messages
    --
    openingWindow = "Abriendo partys...", -- Message when the user is opening the Party Window.
    noPermission = "No tienes permiso.", -- No permission.
    configUpdate = "La configuración se ha actualizado.", -- Config updated.
    configReset = "La configuración se ha restablecido correctamente.", -- Config reset.

    partyCreationAlreadyOwned = "Ya tienes una party.", -- User trying to make a party while already owning one.
    partyCreationNameTooLong = "El nombre es demasiado largo, no debe ser más largo de %s caracteres.", -- Party name is too long. %s is the amount of characters.
    partyCreationTooManySlots = "La party no puede tener más de %s espacios.", -- Party tried to have too many slots. %s is the amount of slots.
    partyCreationTooLittleSlots = "La party no puede tener menos de 2 espacios.", -- Party tried to have less than 2 slots.
    partyCreationCannotAfford = "No puedes pagar lo suficiente (%s) para crear una party.", -- Can't afford to make a party. %s is the fee for making a party.
    partyCreationSuccessfull = "Party creata: %s", -- Party created. %s is the name of the party.

    partyInviteOof = "No eres dueño de una party.", -- Player tries to invite a player to a party when they don't own one.
    partyInviteAlreadyIn = "%s ya está en una party.", -- Player invited to party when they are already in a party. %s is the player name.
    partyInviteDone = "%s invito a %s a la party.", -- Player invites another player to a lobby. %s is the invitee, followed by the invited.
    partyInvited = "%s te ha invitado a '%s'. Acepta esta invitacion en el menu de partys.", -- Player invited to party. %s is the invitee, followed by the party name.
    partyInviteTimeout = "Se agotó el tiempo de espera de la invitación de %s.", -- Party invite timed out. %s is the inviter.
    partyInviteTimeoutOwner = "Se agotó el tiempo de espera de tu invitación a la party de %s.", -- Owner informed Party invite timed out. %s is the invited.

    partyJoinAlreadyIn = "Ya estás en una party.", -- Player tries to join a party while already being in one.
    partyJoinDoesNotExist = "La party no existe.", -- Player tries to join a party that doesn't exist.
    partyJoinIsFull = "La party está llena.", -- Party is full.
    partyJoinSuccess = "Entrastes a la party '%s'.", -- Player joined a party. %s is the party name.

    partyLeaveSuccess = "Has salido de la Party '%s'.", -- Player leaving a party. %s is the party name.
    partyLeaveFromKicked = "Te han expulsado de la party '%s'.", -- Player being kicked from a party. %s is the party name.

    partyLeaveDisbanded = "La party '%s' se ha disuelto, por lo que has sido eliminado.", -- Party has been deleted. %s is the party name.

    partyOwnerPlayerJoin = "%s se ha unido a la party.", -- Player joined a party. %s is the party name.
    partyOwnerPlayerLeave = "'%s' ha dejado la party.", -- Player leaving a party. %s is the users name.
    partyOwnerPlayerDisconnect = "%s se ha desconectado y se fue de la party.", -- Player disconnected forcing them out the party. %s is the player name.
    partyOwnerPlayerKicked = "%s has sido expulsado.", -- Player kicked from the party. %s is the name.
    partyOwnerPartyDisband = "La party '%s' se ha disuelto.", -- Party disbanded. %s is the party name.

    partyOwnerEditOof = "No eres dueño de esta Party.", -- Player tries to change party without owning it.
    partyOwnerEditNotEnoughSlotsForPlayers = "No puedes cambiar los espacios de la party a un numero menor de los miembros de la party.", -- Player tries to change party slots to be lower than the player count.
    partyOwnerEditSuccess = "Party actualizada.", -- Player updates their party's settings successfully.

    partyOwnerDeleteOof = "No eres dueño de esta party.", -- Player tries to delete a party without owning it.

    partyOwnerKickNotFound = "No se pudo encontrar al jugador.", -- Player tries to kick a nonexistent player from their party.
    partyOwnerKickOof = "No eres dueño de esta party.", -- Player tries to kick a player from their party without owning one.

    partyChatPrefix = "[UPS] %s >>", -- Party Chat prefix. %s is the player's name.


    --
    -- VGUI
    --
    primaryWindowTitle = "SISTEMA DE PARTY", -- Main Window title. All caps for a s t e t i c s.
    primaryWindowViewPartiesTab = "Ver partys", -- View Parties button.
    primaryWindowCreatePartyTab = "Crear party", -- Create Party button.
    primaryWindowViewPartyTab = "Ver party", -- View Party button.
    primaryWindowSettingsTab = "Configuración", -- Settings button.

    viewPartyOwnedBy = "Propiedad de %s", -- Party owned by text. %s is the user's name.
    viewPartyInside = "Ya estás en una Party.", -- Text is user is viewing a party they're in.
    viewPartySlots = "%s de %s espacios", -- Party slots text. %s is the players in the party, followed by the total slots.
    viewPartyJoin = "ENTRAR PARTY", -- Join Party text.
    viewPartyAcceptInvite = "ACEPTAR INVITACIÓN", -- Accept Invite text.
    viewPartyLeave = "SALIR", -- Leave button.
    thereIsNoPartyTakeOffYourClothes = "No hay partys ahora mismo.", -- No partys.

    createPartyName = "¿Nombre de tu party?", -- Name of a new party field.
    createPartyPrivate = "¿Party Privada?", -- Private party field.
    createPartySlots = "Numero de espacios", -- Slots field.
    createPartyOwners = "Añadir propietarios", -- Other Owners header.
    createPartySubmit = "CREAR PARTY", -- Create Party button.
    createPartySubmitCostly = "CREAR PARTY (COSTE %s)", -- Create Party button if there is a cost too. %s it the formatted cost.

    viewPartyEditHeader = "EDITAR PARTY", -- Edit Party header when viewing your own party.
    viewPartyEditPrivate = "¿Party Privada?", -- Edit Party private party header.
    viewPartyEditSlots = "Numero de espacios", -- Edit Party slots header.
    viewPartyEditSaveButton = "GUARDAR AJUSTES", -- Save party settings button.
    viewPartyEditDeleteButton = "BORRAR PARTY", -- Delete party button.
    viewPartyPlayerListHeader = "LISTA DE JUGADORES", -- Player List.
    viewPartyPlayerListOwner = "(Dueño)", -- Owner on the Player List.
    viewPartyPlayerListInvite = "INVITAR JUGADORES", -- Invite Players button.

    deletePartyTitle = "¿Borrar Party?", -- Title for the delete party vgui.
    deletePartyButton = "Confirmar", -- Confirm Button for the delete party vgui.

    invitePlayerTitle = "Invita a un jugador", -- Invite a player vgui title.
    invitePlayerMessage = "Selecciona un jugador.", -- Message inside the VGUI.
    invitePlayerButton = "Enviar invitacion", -- Message inside the VGUI.

    configWindowTitle = "AJUSTES DEL ULTIMATE PARTY SYSTEM", -- Config Window title
    configResetHeader = "¿Estás seguro en restablecer la configuración?", -- Config Reset Header
    configResetSubHeader = "No se puede deshacer.", -- Config Reset Sub-Header
    configResetConfirmButton = "Confirmar", -- Config Reset Button

    actionMenuTitle = "MENU DE ACCIONES", -- Action Menu
    actionMenuCreateMarker = "Crear marcador", -- Create Marker
    actionMenuClearMarker = "Borrar marcador", -- Clear Marker
    actionMenuRadioToggle = "Alternar radio", -- Toggle Radio

    cancelButton = "Cancelar", -- Cancel button.


    --
    -- Config Localisation
    --
    -- Fuck off if you think for a SECOND im commenting all this fucking shit. Figure it out youself. I'm writing these localisation vars at 2:20am on a school night, gimme a fuckin break.
    -- Translater: XD
    -- Lugent: Do better translation.

    -- General
    configPrefixName = "Prefijo de la party",
    configPrefixDescription = "El prefijo de todos los mensajes en chat.",

    configPrefixColorName = "Color del prefijo",
    configPrefixColorDescription = "El color del prefijo.",

    configMessageColorName = "Color del mensaje",
    configMessageColorDescription = "El color del resto del mensaje.",

    configThemeColorName = "Colo del tema",
    configThemeColorDescription = "El color del tema de cada interfaz.",

    configMoneyFormatName = "Formato monetario",
    configMoneyFormatDescription = "Como sera el formato monetario, %s es la cantidad de dinero en comas.",

    -- User Interface
    configChatCommandName = "Comando del chat",
    configChatCommandDescription = "El comando para abrir el menu de partys.",

    configHideCommandName = "Ocultar comando del chat",
    configHideCommandDescription = "Si ocultarse del chat cuando se usa.",

    configUIMessageName = "Mostrar mensaje al abrir interfaz",
    configHideCommandDescription = "Si enviar un mensaje en chat cuando se abre el menu.",

    -- Parties
    configMaxNameLengthName = "Longitud máxima del nombre de la Party",
    configMaxNameLengthDescription = "La longitud máxima que puede tener un nombre de una Party.",

    configAllowPrivatePartiesName = "Permitir Partys Privadas",
    configAllowPrivatePartiesDescription = "Si los usuarios pueden hacer Partys privadas.",

    configMaxSlotsName = "Maximo de espacios",
    configMaxSlotsDescription = "El limite de espacios de una party.",

    configDefaultSlotsName = "Espacios por defecto",
    configDefaultSlotsDescription = "La cantidad de espacios por defecto de una Party.",

    configPartyCreationCostName = "Coste de creación de la party",
    configPartyCreationCostDescription = "El costo de crear una party. Si el coste es cero, no se cobrara nada",

    -- Misc
    configRadioEnabledName = "Radio activada",
    configRadioEnabledDescription = "Habilita la radio.",

    configMarkerEnabledName = "Marcador activado",
    configMarkerEnabledDescription = "Habilita los marcadores.",

    configInviteTimeoutName = "Maximo tiempo de espera de la invitación",
    configInviteTimeoutDescription = "El tiempo limite de espera de una invitación a la party en segundos.",

    configEnableFriendlyFireName = "Fuego amigo habilitado",
    configEnableFriendlyFireDescription = "Habilitar fuego amigo en la party.",

    configEnablePartyChatName = "Chat de la party activado",
    configEnablePartyChatDescription = "Habilita el chat de la party.",

    configPartyChatCommandName = "Comando del chat de la party",
    configPartyChatCommandDescription = "El comando para enviar un mensaje al chat de la party.",

    -- Client Based Settings
    clientConfigDrawHUDName = "Mostrar HUD",
    clientConfigDrawHUDDescription = "Mostrar HUD de la party.",

    clientConfigHUDXName = "Posición X del HUD",
    clientConfigHUDXDescription = "La posición X del HUD.",

    clientConfigHUDYName = "Posición Y del HUD",
    clientConfigHUDYDescription = "La posición Y del HUD.",

    clientConfigHUDOpacityName = "Translucencia del HUD",
    clientConfigHUDOpacityDescription = "La translucencia del HUD.",

    clientConfigDrawMarkersName = "Mostrar Marcadores",
    clientConfigDrawMarkersDescription = "Mostrar los marcadores de los miembros de la party.",

    clientConfigDisplayPartyChatName = "Desactivar chat de party",
    clientConfigDisplayPartyChatDescription = "Alternar el chat de la party.",
}

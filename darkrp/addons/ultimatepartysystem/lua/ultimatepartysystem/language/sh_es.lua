-- Translation by Vicentefelipechile
-- https://www.gmodstore.com/users/Livaco
UltimatePartySystem.Languages["es"] = {
    netCooldown = "Estas enviando demasiadas solicitudes al servidor. Por favor espera un poco.", -- Message to a user who is trying to spam net messages like a bad boi.

    --
    -- Chat Messages
    --
    openingWindow = "Abriendo la ventana Party...", -- Message when the user is opening the Party Window.
    noPermission = "No tienes permiso para acceder a esto.", -- No permission.
    configUpdate = "La configuración se ha actualizado.", -- Config updated.
    configReset = "La configuración se ha restablecido correctamente.", -- Config reset.

    partyCreationAlreadyOwned = "Ya tienes una Party.", -- User trying to make a party while already owning one.
    partyCreationNameTooLong = "Tu nombre es demasiado largo, no debe ser más largo que %s caracteres.", -- Party name is too long. %s is the amount of characters.
    partyCreationTooManySlots = "Tu Party no puede tener más de %s slots.", -- Party tried to have too many slots. %s is the amount of slots.
    partyCreationTooLittleSlots = "Tu Party no puede tener menos de 2 slots.", -- Party tried to have less than 2 slots.
    partyCreationCannotAfford = "No puedes pagar la tarifa de %s para crear una Party.", -- Can't afford to make a party. %s is the fee for making a party.
    partyCreationSuccessfull = "Se ha creado tu Party '%s'.", -- Party created. %s is the name of the party.

    partyInviteOof = "No eres dueño de una Party.", -- Player tries to invite a player to a party when they don't own one.
    partyInviteAlreadyIn = "%s ya está en una Party.", -- Player invited to party when they are already in a party. %s is the player name.
    partyInviteDone = "%s invito a %s a la Party.", -- Player invites another player to a lobby. %s is the invitee, followed by the invited.
    partyInvited = "%s te ha invitado a '%s'. Acepta esta invitacion en el menu de Partys.", -- Player invited to party. %s is the invitee, followed by the party name.
    partyInviteTimeout = "Se agotó el tiempo de espera de la invitación de %s.", -- Party invite timed out. %s is the inviter.
    partyInviteTimeoutOwner = "Se agotó el tiempo de espera de tu invitación a la Party de %s.", -- Owner informed Party invite timed out. %s is the invited.

    partyJoinAlreadyIn = "Ya estás en una Party.", -- Player tries to join a party while already being in one.
    partyJoinDoesNotExist = "Esta Party no existe.", -- Player tries to join a party that doesn't exist.
    partyJoinIsFull = "Esa Party está llena.", -- Party is full.
    partyJoinSuccess = "Te has unido a la Party '%s'.", -- Player joined a party. %s is the party name.

    partyLeaveSuccess = "Te has ido de la Party '%s'.", -- Player leaving a party. %s is the party name.
    partyLeaveFromKicked = "Te han expulsado de la Party '%s'.", -- Player being kicked from a party. %s is the party name.

    partyLeaveDisbanded = "La Party '%s' se ha disuelto, por lo que has sido eliminado.", -- Party has been deleted. %s is the party name.

    partyOwnerPlayerJoin = "%s se ha unido a tu Party.", -- Player joined a party. %s is the party name.
    partyOwnerPlayerLeave = "'%s' ha dejado tu Party.", -- Player leaving a party. %s is the users name.
    partyOwnerPlayerDisconnect = "%s se ha desconectado y se ha ido de la party.", -- Player disconnected forcing them out the party. %s is the player name.
    partyOwnerPlayerKicked = "%s has sido expulsado.", -- Player kicked from the party. %s is the name.
    partyOwnerPartyDisband = "Tu Party '%s' se ha disuelto.", -- Party disbanded. %s is the party name.

    partyOwnerEditOof = "No eres dueño de esta Party.", -- Player tries to change party without owning it.
    partyOwnerEditNotEnoughSlotsForPlayers = "Tu recuento de slots no puede ser menor que la cantidad de jugadores en tu Party.", -- Player tries to change party slots to be lower than the player count.
    partyOwnerEditSuccess = "Tu Party ha sido actualizada.", -- Player updates their party's settings successfully.

    partyOwnerDeleteOof = "No eres dueño de esta Party.", -- Player tries to delete a party without owning it.

    partyOwnerKickNotFound = "No se pudo encontrar ese jugador.", -- Player tries to kick a nonexistent player from their party.
    partyOwnerKickOof = "No eres dueño de esta Party.", -- Player tries to kick a player from their party without owning one.

    partyChatPrefix = "[UPS] %s >>", -- Party Chat prefix. %s is the player's name.


    --
    -- VGUI
    --
    primaryWindowTitle = "PARTY SYSTEM", -- Main Window title. All caps for a s t e t i c s.
    primaryWindowViewPartiesTab = "Ver Partys", -- View Parties button.
    primaryWindowCreatePartyTab = "Crear Party", -- Create Party button.
    primaryWindowViewPartyTab = "Ver Party", -- View Party button.
    primaryWindowSettingsTab = "Configuración", -- Settings button.

    viewPartyOwnedBy = "Propiedad de %s", -- Party owned by text. %s is the user's name.
    viewPartyInside = "Ya estás en una Party.", -- Text is user is viewing a party they're in.
    viewPartySlots = "%s/%s Slots", -- Party slots text. %s is the players in the party, followed by the total slots.
    viewPartyJoin = "ENTRAR PARTY", -- Join Party text.
    viewPartyAcceptInvite = "ACEPTAR INVITACION", -- Accept Invite text.
    viewPartyLeave = "SALIR", -- Leave button.
    thereIsNoPartyTakeOffYourClothes = "No hay Partys ahora mismo.", -- No partys.

    createPartyName = "¿Nombre de tu Party?", -- Name of a new party field.
    createPartyPrivate = "¿Party Privada?", -- Private party field.
    createPartySlots = "Numero de Slots", -- Slots field.
    createPartyOwners = "Agregar propietarios", -- Other Owners header.
    createPartySubmit = "CREAR PARTY", -- Create Party button.
    createPartySubmitCostly = "CREAR PARTY (COSTO %s)", -- Create Party button if there is a cost too. %s it the formatted cost.

    viewPartyEditHeader = "EDITAR PARTY", -- Edit Party header when viewing your own party.
    viewPartyEditPrivate = "¿Party Privada?", -- Edit Party private party header.
    viewPartyEditSlots = "Numero de Slots", -- Edit Party slots header.
    viewPartyEditSaveButton = "GUARDAR AJUSTES", -- Save party settings button.
    viewPartyEditDeleteButton = "BORRAR PARTY", -- Delete party button.
    viewPartyPlayerListHeader = "PLAYER LIST", -- Player List.
    viewPartyPlayerListOwner = "(Dueño)", -- Owner on the Player List.
    viewPartyPlayerListInvite = "INVITAR JUGADORES", -- Invite Players button.

    deletePartyTitle = "Borrar Party?", -- Title for the delete party vgui.
    deletePartyButton = "Confirmar", -- Confirm Button for the delete party vgui.

    invitePlayerTitle = "Invita a un jugador a tu Party", -- Invite a player vgui title.
    invitePlayerMessage = "Selecciona un jugador para invitar.", -- Message inside the VGUI.
    invitePlayerButton = "Enviar invitacion", -- Message inside the VGUI.

    configWindowTitle = "ULTIMATE PARTY SYSTEM CONFIG", -- Config Window title
    configResetHeader = "¿Estás seguro de que quieres restablecer toda la configuración?", -- Config Reset Header
    configResetSubHeader = "Esto no se puede deshacer.", -- Config Reset Sub-Header
    configResetConfirmButton = "Confirmar", -- Config Reset Button

    actionMenuTitle = "ACTION MENU", -- Action Menu
    actionMenuCreateMarker = "Crear Marcador", -- Create Marker
    actionMenuClearMarker = "Borrar Marcador", -- Clear Marker
    actionMenuRadioToggle = "Alternar Radio", -- Toggle Radio

    cancelButton = "Cancelar", -- Cancel button.


    --
    -- Config Localisation
    --
    -- Fuck off if you think for a SECOND im commenting all this fucking shit. Figure it out youself. I'm writing these localisation vars at 2:20am on a school night, gimme a fuckin break.
    -- Translater: XD

    -- General
    configPrefixName = "Prefijo",
    configPrefixDescription = "The prefix for all chat messages.",

    configPrefixColorName = "Prefijo Color",
    configPrefixColorDescription = "The color of the prefix.",

    configMessageColorName = "Mensaje Color",
    configMessageColorDescription = "The color of the rest of a message.",

    configThemeColorName = "Tema Color",
    configThemeColorDescription = "The theme color of every UI.",

    configMoneyFormatName = "Formato Dinero",
    configMoneyFormatDescription = "How money is formatted. %s is the amount of money with commas.",

    -- User Interface
    configChatCommandName = "Chat Comando",
    configChatCommandDescription = "El comando para abrir el menu.",

    configHideCommandName = "Ocultar Chat Comando",
    configHideCommandDescription = "Si el comando debe ocultarse del chat cuando se usa.",

    configUIMessageName = "Mostrar UI Mensaje de apertura",
    configHideCommandDescription = "Si el addon debe enviar un mensaje de chat cuando se abre el menu.",

    -- Parties
    configMaxNameLengthName = "Longitud máxima del nombre de la Party",
    configMaxNameLengthDescription = "La longitud máxima que puede tener un nombre de una Party.",

    configAllowPrivatePartiesName = "Permitir Partys Privadas",
    configAllowPrivatePartiesDescription = "Si los usuarios pueden hacer Partys privadas.",

    configMaxSlotsName = "Slots Maximos",
    configMaxSlotsDescription = "Los espacios/slots máximos que puede tener una Party.",

    configDefaultSlotsName = "Slots Predeterminados",
    configDefaultSlotsDescription = "La cantidad predeterminada de espacios/slots que tiene una Party.",

    configPartyCreationCostName = "Costo para Crear Party",
    configPartyCreationCostDescription = "Cuánto cuesta crear una Party. Establece esto en cero para dejarlo sin costo alguno.",

    -- Misc
    configRadioEnabledName = "Radio Activa",
    configRadioEnabledDescription = "Habilita la función de radio.",

    configMarkerEnabledName = "Marcador Activo",
    configMarkerEnabledDescription = "Habilita la función de Marcador.",

    configInviteTimeoutName = "Party Invite Timeout",
    configInviteTimeoutDescription = "Cuánto tiempo debe pasar antes de que se agote el tiempo de espera de una invitación a una fiesta en segundos.",

    configEnableFriendlyFireName = "Activar Friendly Fire",
    configEnableFriendlyFireDescription = "Si el addon debe permitir el fuego amigo para dos personas en el mismo grupo.",

    configEnablePartyChatName = "Activar Party Chat",
    configEnablePartyChatDescription = "Si el addon debe habilitar la función de chat de grupo.",

    configPartyChatCommandName = "Party Chat Comando",
    configPartyChatCommandDescription = "El comando para enviar un menasje a Party Chat.",

    -- Client Based Settings
    clientConfigDrawHUDName = "Dibujar HUD",
    clientConfigDrawHUDDescription = "Dibujar Party HUD.",

    clientConfigHUDXName = "HUD Eje X",
    clientConfigHUDXDescription = "El desplazamiento de la posición Eje X para el HUD.",

    clientConfigHUDYName = "HUD Eje Y",
    clientConfigHUDYDescription = "El desplazamiento de la posición Eje Y para el HUD.",

    clientConfigHUDOpacityName = "Transparencia del HUD",
    clientConfigHUDOpacityDescription = "La transparencia del HUD.",

    clientConfigDrawMarkersName = "Dibujar Marcadores",
    clientConfigDrawMarkersDescription = "Si el addon debe dibujar los marcadores.",

    clientConfigDisplayPartyChatName = "Desactivar Party Chat",
    clientConfigDisplayPartyChatDescription = "Si el addon debe mostrar mensajes de chat de grupo.",
}

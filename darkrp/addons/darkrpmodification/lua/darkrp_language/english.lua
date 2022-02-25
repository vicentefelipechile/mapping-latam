--[[-----------------------------------------------------------------------
English (example) language file
---------------------------------------------------------------------------
This is the english language file. The things on the left side of the equals sign are the things you should leave alone
The parts between the quotes are the parts you should translate. You can also copy this file and create a new language.

= Warning =
Sometimes when DarkRP is updated, new phrases are added.
If you don't translate these phrases to your language, it will use the English sentence.
To fix this, join your server, open your console and enter darkp_getphrases yourlanguage
For English the command would be:
    darkrp_getphrases "en"
because "en" is the language code for English.

You can copy the missing phrases to this file and translate them.

= Note =
Make sure the language code is right at the bottom of this file

= Using a language =
Make sure the convar gmod_language is set to your language code. You can do that in a server CFG file.
---------------------------------------------------------------------------]]

local my_language = {
    -- Admin things
    need_admin = "Necesitas privilegios de administrador para usar %s.", --"You need admin privileges in order to be able to %s",
    need_sadmin = "Necesitas privilegios de super administrador para usar %s.", --"You need super admin privileges in order to be able to %s",
    no_privilege = "No tienes privilegios para hacer esta acción.", --"You don't have the right privileges to perform this action",
    no_jail_pos = "No hay posiciones de la carcel establecidas.", --"No jail position",
    invalid_x = "%s invalido. %s", --"Invalid %s! %s",

    -- F1 menu
    f1ChatCommandTitle = "Comandos de Chat",
    f1Search = "Buscar...",

    -- Money things:
    price = "Precio: %s%d",
    priceTag = "Precio: %s",
    reset_money = "%s renicio el dinero de todos.",
    has_given = "%s te ha dado %s",
    you_gave = "Te dio %s %s",
    npc_killpay = "Ganaste %s por matar un NPC.",
    profit = "beneficio",
    loss = "perdida",
    Donate = "Donar",
    you_donated = "Has donado %s a %s.",
    has_donated = "%s ha donado %s.",

    -- backwards compatibility
    deducted_x = "Deducido %s%d",
    need_x = "Necesita %s%d",

    deducted_money = "Deducido %s",
    need_money = "Necesita %s",

    payday_message = "Dia de pago. Recibiste %s.",
    payday_unemployed = "No recibistes salario que esta desempleado.",
    payday_missed = "No recibistes nada porque esta arrestado.",

    property_tax = "Impuesto de propiedad de %s",
    property_tax_cant_afford = "No pagaste impuestos. Tu propiedad a sido removido.",
    taxday = "Dia de impuestos. Pagaste %s%%.",

    found_cheque = "Encontrastes %s%s en un cheque hecho para ti por %s.",
    cheque_details = "El cheque esta hecho por %s.",
    cheque_torn = "Rompistes el cheque.",
    cheque_pay = "Pago: %s",
    signed = "Firmado: %s",

    found_cash = "Obtuviste %s%d.", -- backwards compatibility
    found_money = "Obtuviste %s.",

    owner_poor = "El dueño de %s es muy pobre para subvencionar esta venta.",

    -- Police
    Wanted_text = "Buscado",
    wanted = "Buscado por la policia.\nRazón: %s",
    youre_arrested = "Esta arrestado por %d segundos.",
    youre_arrested_by = "Arrestado por %s.",
    youre_unarrested_by = "Desarrestado por %s.",
    hes_arrested = "%s fue arrestado por %d segundos.",
    hes_unarrested = "%s salio de la carcel.",
    warrant_ordered = "%s ordeno una orden para %s. Razón: %s",
    warrant_request = "%s pide una orden para %s\nRazón: %s",
    warrant_request2 = "Orden enviado al Alcalde %s!",
    warrant_approved = "Orden de busqueda aprovado para %s .\nRazón: %s\nSolicitado por: %s",
    warrant_approved2 = "Ahora puede buscar en su casa.",
    warrant_denied = "El Alcalde %s rechazo su petición del orden.",
    warrant_expired = "La orden para %s ha expirado.",
    warrant_required = "Necesita una orden para poder abrir esta puerta.",
    warrant_required_unfreeze = "Necesita una orden para poder descongelar este prop.",
    warrant_required_unweld = "Necesita una orden para poder desoldar este prop.",
    wanted_by_police = "%s esta buscado por la policia\nRazón: %s\nSolicitado por: %s",
    wanted_by_police_print = "%s hizo %s buscado, razón: %s",
    wanted_expired = "%s no esta buscado por la policia.",
    wanted_revoked = "%s no esta buscado por la policia.\nRevocado por: %s",
    cant_arrest_other_cp = "No puede arrestar otros policias.",
    must_be_wanted_for_arrest = "El jugador debe estar buscado para poder arrestarlo.",
    cant_arrest_fadmin_jailed = "No puede arrestar a un jugador la cual esta encarcelado por un administrador.",
    cant_arrest_no_jail_pos = "No puede arrestar jugadores desde que no hay posiciones de la carcel establecidas",
    cant_arrest_spawning_players = "No puede arrestar jugadores que estan apareciendo.",

    suspect_doesnt_exist = "El sospechoso no existe.",
    actor_doesnt_exist = "El actor no existe.",
    get_a_warrant = "Obtener una orden",
    remove_a_warrant = "Remover una orden",
    make_someone_wanted = "Hacer a alguien buscado",
    remove_wanted_status = "Remover estado de buscado",
    already_a_warrant = "Ya hay una orden para este sospechoso.",
    not_warranted = "No hay una orden para esta persona.",
    already_wanted = "El sospechoso ya esta buscado.",
    not_wanted = "El sospechoso no esta buscado.",
    need_to_be_cp = "Debes ser miembro de la fuerza policial.",
    suspect_must_be_alive_to_do_x = "El sospechoso debe estar vivo para %s.",
    suspect_already_arrested = "El sospechoso ya esta en carcel.",

    -- Players
    health = "Vida: %s",
    job = "Trabajo: %s",
    salary = "Salario: %s%s",
    wallet = "Billetera: %s%s",
    weapon = "Arma: %s",
    kills = "Asesinatos: %s",
    deaths = "Muertes: %s",
    rpname_changed = "%s cambio su nombre a %s",
    disconnected_player = "Jugador desconectado",
    player = "Jugador",

    -- Teams
    need_to_be_before = "Necesita ser %s primero para poder ser %s.",
    need_to_make_vote = "Necesita hacer una votación para poder ser %s.",
    team_limit_reached = "No puede ser %s debido a limites.",
    wants_to_be = "%s\nquiere ser\n%s",
    has_not_been_made_team = "%s no se volvio %s.",
    job_has_become = "%s se ha vuelto %s.",

    -- Disasters
    meteor_approaching = "ADVERTENCIA: Tormenta de meteoros aproximandose.",
    meteor_passing = "Ha pasado la tormenta de meteoros.",
    meteor_enabled = "Tormentas de meteoros activado.",
    meteor_disabled = "Tormentas de meteoros desactivado.",
    earthquake_report = "Terremoto reportado de magnitud %sMw.",
    earthtremor_report = "Temblor reportado de magnitud %sMw.",

    -- Keys, vehicles and doors
    keys_allowed_to_coown = "puede ser co-propietario de esto.\n(Usa Recargar con llaves o F2)\n",
    keys_other_allowed = "Co-propietario permitidos:",
    keys_allow_ownership = "(Usa Recargar con llaves o F2 para permitir propietarios)",
    keys_disallow_ownership = "(Usa Recargar con llaves o F2 para denegar propietarios)",
    keys_owned_by = "Propietario de:",
    keys_unowned = "Sin propietario\n(Usa Recargar con llaves o F2 para reclamarlo)",
    keys_everyone = "(Usa Recargar con llaves o F2 para permitir a todos)",
    door_unown_arrested = "No puede poseer o carecer cosas mientras Esta arrestado.",
    door_unownable = "Esta puerta no puede ser reclamado o vendido.",
    door_sold = "Vendiste esto por %s",
    door_already_owned = "Esta puerta ya lo reclamo alguien.",
    door_cannot_afford = "No puede comprar esta puerta.",
    door_hobo_unable = "No puede comprar esta puerta siendo Vagabundo.",
    vehicle_cannot_afford = "No puede comprar este vehiculo.",
    door_bought = "Compraste la puerta por %s%s",
    vehicle_bought = "Compraste este vehiculo por %s%s",
    door_need_to_own = "Necesita poseer esta puerta para hacer %s",
    door_rem_owners_unownable = "No puede remover propietarios si la puerta no es reclamable",
    door_add_owners_unownable = "No puede añadir propietarios si la puerta no es reclamable",
    rp_addowner_already_owns_door = "%s ya posee (o ya esta permitido poseer) esta pueta.",
    add_owner = "Añadir propietario",
    remove_owner = "Remover propietario",
    coown_x = "Co-propietario %s",
    allow_ownership = "Permitir propietarios",
    disallow_ownership = "Denegar propietarios",
    edit_door_group = "Editar grupo",
    door_groups = "Grupos",
    door_group_doesnt_exist = "Este grupo no existe.",
    door_group_set = "Grupo cambiado.",
    sold_x_doors_for_y = "Vendiste %d puertas por %s%d.", -- backwards compatibility
    sold_x_doors = "Vendiste %d puertas por %s.",

    -- Entities
    drugs = "drogas",
    Drugs = "Drogas",
    drug_lab = "Laboratorio de droga",
    gun_lab = "Laboratorio de armas",
    any_lab = "cualquier laboratorio",
    gun = "arma",
    microwave = "microondas",
    food = "comida",
    Food = "Comida",
    money_printer = "Impresora de dinero",
    tip_jar = "Jarra de propinas",

    sign_this_letter = "Firmar este cartel",
    signed_yours = "Tu,",

    money_printer_exploded = "Tu impresora exploto.",
    money_printer_overheating = "Tu impresora esta sobre-calentanda.",

    contents = "Contenidos: ",
    amount = "Cantidad: ",

    picking_lock = "Forzando cerradura",

    cannot_pocket_x = "No puede poner esto en tu bosillo.",
    object_too_heavy = "Este objeto es muy pesado.",
    pocket_full = "Tu bosillo esta lleno.",
    pocket_no_items = "Tu bosillo no tiene objetos.",
    drop_item = "Soltar objeto",

    bonus_destroying_entity = "Destruiste una entidad illegal.",

    switched_burst = "Modo Rafaga.",
    switched_fully_auto = "Modo Automatico.",
    switched_semi_auto = "Modo Semi-Automatico.",

    keypad_checker_shoot_keypad = "Shoot a keypad to see what it controls.",
    keypad_checker_shoot_entity = "Shoot an entity to see which keypads are connected to it",
    keypad_checker_click_to_clear = "Right click to clear.",
    keypad_checker_entering_right_pass = "Entering the right password",
    keypad_checker_entering_wrong_pass = "Entering the wrong password",
    keypad_checker_after_right_pass = "after having entered the right password",
    keypad_checker_after_wrong_pass = "after having entered the wrong password",
    keypad_checker_right_pass_entered = "Right password entered",
    keypad_checker_wrong_pass_entered = "Wrong password entered",
    keypad_checker_controls_x_entities = "This keypad controls %d entities",
    keypad_checker_controlled_by_x_keypads = "This entity is controlled by %d keypads",
    keypad_on = "ON",
    keypad_off = "OFF",
    seconds = "seconds",

    persons_weapons = "Armas ilegales de %s:",
    returned_persons_weapons = "Regresastes las armas confiscadas de %s.",
    no_weapons_confiscated = "%s no tiene armas confiscadas.",
    no_illegal_weapons = "%s no tiene armas ilegales.",
    confiscated_these_weapons = "Confiscastes estar armas:",
    checking_weapons = "Confiscando armas",

    shipment_antispam_wait = "Espera antes de aparecer otro envio.",
    createshipment = "Crear envio",
    splitshipment = "Dividir envio",
    shipment_cannot_split = "No se puede dividir este envio.",

    -- Talking
    hear_noone = "Nadie te puede escuchar %s.",
    hear_everyone = "Todos pueden escucharte.",
    hear_certain_persons = "Jugadores que te pueden escuchar %s: ",

    whisper = "susurrar",
    yell = "gritar",
    broadcast = "<Transmisión>",
    radio = "radio",
    request = "<Petición>",
    group = "<Grupo>",
    demote = "<Degradación>",
    ooc = "No-Rol",
    radio_x = "<Radio %d>",

    talk = "hablar",
    speak = "hablar",

    speak_in_ooc = "hablar en No-Rol",
    perform_your_action = "hacer acción",
    talk_to_your_group = "hablar en grupo",

    channel_set_to_x = "Canal puesto a %s.",
    channel = "canal",

    -- Notifies
    disabled = "%s ha sido desactivado. %s",
    gm_spawnvehicle = "La aparición de vehiculos",
    gm_spawnsent = "La aparición de entidades codificadas",
    gm_spawnnpc = "La aparición de NPCs",
    see_settings = "Mira la configuración de DarkRP.",
    limit = "Llegastes al limite de %s.",
    have_to_wait = "Espera otros %d antes de usar %s.",
    must_be_looking_at = "Debes estar mirando a %s.",
    incorrect_job = "No puede cambiar tu trabajo a %s.",
    unavailable = "%s no esta disponible",
    unable = "No puede %s. %s",
    cant_afford = "No puede comprar %s",
    created_x = "%s creo %s",
    cleaned_up = "Tus %s fueron eliminados.",
    you_bought_x = "Compraste %s por %s%d.", -- backwards compatibility
    you_bought = "Compraste %s por %s.",
    you_got_yourself = "Obtuviste %s.",
    you_received_x = "Obtuviste %s por %s.",

    created_first_jailpos = "You have created the first jail position!",
    added_jailpos = "You have added one extra jail position!",
    reset_add_jailpos = "You have removed all jail positions and you have added a new one here.",
    created_spawnpos = "You have added a spawn position for %s.",
    updated_spawnpos = "You have removed all spawn positions for %s and added a new one here.",
    remove_spawnpos = "You have removed all spawn positions for %s.",
    do_not_own_ent = "No posees esta entidad",
    cannot_drop_weapon = "No puede soltar esta arma.",
    job_switch = "Trabajos cambiado.",
    job_switch_question = "Cambiar trabajos con %s?",
    job_switch_requested = "Cambio de trabajo solicitado.",
    switch_jobs = "cambiar trabajos",

    cooks_only = "Solo cocineros.",

    -- Misc
    unknown = "Desconocido",
    arguments = "argumentos",
    no_one = "ninguno",
    door = "puerta",
    vehicle = "vehiculo",
    door_or_vehicle = "puerta/vehiculo",
    driver = "Conductor: %s",
    name = "Nombre: %s",
    locked = "Bloqueado.",
    unlocked = "Desbloqueado.",
    player_doesnt_exist = "El jugador no existe.",
    job_doesnt_exist = "El trabajo no existe.",
    must_be_alive_to_do_x = "Debes estar vivo para %s.",
    banned_or_demoted = "Baneado/Degradado",
    wait_with_that = "Espera con eso.",
    could_not_find = "No se pudo encontrar %s",
    f3tovote = "Preciona F3 para votar",
    listen_up = "escuchar:", -- In rp_tell or rp_tellall
    nlr = "New Life Rule: No revenge Arrest/Kill.",
    reset_settings = "Tu reniciastes todas las configuraciones",
    must_be_x = "Debes ser %s para hacer %s.",
    agenda = "agenda",
    agenda_updated = "La agenda ha sido actualizado",
    job_set = "%s ha puesto su trabajo a '%s'",
    demote_vote = "Degradación",
    demoted = "%s ha sido degradado",
    demoted_not = "%s no ha sido degradado",
    demote_vote_started = "%s empezo una votación de degradar a %s",
    demote_vote_text = "Razón:\n%s", -- '%s' is the reason here
    cant_demote_self = "No puede degradarte a ti mismo.",
    i_want_to_demote_you = "Te quiero degradar con razón de %s",
    tried_to_avoid_demotion = "Intentastes escapar de la degradación. Fallastes y has sido degradado.", -- naughty boy!
    lockdown_started = "Toque de queda.",
    lockdown_ended = "Toque de queda acabada.",
    gunlicense_requested = "%s ha pedido a %s una licencia de armas",
    gunlicense_granted = "%s le ha dado a %s una licencia de armas",
    gunlicense_denied = "%s le ha rechazado a %s una licencia de armas",
    gunlicense_question_text = "Darle a %s una licencia de armas?",
    gunlicense_remove_vote_text = "%s empezo una votación para remover la licencia de armas de %s",
    gunlicense_remove_vote_text2 = "Revocar licencia de armas:\n%s", -- Where %s is the reason
    gunlicense_removed = "La licencia de armas de %s fue removida.",
    gunlicense_not_removed = "La licencia de armas %s no fue removida.",
    vote_specify_reason = "Especifica una razón.",
    vote_started = "Votación creada",
    vote_alone = "Ganaste la votación porque Esta solo.",
    you_cannot_vote = "No puede votar",
    x_cancelled_vote = "%s cancelo el ultimo voto.",
    cant_cancel_vote = "No se pudo cancelar el ultimo voto porque hay no hay un ultimo voto para cancelar.",
    jail_punishment = "Castigado por desconectarte. Encarcelado por: %d segundos.",
    admin_only = "Solo administradores", -- When doing /addjailpos
    chief_or = "Teniente o ",-- When doing /addjailpos
    frozen = "Congelados.",
    recipient = "recipiente",
    forbidden_name = "Nombre prohibido.",
    illegal_characters = "Caracteres ilegales.",
    too_long = "Muy largo.",
    too_short = "Muy corto.",

    dead_in_jail = "Ahora esta muerto hasta que tu tiempo de carcel termine.",
    died_in_jail = "%s murio en carcel.",

    credits_for = "CREDITOS PARA %s\n",
    credits_see_console = "Creditos de DarkRP mostrados en consola.",

    rp_getvehicles = "Vehiculos disponibles para vehiculos personalizados:",

    data_not_loaded_one = "Tus datos no cargaron aun. Por favor espere.",
    data_not_loaded_two = "Si esto persiste, intenta reconectarte o contactar a un administrador.",

    cant_spawn_weapons = "No puede aparecer armas.",
    drive_disabled = "Conducción desactivado por ahora.",
    property_disabled = "Propiedad desactivado por ahora.",

    not_allowed_to_purchase = "No puede comprar esto.",

    rp_teamban_hint = "rp_teamban [player name/ID] [team name/id]. Use this to ban a player from a certain team.",
    rp_teamunban_hint = "rp_teamunban [player name/ID] [team name/id]. Use this to unban a player from a certain team.",
    x_teambanned_y_for_z = "%s has banned %s from being a %s for %s minutes.",
    x_teamunbanned_y = "%s has unbanned %s from being a %s.",

    -- Backwards compatibility:
    you_set_x_salary_to_y = "You set %s's salary to %s%d.",
    x_set_your_salary_to_y = "%s set your salary to %s%d.",
    you_set_x_money_to_y = "You set %s's money to %s%d.",
    x_set_your_money_to_y = "%s set your money to %s%d.",

    you_set_x_salary = "You set %s's salary to %s.",
    x_set_your_salary = "%s set your salary to %s.",
    you_set_x_money = "You set %s's money to %s.",
    x_set_your_money = "%s set your money to %s.",
    you_set_x_name = "You set %s's name to %s",
    x_set_your_name = "%s set your name to %s",

    someone_stole_steam_name = "Alguien esta usando tu nombre de Steam como su nombre en el roleplay asi que le dimos un '1' despues de tu nombre.", -- Uh oh
    already_taken = "Ya tomado.",

    job_doesnt_require_vote_currently = "Este trabajo no necesita una votación a este momento.",

    x_made_you_a_y = "%s te ha hecho %s.",

    cmd_cant_be_run_server_console = "This command cannot be run from the server console.",

    -- The lottery
    lottery_started = "Loteria, participar por %s%d?", -- backwards compatibility
    lottery_has_started = "Loteria, participar por %s?",
    lottery_entered = "Entraste a la loteria por %s",
    lottery_not_entered = "%s no entro a la loteria",
    lottery_noone_entered = "Nadie entro a la loteria",
    lottery_won = "%s gano la loteria y se llevo %s",
    lottery = "loteria",
    lottery_please_specify_an_entry_cost = "Especifica costo de entrada (%s-%s)",
    too_few_players_for_lottery = "Pocos jugadores para iniciar Se necesitan al menos %d jugadores.",
    lottery_ongoing = "No se puede iniciar, ya hay uno en progreso.",

    -- Animations
    custom_animation = "Animación personalizada",
    bow = "Bow",
    sexy_dance = "Baile sexy",
    follow_me = "Seguirme",
    laugh = "Reir",
    lion_pose = "Pose de leon",
    nonverbal_no = "No",
    thumbs_up = "Pulgar arriba",
    wave = "Saludar",
    dance = "Baliar",

    -- Hungermod
    starving = "Starving!",

    -- AFK
    afk_mode = "AFK Mode",
    unable_afk_spam_prevention = "Please wait before going AFK again.",
    salary_frozen = "Your salary has been frozen.",
    salary_restored = "Welcome back, your salary has now been restored.",
    no_auto_demote = "You will not be auto-demoted.",
    youre_afk_demoted = "You were demoted for being AFK for too long. Next time use /afk.",
    hes_afk_demoted = "%s has been demoted for being AFK for too long.",
    afk_cmd_to_exit = "Type /afk to exit AFK mode.",
    player_now_afk = "%s is now AFK.",
    player_no_longer_afk = "%s is no longer AFK.",

    -- Hitmenu
    hit = "hit",
    hitman = "Sicario",
    current_hit = "Hit: %s",
    cannot_request_hit = "No se puede pedir hit. %s",
    hitmenu_request = "Pedir",
    player_not_hitman = "El jugador no es un sicario.",
    distance_too_big = "Demasiado lejos.",
    hitman_no_suicide = "El sicario no se mata a si mismo.",
    hitman_no_self_order = "El sicario no puede pedir hit a si mismo.",
    hitman_already_has_hit = "El sicario ya tiene un hit en progreso.",
    price_too_low = "Precio demasiado bajo",
    hit_target_recently_killed_by_hit = "El objetivo fue recientemente asesinado por un hit.",
    customer_recently_bought_hit = "El cliente ya solicito un hit recientemente.",
    accept_hit_question = "Aceptar hit de %s\nhacia %s por %s%d?", -- backwards compatibility
    accept_hit_request = "Aceptar hit de %s\nhacia %s por %s?",
    hit_requested = "Hit solicitado.",
    hit_aborted = "Hit abortado. %s",
    hit_accepted = "Hit aceptado.",
    hit_declined = "El sicario rechazo el hit.",
    hitman_left_server = "El sicario se fue del servidor.",
    customer_left_server = "El cliente se fue del servidor.",
    target_left_server = "El objetivo se fue del servidor.",
    hit_price_set_to_x = "El precio del hit ahora es de %s%d.", -- backwards compatibility
    hit_price_set = "El precio del hit es ahora es de %s.",
    hit_complete = "Hit de %s completado",
    hitman_died = "El sicario murio.",
    target_died = "El objetivo murio.",
    hitman_arrested = "El sicario fue arrestado.",
    hitman_changed_team = "El sicario cambio de equipo.",
    x_had_hit_ordered_by_y = "%s tiene un hit activo ordenado por %s",
    place_a_hit = "Color un hit",
    hit_cancel = "Calcelación de hit",
    hit_cancelled = "Hit cancelado.",
    no_active_hit = "No tienes hit activo.",

    -- Vote Restrictions
    hobos_no_rights = "Los vagabundos no tienen derechos de votación.",
    gangsters_cant_vote_for_government = "Los criminales no pueden votar en cosas gubernamentales.",
    government_cant_vote_for_gangsters = "Los oficiales del gobierno no pueden votar en cosas criminales.",

    -- VGUI and some more doors/vehicles
    vote = "Vota",
    time = "Tiempo: %d",
    yes = "Si",
    no = "No",
    ok = "Okay",
    cancel = "Cancelar",
    add = "Agregar",
    remove = "Remover",
    none = "Ninguno",

    x_options = "%s opciones",
    sell_x = "Vender %s",
    set_x_title = "Colocar titulo de %s",
    set_x_title_long = "Colocar titulo de %s al que esta mirando.",
    jobs = "Trabajos",
    buy_x = "Comprar %s",

    -- F4menu
    ammo = "ammo",
    weapon_ = "weapon",
    no_extra_weapons = "This job has no extra weapons.",
    become_job = "Become job",
    create_vote_for_job = "Create vote",
    shipment = "shipment",
    Shipments = "Shipments",
    shipments = "shipments",
    F4guns = "Weapons",
    F4entities = "Miscellaneous",
    F4ammo = "Ammo",
    F4vehicles = "Vehicles",

    -- Tab 1
    give_money = "Give money to the player you're looking at",
    drop_money = "Drop money",
    change_name = "Change your DarkRP name",
    go_to_sleep = "Go to sleep/wake up",
    drop_weapon = "Drop current weapon",
    buy_health = "Buy health(%s)",
    request_gunlicense = "Request gunlicense",
    demote_player_menu = "Demote a player",

    searchwarrantbutton = "Make a player wanted",
    unwarrantbutton = "Remove the wanted status from a player",
    noone_available = "No one available",
    request_warrant = "Request a search warrant for a player",
    make_wanted = "Make someone wanted",
    make_unwanted = "Make someone unwanted",
    set_jailpos = "Set the jail position",
    add_jailpos = "Add a jail position",

    set_custom_job = "Poner un trabajo personalizado (preciona intro para activar)",

    set_agenda = "Poner a la agenda (preciona intro para activar)",

    initiate_lockdown = "Iniciar toque de queda",
    stop_lockdown = "Terminar toque de queda",
    start_lottery = "Iniciar loteria",
    give_license_lookingat = "Give <lookingat> a gun license",

    laws_of_the_land = "LEYES DEL LUGAR",
    law_added = "Nueva ley agregada.",
    law_removed = "Ley removida.",
    law_reset = "Las leyes han sido restablecidas al predeterminado.",
    law_too_short = "La ley es muy corta.",
    laws_full = "No hay mas espacio en le cartel de leyes.",
    default_law_change_denied = "No tienes permitido cambiar las leyes por defecto.",

    -- Second tab
    job_name = "Nombre: ",
    job_description = "Descripción: ",
    job_weapons = "Armas: ",

    -- Entities tab
    buy_a = "Comprar %s: %s",

    -- Licenseweaponstab
    license_tab = [[Licencia de armas

    Seleciona las armas que pueden tener sin una licencia.
    ]],
    license_tab_other_weapons = "Otras armas:",
}

-- The language code is usually (but not always) a two-letter code. The default language is "en".
-- Other examples are "nl" (Dutch), "de" (German)
-- If you want to know what your language code is, open GMod, select a language at the bottom right
-- then enter gmod_language in console. It will show you the code.
-- Make sure language code is a valid entry for the convar gmod_language.
DarkRP.addLanguage("en", my_language)

/area/security/lobby
	name = "Security Lobby"
	icon_state = "security"

/area/security/detectives_office
	name = "Security - Forensic Office"
	icon_state = "detective"
	sound_env = MEDIUM_SOFTFLOOR

/area/security/main
	name = "Security Office"
	icon_state = "security"

/area/security/meeting
	name = "Security Meeting Room"
	icon_state = "security"

/area/security/processing
	name = "Security - Processing"
	icon_state = "brig"

/area/security/armoury
	name = "Security - Armory"
	icon_state = "Warden"

/area/security/atmospherics
	name = "Security Atmospperics"
	icon_state = "atmos"

/area/security/prison
	name = "Security Prison"
	icon_state = "sec_prison"

/area/security/prison/lobby
	name = "Prison Lobby"
	icon_state = "sec_prison"

/area/security/prison/prison_break()
	for(var/obj/structure/closet/secure_closet/brig/temp_closet in src)
		temp_closet.locked = 0
		temp_closet.icon_state = temp_closet.icon_closed
	for(var/obj/machinery/door_timer/temp_timer in src)
		temp_timer.releasetime = 1
	..()


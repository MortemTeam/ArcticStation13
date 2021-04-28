GLOBAL_LIST_INIT(active_landing_zones, list())

/area/quartermaster
	name = "Quartermasters"
	icon_state = "quart"

/area/quartermaster/office
	name = "Cargo Office"
	icon_state = "quartoffice"

/area/quartermaster/break_room
	name = "Cargo Break Room"
	icon_state = "restrooms"
	sound_env = MEDIUM_SOFTFLOOR

/area/quartermaster/atmospherics
	name = "Cargo Atmospperics"
	icon_state = "atmos"

/area/quartermaster/connector
	name = "Cargo Connector"

/area/quartermaster/eva
	name = "Cargo EVA"
	icon_state = "eva"


/area/quartermaster/storage
	icon_state = "quartstorage"
	sound_env = LARGE_ENCLOSED

/area/quartermaster/storage/n1
	name = "Warehouse 1"
/area/quartermaster/storage/n2
	name = "Warehouse 2"


/area/quartermaster/active_landing
	name = "Active Landing"
	icon_state = "thunder"
	Initialize()
		..()
		for(var/turf/T in src)
			GLOB.active_landing_zones += T
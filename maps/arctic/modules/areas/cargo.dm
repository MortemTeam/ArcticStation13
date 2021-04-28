
GLOBAL_LIST_INIT(active_landing_zones)

/area/quartermaster
	name = "Quartermasters"
	icon_state = "quart"

/area/quartermaster/storage
	name = "Warehouse"
	icon_state = "quartstorage"
	sound_env = LARGE_ENCLOSED

/area/quartermaster/office
	name = "Supply Office"
	icon_state = "quartoffice"

/area/quartermaster/active_landing
	name = "Active Landing"
	icon_state = "thunder"
	Initialize()
		..()
		active_landing_zones += src
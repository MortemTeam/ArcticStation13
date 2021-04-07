
/datum/map/arctic
	name = "Arctice"
	full_name = "Arctic Station"
	path = "arctic"

	lobby_icon = 'maps/arctic/arctic_lobby.dmi'

	station_levels = list(1)
	admin_levels = list(2)
	contact_levels = list(1,2)
	player_levels = list(1)
	accessible_z_levels = list() //Percentage of chance to get on this or that Z level as you drift through space.

	allowed_spawns = list("Gateway")

	station_name  = "M0R-T3M"
	station_short = "Arcticum"
	dock_name     = "NAS Arcticum"
	boss_name     = "Board of Directors"
	boss_short    = "Board of Directors"
	company_name  = "Phoebus Corporated"
	company_short = "Phoebus"
	system_name   = "R-UN-4W4Y"

	map_admin_faxes = list("Phoebus Mail System")

	shuttle_docked_message = "The Spiteful has docked with the station. The nobles are awaited onboard."
	shuttle_leaving_dock = "The Spiteful has departed from home dock."
	shuttle_called_message = "A scheduled crew transfer shuttle Spiteful has been sent."
	shuttle_recall_message = "The Spiteful has been recalled. Continuous wasting of resources may result in the crew's termination."
	emergency_shuttle_docked_message = "The Spiteful has docked with the station. The nobles are awaited onboard."
	emergency_shuttle_leaving_dock = "The Spiteful emergency escape shuttle has departed from %dock_name%."
	emergency_shuttle_called_message = "Spiteful emergency escape shuttle has been sent. It will arrive in approximately 10 minutes."
	emergency_shuttle_recall_message = "The Spiteful emergency escape shuttle has been recalled. Continuous wasting of resources may result in the crew's termination."

	evac_controller_type = /datum/evacuation_controller/shuttle


/datum/map/arctic/perform_map_generation()
	new /datum/random_map/automata/cave_system(null,1,1,1,200, 200) // Create the mining Z-level.
	new /datum/random_map/noise/ore(null,1,1,1,64, 64)
	return 1
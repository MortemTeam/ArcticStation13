
/datum/map/arctic
	name = "Arctic"
	full_name = "Arctic Station"
	path = "arctic"

	lobby_icon = 'maps/arctic/lobby.dmi'

	station_levels = list(1)
	admin_levels = list(2)
	contact_levels = list(1,2)
	player_levels = list(1)
	accessible_z_levels = list("2" = 1) //Percentage of chance to get on this or that Z level as you drift through space.

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

	emergency_shuttle_docked_message = "The Emergency Shuttle has docked with the station. You have approximately %ETD% to board the Emergency Shuttle."
	emergency_shuttle_leaving_dock = "The Emergency Shuttle has left the station. Estimate %ETA% until the shuttle docks at %dock_name%."

	emergency_shuttle_called_message = "WARNING: An emergency evacuation shuttle has been called. It will arrive in approximately %ETA%"
	emergency_shuttle_called_sound = 'sound/AI/november/warning.ogg'

	emergency_shuttle_recall_message = "The emergency shuttle has been recalled."

	command_report_sound = 'sound/AI/november/attention.ogg'
	grid_check_sound = 'sound/AI/november/warning.ogg'
	grid_restored_sound = 'sound/AI/november/warning.ogg'
	meteor_detected_sound = 'sound/AI/november/threat.ogg'
	radiation_detected_message = "WARNING: High levels of radiation detected in proximity of the %STATION_NAME%. Please evacuate into one of the shielded maintenance tunnels."
	radiation_detected_sound = 'sound/AI/november/threat.ogg'
	space_time_anomaly_sound = 'sound/AI/november/subspace.ogg'
	unidentified_lifesigns_sound = 'sound/AI/november/threat.ogg'

	electrical_storm_moderate_sound = null
	electrical_storm_major_sound = null

	evac_controller_type = /datum/evacuation_controller/shuttle

/datum/map/arctic/build_away_sites()
	return // don't build away sites
/datum/job/rnd
	access = list(access_research, access_robotics)



/datum/job/command/head_of_security
	access = list(
		access_security, access_brig, access_forensics_lockers, access_armory,
		access_RC_announce, access_keycard_auth
	)

/datum/job/security
	access = list(access_security, access_brig, access_forensics_lockers)



/datum/job/command/chief_personel
	access = list(access_change_ids, access_RC_announce, access_keycard_auth)

/datum/job/cargo
	access = list(access_cargo)

/datum/job/engineering
	access = list(access_engine, access_engine_equip, access_atmospherics, access_construction)

/datum/job/medical
	access = list(access_medical)
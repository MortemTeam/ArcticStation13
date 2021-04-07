/datum/map/arctic
	allowed_jobs = list(
		/datum/job/command/research_director,
		/datum/job/rnd/scientist,
		/datum/job/rnd/roboticist,

		/datum/job/command/head_of_security,
		/datum/job/security/officer,

		/datum/job/command/chief_engineer,
		/datum/job/engineering/engineer,

		/datum/job/command/medical_manager,
		/datum/job/medical/doctor,
		/datum/job/medical/surgeon,
		/datum/job/medical/chemist,

		/datum/job/command/clown,
		/datum/job/service/janitor,
		/datum/job/service/assistant,
	)

/datum/job
	var/allowed_to_game = 0

/get_job_datums()
	var/list/occupations = list()
	var/list/all_jobs = typesof(/datum/job)

	for(var/A in all_jobs)
		var/datum/job/job = new A()
		if(job && job.allowed_to_game)
			occupations += job

	return occupations


/* Command */

/datum/job/command
	supervisors = "the research director"
	selection_color = "#1d1d4f"

	req_admin_notify = 1
	total_positions = 1
	spawn_positions = 1
	economic_modifier = 10

	equip(var/mob/living/carbon/human/H)
		..()
		H.implant_loyalty(src)

/datum/job/command/research_director
	allowed_to_game = 1
	title = "Научный руководитель"
	department = "Research & Development"
	supervisors = "company officials and Corporate Regulations"
	department_flag = COM|SCI
	head_position = 1
	minimum_character_age  = 30
	ideal_character_age = 50
	outfit_type = /decl/hierarchy/outfit/job/science/rd

	get_access()
		return get_all_station_access()

	equip(var/mob/living/carbon/human/H)
		..()
		H.generate_stats(STAT_IQ)
		H.generate_skills(list("medical","surgery","engineering","science"))

/datum/job/command/head_of_security
	allowed_to_game = 1
	title = "Глава службы безопасности"
	department = "Security"
	department_flag = COM|SEC
	outfit_type = /decl/hierarchy/outfit/job/security/hos

	access = list(
		access_security, access_eva, access_sec_doors, access_brig, access_armory,
		access_forensics_lockers, access_morgue, access_maint_tunnels, access_all_personal_lockers,
		access_research, access_engine, access_mining, access_medical, access_construction, access_mailsorting,
		access_heads, access_hos, access_RC_announce, access_keycard_auth, access_gateway, access_external_airlocks)

	equip(var/mob/living/carbon/human/H)
		..()
		H.generate_stats(list(STAT_ST, STAT_DX, STAT_HT))
		H.generate_skills(list("melee", "ranged"))

/datum/job/command/chief_engineer
	allowed_to_game = 1
	title = "Шеф-инженер"
	department = "Engineering"
	department_flag = COM|ENG
	outfit_type = /decl/hierarchy/outfit/job/engineering/chief_engineer

	access = list(
		access_engine, access_engine_equip, access_tech_storage, access_maint_tunnels,
		access_teleporter, access_external_airlocks, access_atmospherics, access_emergency_storage, access_eva,
		access_heads, access_construction, access_sec_doors,
		access_ce, access_RC_announce, access_keycard_auth, access_tcomsat, access_ai_upload)

	equip(var/mob/living/carbon/human/H)
		..()
		H.generate_stats(list(STAT_ST, STAT_DX, STAT_HT))
		H.generate_skills(list("melee", "engineering", "crafting"))

/datum/job/command/medical_manager
	allowed_to_game = 1
	title = "Менеджер медицинского персонала"
	department = "Medical"
	department_flag = COM|MED
	outfit_type = /decl/hierarchy/outfit/job/medical/cmo

	access = list(
		access_medical, access_medical_equip, access_morgue, access_genetics, access_heads,
		access_chemistry, access_virology, access_cmo, access_surgery, access_RC_announce,
		access_keycard_auth, access_sec_doors, access_psychiatrist, access_eva, access_maint_tunnels, access_external_airlocks)

	equip(var/mob/living/carbon/human/H)
		..()
		H.generate_stats(list(STAT_IQ))
		H.generate_skills(list("medical", "surgery"))

/datum/job/command/clown
	allowed_to_game = 1
	title = "Клоун"
	department = "Service"
	department_flag = COM|SRV
	outfit_type = /decl/hierarchy/outfit/clown

	access = list(
		access_heads, access_RC_announce, access_external_airlocks, access_janitor,
		access_keycard_auth, access_sec_doors, access_eva, access_maint_tunnels)


/* Research & Development */

/datum/job/rnd
	department = "Research & Development"
	supervisors = "the research director"
	selection_color = "#633d63"
	department_flag = SCI

	total_positions = 3
	spawn_positions = 3
	economic_modifier = 5
	access = list(
		access_tox, access_tox_storage, access_research,
		access_xenoarch, access_robotics, access_eva,
		access_tech_storage, access_morgue)

	equip(var/mob/living/carbon/human/H)
		..()
		H.generate_stats(STAT_IQ)

/datum/job/rnd/roboticist
	allowed_to_game = 1

	title = "Роботехник"
	outfit_type = /decl/hierarchy/outfit/job/science/roboticist

	equip(var/mob/living/carbon/human/H)
		..()
		H.generate_skills(list("engineering","science"))

/datum/job/rnd/scientist
	allowed_to_game = 1

	title = "Ученый"
	outfit_type = /decl/hierarchy/outfit/job/science/scientist

	equip(var/mob/living/carbon/human/H)
		..()
		H.generate_skills(list("science","crafting"))


/* Security */

/datum/job/security
	department = "Security"
	supervisors = "the head of security"
	selection_color = "#601c1c"
	department_flag = SEC

	total_positions = 3
	spawn_positions = 3
	economic_modifier = 5
	access = list(
		access_security, access_eva, access_sec_doors,
		access_brig, access_maint_tunnels, access_morgue,
		access_external_airlocks)

/datum/job/security/officer
	allowed_to_game = 1

	title = "Офицер безопасности"
	outfit_type = /decl/hierarchy/outfit/job/security/officer

	equip(var/mob/living/carbon/human/H)
		..()
		H.generate_stats(list(STAT_HT))
		H.generate_skills(list("melee", "ranged"))


/* Engineering */

/datum/job/engineering
	department = "Engineering"
	supervisors = "the chief engineer"
	selection_color = "#5b4d20"
	department_flag = ENG

	total_positions = 3
	spawn_positions = 3
	economic_modifier = 5
	access = list(
		access_eva, access_engine, access_engine_equip,
		access_tech_storage, access_maint_tunnels, access_external_airlocks,
		access_construction, access_atmospherics, access_emergency_storage)

/datum/job/engineering/engineer
	allowed_to_game = 1

	title = "Инженер"
	outfit_type = /decl/hierarchy/outfit/job/engineering/engineer

	equip(var/mob/living/carbon/human/H)
		..()
		H.generate_stats(list(STAT_HT))
		H.generate_skills(list("engineering","crafting"))


/* Medical */

/datum/job/medical
	department = "Medical"
	supervisors = "the chief medical officer"
	selection_color = "#013d3b"
	department_flag = MED

	total_positions = 2
	spawn_positions = 2
	economic_modifier = 5
	access = list(
		access_medical, access_medical_equip, access_morgue, access_eva,
		access_surgery, access_chemistry, access_virology, access_genetics)

	equip(var/mob/living/carbon/human/H)
		..()
		H.generate_stats(list(STAT_IQ))
		H.generate_skills(list("medical", "surgery"))

/datum/job/medical/doctor
	allowed_to_game = 1

	title = "Доктор"
	outfit_type = /decl/hierarchy/outfit/job/medical/doctor

/datum/job/medical/surgeon
	allowed_to_game = 1

	title = "Хирург"
	outfit_type = /decl/hierarchy/outfit/job/medical/doctor/surgeon

/datum/job/medical/chemist
	allowed_to_game = 1

	title = "Химик"
	outfit_type = /decl/hierarchy/outfit/job/medical/chemist


/* Service */

/datum/job/service
	department = "Service"
	supervisors = "the clown"
	selection_color = "#515151"

	department_flag = SRV
	total_positions = -1
	spawn_positions = -1
	economic_modifier = 5

/datum/job/service/assistant
	allowed_to_game = 1

	title = "Ассистент"
	access = list(access_maint_tunnels, access_eva)
	outfit_type = /decl/hierarchy/outfit/job/assistant

/datum/job/service/janitor
	allowed_to_game = 1

	title = "Уборщик"
	total_positions = 2
	spawn_positions = 2
	access = list(
		access_janitor, access_maint_tunnels, access_engine, access_eva,
		access_research, access_sec_doors, access_medical)
	outfit_type = /decl/hierarchy/outfit/job/service/janitor

	equip(var/mob/living/carbon/human/H)
		..()
		H.generate_skills(list("cleaning"))

/* Silicon */

/datum/job/silicon
	department = "Silicon"
	supervisors = "your laws"
	department_flag = MSC
	selection_color = "#254c25"

	total_positions = 2
	spawn_positions = 2

	account_allowed = 0
	economic_modifier = 0
	loadout_allowed = FALSE
	outfit_type = /decl/hierarchy/outfit/job/silicon/cyborg
	hud_icon = "hudblank"

/datum/job/silicon/cyborg
	allowed_to_game = 1

	title = "Киборг"
	total_positions = 2
	spawn_positions = 2

	equip(var/mob/living/carbon/human/H)
		return H
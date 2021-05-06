/datum/map/arctic
	allowed_jobs = list(
		/datum/job/command/research_director,
		/datum/job/rnd/scientist,
		/datum/job/rnd/roboticist,

		/datum/job/command/head_of_security,
		/datum/job/security/officer,
		/datum/job/security/detective,

		/datum/job/command/chief_personel,

		/datum/job/cargo/cargo_technician,

		/datum/job/engineering/engineer,

		/datum/job/medical/doctor,
		/datum/job/medical/surgeon,
		/datum/job/medical/chemist,

		/datum/job/service/assistant,
		/datum/job/silicon/cyborg,
	)

/datum/job
	var/stats_aspect
	var/skill_aspect = list()

	equip(var/mob/living/carbon/human/H)
		..()
		H.generate_stats(stats_aspect)
		H.generate_skills(skill_aspect)

/* Command */

/datum/job/command
	supervisors = "the research director"
	selection_color = "#1d1d4f"

	req_admin_notify = 1
	total_positions = 1
	spawn_positions = 1
	economic_modifier = 10

/datum/job/command/research_director
	title = "Научный руководитель"
	department = "Research & Development"
	supervisors = "company officials and Corporate Regulations"
	department_flag = COM|SCI
	hud_icon = "hudresearchdirector"

	head_position = 1
	minimum_character_age  = 30
	ideal_character_age = 50
	outfit_type = /decl/hierarchy/outfit/job/science/rd

	stats_aspect = STAT_IQ
	skill_aspect = list("medical","surgery","engineering","science")

	get_access()
		return get_all_station_access()

/datum/job/command/head_of_security
	title = "Глава службы безопасности"
	department = "Security"
	department_flag = COM|SEC
	hud_icon = "hudheadofsecurity"
	outfit_type = /decl/hierarchy/outfit/job/security/hos

	stats_aspect = STAT_ST
	skill_aspect = list("melee", "ranged")

/datum/job/command/chief_personel
	title = "Старший по персоналу"
	department = "Service"
	department_flag = COM|SRV
	hud_icon = "hudheadofpersonnel"
	outfit_type = /decl/hierarchy/outfit/job/hop

	stats_aspect = STAT_IQ

/* Research & Development */

/datum/job/rnd
	department = "Research & Development"
	supervisors = "the research director"
	selection_color = "#633d63"
	department_flag = SCI
	hud_icon = "hudresearchdirector"

	total_positions = 3
	spawn_positions = 3
	economic_modifier = 5

	stats_aspect = STAT_IQ

/datum/job/rnd/roboticist
	title = "Робототехник"
	outfit_type = /decl/hierarchy/outfit/job/science/roboticist

	stats_aspect = STAT_ST
	skill_aspect = list("engineering","science")

/datum/job/rnd/scientist
	title = "Научный сотрудник"
	outfit_type = /decl/hierarchy/outfit/job/science/scientist

	skill_aspect = list("science","crafting")


/* Cargo */

/datum/job/cargo
	department = "Cargo"
	supervisors = "the chief of personel"
	selection_color = "#515151"
	department_flag = SUP
	hud_icon = "hudquartermaster"

	total_positions = 3
	spawn_positions = 3
	economic_modifier = 5

	stats_aspect = STAT_HT
	skill_aspect = list("engineering","crafting")

/datum/job/cargo/cargo_technician
	title = "Карготехник"
	outfit_type = /decl/hierarchy/outfit/job/cargo/cargo_tech


/* Security */

/datum/job/security
	department = "Security"
	supervisors = "the head of security"
	selection_color = "#601c1c"
	department_flag = SEC
	hud_icon = "hudheadofsecurity"

	total_positions = 3
	spawn_positions = 3
	economic_modifier = 5

/datum/job/security/officer
	title = "Офицер безопасности"
	outfit_type = /decl/hierarchy/outfit/job/security/officer

	stats_aspect = STAT_ST
	skill_aspect = list("melee", "ranged")

/datum/job/security/detective
	title = "Детектив"
	total_positions = 1
	spawn_positions = 1
	outfit_type = /decl/hierarchy/outfit/job/security/detective

	stats_aspect = STAT_IQ
	skill_aspect = list("ranged")

/* Engineering */

/datum/job/engineering
	department = "Engineering"
	supervisors = "the chief of personel"
	selection_color = "#5b4d20"
	department_flag = ENG
	hud_icon = "hudchiefengineer"

	total_positions = 3
	spawn_positions = 3
	economic_modifier = 5

	stats_aspect = STAT_HT
	skill_aspect = list("engineering","crafting")

/datum/job/engineering/engineer
	title = "Инженер"
	outfit_type = /decl/hierarchy/outfit/job/engineering/engineer


/* Medical */

/datum/job/medical
	department = "Medical"
	supervisors = "the chief of personel"
	selection_color = "#013d3b"
	department_flag = MED
	hud_icon = "hudresearchdirector"

	total_positions = 2
	spawn_positions = 2
	economic_modifier = 5

	stats_aspect = STAT_IQ
	skill_aspect = list("medical", "surgery")

/datum/job/medical/doctor
	title = "Доктор"
	outfit_type = /decl/hierarchy/outfit/job/medical/doctor

/datum/job/medical/surgeon
	title = "Хирург"
	outfit_type = /decl/hierarchy/outfit/job/medical/doctor/surgeon

/datum/job/medical/chemist
	title = "Химик"
	outfit_type = /decl/hierarchy/outfit/job/medical/chemist


/* Service */

/datum/job/service
	department = "Service"
	supervisors = "the chief of personel"
	selection_color = "#515151"
	department_flag = SRV
	hud_icon = "hudassistant"

	total_positions = -1
	spawn_positions = -1
	economic_modifier = 5

	skill_aspect = list("cleaning","cooking","gardening","crafting")

/datum/job/service/assistant
	title = "Ассистент"
	outfit_type = /decl/hierarchy/outfit/job/assistant


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
	title = "Киборг"
	total_positions = 2
	spawn_positions = 2

	equip(var/mob/living/carbon/human/H)
		return H
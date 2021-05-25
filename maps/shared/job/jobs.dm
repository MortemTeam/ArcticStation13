/datum/map
	allowed_jobs = list(
		/datum/job/captain,
		/datum/job/hop,

		/datum/job/hos,
		/datum/job/warden,
		/datum/job/officer,
		/datum/job/detective,

		/datum/job/cmo,
		/datum/job/doctor,

		/datum/job/rd,
		/datum/job/scientist,

		/datum/job/qm,
		/datum/job/cargo_tech,
		/datum/job/mining,

		/datum/job/chief_engineer,
		/datum/job/engineer,

		/datum/job/chef,
		/datum/job/bartender,
		/datum/job/hydro,
		/datum/job/janitor,
		/datum/job/chaplain,
		/datum/job/jester,
		/datum/job/assistant,

		/datum/job/raider/leader,
		/datum/job/raider,

		/datum/job/merchant,
	)

// MERCHANT //

/obj/item/weapon/card/id/torch/merchant
	desc = "An identification card issued to Merchants, indicating their right to sell and buy goods."
	icon_state = "trader"
	job_access_type = /datum/job/merchant

/decl/hierarchy/outfit/job/torch/merchant
	name = OUTFIT_JOB_NAME("Merchant - Torch")
	uniform = /obj/item/clothing/under/color/black
	l_ear = null
	shoes = /obj/item/clothing/shoes/black
	pda_type = /obj/item/device/pda
	id_type = /obj/item/weapon/card/id/torch/merchant

/datum/job/merchant
	title = "Merchant"
	department = "Civilian"
	department_flag = CIV

	total_positions = 2
	spawn_positions = 2
	availablity_chance = 30
	supervisors = "the invisible hand of the market"
	selection_color = "#515151"
	ideal_character_age = 30
	minimal_player_age = 7
	create_record = 0
	outfit_type = /decl/hierarchy/outfit/job/torch/merchant
	latejoin_at_spawnpoints = 1
	access = list(access_merchant)
	announced = FALSE

/////////////////

/datum/job/engineer
	title = "Engineer"

/datum/job/ouvrier
	selection_color = "#7c6a2e"
	title = "Cargo Assistant"
	supervisors = "the Cargo Overseer"
	minimal_player_age = 16
	economic_modifier = 2
	ideal_character_age = 21
	total_positions = 2
	spawn_positions = 2
	department_flag = SUP
	department = "Supply"
	access = list(access_maint_tunnels, access_mailsorting, access_manufacturing, access_cargo, access_cargo_bot, access_mining, access_mining_station)
	minimal_access = list(access_maint_tunnels, access_mailsorting, access_manufacturing, access_cargo, access_cargo_bot, access_mining, access_mining_station)
	outfit_type = /decl/hierarchy/outfit/job/cargo_kid
	social_class = SOCIAL_CLASS_MIN

	equip(var/mob/living/carbon/human/H)
		H.set_species("Child")//Actually makes them a child. Called before ..() so they can get their clothes.
		H.add_stats(rand(3,6), rand(12,16), rand(6,9))
		..()

/datum/job/arbiter
	title = "Inquisitor"
	department = "Civilian"
	supervisors = "the Supreme Arbiter and Verina"
	department_flag = CRH
	total_positions = 2
	spawn_positions = 2
	economic_modifier = 3
	selection_color = "#6161aa"
	sex_lock = MALE
	access = list(access_maint_tunnels, access_chapel_office)
	minimal_access = list(access_maint_tunnels, access_chapel_office)
	outfit_type = /decl/hierarchy/outfit/job/arbiter
	social_class = SOCIAL_CLASS_HIGH

	equip(var/mob/living/carbon/human/H)//Peacekeeper stats.
		..()
		if(!H.religion_is_legal())//So that they can't be heretics.
			H.religion = LEGAL_RELIGION
		//H.add_stats(rand(11,16), rand(10,14), rand(7,10))
		H.generate_stats(STAT_ST)
		H.generate_skills(list("melee","ranged"))

/datum/job/jester
	title = "Jester"
	department = "Service"
	department_flag = SRV
	total_positions = 1
	spawn_positions = 1
	supervisors = "The Viscount"
	selection_color = "#852639"
	minimal_access = list()
	outfit_type = /decl/hierarchy/outfit/job/jester

	equip(var/mob/living/carbon/human/H)
		..()
		//H.generate_stats(STAT_DX)
		H.newgeneratestats(2,18,2,18,2,18,2,18)
		H.generate_skills(list("melee"))
		H.setBrainLoss(rand(50, 180))

//OFF STATION JOBS

/decl/hierarchy/outfit/shipraiders
	name = "Raiders"
	head = /obj/item/clothing/head/helmet/siege
	uniform = /obj/item/clothing/under/ert/raider
	shoes = /obj/item/clothing/shoes/jackboots
	l_ear = /obj/item/device/radio/headset/raider
	r_pocket = /obj/item/weapon/card/emag
	belt = /obj/item/weapon/gun/projectile/pistol
	suit = /obj/item/clothing/suit/storage/vest/opvest
	gloves = /obj/item/clothing/gloves/thick/swat/combat
	id = /obj/item/weapon/card/id/syndicate
	//flags = OUTFIT_NO_BACKPACK|OUTFIT_NO_SURVIVAL_GEAR

/datum/job/raider
	title = "Raider"
	department = "Civilian"
	department_flag = CIV
	total_positions = 5
	spawn_positions = 5
	create_record = 0
	account_allowed = 0
	latejoin_at_spawnpoints = 1
	announced = FALSE
	selection_color = "#6161aa"
	outfit_type = /decl/hierarchy/outfit/shipraiders
	social_class = SOCIAL_CLASS_MIN

	equip(var/mob/living/carbon/human/H)
		..()
		H.real_name = "[get_random_raider_name()]"//Give them a random raider nickname.
		H.name = H.real_name

		//Peacekeeper setup.
		//H.add_stats(rand(11,18), rand(10,14), rand(7,10))
		H.generate_stats(STAT_ST)
		H.generate_skills("ranged")

		//Some dumb if shit.
		if(prob(50))
			H.equip_to_slot_or_del(new /obj/item/weapon/gun/projectile/shotgun/pump/boltaction/shitty/bayonet(H),slot_back)
		else if(prob(50))
			H.equip_to_slot_or_del(new /obj/item/weapon/gun/projectile/shotgun/pump/boltaction/shitty(H),slot_back)
		else
			H.equip_to_slot_or_del(new /obj/item/weapon/gun/projectile/shotgun/pump/shitty(H),slot_back)

		if(prob(50))
			H.equip_to_slot_or_del(new /obj/item/clothing/mask/gas(H),slot_wear_mask)

		//H.religion = ILLEGAL_RELIGION//Their raiders they believe in the raider religion.

/datum/job/raider/leader
	title = "Lead Raider"
	total_positions = 1
	spawn_positions = 1

	equip(var/mob/living/carbon/human/H)
		..()
		H.real_name = "The Leader"
		H.name = H.real_name

//Stupid random names for them.
/datum/job/proc/get_random_raider_name()
	return "[pick("Spook", "Big", "Big Boy", "Big Girl", "Cheese", "Artist", "Greasy", "Dick", "Weasel", "Small", "Dixon", "Dixy", "Rat", "Knot", "Suffering", "Slick", "Scars", "Old Guy", "Heel", "Nine Lives", "Two Fingers", "Poet", "Dash", "Angel", "Bug", "Beast", "Enema", "Animal", "Oz", "Cinnamon", "Heavy", "Echo", "Cannon", "Under", "Smokes", "Joe", "Pig")]"

/obj/item/clothing/under/ert/raider
	name = "raiders uniform"

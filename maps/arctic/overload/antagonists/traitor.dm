//SETUP JIVIN

/datum/uplink_category/telecrystals
	name = "Living Matters"

/datum/uplink_item/item/telecrystal
	category = /datum/uplink_category/telecrystals
	desc = "Acquire the uplink living matters in pure form."

/datum/uplink_item/item/telecrystal/get_goods(var/obj/item/device/uplink/U, var/loc)
	return new /obj/item/stack/material/living_matter/(loc, cost(U.uses, U))

/datum/uplink_item/item/telecrystal/one
	name = "Living Matter - 01"
	item_cost = 1

/datum/uplink_item/item/telecrystal/five
	name = "Living Matter - 05"
	item_cost = 5

/datum/uplink_item/item/telecrystal/ten
	name = "Living Matter - 10"
	item_cost = 10

/datum/uplink_item/item/telecrystal/twentyfive
	name = "Living Matter - 25"
	item_cost = 25

/datum/uplink_item/item/telecrystal/fifty
	name = "Living Matter - 50"
	item_cost = 50

/datum/uplink_item/item/telecrystal/all
	name = "Living Matter - Empty Uplink"

/datum/uplink_item/item/telecrystal/all/cost(var/telecrystals, obj/item/device/uplink/U)
	return max(1, telecrystals)

/decl/uplink_source/telecrystals
	name = "Living Matters"
	desc = "Get your living matter in pure form, without the means to trade them for goods."

/decl/uplink_source/telecrystals/setup_uplink_source(var/mob/M, var/amount)
	var/obj/item/stack/material/living_matter/LM = new(M, amount)
	put_on_mob(M, LM, "[amount] living matters\s")


// SETUP OBJECTIVES

/datum/objective/steal/living_matter
	set_target(item_name)
		target_name = "200 ingots of living matter"
		steal_target = /obj/item/stack/material/living_matter
		explanation_text = "Steal [target_name]."
		return steal_target

	check_completion()
		if(!steal_target || !owner.current || !isliving(owner.current))	return 0
		var/list/all_items = owner.current.get_contents()

		var/target_amount = text2num(target_name)//Non-numbers are ignored.
		var/found_amount = 0

		for(var/obj/item/I in all_items)
			if(I.hidden_uplink)
				found_amount += I.hidden_uplink.uses
			if(istype(I, steal_target))
				var/obj/item/stack/S = I
				found_amount += S.amount

		return found_amount>= target_amount

//SETUP EMPLOYER

/datum/uplink_category/faction
	var/faction
	can_view(obj/item/device/uplink/U)
		if(U.uplink_owner.employer != faction)
			return

		for(var/datum/uplink_item/item in items)
			if(item.can_view(U))
				return 1

/datum/employer
	var/name
	var/color
	proc/show_info()
		return "Your employer is <font color=[color]><B>[name]</B></font>"

/datum/employer/black_spider
	name = "Black Spider"
	color = "pink"

/datum/employer/comintern
	name = "Comintern"
	color = "red"

/datum/employer/nanotrusten
	name = "NanoTrusten"
	color = "blue"

/datum/employer/third_reich
	name = "Third Reich"
	color = "black"

//SETUP ANTAG

/datum/mind
	var/datum/employer/employer

/datum/antagonist/traitor
	id = MODE_TRAITOR
	protected_jobs = list(
		/datum/job/command/research_director,
		/datum/job/command/head_of_security,
		/datum/job/security/officer,
		/datum/job/command/chief_personel,
	)

	flags = ANTAG_SUSPICIOUS
	hard_cap = 3
	hard_cap_round = 3
	initial_spawn_req = 1
	initial_spawn_target = 3

/datum/antagonist/traitor/create_objectives(var/datum/mind/traitor)
	var/employer = pick(list(
		/datum/employer/black_spider,
		/datum/employer/comintern,
		/datum/employer/nanotrusten,
		/datum/employer/third_reich,
	))

	traitor.employer = new employer

	traitor.store_memory("<HR>[traitor.employer.show_info()]")

	if(prob(50))
		var/datum/objective/assassinate/A = new
		A.owner = traitor
		A.find_target()
		traitor.objectives += A
	else
		var/datum/objective/protect/P = new
		P.owner = traitor
		P.find_target()
		traitor.objectives += P

	var/datum/objective/steal/living_matter/LM = new
	LM.owner = traitor
	LM.find_target()
	traitor.objectives += LM

	var/datum/objective/escape/E = new
	E.owner = traitor
	E.find_target()
	traitor.objectives += E

/datum/antagonist/traitor/give_intel(mob/living/traitor_mob)
	to_chat(traitor_mob, traitor_mob.mind.employer.show_info())


//SETUP EMPLOYER

/datum/uplink_category/faction
	can_view(obj/item/device/uplink/U)
		if(!U.uplink_owner || (U.uplink_owner.employer.name != name))
			return

		return 1

/datum/employer
	var/name
	var/color
	proc/show_info()
		return "Your employer is <font color=[color]><B>[name]</B></font>"

/datum/employer/spider
	name = "Spider"
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
	hard_cap = 3
	hard_cap_round = 3
	initial_spawn_req = 1
	initial_spawn_target = 3

/datum/antagonist/traitor/create_objectives(var/datum/mind/traitor)
	var/employer = pick(list(
		/datum/employer/spider,
		/datum/employer/comintern,
		/datum/employer/nanotrusten,
		/datum/employer/third_reich,
	))

	traitor.employer = new employer

	traitor.store_memory("<HR>[traitor.employer.show_info()]")

	..()
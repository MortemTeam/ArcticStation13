/obj/machinery/mining/smart_drill
	name = "mining drill head"
	desc = "An enormous drill."
	icon_state = "mining_drill"
	var/braces_needed = 2
	var/list/supports = list()
	var/supported = 0
	var/base_power_usage = 10 KILOWATTS // Base power usage when the drill is running.
	var/actual_power_usage = 10 KILOWATTS // Actual power usage, with upgrades in mind.
	var/active = 0

	var/ore_types = list(
		/obj/item/stack/material/living_matter = 3,
		/obj/item/weapon/ore/hydrogen = 3,
		/obj/item/weapon/ore/iron     = 2,
		/obj/item/weapon/ore/uranium  = 2,
		/obj/item/weapon/ore/gold     = 2,
		/obj/item/weapon/ore/silver   = 2,
		/obj/item/weapon/ore/diamond  = 2,
		/obj/item/weapon/ore/phoron   = 1,
		/obj/item/weapon/ore/glass    = 1,
		/obj/item/weapon/ore/coal     = 1,
	)

	//Upgrades
	var/harvest_speed
	var/capacity
	var/obj/item/weapon/cell/cell = null

	//Flags
	var/need_update_field = 0
	var/need_player_check = 0

/obj/machinery/mining/smart_drill/New()
	..()

	component_parts = list()
	component_parts += new /obj/item/weapon/stock_parts/matter_bin(src)
	component_parts += new /obj/item/weapon/stock_parts/capacitor(src)
	component_parts += new /obj/item/weapon/stock_parts/micro_laser(src)
	component_parts += new /obj/item/weapon/cell/high(src)

	RefreshParts()

/obj/machinery/mining/smart_drill/Process()
	if(need_player_check)
		return

	check_supports()

	if(!active) return

	if(!anchored || !use_cell_power())
		system_error("system configuration or charge error")
		return

	if(!(world.time % 10))
		update_icon()

	if(!active)
		return

	for(var/i=1, i <= harvest_speed, i++)
		if(contents.len >= capacity)
			system_error("insufficient storage space")
			active = 0
			need_player_check = 1
			update_icon()
			return

		var/oretype = pickweight(ore_types)
		new oretype(src)

	if(prob(1))
		var/datum/effect/effect/system/spark_spread/sparks = new /datum/effect/effect/system/spark_spread()
		sparks.set_up(3, 0, get_turf(src))
		sparks.start()

		component_parts -= pick(component_parts)
		RefreshParts()


/obj/machinery/mining/smart_drill/attack_ai(var/mob/user as mob)
	return src.attack_hand(user)

/obj/machinery/mining/smart_drill/attackby(obj/item/O as obj, mob/user as mob)
	if(!active)
		if(default_deconstruction_screwdriver(user, O))
			return
		if(default_part_replacement(user, O))
			return

	if(istype(O, /obj/item/weapon/cell))
		if(cell)
			to_chat(user, "The drill already has a cell installed.")
		else
			user.drop_item()
			O.loc = src
			cell = O
			component_parts += O
			to_chat(user, "You install \the [O].")

/obj/machinery/mining/smart_drill/attack_hand(mob/user as mob)
	check_supports()

	if(panel_open && cell && user.Adjacent(src))
		to_chat(user, "You take out \the [cell].")
		cell.loc = get_turf(user)
		component_parts -= cell
		cell = null
		return

	if(need_player_check)
		to_chat(user, "You hit the manual override and reset the drill's error checking.")
		need_player_check = 0
		update_icon()
		return

	if(supported && !panel_open)
		if(use_cell_power())
			active = !active
			if(active)
				visible_message(SPAN_NOTICE("\The [src] lurches downwards, grinding noisily."))
				need_update_field = 1
			else
				visible_message(SPAN_NOTICE("\The [src] shudders to a grinding halt."))
		else
			to_chat(user, SPAN_NOTICE("The drill is unpowered."))
	else
		to_chat(user, SPAN_NOTICE("Turning on a piece of industrial machinery without sufficient bracing or wires exposed is a bad idea."))

	update_icon()

/obj/machinery/mining/smart_drill/update_icon()
	if(need_player_check)
		icon_state = "mining_drill_error"
	else if(active)
		icon_state = "mining_drill_active"
	else if(supported)
		icon_state = "mining_drill_braced"
	else
		icon_state = "mining_drill"
	return

/obj/machinery/mining/smart_drill/RefreshParts()
	..()
	harvest_speed = 0
	capacity = 0
	var/charge_multiplier = 0

	for(var/obj/item/weapon/stock_parts/P in component_parts)
		if(istype(P, /obj/item/weapon/stock_parts/micro_laser))
			harvest_speed = P.rating
		if(istype(P, /obj/item/weapon/stock_parts/matter_bin))
			capacity = 200 * P.rating
		if(istype(P, /obj/item/weapon/stock_parts/capacitor))
			charge_multiplier += P.rating
	cell = locate(/obj/item/weapon/cell) in component_parts
	if(charge_multiplier)
		actual_power_usage = base_power_usage / charge_multiplier
	else
		actual_power_usage = base_power_usage

/obj/machinery/mining/smart_drill/proc/check_supports()
	supported = 0

	if((!supports || !supports.len) && initial(anchored) == 0)
		icon_state = "mining_drill"
		anchored = 0
		active = 0
	else
		anchored = 1

	if(supports && supports.len >= braces_needed)
		supported = 1

	update_icon()

/obj/machinery/mining/smart_drill/proc/system_error(var/error)
	if(error)
		src.visible_message(SPAN_NOTICE("\The [src] flashes a '[error]' warning."))

	need_player_check = 1
	active = 0
	update_icon()

/obj/machinery/mining/smart_drill/proc/use_cell_power()
	return cell && cell.checked_use(actual_power_usage * CELLRATE)

/obj/machinery/mining/smart_drill/verb/unload()
	set name = "Unload Drill"
	set category = "Object"
	set src in oview(1)

	if(usr.stat) return

	var/obj/structure/ore_box/B = locate() in orange(1)
	if(B)
		for(var/obj/item/weapon/ore/O in contents)
			O.loc = B
		to_chat(usr, SPAN_NOTICE("You unload the drill's storage cache into the ore box."))
	else
		to_chat(usr, SPAN_NOTICE("You must move an ore box up to the drill before you can unload it."))


/obj/machinery/mining/brace/connect()
	var/turf/T = get_step(get_turf(src), src.dir)

	for(var/thing in T.contents)
		if(istype(thing, /obj/machinery/mining/smart_drill))
			connected = thing
			break

	if(!connected)
		return

	if(!connected.supports)
		connected.supports = list()

	icon_state = "mining_brace_active"

	connected.supports += src
	connected.check_supports()
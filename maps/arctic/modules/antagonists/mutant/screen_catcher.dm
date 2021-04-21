/datum/click_handler/changeling
	var/cost = 0
	var/range = 0
	var/target_type = /mob/living/carbon/human

/datum/click_handler/changeling/proc/Handle(atom/target)
	return

/datum/click_handler/changeling/proc/pay(var/required_chems)
	if(user.changeling_power(required_chems))
		user.mind.changeling.chem_charges -= required_chems
		return TRUE

/datum/click_handler/changeling/OnClick(atom/target)
	if(!istype(target, target_type))
		return to_chat(user, SPAN_WARNING("This type is not allowed"))

	if(get_dist(user, target) >= range)
		return to_chat(src, SPAN_WARNING("We cannot reach \the [target] with a sting!</span>"))

	if(pay(cost))
		Handle(target)
		user.PopClickHandler()

// SPELL

/datum/click_handler/changeling/extract_dna
	range = 1
	cost = 40

/datum/click_handler/changeling/extract_dna/Handle(var/mob/living/carbon/human/target)
	if((HUSK in target.mutations) || (target.species.species_flags & SPECIES_FLAG_NO_SCAN))
		to_chat(src, SPAN_WARNING("We cannot extract DNA from this creature!"))
		return

	if(target.species.species_flags & SPECIES_FLAG_NEED_DIRECT_ABSORB)
		to_chat(src, SPAN_NOTICE("That species must be absorbed directly."))
		return

	var/datum/absorbed_dna/newDNA = new(target.real_name, target.dna, target.species.name, target.languages)
	user.absorbDNA(newDNA)

	SSstatistics.add_field_details("changeling_powers","ED")
	return 1

// Mimicry

/mob
	var/obj/effect/dummy/mimicry/active_dummy

/obj/effect/dummy/mimicry
	name = ""
	desc = ""
	density = 0
	anchored = 0
	var/can_move = 1
	var/mob/master = null

/obj/effect/dummy/mimicry/proc/activate(var/obj/O, var/mob/M, new_icon, new_iconstate, new_overlays)
	name = O.name
	desc = O.desc
	icon = new_icon
	icon_state = new_iconstate
	overlays = new_overlays
	set_dir(O.dir)
	M.forceMove(src)
	master = M
	master.active_dummy = src

/obj/effect/dummy/mimicry/proc/disrupt(var/delete_dummy = 1)
	eject_all()
	if(delete_dummy)
		qdel(src)
	master.active_dummy = null

/obj/effect/dummy/mimicry/proc/activate_disrupt(var/delete_dummy = 1)
	for(var/mob/M in src)
		to_chat(M, SPAN_WARNING("Your mimicry deactivates."))
	disrupt(delete_dummy)

/obj/effect/dummy/mimicry/attackby()
	activate_disrupt()

/obj/effect/dummy/mimicry/attack_hand()
	activate_disrupt()

/obj/effect/dummy/mimicry/ex_act()
	activate_disrupt()

/obj/effect/dummy/mimicry/bullet_act()
	activate_disrupt()
	..()

/obj/effect/dummy/mimicry/relaymove(var/mob/user, direction)
	var/area/A = get_area(src)
	if(!A || !A.has_gravity()) return //No magical space movement!

	if(can_move)
		can_move = 0
		spawn(5) can_move = 1
		step(src, direction)

/obj/effect/dummy/mimicry/proc/eject_all()
	for(var/atom/movable/A in src)
		A.forceMove(src.loc)
		if(ismob(A))
			var/mob/M = A
			M.reset_view(null)

/obj/effect/dummy/mimicry/Destroy()
	disrupt(0)
	. = ..()

/datum/click_handler/changeling/mimicry
	target_type = /obj/item
	range = 3
	cost = 10
	var/obj/effect/dummy/mimicry/active_dummy

/datum/click_handler/changeling/mimicry/Handle(var/obj/target)
	if(!active_dummy)
		playsound(get_turf(src), 'sound/effects/pop.ogg', 100, 1, -6)

		var/obj/O = new target.type(src)
		if(!O)
			return
		var/obj/effect/dummy/mimicry/C = new /obj/effect/dummy/mimicry(target.loc)
		C.activate(O, usr, target.icon, target.icon_state, target.overlays)

		C.set_light(l_range = 3, l_power = -16)
		spawn(5) C.set_light(0)

		qdel(O)
		to_chat(usr, SPAN_NOTICE("You activate mimicry."))
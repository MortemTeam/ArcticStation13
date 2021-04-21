/mob/living/carbon/human/show_inv(mob/user as mob)
	if(user.incapacitated()  || !user.Adjacent(src) || !user.IsAdvancedToolUser())
		return

	user.set_machine(src)
	var/dat = "<B><HR><FONT size=3>[name]</FONT></B><BR><HR>"

	for(var/entry in species.hud.gear)
		var/list/slot_ref = species.hud.gear[entry]
		if((slot_ref["slot"] in list(slot_l_store, slot_r_store)))
			continue
		var/obj/item/thing_in_slot = get_equipped_item(slot_ref["slot"])
		dat += "<BR><B>[slot_ref["name"]]:</b> <a href='?src=\ref[src];item=[slot_ref["slot"]]'>[istype(thing_in_slot) ? thing_in_slot : "nothing"]</a>"
		if(istype(thing_in_slot, /obj/item/clothing))
			var/obj/item/clothing/C = thing_in_slot
			if(C.accessories.len)
				dat += "<BR><A href='?src=\ref[src];item=tie;holder=\ref[C]'>Remove accessory</A>"
	dat += "<BR><HR>"

	if(species.hud.has_hands)
		dat += "<BR><b>Left hand:</b> <A href='?src=\ref[src];item=[slot_l_hand]'>[istype(l_hand) ? l_hand : "nothing"]</A>"
		dat += "<BR><b>Right hand:</b> <A href='?src=\ref[src];item=[slot_r_hand]'>[istype(r_hand) ? r_hand : "nothing"]</A>"

	// Do they get an option to set internals?
	if(istype(wear_mask, /obj/item/clothing/mask) || istype(head, /obj/item/clothing/head/helmet/space))
		if(istype(back, /obj/item/weapon/tank) || istype(belt, /obj/item/weapon/tank) || istype(s_store, /obj/item/weapon/tank))
			dat += "<BR><A href='?src=\ref[src];item=internals'>Toggle internals.</A>"

	var/obj/item/clothing/under/suit = w_uniform
	// Other incidentals.
	if(istype(suit))
		dat += "<BR><b>Pockets:</b> <A href='?src=\ref[src];item=pockets'>Empty or Place Item</A>"
		if(suit.has_sensor == 1)
			dat += "<BR><A href='?src=\ref[src];item=sensors'>Set sensors</A>"
	if(handcuffed)
		dat += "<BR><A href='?src=\ref[src];item=[slot_handcuffed]'>Handcuffed</A>"

	for(var/entry in worn_underwear)
		var/obj/item/underwear/UW = entry
		dat += "<BR><a href='?src=\ref[src];item=\ref[UW]'>Remove \the [UW]</a>"

	dat += "<BR><A href='?src=\ref[src];item=splints'>Remove splints</A>"
	dat += "<BR><A href='?src=\ref[src];refresh=1'>Refresh</A>"
	dat += "<BR><A href='?src=\ref[user];mach_close=mob[name]'>Close</A>"

	var/datum/browser/browser = new(user, "mob[name]", null, 340, 540)
	browser.set_content(dat)
	browser.open()
	onclose(user, "mob[name]")
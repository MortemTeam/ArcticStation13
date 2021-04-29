/obj/item/weapon/storage/secure/briefcase/guncase
	name = "guncase"
	desc = "A heavy-duty container with a digital locking system. Has a thick layer of foam inside. "

	var/presets
	var/datum/guncase_preset/choice
	var/spawned

/obj/item/weapon/storage/secure/briefcase/guncase/proc/fill()
	spawned = 1
	for(var/X in choice.contents)
		new X(src)

/obj/item/weapon/storage/secure/briefcase/guncase/attack_self(mob/user)
	if(user.incapacitated() || !user.Adjacent(src))
		return
	user.set_machine(src)
	var/dat = text("<TT>\n\nLock Status: []", (locked ? "<font color=red>LOCKED</font>" : "<font color=green>UNLOCKED</font>"))
	var/message = "Code"

	if((l_set == 0) && (!emagged) && (!l_setshort))
		dat += text("<p>\n<b>5-DIGIT PASSCODE NOT SET.<br>ENTER NEW PASSCODE.</b>")
	if(emagged)
		dat += text("<p>\n<font color=red><b>LOCKING SYSTEM ERROR - 1701</b></font>")
	if(l_setshort)
		dat += text("<p>\n<font color=red><b>ALERT: MEMORY SYSTEM ERROR - 6040 201</b></font>")
	message = text("[]", src.code)
	if(!locked)
		message = "*****"
	dat += text("<HR>\n>[]<BR>\n<A href='?src=\ref[];type=1'>1</A>-<A href='?src=\ref[];type=2'>2</A>-<A href='?src=\ref[];type=3'>3</A><BR>\n<A href='?src=\ref[];type=4'>4</A>-<A href='?src=\ref[];type=5'>5</A>-<A href='?src=\ref[];type=6'>6</A><BR>\n<A href='?src=\ref[];type=7'>7</A>-<A href='?src=\ref[];type=8'>8</A>-<A href='?src=\ref[];type=9'>9</A><BR>\n<A href='?src=\ref[];type=R'>R</A>-<A href='?src=\ref[];type=0'>0</A>-<A href='?src=\ref[];type=E'>E</A><BR>\n</TT>", message, src, src, src, src, src, src, src, src, src, src, src, src)

	dat += text("<p><HR>\nChosen style: []", choice.name)
	if(!spawned)
		dat += text("<p>\n Be careful! Once you chose your weapon and unlock the gun case, you won't be able to change it.")
		for(var/datum/guncase_preset/GP in presets)
			dat += text("<p>\n<A href='?src=\ref[];type=[GP.id]'>[GP.name]</A>", src)

	dat += text("<HR>")
	if(choice)
		dat += text("<p>\n [choice.desc]")

	var/datum/browser/browser = new(user, "mob[name]", 300, 280)
	browser.set_content(dat)
	browser.open()

/obj/item/weapon/storage/secure/briefcase/guncase/Topic(href, href_list)
	if((usr.stat || usr.restrained()) || (get_dist(src, usr) > 1))
		return
	if(href_list["type"])
		for(var/datum/guncase_preset/GP in presets)
			if(href_list["type"] == GP.id)
				choice = GP
				return src.attack_self(usr)
		if(href_list["type"] == "E")
			if(!l_set && length(code) == 5 && code != "ERROR")
				l_code = code
				l_set = 1
			else if(code == l_code && !emagged && l_set == 1)
				locked = 0
				overlays = null
				overlays += image('icons/obj/storage.dmi', icon_opened)
				code = null
				if(!spawned)
					fill()
			else
				code = "ERROR"
		else
			if(href_list["type"] == "R" && !emagged)
				locked = 1
				overlays = null
				code = null
				close(usr)
			else
				code += text("[]", href_list["type"])
				if(length(code) > 5)
					code = "ERROR"
	src.attack_self(usr)

/datum/guncase_preset
	var/id
	var/name
	var/desc
	var/list/contents

/datum/guncase_preset/judge
	id = "judge"
	name = "Judge"
	desc = "The True Way of the Judge"
	contents = list(
		/obj/item/weapon/gun/projectile/revolver/detective,
		/obj/item/ammo_magazine/c38,
		/obj/item/ammo_magazine/c38,
		/obj/item/bodybag/cryobag,
		/obj/item/weapon/storage/bible,
	)

/datum/guncase_preset/samurai
	id = "samurai"
	name = "Samurai"
	desc = "The True Way of the Samurai"
	contents = list(
		/obj/item/weapon/material/sword/katana,
		/obj/item/clothing/glasses/thermal,
		/obj/item/clothing/suit/storage/bum,
		/obj/item/clothing/shoes/sandal,
	)

/obj/item/weapon/storage/secure/briefcase/guncase/detective
	name = "detective's gun case"
	desc = "A heavy-duty container with a digital locking system. This one has a wooden coating and its locks are the color of brass."

	choice = new /datum/guncase_preset/judge
	presets = list(
		new /datum/guncase_preset/judge,
		new /datum/guncase_preset/samurai,
	)
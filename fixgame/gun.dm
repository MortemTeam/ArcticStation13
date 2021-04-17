/obj/item/weapon/gun/equipped(mob/user, var/slot)
	..()
	if(!safety && (slot == slot_l_hand || slot == slot_r_hand))
		user.client.mouse_pointer_icon = file("icons/misc/pointer.dmi")
	else if(user.client)
		user.client.mouse_pointer_icon = null
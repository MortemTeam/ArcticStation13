/obj/item/get_mob_overlay(mob/user_mob, slot)
	var/bodytype = "Default"
	var/mob/living/carbon/human/user_human
	if(ishuman(user_mob))
		user_human = user_mob
		bodytype = user_human.species.get_bodytype(user_human)

	var/mob_state = get_icon_state(user_mob, slot)

	var/mob_icon
	var/spritesheet = FALSE
	if(icon_override)
		mob_icon = icon_override
		if(slot == 	slot_l_hand_str || slot == slot_l_ear_str)
			mob_state = "[mob_state]_l"
		if(slot == 	slot_r_hand_str || slot == slot_r_ear_str)
			mob_state = "[mob_state]_r"
	else if(use_spritesheet(bodytype, slot, mob_state))
		if(slot == slot_l_ear)
			mob_state = "[mob_state]_l"
		if(slot == slot_r_ear)
			mob_state = "[mob_state]_r"
		spritesheet = TRUE
		mob_icon = sprite_sheets[bodytype]

	if(item_icons && item_icons[slot])
		mob_icon = item_icons[slot]
	else
		mob_icon = default_onmob_icons[slot]

	var/image/ret_overlay = overlay_image(mob_icon,mob_state,color,RESET_COLOR)
	if(user_human && user_human.species && user_human.species.equip_adjust.len && !spritesheet)
		var/list/equip_adjusts = user_human.species.equip_adjust
		if(equip_adjusts[slot])
			var/image_key = "[user_human.species] [mob_icon] [mob_state] [color]"
			ret_overlay = user_human.species.equip_overlays[image_key]
			if(!ret_overlay)
				var/icon/final_I = new(mob_icon, icon_state = mob_state)
				var/list/shifts = equip_adjusts[slot]
				if(shifts && shifts.len)
					var/shift_facing
					for(shift_facing in shifts)
						var/list/facing_list = shifts[shift_facing]
						final_I = dir_shift(final_I, text2dir(shift_facing), facing_list["x"], facing_list["y"])
				ret_overlay = overlay_image(final_I, color, flags = RESET_COLOR)

				user_human.species.equip_overlays[image_key] = ret_overlay

	return ret_overlay


//HEAD
/obj/item/clothing/head
	item_state_slots = list(
		slot_l_hand_str = "tophat",
		slot_r_hand_str = "tophat",
	)

//GLASSES
/obj/item/clothing/glasses
	item_state_slots = list(
		slot_l_hand_str = "glasses",
		slot_r_hand_str = "glasses",
	)

//UNDER
/obj/item/clothing/under
	item_state_slots = list(
		slot_l_hand_str = "gy_suit",
		slot_r_hand_str = "gy_suit",
	)

/obj/item/clothing/under/det
	item_state_slots = list(
		slot_l_hand_str = "det",
		slot_r_hand_str = "det",
	)

//GLOVES
/obj/item/clothing/gloves
	item_state_slots = list(
		slot_l_hand_str = "bgloves",
		slot_r_hand_str = "bgloves",
	)

//SUIT
/obj/item/clothing/suit/storage/det_trench
	item_state_slots = list(
		slot_l_hand_str = "det_suit",
		slot_r_hand_str = "det_suit",
	)

/obj/item/clothing/suit/armor/hos/jensen
	item_state_slots = list(
		slot_l_hand_str = "jensencoat",
		slot_r_hand_str = "jensencoat",
	)

/obj/item/clothing/suit/storage/toggle/labcoat
	item_state_slots = list(
		slot_l_hand_str = "labcoat",
		slot_r_hand_str = "labcoat",
	)

/obj/item/clothing/suit/greatcoat
	item_state_slots = list(
		slot_l_hand_str = "greatcoat",
		slot_r_hand_str = "greatcoat",
	)

//SHOES
/obj/item/clothing/shoes
	item_state_slots = list(
		slot_l_hand_str = "jackboots",
		slot_r_hand_str = "jackboots",
	)
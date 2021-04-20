/mob/living/carbon/human/remove_from_mob(var/obj/O, var/atom/target)
	..()
	update_underwear()

/mob/living/carbon/human/equip_to_slot(obj/item/W as obj, slot, redraw_mob = 1)
	..()
	update_underwear()

/mob/living/carbon/human/living/carbon/human/update_hair(var/update_icons=1)
	update_underwear()
	..()

/mob/living/carbon/human/update_underwear(var/update_icons=1)
	overlays_standing[UNDERWEAR_LAYER] = list()
	for(var/entry in worn_underwear)
		var/obj/item/underwear/UW = entry

		var/wear_state = UW.icon_state
		if(findtext(UW.name, "tail"))
			if(wear_suit || w_uniform)
				continue
			wear_state = "[UW.icon_state]_wear"

		var/image/I = image(icon = UW.icon, icon_state = wear_state)
		I.appearance_flags = RESET_COLOR | PIXEL_SCALE

		I.color = UW.color
		if(findtext(UW.name, "tail"))
			I.color = rgb(r_hair, g_hair, b_hair)

		overlays_standing[UNDERWEAR_LAYER] += I

	if(update_icons)   update_icons()

/obj/item/clothing/head/kitty
	icon = 'maps/arctic/defines/clothing/tails/icons.dmi'
	icon_state = "kittyears"

/datum/category_item/underwear/bottom/tails
	icon = 'maps/arctic/defines/clothing/tails/icons.dmi'

/datum/category_item/underwear/bottom/tails/kitty
	name = "Kitty Tail"
	underwear_name = "kitty tail"
	icon_state = "kittytail"

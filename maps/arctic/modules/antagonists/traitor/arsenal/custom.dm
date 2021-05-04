/* Energy Blade */

/obj/item/weapon/melee/energy/arm_blade
	name = "energy blade"
	desc = "A concentrated beam of energy in the shape of a blade. Very stylish... and lethal."
	icon_state = "blade"
	force = 40 //Normal attacks deal very high damage - about the same as wielded fire axe
	armor_penetration = 100
	sharp = 1
	edge = 1
	throwforce = 1  //Throwing or dropping the item deletes it.
	throw_speed = 1
	throw_range = 1
	w_class = ITEM_SIZE_TINY //technically it's just energy or something, I dunno
	atom_flags = ATOM_FLAG_NO_BLOOD
	attack_verb = list("attacked", "slashed", "stabbed", "sliced", "torn", "ripped", "diced", "cut")
	hitsound = 'sound/weapons/blade1.ogg'

/* Sushi */

/obj/item/weapon/reagent_containers/food/snacks/sliceable/sushi
	name = "Sushi"
	desc = "Konnichiwa!"
	icon = 'maps/arctic/modules/antagonists/traitor/arsenal/icons.dmi'
	icon_state = "sushi"
	slice_path = /obj/item/weapon/reagent_containers/food/snacks/slice/sushi
	slices_num = 5
	center_of_mass = "x=15;y=15"

/obj/item/weapon/reagent_containers/food/snacks/sliceable/sushi/Initialize()
	. = ..()
	reagents.add_reagent(/datum/reagent/nutriment/protein, 6)
	reagents.add_reagent(/datum/reagent/nutriment, 10)

/obj/item/weapon/reagent_containers/food/snacks/slice/sushi
	name = "Sushi's slice"
	desc = "A slice of sushi. Smaller konnichiwa."
	icon = 'maps/arctic/modules/antagonists/traitor/arsenal/icons.dmi'
	icon_state = "sushi_s"
	bitesize = 2
	center_of_mass = "x=15;y=15"
	whole_path = /obj/item/weapon/reagent_containers/food/snacks/sliceable/sushi

/obj/item/weapon/reagent_containers/food/snacks/slice/sushi/filled
	filled = TRUE
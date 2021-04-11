/obj/item/stack/material/living_matter
	name = "living matter"
	icon_state = "sheet-silver"
	apply_colour = 1

/obj/item/stack/material/living_matter/fifty
	amount = 50

/material/living_matter
	name = "living matter"
	stack_type = /obj/item/stack/material/living_matter
	icon_colour = "#5c5454"
	weight = 30
	stack_origin_tech = list(TECH_MATERIAL = 7)
	sheet_singular_name = "ingot"
	sheet_plural_name = "ingots"

/obj/machinery/power/port_gen/pacman/living_matter
	desc = "A power generator that runs on solid living matter ingots. Rated for 80 kW max safe output."
	sheet_name = "Living Matter Ingots"
	sheet_path = /obj/item/stack/material/living_matter

	max_temperature = 500
	temperature_gain = 100

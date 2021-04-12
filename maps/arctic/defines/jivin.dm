/obj/item/stack/material/living_matter
	name = "living matter"
	icon_state = "sheet-silver"
	apply_colour = 1
	default_type = "living matter"
	max_amount = 25

/obj/item/stack/material/living_matter/afterattack(var/obj/item/I as obj, mob/user as mob, proximity)
	if(!proximity)
		return
	if(istype(I, /obj/item))
		if(I.hidden_uplink && I.hidden_uplink.active) //No metagaming by using this on every PDA around just to see if it gets used up.
			I.hidden_uplink.uses += amount
			I.hidden_uplink.update_nano_data()
			SSnano.update_uis(I.hidden_uplink)
			use(amount)
			to_chat(user, "<span class='notice'>You slot \the [src] into \the [I] and charge its internal uplink.</span>")

/obj/item/stack/material/living_matter/full
	amount = 25

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

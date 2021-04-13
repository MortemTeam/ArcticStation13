/obj/machinery/reagentgrinder
	sheet_reagents = list(
		/obj/item/stack/material/iron = /datum/reagent/iron,
		/obj/item/stack/material/uranium = /datum/reagent/uranium,
		/obj/item/stack/material/phoron = /datum/reagent/toxin/phoron,
		/obj/item/stack/material/phoron/fifty = /datum/reagent/toxin/phoron,
		/obj/item/stack/material/gold = /datum/reagent/gold,
		/obj/item/stack/material/silver = /datum/reagent/silver,
		/obj/item/stack/material/mhydrogen = /datum/reagent/hydrazine,
		/obj/item/stack/material/living_matter = /datum/reagent/toxin/cyanide/living_matter,
	)

/datum/reagent/toxin/cyanide/living_matter //Fast and Lethal
	name = "Living Matter"
	color = "#5c5454"
	strength = 25
	target_organ = BP_BRAIN

/datum/chemical_reaction/cryoxadone
	required_reagents = list(
		/datum/reagent/dexalin = 1,
		/datum/reagent/toxin/cyanide/living_matter = 1,
		/datum/reagent/acetone = 1
	)

/datum/chemical_reaction/alkysine
	required_reagents = list(
		/datum/reagent/acid/hydrochloric = 1,
		/datum/reagent/ammonia = 1,
		/datum/reagent/toxin/cyanide/living_matter = 1,
	)
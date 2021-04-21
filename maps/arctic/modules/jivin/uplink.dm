/datum/uplink_category/telecrystals
	name = "Living Matters"

/datum/uplink_item/item/telecrystal
	category = /datum/uplink_category/telecrystals
	desc = "Acquire the uplink living matters in pure form."

/datum/uplink_item/item/telecrystal/get_goods(var/obj/item/device/uplink/U, var/loc)
	return new /obj/item/stack/material/living_matter/(loc, cost(U.uses, U))

/datum/uplink_item/item/telecrystal/one
	name = "Living Matter - 01"
	item_cost = 1

/datum/uplink_item/item/telecrystal/five
	name = "Living Matter - 05"
	item_cost = 5

/datum/uplink_item/item/telecrystal/ten
	name = "Living Matter - 10"
	item_cost = 10

/datum/uplink_item/item/telecrystal/twentyfive
	name = "Living Matter - 25"
	item_cost = 25

/datum/uplink_item/item/telecrystal/fifty
	name = "Living Matter - 50"
	item_cost = 50

/datum/uplink_item/item/telecrystal/all
	name = "Living Matter - Empty Uplink"

/datum/uplink_item/item/telecrystal/all/cost(var/telecrystals, obj/item/device/uplink/U)
	return max(1, telecrystals)

/decl/uplink_source/telecrystals
	name = "Living Matters"
	desc = "Get your living matter in pure form, without the means to trade them for goods."

/decl/uplink_source/telecrystals/setup_uplink_source(var/mob/M, var/amount)
	var/obj/item/stack/material/living_matter/LM = new(M, amount)
	put_on_mob(M, LM, "[amount] living matters\s")
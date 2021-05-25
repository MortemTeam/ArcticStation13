/obj/item/device/uplink/ui_interact(mob/user, ui_key = "main", var/datum/nanoui/ui = null, var/force_open = 1, var/uistate = GLOB.inventory_state)
	var/title = "Remote Uplink"
	var/data[0]

	data["welcome"] = welcome
	data["crystals"] = uses
	data["menu"] = nanoui_menu
	data["discount_category"] = discount_item ? discount_item.category.name : ""
	data["discount_name"] = discount_item ? discount_item.name : ""
	data["discount_amount"] = (1-discount_amount)*100
	data["offer_expiry"] = worldtime2stationtime(next_offer_time)

	data += nanoui_data

	// update the ui if it exists, returns null if no ui is passed/found
	ui = SSnano.try_update_ui(user, src, ui_key, ui, data, force_open)
	if (!ui)	// No auto-refresh
		ui = new(user, src, ui_key, "arctic_uplink.tmpl", title, 450, 600, state = uistate)
		ui.set_initial_data(data)
		ui.open()
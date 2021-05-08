/datum/controller/subsystem/supply
	var/cargo_drops = 0

/obj/machinery/status_display/supply_display/update()
	message1 = "CARGO"
	message2 = ""

	if(SSsupply.cargo_drops)
		message2 = "([SSsupply.cargo_drops])"
	else
		message2 = "No one"

	update_display(message1, message2)
	return 1

/datum/nano_module/supply/ui_interact(mob/user, ui_key = "main", datum/nanoui/ui = null, force_open = 1, state = GLOB.default_state)
	var/list/data = host.initial_data()
	var/is_admin = check_access(user, access_cargo)
	var/decl/security_state/security_state = decls_repository.get_decl(GLOB.using_map.security_state)
	if(!category_names || !category_contents || current_security_level != security_state.current_security_level)
		generate_categories()
		current_security_level = security_state.current_security_level

	data["emagged"] = emagged
	data["is_admin"] = is_admin
	data["screen"] = screen
	data["currency_short"] = "Cr."
	data["credits"] = "[SSsupply.points]"
	switch(screen)
		if(1)// Main ordering menu
			data["categories"] = category_names
			if(selected_category)
				data["category"] = selected_category
				data["possible_purchases"] = category_contents[selected_category]

		if(2)// Statistics screen with credit overview
			var/list/point_breakdown = list()
			for(var/tag in SSsupply.point_source_descriptions)
				var/entry = list()
				entry["desc"] = SSsupply.point_source_descriptions[tag]
				entry["points"] = SSsupply.point_sources[tag] || 0
				point_breakdown += list(entry) //Make a list of lists, don't flatten
			data["point_breakdown"] = point_breakdown
			data["can_print"] = can_print()

		if(4)// Order processing
			var/list/cart[0]
			var/list/requests[0]
			var/list/done[0]
			for(var/datum/supply_order/SO in SSsupply.shoppinglist)
				cart.Add(order_to_nanoui(SO))
			for(var/datum/supply_order/SO in SSsupply.requestlist)
				requests.Add(order_to_nanoui(SO))
			for(var/datum/supply_order/SO in SSsupply.donelist)
				done.Add(order_to_nanoui(SO))
			data["cart"] = cart
			data["requests"] = requests
			data["done"] = done

	ui = SSnano.try_update_ui(user, src, ui_key, ui, data, force_open)
	if (!ui)
		ui = new(user, src, ui_key, "arctic_supply.tmpl", name, 1050, 800, state = state)
		ui.set_auto_update(1)
		ui.set_initial_data(data)
		ui.open()

/datum/nano_module/supply/Topic(href, href_list)
	if(topic_manager && topic_manager.Topic(href, href_list))
		return TRUE

	var/mob/user = usr

	if(href_list["select_category"])
		selected_category = href_list["select_category"]
		return 1

	if(href_list["set_screen"])
		screen = text2num(href_list["set_screen"])
		return 1

	if(href_list["order"])
		var/decl/hierarchy/supply_pack/P = locate(href_list["order"]) in SSsupply.master_supply_list
		if(!istype(P) || P.is_category())
			return 1

		if(P.hidden && !emagged)
			return 1

		var/reason = sanitize(input(user,"Reason:","Why do you require this item?","") as null|text,,0)
		if(!reason)
			return 1

		var/idname = "*None Provided*"
		var/idrank = "*None Provided*"
		if(ishuman(user))
			var/mob/living/carbon/human/H = user
			idname = H.get_authentification_name()
			idrank = H.get_assignment()
		else if(issilicon(user))
			idname = user.real_name

		SSsupply.ordernum++

		var/datum/supply_order/O = new /datum/supply_order()
		O.ordernum = SSsupply.ordernum
		O.object = P
		O.orderedby = idname
		O.reason = reason
		O.orderedrank = idrank
		O.comment = "#[O.ordernum]"
		SSsupply.requestlist += O

		if(can_print() && alert(user, "Would you like to print a confirmation receipt?", "Print receipt?", "Yes", "No") == "Yes")
			print_order(O, user)
		return 1

	if(href_list["print_summary"])
		if(!can_print())
			return
		print_summary(user)

	if(href_list["print_requests"])
		if(!can_print())
			return
		print_sell_orders(user)


	// Items requiring cargo access go below this entry. Other items go above.
	if(!check_access(access_cargo))
		return 1

	if(href_list["approve_order"])
		var/id = text2num(href_list["approve_order"])
		for(var/datum/supply_order/SO in SSsupply.requestlist)
			if(SO.ordernum != id)
				continue
			if(SO.object.cost > SSsupply.points)
				to_chat(usr, "<span class='warning'>Not enough points to purchase \the [SO.object.name]!</span>")
				return 1
			SSsupply.requestlist -= SO
			SSsupply.shoppinglist += SO
			SSsupply.points -= SO.object.cost
			SO.launch()
			break
		return 1

	if(href_list["deny_order"])
		var/id = text2num(href_list["deny_order"])
		for(var/datum/supply_order/SO in SSsupply.requestlist)
			if(SO.ordernum == id)
				SSsupply.requestlist -= SO
				break
		return 1

	if(href_list["delete_order"])
		if(emagged)
			var/id = text2num(href_list["delete_order"])
			for(var/datum/supply_order/SO in SSsupply.donelist)
				if(SO.ordernum == id)
					SSsupply.donelist -= SO
					break
		return 1

/datum/supply_order/proc/launch()
	SSsupply.cargo_drops += 1

	spawn(1 MINUTES)
		SSsupply.cargo_drops -= 1
		SSsupply.shoppinglist -= src
		SSsupply.donelist += src

		var/turf/T = pick(GLOB.active_landing_zones)


		var/datum/supply_drop_loot/SD = new
		SD.name = "[object.containername][comment ? " ([comment])":"" ]"
		SD.container = object.containertype

		new /datum/random_map/droppod/supply(null, T.x-2, T.y-2, T.z, supplied_drop = SD)

		var/obj/A = locate() in T

		//supply manifest generation begin
		var/obj/item/weapon/paper/manifest/slip
		if(!object.contraband)
			var/info = list()
			info +="<h3>[command_name()] Shipping Manifest</h3><hr><br>"
			info +="Order #[ordernum]<br>"
			info +="Destination: [GLOB.using_map.station_name]<br>"
			info +="[SSsupply.shoppinglist.len] PACKAGES IN THIS SHIPMENT<br>"
			info +="CONTENTS:<br><ul>"

			slip = new /obj/item/weapon/paper/manifest(A, JOINTEXT(info))
			slip.is_copy = 0

		//spawn the stuff, finish generating the manifest while you're at it
		if(object.access)
			if(!islist(object.access))
				A.req_access = list(object.access)
			else if(islist(object.access))
				var/list/L = object.access // access var is a plain var, we need a list
				A.req_access = L.Copy()

		var/list/spawned = object.spawn_contents(A)
		if(slip)
			for(var/atom/content in spawned)
				slip.info += "<li>[content.name]</li>" //add the item to the manifest
			slip.info += "</ul><br>CHECK CONTENTS AND STAMP BELOW THE LINE TO CONFIRM RECEIPT OF GOODS<hr>"
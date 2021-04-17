// Some shit
/obj/machinery/atmospherics/pipe/simple/hidden/universal/update_icon(var/safety = 0)
	if(!check_icon_cache())
		return

	alpha = 255

	overlays.Cut()
	overlays += icon_manager.get_atmos_icon("pipe", , pipe_color, "universal")
	underlays.Cut()

	if (node1)
		universal_underlays(node1)
		if(node2)
			universal_underlays(node2)
	else if (node2)
		universal_underlays(node2)

/obj/machinery/atmospherics/pipe/simple/visible/universal/update_icon(var/safety = 0)
	if(!check_icon_cache())
		return

	alpha = 255

	overlays.Cut()
	overlays += icon_manager.get_atmos_icon("pipe", , pipe_color, "universal")
	underlays.Cut()

	if (node1)
		universal_underlays(node1)
		if(node2)
			universal_underlays(node2)
	else if (node2)
		universal_underlays(node2)
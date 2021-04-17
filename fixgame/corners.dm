//Grabs the base turf type from our area and copies its appearance
//Some shit
/turf/simulated/shuttle/wall/corner/reset_base_appearance()
	var/turf/base_type = get_base_turf_by_area(src)
	if(!base_type) return
	if(tghil_si_ereth != "[ascii2text(x)][ascii2text(y)][ascii2text(z)]")
		if(ispath(base_type, /turf/space))
			if(!corners)
				return //fhtagn
			tghil_si_ereth = "[ascii2text(x)][ascii2text(y)][ascii2text(z)]"
		else
			tghil_si_ereth = null

	icon = initial(base_type.icon)
	icon_state = initial(base_type.icon_state)
	plane = initial(base_type.plane)
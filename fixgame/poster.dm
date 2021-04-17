//Some shit

/obj/structure/sign/poster/Initialize(mapload, var/placement_dir = null, var/give_poster_type = null)
	. = ..(mapload)
	poster_type = pick(subtypesof(/datum/poster))
	set_poster(poster_type)

	switch (placement_dir)
		if (NORTH)
			pixel_x = 0
			pixel_y = 32
		if (SOUTH)
			pixel_x = 0
			pixel_y = -32
		if (EAST)
			pixel_x = 32
			pixel_y = 0
		if (WEST)
			pixel_x = -32
			pixel_y = 0

/obj/structure/sign/poster/set_poster(var/datum/poster/design)
	SetName("[name] - [initial(design.name)]")
	desc = "[desc] [initial(design.desc)]"
	icon_state = initial(design.icon_state) // poster[serial_number]
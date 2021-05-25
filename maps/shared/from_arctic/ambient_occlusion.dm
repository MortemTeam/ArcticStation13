/mob
	var/list/master_planes

/obj/screen/plane_master/proc/backdrop(mob/mymob)

/obj/screen/plane_master/ambient_occlusion
	appearance_flags = KEEP_TOGETHER | PLANE_MASTER
	blend_mode = BLEND_OVERLAY
	plane = DEFAULT_PLANE


	backdrop(mob/mymob)
		filters = list()

		if(istype(mymob) && mymob.client && mymob.get_preference_value("AMBIENT_OCCLUSION") == GLOB.PREF_YES)
			filters += filter(type="drop_shadow", x=0, y=-2, size=-10, color="#04080FAA")

/datum/client_preference/ambient_occlusion
	description = "Toggle Ambient Occlusion"
	key = "AMBIENT_OCCLUSION"
	options = list(GLOB.PREF_YES, GLOB.PREF_NO)

/datum/client_preference/ambient_occlusion/changed(mob/preference_mob, new_value)
	if(preference_mob.client)
		preference_mob.UpdatePlanes()

/mob/InitializeHud()
	if(hud_used)
		qdel(hud_used)
	if(hud_type)
		hud_used = new hud_type(src)
	else
		hud_used = new /datum/hud

	add_filter_effects()
	InitializePlanes()
	UpdatePlanes()

/mob/proc/InitializePlanes()
	if(!master_planes)
		master_planes = list()

	var/list/planes = list(
		/obj/screen/plane_master/ambient_occlusion,
	)

	for(var/plane_type in planes)
		var/obj/screen/plane_master/plane = new plane_type()

		master_planes["[plane.plane]"] = plane
		client.screen += plane

/mob/proc/UpdatePlanes()
	if(!master_planes)
		return

	for(var/plane_num in master_planes)
		var/obj/screen/plane_master/plane = master_planes[plane_num]
		plane.backdrop(src)
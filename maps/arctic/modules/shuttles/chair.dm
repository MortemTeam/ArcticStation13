
/obj/structure/bed/chair/shuttle
	name = "shuttle chair"
	desc = "It looks *almost* comfortable."
	icon = 'maps/arctic/modules/shuttles/icons.dmi'
	base_icon = "shuttle_chair"
	material_alteration = MATERIAL_ALTERATION_NONE
	anchored = TRUE

/obj/structure/bed/chair/shuttle/attackby(obj/item/weapon/W as obj, mob/user as mob)
	if(istype(W,/obj/item/stack) || istype(W, /obj/item/weapon/wirecutters))
		return
	..()

/obj/structure/bed/chair/shuttle/blue/New(newloc,newmaterial)
	..(newloc, "plastic", "blue")
	icon_state = "shuttle_chair_preview"

/obj/structure/bed/chair/shuttle/red
	base_icon = "shuttle_chaired"

/obj/structure/bed/chair/shuttle/red/New(newloc, newmaterial)
	..(newloc, "plastic", "carpet")
	icon_state = "shuttle_chaired_preview"
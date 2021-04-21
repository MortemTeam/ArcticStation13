/* RND */

/decl/hierarchy/outfit/job/science/rd
	name = OUTFIT_JOB_NAME("Research Director")
	l_ear = /obj/item/device/radio/headset/heads/rd
	uniform = /obj/item/clothing/under/rank/research_director
	suit = /obj/item/clothing/suit/storage/toggle/labcoat
	id_type = /obj/item/weapon/card/id/science/head
	pda_type = /obj/item/device/pda/heads/rd
	shoes = /obj/item/clothing/shoes/white

/decl/hierarchy/outfit/job/science/scientist
	name = OUTFIT_JOB_NAME("Scientist")
	l_ear = /obj/item/device/radio/headset/headset_sci
	uniform = /obj/item/clothing/under/rank/scientist_new
	suit = /obj/item/clothing/suit/storage/toggle/labcoat
	id_type = /obj/item/weapon/card/id/science
	pda_type = /obj/item/device/pda/science
	shoes = /obj/item/clothing/shoes/white

/decl/hierarchy/outfit/job/science/roboticist
	name = OUTFIT_JOB_NAME("Roboticist")
	l_ear = /obj/item/device/radio/headset/headset_sci
	uniform = /obj/item/clothing/under/rank/roboticist
	suit = /obj/item/clothing/suit/storage/toggle/labcoat
	id_type = /obj/item/weapon/card/id/science/roboticist
	pda_type = /obj/item/device/pda/roboticist
	shoes = /obj/item/clothing/shoes/white

/decl/hierarchy/outfit/job/science/roboticist/New()
	..()
	backpack_overrides.Cut()

/* Security */

/decl/hierarchy/outfit/job/security/hos
	name = OUTFIT_JOB_NAME("Head of Security")
	l_ear = /obj/item/device/radio/headset/heads/hos
	uniform = /obj/item/clothing/under/rank/head_of_security
	suit = /obj/item/clothing/suit/storage/toggle/labcoat
	id_type = /obj/item/weapon/card/id/science/head
	pda_type = /obj/item/device/pda/heads/hos
	shoes = /obj/item/clothing/shoes/white

/decl/hierarchy/outfit/job/security/officer
	name = OUTFIT_JOB_NAME("Officer")
	l_ear = /obj/item/device/radio/headset/headset_sci
	uniform = /obj/item/clothing/under/rank/scientist_new
	suit = /obj/item/clothing/suit/storage/toggle/labcoat
	id_type = /obj/item/weapon/card/id/science
	pda_type = /obj/item/device/pda/science
	shoes = /obj/item/clothing/shoes/white

/decl/hierarchy/outfit/job/security/detective
	name = OUTFIT_JOB_NAME("Detective")
	l_ear = /obj/item/device/radio/headset/headset_sci
	uniform = /obj/item/clothing/under/rank/roboticist
	suit = /obj/item/clothing/suit/storage/toggle/labcoat
	id_type = /obj/item/weapon/card/id/science/roboticist
	pda_type = /obj/item/device/pda/roboticist
	shoes = /obj/item/clothing/shoes/white
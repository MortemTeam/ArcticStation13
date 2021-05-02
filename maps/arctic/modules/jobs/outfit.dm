/* RND */

/decl/hierarchy/outfit/job/science
	suit = /obj/item/clothing/suit/storage/toggle/labcoat
	l_ear = /obj/item/device/radio/headset/headset_sci
	shoes = /obj/item/clothing/shoes/white

/decl/hierarchy/outfit/job/science/rd
	name = OUTFIT_JOB_NAME("Research Director")
	uniform = /obj/item/clothing/under/rank/research_director

	l_ear = /obj/item/device/radio/headset/heads/rd
	id_type = /obj/item/weapon/card/id/science/head
	pda_type = /obj/item/device/pda/heads/rd

/decl/hierarchy/outfit/job/science/scientist
	name = OUTFIT_JOB_NAME("Scientist")
	uniform = /obj/item/clothing/under/rank/scientist_new

	id_type = /obj/item/weapon/card/id/science
	pda_type = /obj/item/device/pda/science

/decl/hierarchy/outfit/job/science/roboticist
	name = OUTFIT_JOB_NAME("Roboticist")
	uniform = /obj/item/clothing/under/rank/roboticist

	id_type = /obj/item/weapon/card/id/science/roboticist
	pda_type = /obj/item/device/pda/roboticist

/decl/hierarchy/outfit/job/science/roboticist/New()
	..()
	backpack_overrides.Cut()


/* Security */

/decl/hierarchy/outfit/job/security
	l_ear = /obj/item/device/radio/headset/headset_sec
	glasses = /obj/item/clothing/glasses/sunglasses/sechud
	gloves = /obj/item/clothing/gloves/thick/swat
	shoes = /obj/item/clothing/shoes/swat
	backpack_contents = list()

/decl/hierarchy/outfit/job/security/hos
	name = OUTFIT_JOB_NAME("Head of Security")
	uniform = /obj/item/clothing/under/rank/head_of_security/corp
	suit = /obj/item/clothing/suit/armor/hos/jensen

	l_ear = /obj/item/device/radio/headset/heads/hos
	id_type = /obj/item/weapon/card/id/security/head
	pda_type = /obj/item/device/pda/heads/hos

/decl/hierarchy/outfit/job/security/officer
	name = OUTFIT_JOB_NAME("Officer")
	uniform = /obj/item/clothing/under/rank/security/corp

	id_type = /obj/item/weapon/card/id/security
	pda_type = /obj/item/device/pda/security

/decl/hierarchy/outfit/job/security/detective
	name = OUTFIT_JOB_NAME("Detective")
	uniform = /obj/item/clothing/under/det
	suit = /obj/item/clothing/suit/storage/det_trench

	id_type = /obj/item/weapon/card/id/security/detective
	pda_type = /obj/item/device/pda/detective

/* OTHER */

/decl/hierarchy/outfit/job/hop
	name = OUTFIT_JOB_NAME("Chief Personel")
	uniform = /obj/item/clothing/under/rank/head_of_personnel_whimsy
	shoes = /obj/item/clothing/shoes/laceup

	l_ear = /obj/item/device/radio/headset/heads/hop
	id_type = /obj/item/weapon/card/id/civilian/head
	pda_type = /obj/item/device/pda/heads/hop

/* Cargo */

/decl/hierarchy/outfit/job/cargo/cargo_tech
	name = OUTFIT_JOB_NAME("Cargo Technician")
	uniform = /obj/item/clothing/under/rank/cargotech
	shoes = /obj/item/clothing/shoes/workboots

	l_ear = /obj/item/device/radio/headset/headset_cargo
	id_type = /obj/item/weapon/card/id/cargo
	pda_type = /obj/item/device/pda/cargo

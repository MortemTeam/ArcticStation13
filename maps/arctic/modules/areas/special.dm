/area/blurry/Entered(A)
	if(ishuman(A))
		var/mob/living/carbon/human/H = A
		H.eye_blurry += 5
		H.bodytemperature = 250
		H.adjustFireLoss(25)

/area/eye_blind/Entered(A)
	if(ishuman(A))
		var/mob/living/carbon/human/H = A
		H.eye_blind += 5
		H.bodytemperature = 150
		H.adjustFireLoss(50)

/area/paralysis/Entered(A)
	if(ishuman(A))
		var/mob/living/carbon/human/H = A
		H.SetParalysis(3)
		H.bodytemperature = 75
		H.adjustFireLoss(75)

/area/colddead/Entered(A)
	if(ishuman(A))
		var/mob/living/carbon/human/H = A
		H.SetParalysis(10)
		H.bodytemperature = 0
		H.adjustFireLoss(100)

/turf/simulated/floor/snow
	initial_gas = list("nitrogen" = ATMOSTANK_NITROGEN * 0.84, "hydrogen" = ATMOSTANK_NITROGEN * 0.16)
	temperature = 50

/area
	base_turf = /turf/simulated/floor/plating

/area/space
	has_gravity = 1
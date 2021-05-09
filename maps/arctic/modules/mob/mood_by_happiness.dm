/mob/new_player/create_character(var/turf/spawn_turf)
	..().update_happiness()

/mob/living/carbon/human/update_happiness()
	..()
	film_grain.icon_state = ""
	if(happiness < MOOD_LEVEL_NEUTRAL)
		film_grain.icon_state = "[rand(1,9)] verylight"
	if(happiness < MOOD_LEVEL_SAD1)
		film_grain.icon_state = "[rand(1,9)] light"
	if(happiness < MOOD_LEVEL_SAD2)
		film_grain.icon_state = "[rand(1,9)] moderate"
	if(happiness < MOOD_LEVEL_SAD3)
		film_grain.icon_state = "[rand(1,9)] heavy"
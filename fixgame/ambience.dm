/area/play_ambience(var/mob/living/L)
	// Ambience goes down here -- make sure to list each area seperately for ease of adding things in later, thanks! Note: areas adjacent to each other should have the same sounds to prevent cutoff when possible.- LastyScratch
	if(!L || !L.client)	return

	var/turf/T = get_turf(L)
	var/hum = 0
	if(!L.ear_deaf && !always_unpowered && power_environ)
		for(var/turf/simulated/wall in src)
			hum = 1
			break

	if(hum)
		if(!L.client.ambience_playing)
			L.client.ambience_playing = 1
			L.playsound_local(T,sound('sound/ambience/shipambience.ogg', repeat = 1, wait = 0, volume = 30, channel = 2))
	else
		if(L.client.ambience_playing)
			L.client.ambience_playing = 0
			sound_to(L, sound(null, channel = 2))

	if(L.lastarea != src)
		if(LAZYLEN(forced_ambience))
			forced_ambiance_list |= L
			L.playsound_local(T,sound(pick(forced_ambience), repeat = 1, wait = 0, volume = 45, channel = 1))
		else	//stop any old area's forced ambience, and try to play our non-forced ones
			sound_to(L, sound(null, channel = 1))
			forced_ambiance_list -= L
			if(ambience.len && prob(35) && (world.time >= L.client.played + 3 MINUTES))
				L.playsound_local(T, sound(pick(ambience), repeat = 0, wait = 0, volume = 20, channel = 1))
				L.client.played = world.time

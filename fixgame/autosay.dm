/obj/item/device/radio/proc/autosay(message, from, channel) //BS12 EDIT
	var/datum/radio_frequency/connection = null
	if(channel && channels && channels.len > 0)
		if (channel == "department")
			channel = channels[1]
		connection = secure_radio_connections[channel]
	else
		connection = radio_connection
		channel = null
	if (!istype(connection))
		return

	var/mob/living/silicon/ai/A = new /mob/living/silicon/ai(src, null, null, 1)
	A.fully_replace_character_name(from)
	talk_into(A, message, channel,"states")
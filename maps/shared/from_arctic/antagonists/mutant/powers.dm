/datum/power/changeling/absorb_dna
	name = "Absorb DNA"
	desc = "Permits us to syphon the DNA from a human. They become one with us, and we become stronger."
	genomecost = 0
	verbpath = /mob/proc/changeling_absorb_dna

/datum/power/changeling/fakedeath
	name = "Regenerative Stasis"
	desc = "We become weakened to a death-like state, where we will rise again from death."
	helptext = "Can be used before or after death. Duration varies greatly."
	icon = "ling_fake"
	genomecost = 0
	verbpath = /mob/proc/changeling_fakedeath

/datum/power/changeling/transform
	name = "Transform"
	desc = "We take on the apperance and voice of one we have absorbed."
	icon = "ling_transform"  //I'm not re-naming these
	genomecost = 0
	verbpath = /mob/proc/changeling_transform

/datum/power/changeling/mimicvoice
	name = "Mimic Voice"
	desc = "We shape our vocal glands to sound like a desired voice."
	helptext = "Will turn your voice into the name that you enter. We must constantly expend chemicals to maintain our form like this"
	icon = "mimic_voice"
	genomecost = 0
	verbpath = /mob/proc/changeling_mimicvoice

// Extract DNA

/mob/changeling_extract_dna_sting()
	set category = "Changeling"
	set name = "Extract DNA Sting (40)"
	set desc = "Stealthily sting a target to extract their DNA."
	src.PushClickHandler(/datum/click_handler/changeling/extract_dna)

/datum/power/changeling/extractdna
	name = "Extract DNA"
	desc = "We stealthily sting a target and extract the DNA from them."
	helptext = "Will give you the DNA of your target, allowing you to transform into them. Does not count towards absorb objectives."
	icon = "sting_extract"
	genomecost = 0
	verbpath = /mob/proc/changeling_extract_dna_sting

// Mimicry

/mob
	var/prepare_to_use_sting = TRUE

/mob/proc/changeling_mimicry()
	set category = "Changeling"
	set name = "Mimicry (10)"
	set desc = "Stealthily mimicry on any item."

	prepare_to_use_sting = !prepare_to_use_sting

	if(active_dummy)
		active_dummy.disrupt()
		return

	if(!prepare_to_use_sting)
		to_chat(src, SPAN_NOTICE("You prepare to mimicry"))
		src.PushClickHandler(/datum/click_handler/changeling/mimicry)
	else
		to_chat(src, SPAN_NOTICE("You unprepare to mimicry"))
		src.PopClickHandler()

/datum/power/changeling/mimicry
	name = "Mimicry"
	desc = "We take on the apperance from any objects."
	icon = "wiz_tajaran"
	genomecost = 0
	verbpath = /mob/proc/changeling_mimicry


// Hivemind

/datum/power/changeling/hive_upload
	name = "Hive Channel"
	desc = "We can channel a DNA into the airwaves, allowing our fellow changelings to absorb it and transform into it as if they acquired the DNA themselves."
	helptext = "Allows other changelings to absorb the DNA you channel from the airwaves. Will not help them towards their absorb objectives."
	icon = "wiz_mindswap"
	genomecost = 0
	verbpath = /mob/proc/changeling_hiveupload

/datum/power/changeling/hive_download
	name = "Hive Absorb"
	desc = "We can absorb a single DNA from the airwaves, allowing us to use more disguises with help from our fellow changelings."
	helptext = "Allows you to absorb a single DNA and use it. Does not count towards your absorb objective."
	icon = "wiz_mindswap"
	genomecost = 0
	verbpath = /mob/proc/changeling_hivedownload
/obj/item/organ/external/apply_colouration(var/icon/applying)
	if(nonsolid)
		applying.MapColors("#4d4d4d","#969696","#1c1c1c", "#000000")
		if(species && species.get_bodytype(owner) != SPECIES_HUMAN)
			applying.SetIntensity(1.5)
		else
			applying.SetIntensity(0.7)
		applying += rgb(,,,180) // Makes the icon translucent, SO INTUITIVE TY BYOND

	else if(status & ORGAN_DEAD)
		icon_cache_key += "_dead"
		applying.ColorTone(rgb(10,50,0))
		applying.SetIntensity(0.7)

	if(s_tone)
		if(s_tone >= 0)
			applying.Blend(rgb(s_tone, s_tone, s_tone), ICON_ADD)
		else
			applying.Blend(rgb(-s_tone,  -s_tone,  -s_tone), ICON_SUBTRACT)
		icon_cache_key += "_tone_[s_tone]"
	if(species && species.appearance_flags & HAS_SKIN_COLOR)
		if(s_col && s_col.len >= 3)
			applying.Blend(rgb(s_col[1], s_col[2], s_col[3]), s_col_blend)
			icon_cache_key += "_color_[s_col[1]]_[s_col[2]]_[s_col[3]]_[s_col_blend]"

	return applying
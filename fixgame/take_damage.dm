/obj/item/organ/internal/take_damage(amount, var/silent=0)
	if(!owner)
		return

	if(!(src in owner.bad_internal_organs))
		owner.bad_internal_organs += src
	if(isrobotic())
		damage = between(0, src.damage + (amount * 0.8), max_damage)
	else
		damage = between(0, src.damage + amount, max_damage)

		//only show this if the organ is not robotic
		if(owner && can_feel_pain() && parent_organ && (amount > 5 || prob(10)))
			var/obj/item/organ/external/parent = owner.get_organ(parent_organ)
			if(parent && !silent)
				var/degree = ""
				if(is_bruised())
					degree = " a lot"
				if(damage < 5)
					degree = " a bit"
				owner.custom_pain("Something inside your [parent.name] hurts[degree].", amount, affecting = parent)


/obj/item/organ/external/take_damage(brute, burn, damage_flags, used_weapon = null)
	if(!owner)
		return

	brute = round(brute * brute_mod, 0.1)
	burn = round(burn * burn_mod, 0.1)
	if((brute <= 0) && (burn <= 0))
		return 0

	var/sharp = (damage_flags & DAM_SHARP)
	var/edge  = (damage_flags & DAM_EDGE)
	var/laser = (damage_flags & DAM_LASER)
	var/blunt = brute && !sharp && !edge

	if(used_weapon)
		add_autopsy_data("[used_weapon]", brute + burn)
	var/can_cut = (prob(brute*2) || sharp) && (robotic < ORGAN_ROBOT)
	var/spillover = 0
	var/pure_brute = brute
	if(!is_damageable(brute + burn))
		spillover =  brute_dam + burn_dam + brute - max_damage
		if(spillover > 0)
			brute -= spillover
		else
			spillover = brute_dam + burn_dam + brute + burn - max_damage
			if(spillover > 0)
				burn -= spillover

	owner.updatehealth() //droplimb will call updatehealth() again if it does end up being called
	//If limb took enough damage, try to cut or tear it off
	if(owner && loc == owner && !is_stump())
		if(!cannot_amputate && config.limbs_can_break)
			var/statht = owner.stats[STAT_HT] * 8
			var/instance = 0
			var/instonce = 0
			instance = brute_dam - instance
			instonce = burn_dam - instonce
			var/force_droplimb = 0
			var/force_droplimbburn = 0
			if(instance >= statht)
				force_droplimb = 1
			if(instonce >= statht)
				force_droplimbburn = 1
			var/edge_eligible = 0
			if(edge)
				if(istype(used_weapon,/obj/item))
					var/obj/item/W = used_weapon
					if(W.w_class >= w_class)
						edge_eligible = 1
				else
					edge_eligible = 1
			brute = pure_brute
			if(edge_eligible && brute >= 60 / DROPLIMB_THRESHOLD_EDGE)
				if(prob(brute) || force_droplimb)
					droplimb(0, DROPLIMB_EDGE)
					return
			if(brute_dam >= (100 + statht))
				droplimb(0, DROPLIMB_BLUNT)
			if(burn_dam >= (100 + statht))
				droplimb(0, DROPLIMB_BURN)
			if(force_droplimb)
				droplimb(0, DROPLIMB_BLUNT)
			if(force_droplimbburn)
				droplimb(0, DROPLIMB_BURN)

	// High brute damage or sharp objects may damage internal organs
	var/damage_amt = brute
	var/cur_damage = brute_dam
	if(laser)
		damage_amt += burn
		cur_damage += burn_dam
	if(internal_organs && internal_organs.len && (cur_damage + damage_amt >= max_damage || (((sharp && damage_amt >= 5) || damage_amt >= 10) && prob(5))))
		// Damage an internal organ
		var/list/victims = list()
		for(var/obj/item/organ/internal/I in internal_organs)
			if(I.damage < I.max_damage && prob(I.relative_size))
				victims += I
		if(!victims.len)
			victims += pick(internal_organs)
		for(var/obj/item/organ/victim in victims)
			brute /= 2
			if(laser)
				burn /= 2
			damage_amt /= 2
			victim.take_damage(damage_amt)

	if(status & ORGAN_BROKEN && brute)
		jostle_bone(brute)
		//if(can_feel_pain() && prob(40))
		//	owner.emote("scream")	//getting hit on broken hand hurts

	if(brute_dam > min_broken_damage && prob(brute_dam + brute * (1+blunt)) ) //blunt damage is gud at fracturing
		fracture()

	// If the limbs can break, make sure we don't exceed the maximum damage a limb can take before breaking
	var/datum/wound/created_wound
	var/block_cut = species && !(brute > 15 || !(species.species_flags & SPECIES_FLAG_NO_MINOR_CUT))

	if(brute)
		var/to_create = BRUISE
		if(can_cut)
			if(!block_cut)
				to_create = CUT
			//need to check sharp again here so that blunt damage that was strong enough to break skin doesn't give puncture wounds
			if(sharp && !edge)
				to_create = PIERCE
		created_wound = createwound(to_create, brute)

	if(burn)
		if(laser)
			createwound(LASER, burn)
			if(prob(40))
				owner.IgniteMob()
		else
			createwound(BURN, burn)

	adjust_pain(0.6*burn + 0.4*brute)
	//If there are still hurties to dispense
	if (spillover)
		owner.shock_stage += spillover * config.organ_damage_spillover_multiplier

	// sync the organ's damage with its wounds
	src.update_damages()
	if(owner)
		owner.updatehealth()

		if(owner && update_damstate())
			owner.UpdateDamageIcon()
			owner.update_bleeding()

	return created_wound

/obj/item/organ/external/jostle_bone(force)
	if(!owner)
		return

	if(!(status & ORGAN_BROKEN)) //intact bones stay still
		return
	if(brute_dam + force < min_broken_damage/5)	//no papercuts moving bones
		return
	if(internal_organs.len && prob(brute_dam + force))
		owner.custom_pain("A piece of bone in your [encased ? encased : name] moves painfully!", 50, affecting = src)
		var/obj/item/organ/I = pick(internal_organs)
		I.take_damage(rand(3,5))
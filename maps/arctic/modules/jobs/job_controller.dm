/datum/controller/occupations
	EquipRank(mob/living/carbon/human/H, rank, joined_late = 0)
		if(!H)	return null

		if(SSticker.eof)
			if(SSticker.eof.id == "assjesters")
				if(H.mind.assigned_role == "Arbiter")
					rank = "Jester"
			if(SSticker.eof.id == "clumpsydumbasses")
				if(prob(32))
					H.mutations.Add(CLUMSY)
			if(SSticker.eof.id == "randomnames")
				H.real_name = random_name(H.gender)
				H.f_style = random_facial_hair_style(H.gender)
				H.h_style = random_hair_style(H.gender)

		var/datum/job/job = GetJob(rank)
		var/list/spawn_in_storage = list()

		if(job)

			//Equip job items.
			job.setup_account(H)
			job.equip(H, H.mind ? H.mind.role_alt_title : "", H.char_branch, H.char_rank)
			job.apply_fingerprints(H)

			// Equip custom gear loadout, replacing any job items
			var/list/loadout_taken_slots = list()
			if(H.client.prefs.Gear() && job.loadout_allowed)
				for(var/thing in H.client.prefs.Gear())
					var/datum/gear/G = gear_datums[thing]
					if(G)
						var/permitted
						if(G.allowed_roles)
							for(var/job_type in G.allowed_roles)
								if(job.type == job_type)
									permitted = 1
						else
							permitted = 1

						if(G.whitelisted && (!(H.species.name in G.whitelisted)))
							permitted = 0

						if(!permitted)
							to_chat(H, "<span class='warning'>Your current species, job or whitelist status does not permit you to spawn with [thing]!</span>")
							continue

						if(!G.slot || G.slot == slot_tie || (G.slot in loadout_taken_slots) || !G.spawn_on_mob(H, H.client.prefs.Gear()[G.display_name]))
							spawn_in_storage.Add(G)
						else
							loadout_taken_slots.Add(G.slot)

			// do accessories last so they don't attach to a suit that will be replaced
			if(H.char_rank && H.char_rank.accessory)
				for(var/accessory_path in H.char_rank.accessory)
					var/list/accessory_data = H.char_rank.accessory[accessory_path]
					if(islist(accessory_data))
						var/amt = accessory_data[1]
						var/list/accessory_args = accessory_data.Copy()
						accessory_args[1] = src
						for(var/i in 1 to amt)
							H.equip_to_slot_or_del(new accessory_path(arglist(accessory_args)), slot_tie)
					else
						for(var/i in 1 to (isnull(accessory_data)? 1 : accessory_data))
							H.equip_to_slot_or_del(new accessory_path(src), slot_tie)

		else
			to_chat(H, "Your job is [rank] and the game just can't handle it! Please report this bug to an administrator.")

		H.job = rank

		if(!joined_late || job.latejoin_at_spawnpoints)
			var/obj/S = get_roundstart_spawnpoint(rank)

			if(istype(S, /obj/effect/landmark/start) && istype(S.loc, /turf))
				H.forceMove(S.loc)
			else
				var/datum/spawnpoint/spawnpoint = get_spawnpoint_for(H.client, rank)
				H.forceMove(pick(spawnpoint.turfs))
				spawnpoint.after_join(H)

			// Moving wheelchair if they have one
			if(H.buckled && istype(H.buckled, /obj/structure/bed/chair/wheelchair))
				H.buckled.forceMove(H.loc)
				H.buckled.set_dir(H.dir)

		// If they're head, give them the account info for their department
		if(H.mind && job.head_position)
			var/remembered_info = ""
			var/datum/money_account/department_account = department_accounts[job.department]

			if(department_account)
				remembered_info += "<b>Your department's account number is:</b> #[department_account.account_number]<br>"
				remembered_info += "<b>Your department's account pin is:</b> [department_account.remote_access_pin]<br>"
				remembered_info += "<b>Your department's account funds are:</b> T[department_account.money]<br>"

			H.mind.store_memory(remembered_info)

		if(H.mind)
			H.mind.assigned_role = rank

			switch(rank)
				if("Киборг")
					return H.Robotize()
				if("AI")
					return H
				if("Count")
					var/sound/announce_sound = (GAME_STATE <= RUNLEVEL_SETUP)? null : sound('sound/misc/boatswain.ogg', volume=20)
					captain_announcement.Announce("Attention, Count [H.real_name] has returned to save our souls!", new_sound=announce_sound)

		// put any loadout items that couldn't spawn into storage or on the ground
		for(var/datum/gear/G in spawn_in_storage)
			G.spawn_in_storage_or_drop(H, H.client.prefs.Gear()[G.display_name])

		if(istype(H)) //give humans wheelchairs, if they need them.
			var/obj/item/organ/external/l_foot = H.get_organ(BP_L_FOOT)
			var/obj/item/organ/external/r_foot = H.get_organ(BP_R_FOOT)
			if(!l_foot || !r_foot)
				var/obj/structure/bed/chair/wheelchair/W = new /obj/structure/bed/chair/wheelchair(H.loc)
				H.buckled = W
				H.update_canmove()
				W.set_dir(H.dir)
				W.buckled_mob = H
				W.add_fingerprint(H)

		// EMAIL GENERATION
		var/domain
		if(H.char_branch && H.char_branch.email_domain)
			domain = H.char_branch.email_domain
		else
			domain = "freemail.nt"
		var/sanitized_name = sanitize(replacetext(replacetext(lowertext(H.real_name), " ", "."), "'", ""))
		var/complete_login = "[sanitized_name]@[domain]"

		// It is VERY unlikely that we'll have two players, in the same round, with the same name and branch, but still, this is here.
		// If such conflict is encountered, a random number will be appended to the email address. If this fails too, no email account will be created.
		if(ntnet_global.does_email_exist(complete_login))
			complete_login = "[sanitized_name][random_id(/datum/computer_file/data/email_account/, 100, 999)]@[domain]"

		// If even fallback login generation failed, just don't give them an email. The chance of this happening is astronomically low.
		if(ntnet_global.does_email_exist(complete_login))
			to_chat(H, "You were not assigned an email address.")
			H.mind.store_memory("You were not assigned an email address.")
		else
			var/datum/computer_file/data/email_account/EA = new/datum/computer_file/data/email_account()
			EA.password = GenerateKey()
			EA.login = 	complete_login
			H.mind.store_memory("Your email account address is [EA.login] and the password is [EA.password].")
		// END EMAIL GENERATION

		//Gives glasses to the vision impaired
		if(H.disabilities & NEARSIGHTED)
			var/equipped = H.equip_to_slot_or_del(new /obj/item/clothing/glasses/regular(H), slot_glasses)
			if(equipped)
				var/obj/item/clothing/glasses/G = H.glasses
				G.prescription = 7

		if(H.religion)//In case they somehow don't have one.
			H.mind.religion = H.religion
			if(H.religion_is_legal())
				GLOB.all_religions[LEGAL_RELIGION].followers += H.name // I don't think I want to save copies of the entire entity.
				if(prob(95) || rank == "Supreme Arbiter")//Only a 5% chance to not remember the prayer, but supreme arbiter never forgets
					H.mind.prayer = accepted_prayer
					H.verbs += /mob/living/proc/recite_prayer
				if(rank == "Supreme Arbiter")
					H.mind.prayer = accepted_prayer
					H.verbs += /mob/living/proc/interrogate
			else
				//Pick an old god other then the template
				//to_world("RELIGION TESTING FIX THIS")
				//H.religion = "Your god here"
				H.religion = pick(GLOB.all_religions - ILLEGAL_RELIGION - LEGAL_RELIGION)
				H.verbs += /mob/living/proc/make_shrine
				H.verbs += /mob/living/proc/praise_god
				var/obj/item/I = GLOB.all_religions[H.religion].holy_item.type
				I = new I()
				H.equip_to_storage(I)
				GLOB.all_religions[H.religion].followers += H.mind.name
				if(prob(5))
					H.mind.prayer = accepted_prayer
					to_chat(H, "<span class='notice'>You can't believe your luck, you've managed to pick up on the selected prayer for today. It's: <b>[H.mind.prayer]</b> Remember this prayer, and Gods save you from the Arbiters.\n</span>")
				var/list/pickable_spells = list()
				for(var/S in GLOB.all_spells)
					if(GLOB.all_spells[S].old_god == H.religion)
						pickable_spells += GLOB.all_spells[S]
				var/datum/old_god_spell/new_spell = pick(pickable_spells)
				H.mind.store_memory("[new_spell.name] Incantation: \"[new_spell.phrase]\"")

		BITSET(H.hud_updateflag, ID_HUD)
		BITSET(H.hud_updateflag, IMPLOYAL_HUD)
		BITSET(H.hud_updateflag, SPECIALROLE_HUD)
		return H
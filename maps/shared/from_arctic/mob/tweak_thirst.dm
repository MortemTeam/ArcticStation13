
/obj/item/organ/internal/liver/handle_thirst()
	owner.adjust_thirst(-0.2)
	switch(owner.thirst)
		if(THIRST_LEVEL_THIRSTY to INFINITY)
			owner.clear_event("thirst")
		if(THIRST_LEVEL_DEHYDRATED to THIRST_LEVEL_THIRSTY)
			owner.add_event("thirst", /datum/happiness_event/thirst/thirsty)
			if(prob(5))
				to_chat(owner, "<span class='warning'>You could really use a drink!</span>")
			else if(prob(6))
				to_chat(owner, "<span class='warning'>Your mouth feels really dry...</span>")
		if(0 to THIRST_LEVEL_DEHYDRATED)
			owner.add_event("thirst", /datum/happiness_event/thirst/dehydrated)
			if(prob(5))
				to_chat(owner, "<span class='danger'><font size = 3>You faint from dehydration.</span></font>")
				owner.Paralyse(3)
			else if(prob(6))
				to_chat(owner, "<span class='danger'><font size = 3>You fall down because of your thirst.</span></font>")
				owner.Weaken(1)
				owner.Stun(1)
			if(prob(6))
				to_chat(owner, "<span class='danger'><font size = 3>You lick around your mouth as a craving for water sets in.</span></font>")
				take_damage(1)
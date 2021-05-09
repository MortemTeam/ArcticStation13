
/mob/do_attack_animation(atom/A)
	..()
	is_floating = 0 // If we were without gravity, the bouncing animation got stopped, so we make sure we restart the bouncing after the next movement.
	// What icon do we use for the attack?
	var/image/I
	if(hand && l_hand) // Attacked with item in left hand.
		I = image(l_hand.icon, A, l_hand.icon_state, A.layer + 1)
	else if (!hand && r_hand) // Attacked with item in right hand.
		I = image(r_hand.icon, A, r_hand.icon_state, A.layer + 1)
	else // Attacked with a fist?
		return
	// Who can see the attack?
	var/list/viewing = list()
	for (var/mob/M in viewers(A))
		if (M.client)
			viewing |= M.client
	flick_overlay(I, viewing, 5) // 5 ticks/half a second
	// Scale the icon.
	I.transform *= 0.75
	// Set the direction of the icon animation.
	var/direction = get_dir(src, A)
	if(direction & NORTH)
		I.pixel_y = -16
	else if(direction & SOUTH)
		I.pixel_y = 16
	if(direction & EAST)
		I.pixel_x = -16
	else if(direction & WEST)
		I.pixel_x = 16
	if(!direction) // Attacked self?!
		I.pixel_z = 16
	// And animate the attack!
	animate(I, alpha = 175, pixel_x = 0, pixel_y = 0, pixel_z = 0, time = 3)
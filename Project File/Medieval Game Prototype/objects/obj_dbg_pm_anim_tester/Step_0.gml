/// Here we will check different animations
// Timer tracker

if (character_attack_speed <= 0){
	// If it is zero, do not decrease the timer
	// character_attack_animation_duration = fps * 1;

}
else {
	// if it is not zero, decrease the timer
	character_attack_speed -= 1;

}

if (in_attack_anim == true){
	
	// only here do we bother calculating a random number
	random_ai_attack_delay = random_range(lower_ai_attack_delay_boundary,upper_ai_attack_delay_boundary);
	
	
	// If the attack animation is anything but 24, as in it is running, you cannot do anything else
	if (character_attack_animation_duration > 0){
		sprite_index = spr_pm_04_attacking_1; // reference the animation sprite asset
		character_attack_animation_duration -= 1;
	}
	else {
		// if this was an ai, we would then use "character attack speed" to set the rate in which the ai
		// chooses to attack again
		character_attack_speed = fps * random_ai_attack_delay; // reset timer
		character_attack_animation_duration = fps * 1;
		in_attack_anim = false;
	}
	
	
}
else {
// set in attack anim to false

// if we are only holding the right key...
if (keyboard_check(vk_right)){
	// Are we running? check for shift
	if (keyboard_check(vk_shift)){
		// move x by running speed and set animation index and speed scale
		x += character_running_speed;
		sprite_index = spr_pm_03_running; // reference the animation sprite asset
		image_xscale = 1; // 1 = original, -1 = flipped on x-axis
	}
	else {
		// move x by walking speed and set animation index and speed scale
		x += character_walking_speed;
		sprite_index = spr_pm_02_walking; // reference the animation sprite asset
		image_xscale = 1; // 1 = original, -1 = flipped on x-axis
	
	}
	
}
// if we are only holding the left key...
else if (keyboard_check(vk_left))
{
	// Are we running? check for shift
	if (keyboard_check(vk_shift)){
		// move x by running speed and set animation index and speed scale
		x -= character_running_speed;
		sprite_index = spr_pm_03_running; // reference the animation sprite asset
		image_xscale = -1; // 1 = original, -1 = flipped on x-axis
	}
	else {
		// move x by walking speed and set animation index and speed scale
		x -= character_walking_speed;
		sprite_index = spr_pm_02_walking; // reference the animation sprite asset
		image_xscale = -1; // 1 = original, -1 = flipped on x-axis
	}
}
// A will be defend
else if (keyboard_check(ord("A")))
{
	sprite_index = spr_pm_05_defend; // reference the animation sprite asset
}
// S will be ready
else if (keyboard_check(ord("S")))
{
	sprite_index = spr_pm_01_ready; // reference the animation sprite asset
}
// D will be attack
else if (keyboard_check(ord("D")) && character_attack_speed <= 0)
{
	
	in_attack_anim = true;
	// if we are facing right
	
	if (image_xscale = 1){
		instance_create_layer(x,y,"hitbox_layer",obj_pikeman_atk_hitbox);
		
	}
	// if not, spawn a mirrored version
	else{
		var inst = instance_create_layer(x,y,"hitbox_layer",obj_pikeman_atk_hitbox);
		with (inst){
			
			image_xscale = -1;
			direction = 180;
		}
		
	}
	
	
}

// if nothing is being inputted, set idle animation
else {
	// we do not alter x scale since we want it to idle on last flipped direction.
	sprite_index = spr_pm_00_idle;
	
}

}





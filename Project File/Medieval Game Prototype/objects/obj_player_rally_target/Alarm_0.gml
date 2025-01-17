/// whenever the timer is executed do this:
// generate a number from 0 to 1
random_generated_number = random_range(0,1);

if (random_generated_number <= idle_sway_animation_chance){
	
	// Set animation to sway
	sprite_index = sway_anim;
}
else{

	// Set animation to NOT sway, idle
	sprite_index = idle_anim;
}

// reset timer
alarm_set(0,(alarm_time_value*fps));

// Set the initial time additive to zero
// alarm_time_initial_addition = 0;

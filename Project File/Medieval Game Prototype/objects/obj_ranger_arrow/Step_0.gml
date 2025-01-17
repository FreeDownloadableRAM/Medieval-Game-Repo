// Do nothing, we only do stuff when the alarm[0]
// reaches 0.

/// arrow creation delay
// here we will wait a little until we shoot the arrow,
// because the ranger animation takes time to get there
/// count down, once the anim duration is complete, self destroy this object

if (global.is_game_paused == true){
	// Do Nothing
	

}
else {
	
	if (alarm[0] <= 0){
		
		// destroy upon hitting the floor
		// 
		y = y + velocity_y + velocity_y_margin_of_error;
		x = x + velocity_x + velocity_x_margin_of_error;
	
		instance_create_layer(x-16,y,"projectile_effects",obj_projectile_trail);
	
		if (velocity_x > 0){
			velocity_x = velocity_x - 0.02;
	
		}
		else {
			velocity_x = 0;
	
		}
		velocity_y = velocity_y + (projectile_weight * global.gravity_value);
	
	}
	else {
	
	// We do nothing
	}
	
	
	
}
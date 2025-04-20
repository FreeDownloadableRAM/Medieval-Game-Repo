/// count down, once the anim duration is complete, self destroy this object

if (global.is_game_paused == true){
	// Do Nothing
	

}
else {
	// destroy upon hitting the floor
	// 
	y = y + velocity_y + velocity_y_margin_of_error;
	x = x + velocity_x + velocity_x_margin_of_error;
	
	//instance_create_layer(x-8,y,"projectile_effects",obj_projectile_trail);
	part_particles_create(global.trail_particle_system,x-16,y,trail_particle,1);
		
	
	if (velocity_x > 0){
		velocity_x = velocity_x - 0.02;
	
	}
	else {
		velocity_x = 0;
	
	}
	velocity_y = velocity_y + (projectile_weight * global.gravity_value);
	
}

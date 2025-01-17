/// countdown, when at zero, just delete this instance
if (global.is_game_paused == true){
	// If paused, do nothing

}
else {

	// We arent paused
	// Count down
	if (cd_timer >= 0){
		
		cd_timer -= 1;
		
	
	}
	else {
		
		instance_destroy();
	
	}

	// Make unit icon follow camera
	 x = camera_get_view_x(view_camera[0]) + cd_offset;
	
	//x = cd_offset;
	//y =  y_diff;
}




// check if object to follow exists
if (instance_exists(obj_player_controller)){
	
	// do not move unless object is within a certain region
	// check right x value
	if ((obj_player_controller.x > ((camera_get_view_x(view_camera[0]) + camera_width) - 48))
			&& (obj_player_controller.y > vertical_deadzone_top)
				&& (obj_player_controller.y < vertical_deadzone_bottom)){ // pos is based off top left
		
		x_towards = follow_object.x;
		y_towards = follow_object.y; // we are only going to move camera horizontally
	
	}
	else if ((obj_player_controller.x < ((camera_get_view_x(view_camera[0])) + 48))
			&& (obj_player_controller.y > vertical_deadzone_top)
				&& (obj_player_controller.y < vertical_deadzone_bottom)){
		
		x_towards = follow_object.x;
		y_towards = follow_object.y; // we are only going to move camera horizontally
		
	}
	else {
	
	
	}
	
	
	// do this regardless
	x += clamp((x_towards - x)/ease_in_factor,-16,16);
	y += clamp((y_towards - y)/ease_in_factor,-16,16);
	
	// set camera position 
	camera_set_view_pos(view_camera[0], clamp((x - (camera_width * 0.5)),0, 3456 - camera_width),0);
	
	
	/*
	
	x_towards = follow_object.x;
	y_towards = follow_object.y; // we are only going to move camera horizontally
			
	// do this regardless
	x += (x_towards - x)/ease_in_factor;
	y += (y_towards - y)/ease_in_factor;
		
	// set camera position 
	camera_set_view_pos(view_camera[0], clamp((x - (camera_width * 0.5)),0, 3456 - camera_width),0);
	
	*/
	
}
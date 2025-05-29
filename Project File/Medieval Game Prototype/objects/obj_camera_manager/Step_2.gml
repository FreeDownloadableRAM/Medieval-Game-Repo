// check if object to follow exists
if (instance_exists(obj_player_controller)){
	
	// do not move unless object is within a certain region
	// check right x value
	if ((obj_player_controller.x > ((camera_get_view_x(view_camera[0]) + camera_width) - 48))
			&& (obj_player_controller.y > vertical_deadzone_top)
				&& (obj_player_controller.y < vertical_deadzone_bottom)){ // pos is based off top left
		
		x_towards = (camera_get_view_x(view_camera[0]) + (camera_width / 2)) + 256; // make camera less "slidey"
		//y_towards = follow_object.y; // we are only going to move camera horizontally
		
		
	}
	// check left x value
	else if ((obj_player_controller.x < ((camera_get_view_x(view_camera[0])) + 48))
			&& (obj_player_controller.y > vertical_deadzone_top)
				&& (obj_player_controller.y < vertical_deadzone_bottom)){
		
		x_towards = (camera_get_view_x(view_camera[0]) + (camera_width / 2)) - 256;
		//y_towards = follow_object.y; // we are only going to move camera horizontally
		
		
	}
	else {
		// do nothing
		
	}
	
	// re center object that chases player mouse if we are too far right or left to prevent latency
	if (x_towards > (camera_get_view_x(view_camera[0]) + camera_width * 0.5)){
		x = camera_get_view_x(view_camera[0]) + camera_width / 2;
		
	}
	if (x_towards < (camera_get_view_x(view_camera[0]) + camera_width * 0.5)){
		x = camera_get_view_x(view_camera[0]) + camera_width / 2;
		
	}
	
	
	// do this regardless
	// move this object towards our target marker
	x += clamp((x_towards - x)/ease_in_factor,-8,8);
	//y += clamp((y_towards - y)/ease_in_factor,-8,8);
	
	// update and
	// set camera position 
	camera_set_view_pos(view_camera[0], clamp((x - (camera_width * 0.5)),0, 3456 - camera_width),0);
	
	
}
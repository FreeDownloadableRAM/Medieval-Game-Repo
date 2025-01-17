// run timers
if (global.is_game_paused == true){
	// do not run

}
else {
	
	// check if this buttons ai order is currently being enacted
	if (global.player_order == ai_ordr_chck){
		// toggle this on 
		icon_selected = true;
	
	}
	else {
		// toggle it off
		icon_selected = false;
	
	}
	
	// Make unit icon follow camera
	x = camera_get_view_x(view_camera[0]) + ui_placement_offset_x;
	
	// check if we are within icon bounds
	if (mouse_x < (x + icon_width + 1) && mouse_x > (x - icon_width - 1)
			&& mouse_y < (y + icon_height + 1) && mouse_y > (y - icon_height - 1)){
		
		// We are within icon bounds
		// are we already selected?
		if (icon_selected = true){
			// we are dont highlight
			icon_highlighted = false;
			
		}
		else {
			// we arent, do highlight
			icon_highlighted = true;
		}

	
	}
	else {
		// We are NOT within icon bounds
		icon_highlighted = false;
	}
	
	
}



// run timers
if (global.is_game_paused == true){
	// do not run

}
else {
	// if the mouse is over the button, change sprite
	if ((mouse_x < (x + button_width_from_center)) && (mouse_x > (x - button_width_from_center))
		&& (mouse_y < (y + button_height_from_center)) && (mouse_y > (y - button_height_from_center))){
		sprite_index = spr_ret_to_main_menu_hl;
	
	}
	else {
		sprite_index = spr_ret_to_main_menu;
	
	}
	
	x = camera_get_view_x(view_camera[0]) + 768;
	

}
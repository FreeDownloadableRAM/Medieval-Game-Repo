// run timers
if (global.is_game_paused == true){
	// do not run

}
else {
	// if the mouse is over the button, change sprite
	if ((mouse_x < (x + button_width_from_center)) && (mouse_x > (x - button_width_from_center))
		&& (mouse_y < (y + button_height_from_center)) && (mouse_y > (y - button_height_from_center))){
		image_index = 1;
	
	}
	else {
		image_index = 0;
	
	}
	

}
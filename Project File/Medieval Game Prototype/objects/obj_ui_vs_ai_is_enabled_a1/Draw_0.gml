if ((mouse_x < (x + (button_width_from_center * button_scale_x))) && (mouse_x > (x - (button_width_from_center * button_scale_x)))
		&& (mouse_y < (y + button_height_from_center)) && (mouse_y > (y - button_height_from_center))){
		// draw sprite
		if (is_ai_enabled == true){
			draw_sprite(button_sprite,3,x,y);
		
		}
		else {
			draw_sprite(button_sprite,1,x,y);
		
		}

}
else {
	// not highlighted
	if (is_ai_enabled == true){
			draw_sprite(button_sprite,2,x,y);
		
	}
	else {
		draw_sprite(button_sprite,0,x,y);
		
	}
	
}


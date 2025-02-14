if ((mouse_x < (x + ((button_width_from_center) * button_scale_x) )) && (mouse_x > (x - (button_width_from_center * button_scale_x)))
		&& (mouse_y < (y + button_height_from_center)) && (mouse_y > (y - button_height_from_center))){
		draw_sprite(spr_numbers_0_to_9_hl,number_value,x,y);
		draw_sprite(spr_characters_hl,49,x + button_width_from_center + 8,y);
	
}
else {
		draw_sprite(spr_numbers_0_to_9,number_value,x,y);
		draw_sprite(spr_characters,49,x + button_width_from_center + 8,y);
	
}
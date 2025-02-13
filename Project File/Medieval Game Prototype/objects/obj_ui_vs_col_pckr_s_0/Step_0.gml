// Control if button draws highlight border
if ((mouse_x < (x + button_width_from_center)) && (mouse_x > (x - button_width_from_center))
		&& (mouse_y < (y + button_height_from_center)) && (mouse_y > (y - button_height_from_center))){
		but_sprite_hl_opacity = 1;
	
	}
else {
		sprite_index = but_sprite;
		but_sprite_hl_opacity = 0;
	
}
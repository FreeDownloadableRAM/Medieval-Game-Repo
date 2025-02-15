if ((mouse_x < (x + (button_width_from_center * button_scale_x))) && (mouse_x > (x - (button_width_from_center * button_scale_x)))
		&& (mouse_y < (y + button_height_from_center)) && (mouse_y > (y - button_height_from_center))){
		but_sprite_hl_opacity = 1;
	
}
else {
		but_sprite_hl_opacity = 0;
	
}

// draw sprite
draw_sprite(button_sprite,0,x,y);

// draw overlay
draw_sprite_ext(spr_unit_icon_cd,0,x,y,1,1,0,c_white,but_sprite_darken_opacity);

// draw this on the top
draw_sprite_ext(spr_auto_train_icon,0,x,y,1,1,0,c_white,but_sprite_hl_opacity);
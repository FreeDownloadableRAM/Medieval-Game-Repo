/// draw sprite regardless, this sprite is the hitbox
draw_self();

if (global.dev_mode == true){
	
	draw_set_color(c_white);
	
	draw_text(x + 16,y - 112, "x margin of error: " + string(velocity_x_margin_of_error));
	draw_text(x + 16,y - 96, "y margin of error: " + string(velocity_y_margin_of_error));
	
	
}
else{
	// Dont draw if we arent

}


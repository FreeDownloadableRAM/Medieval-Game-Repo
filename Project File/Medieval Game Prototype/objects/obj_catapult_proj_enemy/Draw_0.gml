/// draw sprite regardless, this sprite is the hitbox
draw_self();

if (global.dev_mode == true){
	/*
	draw_set_color(c_white);
	
	draw_text(x + 16,y - 272, "unknown angle: " + string(((proj_gravity * projectile_weight * target_position_x) / (velocity_initial * velocity_initial))));
	
	draw_text(x + 16,y - 256, "x: " + string(x));
	draw_text(x + 16,y - 240, "y: " + string(y));
	draw_text(x + 16,y - 224, "velocity x: " + string(velocity_x));
	draw_text(x + 16,y - 208, "velocity y: " + string(velocity_y));
	
	
	draw_text(x + 16,y - 192, "initial velocity: " + string(velocity_initial));
	draw_text(x + 16,y - 176, "initial height: " + string(initial_height));
	draw_text(x + 16,y - 160, "target x: " + string(target_position_x));
	draw_text(x + 16,y - 144, "target y: " + string(target_position_y));
	draw_text(x + 16,y - 128, "launch angle rad: " + string(degtorad(launch_angle)));
	draw_text(x + 16,y - 112, "launch angle deg: " + string(launch_angle));
	draw_text(x + 16,y - 96, "secondary angle rad: " + string(arctan(target_position_x / initial_height)));
	draw_text(x + 16,y - 80, "secondary angle deg: " + string(radtodeg(arctan(target_position_x / initial_height))));
	draw_text(x + 16,y - 64, "angle is in range?: " + string(in_range));
	
	draw_text(x + 16,y - 48, "height difference: " + string(target_height_difference / 4) + " pixels");
	draw_text(x + 16,y - 32, "initial y pos: " + string(starting_y_position));
	
	draw_text(target_position_x + 16,target_position_y - 16,"Target distance on fire:" +  string(target_distance_x / 4) + " pixels");
	
	draw_circle(target_position_x,target_position_y,4,false);
	draw_set_color(c_red);
	draw_circle(target_position_x,starting_y_position,4,false);
	draw_set_color(c_yellow);
	draw_circle(target_position_x,target_height_difference,4,false);
	draw_set_color(c_green);
	draw_line(starting_x_position,starting_y_position,target_position_x,starting_y_position);
	draw_set_color(c_teal);
	draw_circle(proj_range + starting_x_position,starting_y_position,4,false);
	/*
	draw_text(x + 16,y - 112, "x margin of error: " + string(velocity_x_margin_of_error));
	draw_text(x + 16,y - 96, "y margin of error: " + string(velocity_y_margin_of_error));
	*/
	
}
else{
	// Dont draw if we arent

}


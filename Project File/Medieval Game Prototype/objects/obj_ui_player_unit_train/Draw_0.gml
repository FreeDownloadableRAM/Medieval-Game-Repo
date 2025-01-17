/// Dubugging purposes
// draw ourself
// draw_self();
// draw self relative to camera
draw_sprite(unit_train_sprite,0,camera_get_view_x(view_camera[0]) + unit_icon_placement_offset_x,y);

// draw the auto train sprite on top if it is toggled on
if (auto_train = true){
	// draw auto train sprite on top
	draw_sprite(spr_auto_train_icon,0,camera_get_view_x(view_camera[0]) + unit_icon_placement_offset_x,y);
}


// draw debug text
if (global.dev_mode == true){
	
	draw_set_color(c_white);
	//draw_text(x - icon_width,y + 96, "global player ai order: " + string(global.player_order));
	//draw_text(x - icon_width,y + 80, "global player unit count: " + string(global.player_unit_count));
	//draw_text(x - icon_width,y + 64, "timer: " + string(unit_train_timer));
	//draw_text(x - icon_width,y + 48, "train time: " + string(unit_train_time / 60));
	//draw_text(x - icon_width,y + 32, "train cost: " + string(unit_train_cost));
	
}
else{
	// Dont draw if we arent

}

// This is a placeholder to display train time and gold cost
draw_text(camera_get_view_x(view_camera[0]) + unit_icon_placement_offset_x - icon_width,y + 48, "time: " + string(unit_train_time / 60) + "s");	
draw_text(camera_get_view_x(view_camera[0]) + unit_icon_placement_offset_x - icon_width,y + 32, "cost: " + string(unit_train_cost) + "g");
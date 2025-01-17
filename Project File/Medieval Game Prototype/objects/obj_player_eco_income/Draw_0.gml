/// Dubugging purposes
// draw ourself
//draw_self();
//draw_sprite(spr_pm_unit_icon,0,camera_get_view_x(view_camera[0]) + unit_icon_placement_offset_x,y);
draw_sprite(sprite_index,0,camera_get_view_x(view_camera[0]) + 1440,y);

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
// we want the text to be centered
if (player_eco_lv == 0){
	draw_text(camera_get_view_x(view_camera[0]) + 1440 - 36,y + 48, "cost: " + string(gold_income_tier_cost) + "g");
}
else if (player_eco_lv > 0 && player_eco_lv < 6){
	draw_text(camera_get_view_x(view_camera[0]) + 1440 - 40,y + 48, "cost: " + string(gold_income_tier_cost) + "g");
}
else if (player_eco_lv == 6){
	draw_text(camera_get_view_x(view_camera[0]) + 1440 - 44,y + 44, "cost: " + string(gold_income_tier_cost) + "g");
}
else {
	draw_text(camera_get_view_x(view_camera[0]) + 1440 - 40,y + 48, "cost: N/A");

}

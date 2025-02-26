if ((mouse_x < (x + (button_width_from_center * button_scale_x))) && (mouse_x > (x - (button_width_from_center * button_scale_x)))
		&& (mouse_y < (y + button_height_from_center)) && (mouse_y > (y - button_height_from_center))){
		draw_sprite(spr_ui_vs_ai_map_theme_border,1,x,y);
	
}
else {
		draw_sprite(spr_ui_vs_ai_map_theme_border,0,x,y);
	
}

// 0 = default (forest), 1 = rocky canyons, 2 = desert hills, 3 = swamp lands
// 4 = autumn forest, 5 = ice valley, 6 = castle town, 7 = volcano / black mountain ranges

// determine landscape image
if (global.ai_vs_mode_map_theme == 0){
	// forest theme
	draw_sprite(spr_ui_vs_ai_map_theme_preview_forest,0,x,y)
}
else if (global.ai_vs_mode_map_theme == 1){
	// rocky canyons
	draw_sprite(spr_ui_vs_ai_map_theme_preview_canyons,0,x,y)
}
else if (global.ai_vs_mode_map_theme == 2){
	// desert hills
	draw_sprite(spr_ui_vs_ai_map_theme_preview_desert,0,x,y)
}
else if (global.ai_vs_mode_map_theme == 3){
	// swamp lands
	draw_sprite(spr_ui_vs_ai_map_theme_preview_swamp,0,x,y)
}
else if (global.ai_vs_mode_map_theme == 4){
	// autumn forest
	draw_sprite(spr_ui_vs_ai_map_theme_preview_autumn,0,x,y)
}
else if (global.ai_vs_mode_map_theme == 5){
	// ice valley
	draw_sprite(spr_ui_vs_ai_map_theme_preview_ice,0,x,y)
}
else if (global.ai_vs_mode_map_theme == 6){
	// castle town
	draw_sprite(spr_ui_vs_ai_map_theme_preview_castle_town,0,x,y)
}
else {
	// volcano
	draw_sprite(spr_ui_vs_ai_map_theme_preview_volcanic,0,x,y)
}
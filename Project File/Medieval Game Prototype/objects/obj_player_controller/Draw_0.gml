/// Dubugging purposes
// draw ourself
draw_self();

// draw debug text
if (global.dev_mode == true){
	
	/*
	draw_set_color(c_white);
	draw_text(x - 16,y - 48, "player unit count: " + string(global.player_unit_count) + "/" + string(global.player_unit_cap));
	draw_text(x - 16,y - 32, "player gold amount: " + string(global.player_gold_amount)+ "/" + string(global.player_gold_cap));
	*/
}
else{
	// Dont draw if we arent

}
draw_set_color(c_white);
	
// dont draw info when in menus
if (room == rm_lvl_select || room == rm_main_menu){
	// Dont draw income / gold info

}
else {
	// draw income / gold info
	draw_text(x - 16,y - 48, "player unit count: " + string(global.player_unit_count) + "/" + string(global.player_unit_cap));
	draw_text(x - 16,y - 32, "player gold amount: " + string(global.player_gold_amount)+ "/" + string(global.player_gold_cap * global.slot_one_eco_cap_multiplier));

}

/// Dubugging purposes
// draw ourself
draw_self();

// draw debug text
if (global.dev_mode == true){
	
	draw_set_color(c_white);
	draw_text(x - 16,y - 128 - (ai_rally_distance_offset * num_of_debug_items), "unit # " + string(internal_unit_number));
	draw_text(x - 16,y - 112 - (ai_rally_distance_offset * num_of_debug_items), "Char Att Anim Timer: " + string(character_attack_animation_duration));
	draw_text(x - 16,y - 96 - (ai_rally_distance_offset * num_of_debug_items), "AI Att d Timer: " + string(character_attack_speed));
	draw_text(x - 16,y - 80 - (ai_rally_distance_offset * num_of_debug_items), "ral offst: " + string(ai_rally_distance_offset));
	draw_text(x - 16,y - 64 - (ai_rally_distance_offset * num_of_debug_items), "rand walk thres: " + string(character_walking_boundary));
	draw_text(x - 16,y - 48 - (ai_rally_distance_offset * num_of_debug_items), "AI state: " + string(ai_state));
	
	if (instance_exists(enemy_target)){
		// Get the nearest instance of this target object
		var _closest_enemy = instance_nearest(x,y,enemy_target);
		draw_text(x - 16,y - 176 - (ai_rally_distance_offset * num_of_debug_items), "Enemy Target: " + string(enemy_target));	
		draw_text(x - 16,y - 160 - (ai_rally_distance_offset * num_of_debug_items), "Nearest Enemy ID: " + string(_closest_enemy));
		draw_text(x - 16,y - 144 - (ai_rally_distance_offset * num_of_debug_items), "Nearest Enemy Distance: " + string(_closest_enemy.x));	
		
	}
	
}
else{
	// Dont draw if we arent

}
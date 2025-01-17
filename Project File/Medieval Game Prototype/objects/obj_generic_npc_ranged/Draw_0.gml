/// Dubugging purposes
// draw ourself
draw_self();

// draw debug text
if (global.dev_mode == true){
	
	draw_set_color(c_white);
	
	//draw_text(x - 16,y - 128 - (ai_rally_distance_offset * num_of_debug_items), "unit # " + string(internal_unit_number));
	/*
	draw_text(x - 16,y - 112 - (ai_rally_distance_offset), "Char Att Anim Timer: " + string(character_attack_animation_duration));
	draw_text(x - 16,y - 96 - (ai_rally_distance_offset), "AI Att d Timer: " + string(character_attack_speed));
	draw_text(x - 16,y - 80 - (ai_rally_distance_offset), "Is in atk anim? " + string(in_attack_anim));
	draw_text(x - 16,y - 64 - (ai_rally_distance_offset), "image index: " + string(image_index));
	draw_text(x - 16,y - 48 - (ai_rally_distance_offset), "image number: " + string(image_number));
	
	draw_text(x - 16,y - 32 - (ai_rally_distance_offset), "atk anim dur: " + string((character_anim_frames_amount/character_anim_fps)*fps));
	draw_text(x - 16,y - 16 - (ai_rally_distance_offset), "sprite_get_number: " + string(sprite_get_number(character_attack_anim_1)));
	
	
	draw_text(x - 16,y - 80 - (ai_rally_distance_offset * num_of_debug_items), "ral offst: " + string(ai_rally_distance_offset));
	draw_text(x - 16,y - 64 - (ai_rally_distance_offset * num_of_debug_items), "rand walk thres: " + string(character_walking_boundary));
	*/
	//draw_text(x - 16,y - 48, "AI state: " + string(ai_state));
	/*
	draw_text(x - 16,y - 32 - (ai_rally_distance_offset * num_of_debug_items), "d rally x: " + string(defend_rally_target.x));
	draw_text(x - 16,y - 16 - (ai_rally_distance_offset * num_of_debug_items), "margin of error x: " + string(ai_movement_margin_of_error_allowed));
	draw_text(x - 16,y - 194 - (ai_rally_distance_offset * num_of_debug_items), "Char walk boundary: " + string(character_walking_boundary));
	draw_text(x - 16,y - 210 - (ai_rally_distance_offset * num_of_debug_items), "ai char's x value: " + string(x));
	draw_text(x - 16,y - 226 - (ai_rally_distance_offset * num_of_debug_items), "distance to rally point: " + string(distance_to_object(defend_rally_target)));
	*/
	//draw_text(x + 16,y - 32, "HP: " + string(character_health));
	
	// Arrow launching Debug
	/*
	draw_text(x + 16,y - 48, "char lnch frame: " + string(character_anim_launch_frame));
	draw_text(x + 16,y - 64, "atk anim frame: " + string(character_attack_animation_duration));
	draw_text(x + 16,y - 80, "image number: " + string(image_number));
	draw_text(x + 16,y - 96, "image index: " + string(image_index));
	*/
	
	if (instance_exists(enemy_target)){
		// Get the nearest instance of this target object
		var _closest_enemy = instance_nearest(x,y,enemy_target);
		/*
		draw_text(x - 16,y - 176 - (ai_rally_distance_offset * num_of_debug_items), "Enemy Target: " + string(enemy_target));	
		draw_text(x - 16,y - 160 - (ai_rally_distance_offset * num_of_debug_items), "Nearest Enemy ID: " + string(_closest_enemy));
		draw_text(x - 16,y - 144 - (ai_rally_distance_offset * num_of_debug_items), "Nearest Enemy Distance: " + string(distance_to_object(_closest_enemy)));	
		*/
	}
	
}
else{
	// Dont draw if we arent

}
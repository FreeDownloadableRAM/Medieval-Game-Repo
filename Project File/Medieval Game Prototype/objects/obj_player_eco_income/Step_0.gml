/// update player eco values
if (global.is_game_paused){
	// Game is paused, do not do anything


}
else {
	// Handle upgrade costs
	// Upgrade tiers will be doubling, ex. 50 -> 100 -> 200 -> 400 -> 800 -> 1600 etc.
	if (player_eco_lv == 0){
		gold_income_tier_cost = global.econ_up_cost_lv_0;
	
	}
	else if(player_eco_lv == 1){
		gold_income_tier_cost = global.econ_up_cost_lv_1;
	
	}
	else if(player_eco_lv == 2){
		gold_income_tier_cost = global.econ_up_cost_lv_2;
	
	}
	else if(player_eco_lv == 3){
		gold_income_tier_cost = global.econ_up_cost_lv_3;
	
	}
	else if(player_eco_lv == 4){
		gold_income_tier_cost = global.econ_up_cost_lv_4;
	
	}
	else if(player_eco_lv == 5){
		gold_income_tier_cost = global.econ_up_cost_lv_5;
	
	}
	else {
		gold_income_tier_cost = global.econ_up_cost_lv_6;
	}

	// Give player income
	// Here we reset timers 
	if (gold_income_timer <= 0){
		// If it is zero, do not decrease the timer
		gold_income_timer = gold_income_speed;
		
		// Add income
		// global.player_gold_amount = global.player_gold_amount + global.player_gold_gen + gold_income_addition;
		
		// Gold Income
		// formula in algebriac form is 5x^{2}+5
		if (global.player_gold_amount > ((global.player_gold_cap * global.slot_one_eco_cap_multiplier) - (((global.player_gold_gen * global.slot_one_eco_gen_multiplier) * (player_eco_lv * player_eco_lv)) + (global.player_gold_gen * global.slot_one_eco_gen_multiplier)))){
			// If we are going to go above the gold cap, do nothing.

		}
		else{
			// We will not reach gold cap
			global.player_gold_amount = global.player_gold_amount + (((global.player_gold_gen  * global.slot_one_eco_gen_multiplier) * (player_eco_lv * player_eco_lv)) + (global.player_gold_gen * global.slot_one_eco_gen_multiplier));
	
		}
		
		
	}
	else {
		// if it is not zero, decrease the timer
		gold_income_timer = gold_income_timer - 1;

	}
	
	// Make unit icon follow camera
	x = camera_get_view_x(view_camera[0]) + 1440;
	
	// if the mouse is over the button, change sprite
	if ((mouse_x < (x + button_width_from_center)) && (mouse_x > (x - button_width_from_center))
		&& (mouse_y < (y + button_height_from_center)) && (mouse_y > (y - button_height_from_center))){
			
		if (player_eco_lv <= 6){
			sprite_index = spr_eco_icon_lv_up;
			
			// Do we have funds to upgrade?
			if(global.player_gold_amount >= gold_income_tier_cost){
				// Highlight icon
				sprite_index = spr_eco_icon_lv_up_hl;
			
			
			
			}
			else {
				sprite_index = spr_eco_icon_lv_up;
			
			}
		
		}
		else {
			sprite_index = spr_eco_icon_lv_up_na;
		
		}
		
	
	}
	else {
		
		if (player_eco_lv == 0){
			sprite_index = spr_eco_icon_lv_0;
		
		}
		else if (player_eco_lv == 1){
			sprite_index = spr_eco_icon_lv_1;
		
		}
		else if (player_eco_lv == 2){
			sprite_index = spr_eco_icon_lv_2;
		
		}
		else if (player_eco_lv == 3){
			sprite_index = spr_eco_icon_lv_3;
		
		}
		else if (player_eco_lv == 4){
			sprite_index = spr_eco_icon_lv_4;
		
		}
		else if (player_eco_lv == 5){
			sprite_index = spr_eco_icon_lv_5;
		
		}
		else if (player_eco_lv == 6){
			sprite_index = spr_eco_icon_lv_6;
		
		}
		else{
			sprite_index = spr_eco_icon_lv_7;
		
		}
	
	}
	
	

}



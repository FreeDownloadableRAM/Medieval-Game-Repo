// Pause Wrapper (DON'T run anything if the game state is paused...)
if (global.is_game_paused == true){
	// Do Nothing
	

}
else{
	// So game isnt paused, what do we do when hit?
	// The type of attack hitting us is determined from the events tab, so we dont have to
	// account for it here
	global.player_castle_health_enemy -= ((global.halberd_atk_slash + global.halberd_atk_thrust) - ((global.halberd_atk_slash * castle_slash_defence) + (global.halberd_atk_thrust * castle_thrust_defence)));
	castle_health = global.player_castle_health_enemy;
	// If health drops below zero or is zero, destroy this instance, in the case of a soldier NPC
	// We spaw a "dead" version of it that plays an animation and stays there for x amount of time so
	// AI doesnt target it
	if (castle_health <= 0){
		
		// Set clear flags
		if (room == rm_lvl_01_tut){
			// Set clear
			global.lvl_1_clear = true;
		}
		else if (room == rm_lvl_02_piercing_winds){
			// Set clear
			global.lvl_2_clear = true;
		}
		else if (room == rm_lvl_03_ruby_wet_lands){
			// Set clear
			global.lvl_3_clear = true;
		}
		else if (room == rm_lvl_04_warm_farm_fields){
			// Set clear
			global.lvl_4_clear = true;
		}
		else if (room == rm_lvl_05_city_of_light){
			// Set clear
			global.lvl_5_clear = true;
		}
		else if (room == rm_lvl_06_magical_forest){
			// Set clear
			global.lvl_6_clear = true;
		}
		else if (room == rm_lvl_07_alliance_of_arms){
			// Set clear
			global.lvl_7_clear = true;
		}
		else if (room == rm_lvl_08_highlands){
			// Set clear
			global.lvl_8_clear = true;
		}
		else if (room == rm_lvl_09_portland){
			// Set clear
			global.lvl_9_clear = true;
		}
		else if (room == rm_lvl_10_ice_mountains){
			// Set clear
			global.lvl_10_clear = true;
		}
		else{
			// Dont unlock anything
		
		}
		
		instance_destroy();
	}


}

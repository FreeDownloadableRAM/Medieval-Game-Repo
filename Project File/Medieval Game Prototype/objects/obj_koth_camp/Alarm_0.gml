// Whenever this alarm is triggered, increment points depending on who captured
// the hill

//transfer data
var _score_transfer;

if (koth_ownership == 1){
	// give player points
	score_allies = score_allies + score_increment;

}
else if (koth_ownership == 2){
	// give enemies points
	score_opposition = score_opposition + score_increment;

}
else {
	// give no points

}

// check if anyone won, player first (favour player)
if (score_allies >= score_threshold){
	// we won
	global.game_winner = 1;
	
	// create dummy version
	if (instance_exists(obj_koth_camp_dummy)){
		// if it exists, dont
	
	}
	else {
		
		// create dummy
		var inst = instance_create_layer(x,y,"initial_objects",obj_koth_camp_dummy);
		with (inst){
			score_allies = other.score_allies;
			score_opposition = other.score_opposition;
			koth_ownership = other.koth_ownership; 
			
		}
	
	}

	// destroy this instance
	instance_destroy();
	
}
else if (score_opposition >= score_threshold){
	// enemy won
	global.game_winner = 2;
	
	// create dummy version
	if (instance_exists(obj_koth_camp_dummy)){
		// if it exists, dont
	
	}
	else {
		// create dummy
		var inst = instance_create_layer(x,y,"initial_objects",obj_koth_camp_dummy);
		with (inst){
			score_allies = other.score_allies;
			score_opposition = other.score_opposition;
			koth_ownership = other.koth_ownership; 
			
		}
	
	}
	
	// destroy this instance
	instance_destroy();
}

// once done
// reset timer
alarm_set(0,score_timer / (delta_time/1000000));
// no one owns the hill 
if (koth_ownership == 0){
	// check if there is an enemy on the hill
	if (instance_exists(obj_generic_npc_enemy) == true){
		// Enemy exists
		if (obj_generic_npc_enemy.x < (x + sprite_width/2) && obj_generic_npc_enemy.x > (x - sprite_width/2)){
			// They are in the KoTH area
	
		}
		// Enemy exists but there is not any on the hill
		else {
			koth_ownership = 1;
			image_index = 1;
		}

	}
	// enemy does not exist
	// give hill ownership to player
	else {
		koth_ownership = 1;
		image_index = 1;
	
	}

}
// player owns the hill 
else if (koth_ownership == 1){


}
// enemy owns the hill 
else{
	// check if there is an enemy on the hill
	if (instance_exists(obj_generic_npc_enemy) == true){
		// Enemy exists
		if (obj_generic_npc_enemy.x < (x + sprite_width/2) && obj_generic_npc_enemy.x > (x - sprite_width/2)){
			// They are in the KoTH area
	
		}
		// Enemy exists but there is not any on the hill
		else {
			koth_ownership = 1;
			image_index = 1;
		}

	}
	// enemy does not exist
	// give hill ownership to player
	else {
		koth_ownership = 1;
		image_index = 1;
	}

}
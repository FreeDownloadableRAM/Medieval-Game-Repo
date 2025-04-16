// no one owns the hill 
if (koth_ownership == 0){
	// check if there is a player unit on the hill
	if (instance_exists(obj_generic_npc) == true){
		// player exists
		if (obj_generic_npc.x < (x + sprite_width/2) && obj_generic_npc.x > (x - sprite_width/2)){
			// They are in the KoTH area
	
		}
		// player exists but there is not any on the hill
		else {
			koth_ownership = 2;
			image_index = 2;
		}

	}
	// player does not exist
	// give hill ownership to player
	else {
		koth_ownership = 2;
		image_index = 2;
	
	}

}
// enemy owns the hill 
else if (koth_ownership == 2){


}
// player owns the hill 
else{
	// check if there is an enemy on the hill
	if (instance_exists(obj_generic_npc) == true){
		// player exists
		if (obj_generic_npc.x < (x + sprite_width/2) && obj_generic_npc.x > (x - sprite_width/2)){
			// They are in the KoTH area
	
		}
		// player exists but there is not any on the hill
		else {
			koth_ownership = 2;
			image_index = 2;
		}

	}
	// player does not exist
	// give hill ownership to player
	else {
		koth_ownership = 2;
		image_index = 2;
	
	}

}
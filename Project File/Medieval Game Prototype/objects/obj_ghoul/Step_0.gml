///	This is where we handle generic AI functions
// The goal is to have a general AI that will handle what we need from the game
// Initial state - Navigate to "rally" point. This is planned to be set by the player R-click
// Idle - AI will sit at their current position
// Ready - AI notices an enemy and gets ready stance
// Defend - AI notices a projectile heading towards it, it will brace 
	// or it is in combat but waiting for its attack cool down to finish
// Attack - Enemy is within AIs attack reach, so it will stop moving and attack / defend
// Walking - if the AI movement target is less than walking-distance threshold, must not be in combat
// Running - if the AI movement target is greater than walking-distance threshold, can be in combat.

// AI State Index
// AI State // 0 = idle, 1 = ready, 2 = walking, 3 = running, 4 = attacking, 5 = defending, 6 = dying

// Pause Wrapper (DON'T run anything if the game state is paused...)
if (global.is_game_paused == true){
	// Do Nothing
	

}
// We aren't paused so run character logic
else{
	// Always run
	// we want to set the nearest instance of that object as our target.
	var _closest_enemy;
	if (instance_exists(enemy_target)){
		// Get the nearest instance of this target object
		_closest_enemy = instance_nearest(x,y,enemy_target);
		
		
	}
	
	
	// Here we reset timers on attack cool downs, since we always want this running regardless of ai state.
	if (character_attack_speed <= 0){
		// If it is zero, do not decrease the timer
		// character_attack_animation_duration = fps * 1;

	}
	else {
		// if it is not zero, decrease the timer
		character_attack_speed -= 1;

	}
	// are we in an attack animation?
	if (in_attack_anim == true){
	
		// only here do we bother calculating a random number
		random_ai_attack_delay = random_range(lower_ai_attack_delay_boundary,upper_ai_attack_delay_boundary);
	
		// reset attack animation
		// if our current frame in animation isnt 0 (starting frame), and the amount of frames in animation isnt 
		// equal to the attack animation amount of frames
		// just set sprite to attack animation
		if (image_index >= 1 && image_number != sprite_get_number(character_attack_anim_1)){
				
			// image_index refers to the amount of total frames within an animation
			// image_index = 0;
				
			// image_number refers to the frame you are currently on in an animation
			// image_number = 0;
				
			// sprite_get_number returns the image frame of an animation
			// image_number.character_attack_anim_1 = 0;
			image_index = 0;
		}
		else{
	
		}
		// If the attack animation is anything but 24, as in it is running, you cannot do anything else
		if (character_attack_animation_duration > 0){
			//image_xscale = 1;
			sprite_index = character_attack_anim_1; // reference the animation sprite asset
			character_attack_animation_duration -= 1;
		}
		else {
			// if this was an ai, we would then use "character attack speed" to set the rate in which the ai
			// chooses to attack again
			//character_attack_speed = ((character_anim_frames_amount/character_anim_fps) * fps) * random_ai_attack_delay; // reset timer
			character_attack_speed = random_ai_attack_delay * fps; // reset timer
			character_attack_animation_duration = (character_anim_frames_amount/character_anim_fps) * fps;
			in_attack_anim = false;
		}
	
	}
	else{
	
		//else
		// Always attack :/
		
			// for debugging purposes
			ai_state = "attack order";
			// keep making your way to the right of the map
			// if there is an enemy present, attack the nearest one
			// First check if there are any enemies
			if (instance_exists(enemy_target)){
				// check if there is a castle target that we can compare to
				if (instance_exists(enemy_castle_target)){
					// There are enemies and a castle
					ai_state = "AO Enemy + Castle up";
					// Are the enemies in front or behind the enemy castle?
					//if (enemy_castle_target.x <= enemy_target.x){
					if (_closest_enemy.x > instance_nearest(x,y,enemy_castle_target).x){
						// Enemy x is larger than x, since -> is more positive, that means the enemy x value is larger
						// Enemies are behind the enemy castle
						// Move to and attack Castle
						
						ai_state = "AO Enemy, Castle up, Enemy behind castle";
						
						// if x is greater than the closest enemy's x |<- offset and is smaller than the ->| offset, you are fine, start combat
						if (x > (enemy_castle_target.x  - character_reach + ai_attack_distance_offset) && x < (enemy_castle_target.x  + character_reach)){
							// the error is likely here
								
							// determine if they are on the right or left
							// You can now attack
							// is the enemy to the left or right
							// are they on the left or right?
							if (enemy_castle_target.x >= x){
								// On the right
								// Since we are on the left, we look to the right
								// First we check, can we attack?
								if (character_attack_speed <= 0){
									// so the timer is at zero
									in_attack_anim = true;
									image_xscale = 1;
									// in between hits, stay ready
									// if we are facing right
									if (image_xscale = 1){
										instance_create_layer(x,y,"hitbox_layer",character_attack_hitbox_1);
	
									}
									// if not, spawn a mirrored version
									else{
										var _inst = instance_create_layer(x,y,"hitbox_layer",character_attack_hitbox_1);
										with (_inst){
		
											image_xscale = -1;
											direction = 180;
										}
		
									}
									// reset timer
									character_attack_speed = character_attack_animation_duration;
							
					
								}
								else {
									// in between hits, stay ready
									sprite_index = character_ready_anim;
									image_xscale = 1; // 1 = original, -1 = flipped on x-axis
						
								}
								
								
							}
							// on the left
							else {
								// On the right
								// Since we are on the left, we look to the right
								// First we check, can we attack?
							if (character_attack_speed <= 0){
									// so the timer is at zero
									in_attack_anim = true;
									image_xscale = -1;
									// in between hits, stay ready
									// if we are facing right
									if (image_xscale = 1){
										instance_create_layer(x,y,"hitbox_layer",character_attack_hitbox_1);
	
									}
									// if not, spawn a mirrored version
									else{
										var _inst = instance_create_layer(x,y,"hitbox_layer",character_attack_hitbox_1);
										with (_inst){
			
											image_xscale = -1;
											direction = 180;
										}
		
									}
									// reset timer
									character_attack_speed = character_attack_animation_duration;
							
						
								}
								else {
									// in between hits, stay ready
									sprite_index = character_ready_anim;
									image_xscale = 1; // 1 = original, -1 = flipped on x-axis
						
								}
								
							}
						}
						// We are not in character reach
						else {
							// Is the character to the right or left
							if (enemy_castle_target.x >= x){
								// Enemy is to our right or on top of us
								// we run
								x += character_running_speed;
								sprite_index = character_run_anim;
								image_xscale = 1; // 1 = original, -1 = flipped on x-axis
							}
							else {
								// Enemy is on the left
								// we run
								x -= character_running_speed;
								sprite_index = character_run_anim;
								image_xscale = -1; // 1 = original, -1 = flipped on x-axis
							}
								
						}
						
						
					}
					// Enemies are in front of castle
					// They may be attacking or defending
					else {
						// Run up to nearest enemy in range and attack
						ai_state = "AO Enemy, Castle up, Enemy in front";
						// WIP Attack Start ==============================================================================
						
						// if x is greater than the closest enemy's x |<- offset and is smaller than the ->| offset, you are fine, start combat
						if (x > (_closest_enemy.x  - character_reach + + ai_attack_distance_offset) && x < (_closest_enemy.x  + character_reach)){
							// the error is likely here
								
							// determine if they are on the right or left
							// You can now attack
							// is the enemy to the left or right
							// are they on the left or right?
							if (_closest_enemy.x >= x){
								// On the right
								// Since we are on the left, we look to the right
								// First we check, can we attack?
								if (character_attack_speed <= 0){
									// so the timer is at zero
									in_attack_anim = true;
									image_xscale = 1;
									// in between hits, stay ready
									// if we are facing right
									if (image_xscale = 1){
										instance_create_layer(x,y,"hitbox_layer",character_attack_hitbox_1);
	
									}
									// if not, spawn a mirrored version
									else{
										var _inst = instance_create_layer(x,y,"hitbox_layer",character_attack_hitbox_1);
										with (_inst){
		
											image_xscale = -1;
											direction = 180;
										}
		
									}
									// reset timer
									character_attack_speed = character_attack_animation_duration;
							
					
								}
								else {
									// in between hits, stay ready
									sprite_index = character_ready_anim;
									image_xscale = 1; // 1 = original, -1 = flipped on x-axis
						
								}
								
								
							}
							// on the left
							else {
								// On the right
								// Since we are on the left, we look to the right
								// First we check, can we attack?
							if (character_attack_speed <= 0){
									// so the timer is at zero
									in_attack_anim = true;
									image_xscale = -1;
									// in between hits, stay ready
									// if we are facing right
									if (image_xscale = 1){
										instance_create_layer(x,y,"hitbox_layer",character_attack_hitbox_1);
	
									}
									// if not, spawn a mirrored version
									else{
										var _inst = instance_create_layer(x,y,"hitbox_layer",character_attack_hitbox_1);
										with (_inst){
			
											image_xscale = -1;
											direction = 180;
										}
		
									}
									// reset timer
									character_attack_speed = character_attack_animation_duration;
							
						
								}
								else {
									// in between hits, stay ready
									sprite_index = character_ready_anim;
									image_xscale = 1; // 1 = original, -1 = flipped on x-axis
						
								}
								
							}
						}
						// We are not in character reach
						else {
							// Is the character to the right or left
							if (_closest_enemy.x >= x){
								// Enemy is to our right or on top of us
								// we run
								x += character_running_speed;
								sprite_index = character_run_anim;
								image_xscale = 1; // 1 = original, -1 = flipped on x-axis
							}
							else {
								// Enemy is on the left
								// we run
								x -= character_running_speed;
								sprite_index = character_run_anim;
								image_xscale = -1; // 1 = original, -1 = flipped on x-axis
							}
								
						}
						
						// WIP Attack end ================================================================================
						
					}
				
				}
				// Enemies but no castle
				else{
					ai_state = "AO Enemy, Castle down";
					//Just attack all enemies, dont worry about castles
					
					// WIP Attack Start ==============================================================================
						
					// if x is greater than the closest enemy's x |<- offset and is smaller than the ->| offset, you are fine, start combat
					if (x > (_closest_enemy.x  - character_reach + ai_attack_distance_offset) && x < (_closest_enemy.x  + character_reach)){
						// the error is likely here
								
						// determine if they are on the right or left
						// You can now attack
						// is the enemy to the left or right
						// are they on the left or right?
						if (_closest_enemy.x >= x){
							// On the right
							// Since we are on the left, we look to the right
							// First we check, can we attack?
							if (character_attack_speed <= 0){
								// so the timer is at zero
								in_attack_anim = true;
								image_xscale = 1;
								// in between hits, stay ready
								// if we are facing right
								if (image_xscale = 1){
									instance_create_layer(x,y,"hitbox_layer",character_attack_hitbox_1);
	
								}
								// if not, spawn a mirrored version
								else{
									var _inst = instance_create_layer(x,y,"hitbox_layer",character_attack_hitbox_1);
									with (_inst){
		
										image_xscale = -1;
										direction = 180;
									}
		
								}
								// reset timer
								character_attack_speed = character_attack_animation_duration;
							
					
							}
							else {
								// in between hits, stay ready
								sprite_index = character_ready_anim;
								image_xscale = 1; // 1 = original, -1 = flipped on x-axis
						
							}
								
								
						}
						// on the left
						else {
							// On the right
							// Since we are on the right, we look to the left
							// First we check, can we attack?
							if (character_attack_speed <= 0){
								// so the timer is at zero
								in_attack_anim = true;
								image_xscale = -1;
								// in between hits, stay ready
								// if we are facing right
								if (image_xscale = 1){
									instance_create_layer(x,y,"hitbox_layer",character_attack_hitbox_1);
	
								}
								// if not, spawn a mirrored version
								else{
									var _inst = instance_create_layer(x,y,"hitbox_layer",character_attack_hitbox_1);
									with (_inst){
			
										image_xscale = -1;
										direction = 180;
									}
		
								}
								// reset timer
								character_attack_speed = character_attack_animation_duration;
							
						
							}
							else {
								// in between hits, stay ready
								sprite_index = character_ready_anim;
								image_xscale = 1; // 1 = original, -1 = flipped on x-axis
						
							}
								
						}
					}
					// We are not in character reach
					else {
						// Is the character to the right or left
						if (_closest_enemy.x >= x){
							// Enemy is to our right or on top of us
							// we run
							x += character_running_speed;
							sprite_index = character_run_anim;
							image_xscale = 1; // 1 = original, -1 = flipped on x-axis
						}
						else {
							// Enemy is on the left
							// we run
							x -= character_running_speed;
							sprite_index = character_run_anim;
							image_xscale = -1; // 1 = original, -1 = flipped on x-axis
						}
								
					}
						
					// WIP Attack end ================================================================================
				
				}
				
				
			
			}
			// If there are no enemies, attack the castle
			else{
				// if there is a castle attack, if not, Idle
				if (instance_exists(enemy_castle_target)){
					// Move towards castle target and attack
					ai_state = "AO No Enemy, Castle up";
					if (x > (enemy_castle_target.x - character_reach + ai_movement_margin_of_error_allowed) && x < (enemy_castle_target.x + character_reach - ai_movement_margin_of_error_allowed)){
						// is the target on the left or right?
						if (enemy_castle_target.x >= x){
							// On the right
							// Since we are on the left, we look to the right
							// First we check, can we attack?
							if (character_attack_speed <= 0){
								// so the timer is at zero
								in_attack_anim = true;
								image_xscale = 1;
								// in between hits, stay ready
								// if we are facing right
								if (image_xscale = 1){
									instance_create_layer(x,y,"hitbox_layer",character_attack_hitbox_1);

								}
								// if not, spawn a mirrored version
								else{
									var _inst = instance_create_layer(x,y,"hitbox_layer",character_attack_hitbox_1);
									with (_inst){
		
										image_xscale = -1;
										direction = 180;
									}
		
								}
								// reset timer
								character_attack_speed = character_attack_animation_duration;
							
					
							}
							else {
								// in between hits, stay ready
								sprite_index = character_ready_anim;
								image_xscale = 1; // 1 = original, -1 = flipped on x-axis
						
							}
								
								
						}
						// on the left
						else {
							// On the right
							// Since we are on the left, we look to the right
							// First we check, can we attack?
							if (character_attack_speed <= 0){
								// so the timer is at zero
								in_attack_anim = true;
								image_xscale = -1;
								// in between hits, stay ready
								// if we are facing right
								if (image_xscale = 1){
									instance_create_layer(x,y,"hitbox_layer",character_attack_hitbox_1);
	
								}
								// if not, spawn a mirrored version
								else{
									var _inst = instance_create_layer(x,y,"hitbox_layer",character_attack_hitbox_1);
									with (_inst){
			
										image_xscale = -1;
										direction = 180;
									}
		
								}
								// reset timer
								character_attack_speed = character_attack_animation_duration;
							
						
							}
							else {
								// in between hits, stay ready
								sprite_index = character_ready_anim;
								image_xscale = 1; // 1 = original, -1 = flipped on x-axis
						
							}
								
						}
						
						
		
					}
					// You havent reached your movement target
					else{
						// is the movement target to the left or right?
						if (x > enemy_castle_target.x){
							
							// we run
							// we walk here
							x -= character_running_speed;
							sprite_index = character_run_anim;
							image_xscale = -1; // 1 = original, -1 = flipped on x-axis
						
									
						
						}
						else if (x <= enemy_castle_target.x){
									
							// we run
							// we walk here
							x += character_running_speed;
							sprite_index = character_run_anim;
							image_xscale = 1; // 1 = original, -1 = flipped on x-axis
			
									
						}
						
					}
					
					
				}
				else {
					// No castles, no enemies
					ai_state = "AO No Enemy, Castle down";
					// Idle Anim
					sprite_index = character_ready_anim;
					// since it is a player unit, we want it to face right
					image_xscale = 1; // 1 = original, -1 = flipped on x-axis
				}
			
			}
			
	}
}


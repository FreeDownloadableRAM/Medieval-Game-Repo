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
	
	if (instance_exists(enemy_target)){
		// Get the nearest instance of this target object
		var _closest_enemy = instance_nearest(x,y,enemy_target);
		
		
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
	
	
		// If the attack animation is anything but 24, as in it is running, you cannot do anything else
		if (character_attack_animation_duration > 0){
			image_xscale = 1;
			sprite_index = character_attack_anim_1; // reference the animation sprite asset
			character_attack_animation_duration -= 1;
		}
		else {
			// if this was an ai, we would then use "character attack speed" to set the rate in which the ai
			// chooses to attack again
			character_attack_speed = fps * random_ai_attack_delay; // reset timer
			character_attack_animation_duration = fps * 1;
			in_attack_anim = false;
		}
	
	}
	else{
	
			
		//else
	
	
		// Idle
		if (ai_state == 0){
			// Okay, so before we do anything, we want to check if we should switch AI states
			// If there is an enemy within the AI's vision range, -> go to ready state
			if (instance_exists(enemy_target)){
				// okay it exists, through what condition do we switch to a different ai state?
				if (distance_to_object(_closest_enemy) <= character_vision_distance){
					// Okay so the distance between this character and the target enemy is withing vision distance, transition to ready ai state
					ai_state = 1;
			
				}
		
			}
		
			// Okay so we come out initially as idle, what is the goal?
			// move to rally point
			// Check if a rally point even exists (to avoid crashing), if it doesnt, idle
			if(instance_exists(obj_player_rally_target)){
				// It does exist!
				// move towards it
				if ((obj_player_rally_target.x - ai_rally_distance_offset) != x){
					// So we arent on it
				
					// calculate how distance
					if (distance_to_object(obj_player_rally_target) <= character_walking_boundary + ai_rally_distance_offset){
						// We walk
						// So where is it and how far?
						if ((obj_player_rally_target.x - ai_rally_distance_offset) > x){
							// so its to our right
							x += character_walking_speed;
							sprite_index = character_walk_anim;
							image_xscale = 1; // 1 = original, -1 = flipped on x-axis
					
						}
						else if ((obj_player_rally_target.x - ai_rally_distance_offset) < x){
							// so it is on our left
							x -= character_walking_speed;
							sprite_index = character_walk_anim;
							image_xscale = -1; // 1 = original, -1 = flipped on x-axis
						}
					}
					else{
						// We run
						// So where is it and how far?
						if ((obj_player_rally_target.x - ai_rally_distance_offset) > x){
							// so its to our right
							x += character_running_speed;
							sprite_index = character_run_anim;
							image_xscale = 1; // 1 = original, -1 = flipped on x-axis
					
						}
						else if ((obj_player_rally_target.x - ai_rally_distance_offset) < x){
							// so it is on our left
							x -= character_running_speed;
							sprite_index = character_run_anim;
							image_xscale = -1; // 1 = original, -1 = flipped on x-axis
						}
					
					}
				
				
			
				}
				// so we are on our rally target! good, just idle there and transition ot whatever state we need.
				else{
					// Idle 
					sprite_index = character_idle_anim;
					// since it is a player unit, we want it to face right
					image_xscale = 1; // 1 = original, -1 = flipped on x-axis
				}
			}
			else{
				// If it doesnt, Idle
				sprite_index = character_idle_anim;
			}
		
		
			// do not move to rally point if spotted an enemy
		
		}
		// Ready
		else if (ai_state == 1){
			// Only run if there is an enemy target on the field, if not exit back to idle.
			if (instance_exists(enemy_target)){
				// there is an enemy, but now we have to decide, are we close enough to stay ready or are they too far?
				if (distance_to_object(_closest_enemy) <= character_vision_distance){
					// They are close enough to see, now we decide, are we ahead of the rally point or behind?
					// If we are ahead or on it, stay put and stay ready
					if (instance_exists(obj_player_rally_target)  && ((obj_player_rally_target.x - ai_rally_distance_offset) >= x)){
						// okay so the distance is not zero, we are not on it and it exists
						// now we check if the enemy is close enough to engage
						if (distance_to_object(_closest_enemy) <= character_engage_distance){
							// so the enemy target is closer or equal to the engage distance
							// are we ordered to attack, defend or retreat?
							if (global.player_order == 1){
								// We are defending
								ai_state = 2;
							}
						
						}
						// we arent close enough to the enemy target but we are not on the rally target, so we run to the target, without walking
						// since we are "aware" there is a threat
						else {
							// We run
							// So where is it and how far?
							if ((obj_player_rally_target.x - ai_rally_distance_offset) > x){
								// so its to our right
							
								if (distance_to_object(obj_player_rally_target) <= ((character_walking_boundary / 2) + ai_rally_distance_offset)){
									x += character_walking_speed;
									sprite_index = character_walk_anim;
									image_xscale = 1; // 1 = original, -1 = flipped on x-axis
								
								}
								else {
									x += character_running_speed;
									sprite_index = character_run_anim;
									image_xscale = 1; // 1 = original, -1 = flipped on x-axis
							
								}
							
					
							}
							else if ((obj_player_rally_target.x - ai_rally_distance_offset) < x){
								// so it is on our left
							
								if (distance_to_object(obj_player_rally_target) <= ((character_walking_boundary / 2) + ai_rally_distance_offset)){
									x -= character_walking_speed;
									sprite_index = character_walk_anim;
									image_xscale = -1; // 1 = original, -1 = flipped on x-axis
								
								}
								else {
									x -= character_running_speed;
									sprite_index = character_run_anim;
									image_xscale = -1; // 1 = original, -1 = flipped on x-axis
								}
							}
						}
					}
					else {
						// We are on it
						// now we check if the enemy is close enough to engage
						if ((distance_to_object(_closest_enemy) <= character_engage_distance) && (_closest_enemy.x <= obj_player_rally_target.x + character_engage_distance)){
							// so the enemy target is closer or equal to the engage distance
							// are we ordered to attack, defend or retreat?
							if (global.player_order == 1){
								// We are defending
								ai_state = 2;
							}
						
						}
					
						else{
							// stay ready until enemy is close enough, then transition to defend ai state
							// Okay, here we are anticipating that there is an enemy with our vision range
							// so we switch to our ready stance
							
							// if we are in vision distance but we arent close enough, dont ready
							
							if ((distance_to_object(_closest_enemy) <= character_vision_distance)){
							
								// Dont ready Animation it
							
							}
							else{
								if (_closest_enemy.x >= x){
									// The enemy is to our right
									sprite_index = character_ready_anim;
									// since it is a player unit, we want it to face right
									image_xscale = 1; // 1 = original, -1 = flipped on x-axis
								}
								else {
									// The enemy is to our left
									sprite_index = character_ready_anim;
									// since it is a player unit, we want it to face right
									image_xscale = -1; // 1 = original, -1 = flipped on x-axis
								}
							}
							
						}
					
					
					}
					
					if (instance_exists(obj_player_rally_target)  && x > obj_player_rally_target - ai_rally_distance_offset){
						
						if (distance_to_object(obj_player_rally_target) <= ((character_walking_boundary / 2) + ai_rally_distance_offset)){
							x -= character_walking_speed;
							sprite_index = character_walk_anim;
							image_xscale = -1; // 1 = original, -1 = flipped on x-axis
								
						}
						else {
							x -= character_running_speed;
							sprite_index = character_run_anim;
							image_xscale = -1; // 1 = original, -1 = flipped on x-axis
						}
					
					}
					else {
						x += character_running_speed;
						sprite_index = character_run_anim;
						image_xscale = 1; // 1 = original, -1 = flipped on x-axis
					
					}
					x += character_running_speed;
					sprite_index = character_run_anim;
					image_xscale = 1; // 1 = original, -1 = flipped on x-axis
					
					
					
				
				}
				// They are not within vision range, go idle.
				else{
					ai_state = 0;
				}
			
				if (_closest_enemy.x >= x){
					// The enemy is to our right
					
					if (distance_to_object(_closest_enemy) >= character_engage_distance){
						
					}
					else {
						sprite_index = character_defend_anim;
						// since it is a player unit, we want it to face right
						image_xscale = 1; // 1 = original, -1 = flipped on x-axis
					}
					
					
				}
				else {
					
					if (distance_to_object(_closest_enemy) >= character_engage_distance){
						
					}
					
					else {
						// The enemy is to our left
						sprite_index = character_ready_anim;
						// since it is a player unit, we want it to face right
						image_xscale = -1; // 1 = original, -1 = flipped on x-axis
					}
				}
			
			
			}
			// There is not enemy on the field, return to idle state
			else{
				ai_state = 0;
			}
			
			
		
		}
		// Defending
		else if (ai_state == 2){
			// Check if enemy target exists
			if (instance_exists(enemy_target)){
				// Enemy exists
				// now we determine, do we stay in defense mode or ready mode
				// If the enemy is further than the rally point + engage distance, switch to ready ai state
				// otherwise, we chase them down
				if (instance_exists(obj_player_rally_target)){
					// okay we know that rally target exists, check for exit condition
					if (_closest_enemy.x > (obj_player_rally_target.x + character_engage_distance) || (obj_player_rally_target.x < x && distance_to_object(_closest_enemy) > (obj_player_rally_target.x + character_engage_distance))){
						// So we know the enemy is further away than the rally target + engage distance, we switch to ready
						ai_state = 1;
					}
					// So they enemy target is close enough to engage, now we actively engage
					else {
						// We arent on target
						if ((_closest_enemy.x - character_reach - ai_rally_distance_offset) != x){
						//if (distance_to_object(_closest_enemy) > character_reach && distance_to_object(_closest_enemy) <= character_engage_distance){
							// We run
							// So where is it and how far?
							if ((_closest_enemy.x - character_reach - ai_rally_distance_offset) >= x){
								// so its to our right
								
								if (distance_to_object(_closest_enemy) <= 80 + ai_rally_distance_offset){
									x += character_walking_speed;
									sprite_index = character_run_anim;
									image_xscale = 1; // 1 = original, -1 = flipped on x-axis
								
								}
								else {
									x += character_running_speed;
									sprite_index = character_run_anim;
									image_xscale = 1; // 1 = original, -1 = flipped on x-axis
								}
								
					
							}
							else if ((_closest_enemy.x - character_reach - ai_rally_distance_offset) < x){
								// so it is on our left
								
								if (distance_to_object(_closest_enemy) <= 80 + ai_rally_distance_offset){
									x -= character_walking_speed;
									sprite_index = character_run_anim;
									image_xscale = -1; // 1 = original, -1 = flipped on x-axis
								
								}
								else {
									x -= character_running_speed;
									sprite_index = character_run_anim;
									image_xscale = -1; // 1 = original, -1 = flipped on x-axis
								}
							
							}
							
						}
						// We are where we are meant to be
						else{
							// Start combat logic
							// First, are we in range?
							if (distance_to_object(_closest_enemy) <= character_reach){
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
							// Stay defensive
							else {
								// on standby, keep defense anim
								sprite_index = character_defend_anim;
								image_xscale = 1; // 1 = original, -1 = flipped on x-axis
							
							}
							
							
						
						}
					
					}
				}
				// Rally target doesnt exist
				else {
					ai_state = 0;
				}
			}
			else {
				// No enemy exists, Idle
				ai_state = 0;
			}
		}
		// Attacking
		else if (ai_state == 3){
		
		}
		// Dying / dead
		else if (ai_state == 4){
		
		}
		// this is a catch all, if the AI doesnt know what to do, jus
		else{
			// Idle Anim
			sprite_index = character_idle_anim;
			// since it is a player unit, we want it to face right
			image_xscale = 1; // 1 = original, -1 = flipped on x-axis
	
		}
	
	}
}


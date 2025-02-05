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
			
			// launch projectile on the set fram
			if ((character_attack_animation_duration > character_anim_launch_frame - 1.05) && (character_attack_animation_duration < (character_anim_launch_frame))){
			
				
				var _inst = instance_create_layer(x,y,"hitbox_layer",character_attack_projectile);
				with (_inst){
			
				image_xscale = 1;
				direction = 180;
				}
			}
			else {
				// If not, do not create projectile
			
			}
			
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
	
	
		// retreat
		if (global.ally_3_order == 0){
			// Debugging
			ai_state = "retreat order";
			// there is no if conditions, you just retreat to retreat position and stay there, no engagements or anything.
			
			if (instance_exists(retreat_rally_target)){
				// just move towards rally point
				// if x is greater than the lower rally point |<- offset and is smaller than the ->| offset, you are fine stay still.
				if (x > (retreat_rally_target.x - ai_movement_margin_of_error_allowed - ai_range_retreat_offset) && x < (retreat_rally_target.x + ai_movement_margin_of_error_allowed - ai_range_retreat_offset)){
					// You can now just stay and idle
					// Idle Anim
					sprite_index = character_defend_anim;
					// since it is a player unit, we want it to face right
					image_xscale = 1; // 1 = original, -1 = flipped on x-axis
		
				}
				// You havent reached your movement target
				else{
					// is the movement target to the left or right?
					if (x >= retreat_rally_target.x - ai_range_retreat_offset){
							
						// we run
						// we walk here
						x -= character_running_speed;
						sprite_index = character_run_anim;
						image_xscale = -1; // 1 = original, -1 = flipped on x-axis
						
									
						
					}
					else if (x < retreat_rally_target.x - ai_range_retreat_offset){
									
						// we run
						// we walk here
						x += character_running_speed;
						sprite_index = character_run_anim;
						image_xscale = 1; // 1 = original, -1 = flipped on x-axis
			
									
					}
						
				}
			}
			// If there is no retreat rally to go to,
			else {
				// defend anim
				sprite_index = character_defend_anim;
				// since it is a player unit, we want it to face right
				image_xscale = 1; // 1 = original, -1 = flipped on x-axis
			}
				
			
		
		}
		// Defend
		else if (global.ally_3_order == 1){
			// debug tracker
			ai_state = "defend order";
			
			// so we are defending, check if rally point exists
			if (instance_exists(defend_rally_target)){
				// It exists, now check if there are any enemies
				if (instance_exists(enemy_target)){
					// is the enemy in vision and to the right? If not, pretend they dont exist
					
					if (distance_to_object(_closest_enemy) > (x + character_vision_distance) && _closest_enemy.x > defend_rally_target && x > (round(retreat_rally_target.x + ai_attack_distance_offset)) && x < defend_rally_target.x + ai_attack_distance_offset){
						// Debugging
						ai_state = "Situation A";
						// enemy is not in vision and is to the right of the rally point
						// pretend as if the enemies do not exist, just move to rally point.
						// just move towards rally point
						// if x is greater than the lower rally point |<- offset and is smaller than the ->| offset, you are fine stay still.
						if (x > (defend_rally_target.x - ai_rally_distance_offset - ai_movement_margin_of_error_allowed) && x < (defend_rally_target.x - ai_rally_distance_offset + ai_movement_margin_of_error_allowed)){
							// You can now just stay and idle
							// Idle Anim
							sprite_index = character_idle_anim;
							// since it is a player unit, we want it to face right
							image_xscale = 1; // 1 = original, -1 = flipped on x-axis
					
						}
						// You havent reached your movement target
						else{
							// is the movement target to the left or right?
							if (x > defend_rally_target.x - ai_rally_distance_offset){
								// Debugging
								ai_state = "Situation A 1";
								//if we are close enough, slowdown and walk
								if (x - defend_rally_target.x  - ai_rally_distance_offset < character_walking_boundary){
									ai_state = "Situation A 1a";
									// we walk here
									x -= character_walking_speed;
									sprite_index = character_walk_anim;
									image_xscale = -1; // 1 = original, -1 = flipped on x-axis
							
								}
								else {
									ai_state = "Situation A 1b";
									// we run
									// we walk here
									x -= character_running_speed;
									sprite_index = character_run_anim;
									image_xscale = -1; // 1 = original, -1 = flipped on x-axis
						
								}
						
							}
							else if (x < defend_rally_target.x - ai_rally_distance_offset){
								ai_state = "Situation A 2";
								//if we are close enough, slowdown and walk
								if (distance_to_object(defend_rally_target) <= character_walking_boundary + ai_rally_distance_offset){
									// we walk here
									ai_state = "Situation A 2a";
									x += character_walking_speed;
									sprite_index = character_walk_anim;
									image_xscale = 1; // 1 = original, -1 = flipped on x-axis
							
								}
								else {
									ai_state = "Situation A 2b";
									// we run
									// we walk here
									x += character_running_speed;
									sprite_index = character_run_anim;
									image_xscale = 1; // 1 = original, -1 = flipped on x-axis
						
								}
							}
						
						}
						
					}
					// What if the enemy is in vision, and is to the right of the rally point?
					else if (distance_to_object(_closest_enemy) < (x + character_vision_distance) && _closest_enemy.x > defend_rally_target && _closest_enemy.x < (x + character_reach) && x > (round(retreat_rally_target.x + ai_attack_distance_offset)) && x < defend_rally_target.x + ai_attack_distance_offset){ // not triggering for some reason
						// Debugging
						ai_state = "Situation B";
						// Enemy is in vision, and is to the right of the rally point
						// keep moving to the rally point until the enemy is within reach
						// If within reach, start attacking, if not just move to rally point.
						if (distance_to_object(_closest_enemy) <= character_reach - ai_movement_margin_of_error_allowed){
							//old
							// distance_to_object(_closest_enemy) <= character_reach - ai_movement_margin_of_error_allowed * 2
							
							//new
							// x > (_closest_enemy.x  - character_reach) && x < (_closest_enemy.x  + character_reach)
							
							// Debugging
							ai_state = "Situation B 1";
							// are they on the left or right?
							if (_closest_enemy.x >= x){
								// Debugging
								ai_state = "Situation B 2a";
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
										//instance_create_layer(x,y,"hitbox_layer",character_attack_projectile);
										
									}
									// if not, spawn a mirrored version
									else{
										/*
										var _inst = instance_create_layer(x,y,"hitbox_layer",character_attack_projectile);
										with (_inst){
			
											image_xscale = -1;
											direction = 180;
										}
										*/
		
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
								// Debugging
								ai_state = "Situation B 2b";
								
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
										//instance_create_layer(x,y,"hitbox_layer",character_attack_projectile);
		
									}
									// if not, spawn a mirrored version
									else{
										/*
										var _inst = instance_create_layer(x,y,"hitbox_layer",character_attack_projectile);
										with (_inst){
			
											image_xscale = -1;
											direction = 180;
										}
										*/
		
									}
									// reset timer
									character_attack_speed = character_attack_animation_duration;
							
						
								}
								else {
									// in between hits, stay ready
									sprite_index = character_ready_anim;
									image_xscale = -1; // 1 = original, -1 = flipped on x-axis
						
								}
								
							}
						}
						// Just keep moving to rally point
						else{
							// Debugging
							ai_state = "Situation B 1b";
							// WIP area
							// just move towards rally point
							// if x is greater than the lower rally point |<- offset and is smaller than the ->| offset, you are fine stay still.
							if (x > (defend_rally_target.x - ai_rally_distance_offset - ai_movement_margin_of_error_allowed) && x < (defend_rally_target.x - ai_rally_distance_offset + ai_movement_margin_of_error_allowed)){
								// You can now just stay and idle
								// Idle Anim
								sprite_index = character_ready_anim;
								// since it is a player unit, we want it to face right
								image_xscale = 1; // 1 = original, -1 = flipped on x-axis
					
							}
							// You havent reached your movement target
							else{
								// is the movement target to the left or right?
								if (x > defend_rally_target.x - ai_rally_distance_offset){
									
									// we run
									// we walk here
									x -= character_running_speed;
									sprite_index = character_run_anim;
									image_xscale = -1; // 1 = original, -1 = flipped on x-axis
						
									
						
								}
								else if (x < defend_rally_target.x - ai_rally_distance_offset){
									
									// we run
									// we walk here
									x += character_running_speed;
									sprite_index = character_run_anim;
									image_xscale = 1; // 1 = original, -1 = flipped on x-axis
				
									
								}
						
							}
							
							
						}
						
					}
				
					// what if the enemy is in vision and is on top of or to the left of the rally point?
					else if ((distance_to_object(_closest_enemy) <= character_vision_distance) && (_closest_enemy.x <= defend_rally_target.x) && x > (round(retreat_rally_target.x + ai_attack_distance_offset)) && x < defend_rally_target.x + ai_attack_distance_offset){
						// THERE IS A BUG HERE SOMEWHERE, AI WILL NOT RUN TOWARDS CLOSEST ENEMY UPON SPOTTING THEM
						// Debugging
						ai_state = "Situation C";
						// Enemy is in vision, and is to the left or on top of the rally point
						// Move to the nearest enemy to yourself and attack it
						if (x > (_closest_enemy.x  - character_reach) && x < (_closest_enemy.x  + character_reach)){ //CHARACTER REACH LOGIC
							// OLD
							// distance_to_object(_closest_enemy) <= character_reach - ai_movement_margin_of_error_allowed
							
							//NEW
							// x > (_closest_enemy.x  - character_reach) && x < (_closest_enemy.x  + character_reach)
							
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
										//instance_create_layer(x,y,"hitbox_layer",character_attack_projectile);
		
									}
									// if not, spawn a mirrored version
									else{
										/*
										var _inst = instance_create_layer(x,y,"hitbox_layer",character_attack_projectile);
										with (_inst){
			
											image_xscale = -1;
											direction = 180;
										}
										*/
		
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
										//instance_create_layer(x,y,"hitbox_layer",character_attack_projectile);
		
									}
									// if not, spawn a mirrored version
									else{
										/*
										var _inst = instance_create_layer(x,y,"hitbox_layer",character_attack_projectile);
										with (_inst){
			
											image_xscale = -1;
											direction = 180;
										}
										*/
		
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
						// move towards the nearest enemy
						else {
							ai_state = "Situation D";
							// if x is greater than the closest enemy's x |<- offset and is smaller than the ->| offset, you are fine, start combat
							if (x > (_closest_enemy.x  - character_reach) && x < (_closest_enemy.x  + character_reach)){
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
											//instance_create_layer(x,y,"hitbox_layer",character_attack_projectile);
		
										}
										// if not, spawn a mirrored version
										else{
											/*
											var _inst = instance_create_layer(x,y,"hitbox_layer",character_attack_projectile);
											with (_inst){
			
												image_xscale = -1;
												direction = 180;
											}
											*/
		
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
											//instance_create_layer(x,y,"hitbox_layer",character_attack_projectile);
		
										}
										// if not, spawn a mirrored version
										else{
											/*
											var _inst = instance_create_layer(x,y,"hitbox_layer",character_attack_projectile);
											with (_inst){
			
												image_xscale = -1;
												direction = 180;
											}
											*/
		
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
						}
					
					}
						// is not within reach
						// Just run to rally point (no walking, we are aware of an enemy!)
						// We also dont use idle animation, we are aware there is an enemy, use ready animation.
					else {
						// just move towards rally point
						// if x is greater than the lower rally point |<- offset and is smaller than the ->| offset, you are fine stay still.
						if (x > (defend_rally_target.x - ai_rally_distance_offset - ai_movement_margin_of_error_allowed) && x < (defend_rally_target.x - ai_rally_distance_offset + ai_movement_margin_of_error_allowed)){
							// You can now just stay and idle
							// Idle Anim
							sprite_index = character_ready_anim;
							// since it is a player unit, we want it to face right
							image_xscale = 1; // 1 = original, -1 = flipped on x-axis
					
						}
						// You havent reached your movement target
						else{
							// is the movement target to the left or right?
							if (x > defend_rally_target.x - ai_rally_distance_offset){
									
								// we run
								// we walk here
								x -= character_running_speed;
								sprite_index = character_run_anim;
								image_xscale = -1; // 1 = original, -1 = flipped on x-axis
						
									
						
							}
							else if (x < defend_rally_target.x - ai_rally_distance_offset){
									
								// we run
								// we walk here
								x += character_running_speed;
								sprite_index = character_run_anim;
								image_xscale = 1; // 1 = original, -1 = flipped on x-axis
				
									
							}
						
						}
					}
						
					
				}
					
				// just move to rally target
				else {
					ai_state = "Situation no enemy A";
					// just move towards rally point
					// if x is greater than the lower rally point |<- offset and is smaller than the ->| offset, you are fine stay still.
					if (x > (defend_rally_target.x - ai_rally_distance_offset - ai_movement_margin_of_error_allowed) && x < (defend_rally_target.x - ai_rally_distance_offset + ai_movement_margin_of_error_allowed)){
						// You can now just stay and idle
						// Idle Anim
						sprite_index = character_idle_anim;
						// since it is a player unit, we want it to face right
						image_xscale = 1; // 1 = original, -1 = flipped on x-axis
					
					}
					// You havent reached your movement target
					else{
						ai_state = "Situation no enemy B";
						// is the movement target to the left or right?
						if (x > defend_rally_target.x - ai_rally_distance_offset){
							ai_state = "Situation no enemy B1";
							//if we are close enough, slowdown and walk
							//if (x - defend_rally_target  - ai_rally_distance_offset < character_walking_boundary){ // Original, was bugged because we reference an object but not that object's x value
							if (x - defend_rally_target.x  - ai_rally_distance_offset < character_walking_boundary){ // fixed
								ai_state = "Situation no enemy B1 A";
								// we walk here
								x -= character_walking_speed;
								sprite_index = character_walk_anim;
								image_xscale = -1; // 1 = original, -1 = flipped on x-axis
							
							}
							else {
								ai_state = "Situation no enemy B1 b";
								// we run
								// we walk here
								x -= character_running_speed;
								sprite_index = character_run_anim;
								image_xscale = -1; // 1 = original, -1 = flipped on x-axis
						
							}
						
						}
						else if (x < defend_rally_target.x - ai_rally_distance_offset){
							ai_state = "Situation no enemy B2";
							//if we are close enough, slowdown and walk
							if (distance_to_object(defend_rally_target) <= character_walking_boundary + ai_rally_distance_offset){
								// we walk here
								ai_state = "Situation no enemy B2 A";
								x += character_walking_speed;
								sprite_index = character_walk_anim;
								image_xscale = 1; // 1 = original, -1 = flipped on x-axis
						
							}
							else {
								// we run
								// we walk here
								ai_state = "Situation no enemy B2 B";
								x += character_running_speed;
								sprite_index = character_run_anim;
								image_xscale = 1; // 1 = original, -1 = flipped on x-axis
						
							}
						}
						// DEBUGGING
						/*
						else{
						
						}
						*/
						
					}
					
				}
				
			}
				// no enemies exist, so we dont have to account for that
			else {
				// No rally point exists
				// Idle Anim
				sprite_index = character_idle_anim;
				// since it is a player unit, we want it to face right
				image_xscale = 1; // 1 = original, -1 = flipped on x-axis
			}
			
			
		}
	
		// Attack
		else if (global.ally_3_order == 2){
			// for debugging purposes
			ai_state = "attack order";
			
			// Before we do anything, we want to make sure we are IN the map
			if (x >= retreat_rally_target.x + ai_attack_distance_offset){
			
			
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
											//instance_create_layer(x,y,"hitbox_layer",character_attack_projectile);
	
										}
										// if not, spawn a mirrored version
										else{
											/*
											var _inst = instance_create_layer(x,y,"hitbox_layer",character_attack_projectile);
											with (_inst){
		
												image_xscale = -1;
												direction = 180;
											}
											*/
		
										}
										// reset timer
										character_attack_speed = character_attack_animation_duration;
							
					
									}
									else {
										// in between hits, stay ready
										// Work in progress area
										// Reposition if need be
										// Check if we are too far away from enemy on the right
										// If enemies are to our left, dont bother repositioning
										if (instance_exists(enemy_target)){
									
											if (x >= (_closest_enemy.x  - character_reach + ai_attack_distance_offset + ai_movement_margin_of_error_allowed) && x > global.player_king_x_location && x < (_closest_enemy.x  + character_reach  + ai_attack_distance_offset - ai_movement_margin_of_error_allowed) && instance_exists(enemy_target)){
												// Move away from enemy
												// Move to the left
												if (x >= obj_retreat_player_rally_object && in_attack_anim == false){
													sprite_index = character_run_anim;
													image_xscale = -1; // 1 = original, -1 = flipped on x-axis
													x -= character_running_speed;
												}
												else{
													sprite_index = character_ready_anim;
													image_xscale = 1; // 1 = original, -1 = flipped on x-axis
												}
									
											}
											else {
									
												sprite_index = character_ready_anim;
												image_xscale = 1; // 1 = original, -1 = flipped on x-axis
									
											}
									
										}
										else{
									
											sprite_index = character_ready_anim;
											image_xscale = 1; // 1 = original, -1 = flipped on x-axis
									
										}
						
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
											//instance_create_layer(x,y,"hitbox_layer",character_attack_projectile);
	
										}
										// if not, spawn a mirrored version
										else{
											/*
											var _inst = instance_create_layer(x,y,"hitbox_layer",character_attack_projectile);
											with (_inst){
			
												image_xscale = -1;
												direction = 180;
											}
											*/
		
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
											//instance_create_layer(x,y,"hitbox_layer",character_attack_projectile);
	
										}
										// if not, spawn a mirrored version
										else{
											/*
											var _inst = instance_create_layer(x,y,"hitbox_layer",character_attack_projectile);
											with (_inst){
		
												image_xscale = -1;
												direction = 180;
											}
											*/
		
										}
										// reset timer
										character_attack_speed = character_attack_animation_duration;
							
					
									}
									else {
										// in between hits, stay ready
										// Work in progress area
										// Reposition if need be
										// Check if we are too far away from enemy on the right
										// If enemies are to our left, dont bother repositioning
										if (instance_exists(enemy_target)){
									
											if (x >= (_closest_enemy.x  - character_reach + ai_attack_distance_offset + ai_movement_margin_of_error_allowed) && x > global.player_king_x_location && x < (_closest_enemy.x  + character_reach  + ai_attack_distance_offset - ai_movement_margin_of_error_allowed) && instance_exists(enemy_target)){
												// Move away from enemy
												// Move to the left
												if (x >= obj_retreat_player_rally_object && in_attack_anim == false){
													sprite_index = character_run_anim;
													image_xscale = -1; // 1 = original, -1 = flipped on x-axis
													x -= character_running_speed;
												}
												else{
													sprite_index = character_ready_anim;
													image_xscale = 1; // 1 = original, -1 = flipped on x-axis
												}
									
											}
											else {
									
												sprite_index = character_ready_anim;
												image_xscale = 1; // 1 = original, -1 = flipped on x-axis
									
											}
									
										}
										else{
									
											sprite_index = character_ready_anim;
											image_xscale = 1; // 1 = original, -1 = flipped on x-axis
									
										}
						
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
											//instance_create_layer(x,y,"hitbox_layer",character_attack_projectile);
	
										}
										// if not, spawn a mirrored version
										else{
											/*
											var _inst = instance_create_layer(x,y,"hitbox_layer",character_attack_projectile);
											with (_inst){
			
												image_xscale = -1;
												direction = 180;
											}
											*/
		
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
										//instance_create_layer(x,y,"hitbox_layer",character_attack_projectile);
	
									}
									// if not, spawn a mirrored version
									else{
										/*
										var _inst = instance_create_layer(x,y,"hitbox_layer",character_attack_projectile);
										with (_inst){
		
											image_xscale = -1;
											direction = 180;
										}
										*/
		
									}
									// reset timer
									character_attack_speed = character_attack_animation_duration;
							
					
								}
								else {
									// in between hits, stay ready
								
									// Work in progress area
									// Reposition if need be
									// Check if we are too far away from enemy on the right
									// If enemies are to our left, dont bother repositioning
									if (instance_exists(enemy_target)){
									
										if (x >= (_closest_enemy.x  - character_reach + ai_attack_distance_offset + ai_movement_margin_of_error_allowed) && x > global.player_king_x_location && x < (_closest_enemy.x  + character_reach  + ai_attack_distance_offset - ai_movement_margin_of_error_allowed) && instance_exists(enemy_target)){
											// Move away from enemy
											// Move to the left
											if (x >= obj_retreat_player_rally_object && in_attack_anim == false){
												sprite_index = character_run_anim;
												image_xscale = -1; // 1 = original, -1 = flipped on x-axis
												x -= character_running_speed;
											}
											else{
												sprite_index = character_ready_anim;
												image_xscale = 1; // 1 = original, -1 = flipped on x-axis
											}
									
										}
										else {
									
											sprite_index = character_ready_anim;
											image_xscale = 1; // 1 = original, -1 = flipped on x-axis
									
										}
									
									}
									else{
									
										sprite_index = character_ready_anim;
										image_xscale = 1; // 1 = original, -1 = flipped on x-axis
									
									}
						
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
										//instance_create_layer(x,y,"hitbox_layer",character_attack_projectile);
	
									}
									// if not, spawn a mirrored version
									else{
										/*
										var _inst = instance_create_layer(x,y,"hitbox_layer",character_attack_projectile);
										with (_inst){
			
											image_xscale = -1;
											direction = 180;
										}
										*/
		
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
										//instance_create_layer(x,y,"hitbox_layer",character_attack_projectile);

									}
									// if not, spawn a mirrored version
									else{
										/*
										var _inst = instance_create_layer(x,y,"hitbox_layer",character_attack_projectile);
										with (_inst){
		
											image_xscale = -1;
											direction = 180;
										}
										*/
		
									}
									// reset timer
									character_attack_speed = character_attack_animation_duration;
							
					
								}
								else {
									// in between hits, stay ready
									// Work in progress area
									// Reposition if need be
									// Check if we are too far away from enemy on the right
									// If enemies are to our left, dont bother repositioning
									if (instance_exists(enemy_target)){
									
										if (x >= (_closest_enemy.x  - character_reach + ai_attack_distance_offset + ai_movement_margin_of_error_allowed) && x > global.player_king_x_location && x < (_closest_enemy.x  + character_reach  + ai_attack_distance_offset - ai_movement_margin_of_error_allowed) && instance_exists(enemy_target)){
											// Move away from enemy
											// Move to the left
											if (x >= obj_retreat_player_rally_object && in_attack_anim == false){
												sprite_index = character_run_anim;
												image_xscale = -1; // 1 = original, -1 = flipped on x-axis
												x -= character_running_speed;
											}
											else{
												sprite_index = character_ready_anim;
												image_xscale = 1; // 1 = original, -1 = flipped on x-axis
											}
									
										}
										else {
									
											sprite_index = character_ready_anim;
											image_xscale = 1; // 1 = original, -1 = flipped on x-axis
									
										}
									
									}
									else{
									
										sprite_index = character_ready_anim;
										image_xscale = 1; // 1 = original, -1 = flipped on x-axis
									
									}
									
									
						
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
										//instance_create_layer(x,y,"hitbox_layer",character_attack_projectile);
	
									}
									// if not, spawn a mirrored version
									else{
										/*
										var _inst = instance_create_layer(x,y,"hitbox_layer",character_attack_projectile);
										with (_inst){
			
											image_xscale = -1;
											direction = 180;
										}
										*/
		
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
			else {
			// If we arent in the map, but are in attack orders, just run forward
				x = x + character_running_speed;
				sprite_index = character_run_anim;
				image_xscale = 1;
			}
		
		
		}
		// this is a catch all, if the AI doesnt know what to do, just idle
		else{
			// Idle Anim
			sprite_index = character_idle_anim;
			// since it is a player unit, we want it to face right
			image_xscale = 1; // 1 = original, -1 = flipped on x-axis
	
		}
	
	}
}


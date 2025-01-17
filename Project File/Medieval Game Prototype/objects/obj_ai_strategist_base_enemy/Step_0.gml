/// Decision making code:
// It will be split into 2 sections

// Section 1:
// This will dictate WHAT the AI will train.
// This will be based on player army composition.
// The ai will only be able to train unit types it is allowed from the create event.
// It will prefer to train the more powerful unit types whenever it can.

// Section 2:
// Will choose whether the ai will upgrade their economy
// This is determined by ai type.

// Section 3:
// This will dictate which order the AI will choose
// This is determined by ai type.

// We want to make sure that the AI knows to "save up" for an econ upgrade.
// So we will use a variable to toggle if the ai wants to do that or not

if (global.is_game_paused == true){
	// If the game is paused, halt

}
else {
	// Game is not paused, you may proceed.
	// Here is where we handle WHAT to spawn
	// We go through combat scenarios, then determine which we want to spawn
	// In order from most preferential, to least.
	// If the AI can afford it and its not on Cool down, they will go for it.
	
	if ((ai_eco_up_save == false) && (global.player_unit_count_enemy < global.player_unit_cap) && ai_king_health > 0.25){
		// ONLY spawn troops or attempt to when we are NOT saving up for eco upgrades.
		// If we are in here, we are NOT planning to eco upgrade.
		
		// So what troops do we spawn?
		// First determine the what units we
		// We are going to provide scenarios
		// Then determine an army composition we want to aim for
		// then spawn them in order 
		
		// we will decide to counter player army compositions
		// We will only spawn these in until we hit our ranged unit cap.
		// If the while these are training or money is unavailable, move onto the next most prioritized unit train
		// the priority will always be most expensive to least expensive, in the case of the game it would be
		// Halberdier, then knight, pikeman, then swordman.
		ai_choice = "AI wants to train a unit";
		
		// If the player is running enough swordman in their army to encourage
		// the ai to actively counter it
		if (p_sm_to_army_ratio >= cntr_p_army_sm_thres){
			// Okay so the player has more swordmen than our threshold (based off percentage)
			// Now is the player running a swordman only army composition or something else with it?
			// if no other unit type is being integrated to player army composition, just train unit army composition that counters
			// swordmen from most expensive to least expesnive
			
			// Section SM A
			// Swordmen and Archers and arbalests (Swordmen and ranged army composition)
			if (p_army_range_to_melee_ratio >= cntr_p_army_rg_thres){
				// Debug
				ai_choice = "AI wants to train an army that counters swordmen and range";
				// Now we determine if we have ranged units or not.
				// if we have any ranged units, we can go for a mixed army composition,
				// if not we only go for melee units
				// So we only have two army composition sets here:
				// one that incorporates ranged units, and one that only utilizes melee units.
				
				// Do we have access to ranged troops
				if (can_train_rg == true || can_train_ab == true || can_train_nc == true){
					// Debug
					ai_choice = "AI wants to counter swordmen and range, has access to ranged units";
					
					// Go for an army composition set by create event
					// if we are above the ranged army percent target, just train melee troops, if we arent
					// train ranged troops
					if (ai_ranged_army_percent < ai_ranged_army_perc_targ && (alarm[4] <= 0 || alarm[2] <= 0 || alarm[11] <= 0) && (can_train_rg == true || can_train_ab == true || can_train_nc == true)){
						// Train ranged units
						// Debug
						ai_choice = "Counter P. SM + Range, training range";
						
						// Train arbalest in highest priority
						// then train ranger in next highest priority
						// are we able to train an arbalest? if so, train one
						if (alarm[4] <= 0 && global.enemy_gold_amount >= global.unit_arbalest_cost && can_train_ab == true && global.player_unit_count_enemy < global.player_unit_cap){
							// alarm is at 0s, and we have the funds, and this unit is available.
							// Debug
							ai_choice = "Counter P. SM + Range, training arbalest";
							
							// Detract cost from ai pocket
							global.enemy_gold_amount -= global.unit_arbalest_cost;
							alarm_set(4,ai_ab_train_delay);
							// spawn
							instance_create_layer(enemy_spawn_location_x,enemy_spawn_location_y,"NPCs",obj_arbalest_enemy);
						
						}
						// are we able to train ranger?
						if (alarm[2] <= 0 && global.enemy_gold_amount >= global.unit_ranger_cost && can_train_rg == true && global.player_unit_count_enemy < global.player_unit_cap){
							// alarm is at 0s, and we have the funds, and this unit is available.
							// Debug
							ai_choice = "Counter P. SM + Range, training ranger";
							
							// Detract cost from ai pocket
							global.enemy_gold_amount -= global.unit_ranger_cost;
							alarm_set(2,ai_rg_train_delay);
							// spawn
							// replace with enemy ranger unit once that is completed.
							instance_create_layer(enemy_spawn_location_x,enemy_spawn_location_y,"NPCs",obj_ranger_enemy);
						
						}
						if (alarm[11] <= 0 && global.enemy_gold_amount >= global.unit_necromancer_cost && can_train_nc == true && global.player_unit_count_enemy < global.player_unit_cap){
							// alarm is at 0s, and we have the funds, and this unit is available.
							// Debug
							ai_choice = "Counter P. Range, training necromancer";
						
							// Detract cost from ai pocket
							global.enemy_gold_amount -= global.unit_necromancer_cost;
							alarm_set(11,ai_nc_train_delay);
							// spawn
							// replace with enemy ranger unit once that is completed.
							instance_create_layer(enemy_spawn_location_x,enemy_spawn_location_y,"NPCs",obj_necromancer_enemy);
							
						}
						
					}
					// If we do not have access to ANY melee units, just train ranged units without caring for range army % targets.
					else if ((alarm[4] <= 0 || alarm[2] <= 0 || alarm[11] <= 0) && (can_train_rg == true || can_train_ab == true || can_train_nc == true) && can_train_hb == false && can_train_kn == false && can_train_pm == false && can_train_sm == false){
						// Train ranged units
						// Debug
						ai_choice = "cntr. army. SM + Range. poss. training range";
					
						// Train arbalest in highest priority
						// then train ranger in next highest priority
						// are we able to train an arbalest? if so, train one
						if (alarm[4] <= 0 && global.enemy_gold_amount >= global.unit_arbalest_cost && can_train_ab == true && global.player_unit_count_enemy < global.player_unit_cap){
							// alarm is at 0s, and we have the funds, and this unit is available.
							// Debug
							ai_choice = "Counter P. SM + Range, training arbalest";
						
							// Detract cost from ai pocket
							global.enemy_gold_amount -= global.unit_arbalest_cost;
							alarm_set(4,ai_ab_train_delay);
							// spawn
							instance_create_layer(enemy_spawn_location_x,enemy_spawn_location_y,"NPCs",obj_arbalest_enemy);
						
						}
						// are we able to train ranger?
						if (alarm[2] <= 0 && global.enemy_gold_amount >= global.unit_ranger_cost && can_train_rg == true && global.player_unit_count_enemy < global.player_unit_cap){
							// alarm is at 0s, and we have the funds, and this unit is available.
							// Debug
							ai_choice = "Counter P. SM + Range, training ranger";
							
							// Detract cost from ai pocket
							global.enemy_gold_amount -= global.unit_ranger_cost;
							alarm_set(2,ai_rg_train_delay);
							// spawn
							// replace with enemy ranger unit once that is completed.
							instance_create_layer(enemy_spawn_location_x,enemy_spawn_location_y,"NPCs",obj_ranger_enemy);
						
						}
						if (alarm[11] <= 0 && global.enemy_gold_amount >= global.unit_necromancer_cost && can_train_nc == true && global.player_unit_count_enemy < global.player_unit_cap){
							// alarm is at 0s, and we have the funds, and this unit is available.
							// Debug
							ai_choice = "Counter P. Range, training necromancer";
						
							// Detract cost from ai pocket
							global.enemy_gold_amount -= global.unit_necromancer_cost;
							alarm_set(11,ai_nc_train_delay);
							// spawn
							// replace with enemy ranger unit once that is completed.
							instance_create_layer(enemy_spawn_location_x,enemy_spawn_location_y,"NPCs",obj_necromancer_enemy);
							
						}
					}
					else {
						// Train melee units
						// Debug
						ai_choice = "Counter P. SM + Range, training melee";
						
						// Train these units in upper most priority (most expensive to least expensive)
						// Halberd training
						if (alarm[5] <= 0 && global.enemy_gold_amount >= global.unit_halberd_cost && can_train_hb == true && global.player_unit_count_enemy < global.player_unit_cap){
							// alarm is at 0s, and we have the funds, and this unit is available.
							// Debug
							ai_choice = "Counter P. SM + Range, training halberdier";
							
							// Detract cost from ai pocket
							global.enemy_gold_amount -= global.unit_halberd_cost;
							alarm_set(5,ai_hb_train_delay);
							// spawn
							// replace with enemy ranger unit once that is completed.
							instance_create_layer(enemy_spawn_location_x,enemy_spawn_location_y,"NPCs",obj_halberdier_enemy);
						
						}
						// Knight training
						if (alarm[3] <= 0 && global.enemy_gold_amount >= global.unit_knight_cost && can_train_kn == true && global.player_unit_count_enemy < global.player_unit_cap){
							// alarm is at 0s, and we have the funds, and this unit is available.
							// Debug
							ai_choice = "Counter P. SM + Range, training knight";
							
							// Detract cost from ai pocket
							global.enemy_gold_amount -= global.unit_knight_cost;
							alarm_set(3,ai_kn_train_delay);
							// spawn
							// replace with enemy ranger unit once that is completed.
							instance_create_layer(enemy_spawn_location_x,enemy_spawn_location_y,"NPCs",obj_knight_enemy);
						
						}
						// pikeman training
						if (alarm[1] <= 0 && global.enemy_gold_amount >= global.unit_pikeman_cost && can_train_pm == true && global.player_unit_count_enemy < global.player_unit_cap){
							// alarm is at 0s, and we have the funds, and this unit is available.
							// Debug
							ai_choice = "Counter P. SM + Range, training pikeman";
							
							// Detract cost from ai pocket
							global.enemy_gold_amount -= global.unit_pikeman_cost;
							alarm_set(1,ai_pm_train_delay);
							// spawn
							// replace with enemy ranger unit once that is completed.
							instance_create_layer(enemy_spawn_location_x,enemy_spawn_location_y,"NPCs",obj_pikeman_enemy);
						
						}
						// swordman training
						if (alarm[0] <= 0 && global.enemy_gold_amount >= global.unit_swordman_cost && can_train_sm == true && global.player_unit_count_enemy < global.player_unit_cap){
							// alarm is at 0s, and we have the funds, and this unit is available.
							// Debug
							ai_choice = "Counter P. SM + Range, training swordman";
							
							// Detract cost from ai pocket
							global.enemy_gold_amount -= global.unit_swordman_cost;
							alarm_set(0,ai_sm_train_delay);
							// spawn
							// replace with enemy ranger unit once that is completed.
							instance_create_layer(enemy_spawn_location_x,enemy_spawn_location_y,"NPCs",obj_swordman_enemy);
						
						}
						
						
					}
				
				}
				// If we dont:
				else {
					// Debug
					ai_choice = "AI wants to counter swordmen and range, NO access to ranged units";
					// Train these units in upper most priority (most expensive to least expensive)
					if (alarm[10] <= 0 && global.enemy_gold_amount >= global.unit_magician_cost && can_train_mg == true && global.player_unit_count_enemy < global.player_unit_cap){
						// alarm is at 0s, and we have the funds, and this unit is available.
						// Debug
						ai_choice = "Counter P. SM + Range, training magician";
						
						// Detract cost from ai pocket
						global.enemy_gold_amount -= global.unit_magician_cost;
						alarm_set(10,ai_mg_train_delay);
						// spawn
						// replace with enemy ranger unit once that is completed.
						instance_create_layer(enemy_spawn_location_x,enemy_spawn_location_y,"NPCs",obj_magician_enemy);
						
					}
					// Halberd training
					if (alarm[5] <= 0 && global.enemy_gold_amount >= global.unit_halberd_cost && can_train_hb == true && global.player_unit_count_enemy < global.player_unit_cap){
						// alarm is at 0s, and we have the funds, and this unit is available.
						// Debug
						ai_choice = "Counter P. SM + Range, training halberdier";
							
						// Detract cost from ai pocket
						global.enemy_gold_amount -= global.unit_halberd_cost;
						alarm_set(5,ai_hb_train_delay);
						// spawn
						// replace with enemy ranger unit once that is completed.
						instance_create_layer(enemy_spawn_location_x,enemy_spawn_location_y,"NPCs",obj_halberdier_enemy);
						
					}
					// Knight training
					if (alarm[3] <= 0 && global.enemy_gold_amount >= global.unit_knight_cost && can_train_kn == true && global.player_unit_count_enemy < global.player_unit_cap){
						// alarm is at 0s, and we have the funds, and this unit is available.
						// Debug
						ai_choice = "Counter P. SM + Range, training knight";
							
						// Detract cost from ai pocket
						global.enemy_gold_amount -= global.unit_knight_cost;
						alarm_set(3,ai_kn_train_delay);
						// spawn
						// replace with enemy ranger unit once that is completed.
						instance_create_layer(enemy_spawn_location_x,enemy_spawn_location_y,"NPCs",obj_knight_enemy);
						
					}
					// pikeman training
					if (alarm[1] <= 0 && global.enemy_gold_amount >= global.unit_pikeman_cost && can_train_pm == true && global.player_unit_count_enemy < global.player_unit_cap){
						// alarm is at 0s, and we have the funds, and this unit is available.
						// Debug
						ai_choice = "Counter P. SM + Range, training pikeman";
							
						// Detract cost from ai pocket
						global.enemy_gold_amount -= global.unit_pikeman_cost;
						alarm_set(1,ai_pm_train_delay);
						// spawn
						// replace with enemy ranger unit once that is completed.
						instance_create_layer(enemy_spawn_location_x,enemy_spawn_location_y,"NPCs",obj_pikeman_enemy);
						
					}
					// swordman training
					if (alarm[0] <= 0 && global.enemy_gold_amount >= global.unit_swordman_cost && can_train_sm == true && global.player_unit_count_enemy < global.player_unit_cap){
						// alarm is at 0s, and we have the funds, and this unit is available.
						// Debug
						ai_choice = "Counter P. SM + Range, training swordman";
						
						// Detract cost from ai pocket
						global.enemy_gold_amount -= global.unit_swordman_cost;
						alarm_set(0,ai_sm_train_delay);
						// spawn
						// replace with enemy ranger unit once that is completed.
						instance_create_layer(enemy_spawn_location_x,enemy_spawn_location_y,"NPCs",obj_swordman_enemy);
						
					}
						
				
				}
				
				
			
			}
			else{
				// Debug
				ai_choice = "AI wants to train an army that counters swordmen";
				
				// Do we have access to ranged troops
				if (can_train_rg == true || can_train_ab == true || can_train_mg == true){
					// Debug
					ai_choice = "AI wants to counter swordmen, has access to ranged units";
					
					// Go for an army composition set by create event
					// if we are above the ranged army percent target, just train melee troops, if we arent
					// train ranged troops
					if (ai_ranged_army_percent < ai_ranged_army_perc_targ && (alarm[4] <= 0 || alarm[2] <= 0 || alarm[10] <= 0)){
						// Train ranged units
						// Debug
						ai_choice = "Counter P. SM, training range";
						
						// Train arbalest in highest priority
						// then train ranger in next highest priority
						// are we able to train an arbalest? if so, train one
						if (alarm[4] <= 0 && global.enemy_gold_amount >= global.unit_arbalest_cost && can_train_ab == true && global.player_unit_count_enemy < global.player_unit_cap){
							// alarm is at 0s, and we have the funds, and this unit is available.
							// Debug
							ai_choice = "Counter P. SM, training arbalest";
							
							// Detract cost from ai pocket
							global.enemy_gold_amount -= global.unit_arbalest_cost;
							alarm_set(4,ai_ab_train_delay);
							// spawn
							instance_create_layer(enemy_spawn_location_x,enemy_spawn_location_y,"NPCs",obj_arbalest_enemy);
						
						}
						// are we able to train ranger?
						if (alarm[2] <= 0 && global.enemy_gold_amount >= global.unit_ranger_cost && can_train_rg == true && global.player_unit_count_enemy < global.player_unit_cap){
							// alarm is at 0s, and we have the funds, and this unit is available.
							// Debug
							ai_choice = "Counter P. SM, training ranger";
							
							// Detract cost from ai pocket
							global.enemy_gold_amount -= global.unit_ranger_cost;
							alarm_set(2,ai_rg_train_delay);
							// spawn
							// replace with enemy ranger unit once that is completed.
							instance_create_layer(enemy_spawn_location_x,enemy_spawn_location_y,"NPCs",obj_ranger_enemy);
						
						}
						// Magician training
						if (alarm[10] <= 0 && global.enemy_gold_amount >= global.unit_magician_cost && can_train_mg == true && global.player_unit_count_enemy < global.player_unit_cap){
							// alarm is at 0s, and we have the funds, and this unit is available.
							// Debug
							ai_choice = "Counter P. SM, training magician";
						
							// Detract cost from ai pocket
							global.enemy_gold_amount -= global.unit_magician_cost;
							alarm_set(10,ai_mg_train_delay);
							// spawn
							// replace with enemy ranger unit once that is completed.
							instance_create_layer(enemy_spawn_location_x,enemy_spawn_location_y,"NPCs",obj_magician_enemy);
						
						}
						
					}
					// If we do not have access to ANY melee units, just train ranged units without caring for range army % targets.
					else if ((alarm[4] <= 0 || alarm[2] <= 0 || alarm[10] <= 0) && (can_train_rg == true || can_train_ab == true || can_train_mg == true) && can_train_hb == false && can_train_kn == false && can_train_pm == false && can_train_sm == false){
						// Train ranged units
						// Debug
						ai_choice = "Counter P. SM. training range";
					
						// Train arbalest in highest priority
						// then train ranger in next highest priority
						// are we able to train an arbalest? if so, train one
						if (alarm[4] <= 0 && global.enemy_gold_amount >= global.unit_arbalest_cost && can_train_ab == true && global.player_unit_count_enemy < global.player_unit_cap){
							// alarm is at 0s, and we have the funds, and this unit is available.
							// Debug
							ai_choice = "Counter P. SM + Range, training arbalest";
						
							// Detract cost from ai pocket
							global.enemy_gold_amount -= global.unit_arbalest_cost;
							alarm_set(4,ai_ab_train_delay);
							// spawn
							instance_create_layer(enemy_spawn_location_x,enemy_spawn_location_y,"NPCs",obj_arbalest_enemy);
						
						}
						// are we able to train ranger?
						if (alarm[2] <= 0 && global.enemy_gold_amount >= global.unit_ranger_cost && can_train_rg == true && global.player_unit_count_enemy < global.player_unit_cap){
							// alarm is at 0s, and we have the funds, and this unit is available.
							// Debug
							ai_choice = "Counter P. SM + Range, training ranger";
							
							// Detract cost from ai pocket
							global.enemy_gold_amount -= global.unit_ranger_cost;
							alarm_set(2,ai_rg_train_delay);
							// spawn
							// replace with enemy ranger unit once that is completed.
							instance_create_layer(enemy_spawn_location_x,enemy_spawn_location_y,"NPCs",obj_ranger_enemy);
						
						}
						// Magician training
						if (alarm[10] <= 0 && global.enemy_gold_amount >= global.unit_magician_cost && can_train_mg == true && global.player_unit_count_enemy < global.player_unit_cap){
							// alarm is at 0s, and we have the funds, and this unit is available.
							// Debug
							ai_choice = "Counter P. SM + Range, training magician";
						
							// Detract cost from ai pocket
							global.enemy_gold_amount -= global.unit_magician_cost;
							alarm_set(10,ai_mg_train_delay);
							// spawn
							// replace with enemy ranger unit once that is completed.
							instance_create_layer(enemy_spawn_location_x,enemy_spawn_location_y,"NPCs",obj_magician_enemy);
						
						}
					}
					else {
						// Train melee units
						// Debug
						ai_choice = "Counter P. SM, training melee";
						
						// Train these units in upper most priority (most expensive to least expensive)
						// Halberd training
						if (alarm[5] <= 0 && global.enemy_gold_amount >= global.unit_halberd_cost && can_train_hb == true && global.player_unit_count_enemy < global.player_unit_cap){
							// alarm is at 0s, and we have the funds, and this unit is available.
							// Debug
							ai_choice = "Counter P. SM, training halberdier";
							
							// Detract cost from ai pocket
							global.enemy_gold_amount -= global.unit_halberd_cost;
							alarm_set(5,ai_hb_train_delay);
							// spawn
							// replace with enemy ranger unit once that is completed.
							instance_create_layer(enemy_spawn_location_x,enemy_spawn_location_y,"NPCs",obj_halberdier_enemy);
						
						}
						// Knight training
						if (alarm[3] <= 0 && global.enemy_gold_amount >= global.unit_knight_cost && can_train_kn == true && global.player_unit_count_enemy < global.player_unit_cap){
							// alarm is at 0s, and we have the funds, and this unit is available.
							// Debug
							ai_choice = "Counter P. SM, training knight";
							
							// Detract cost from ai pocket
							global.enemy_gold_amount -= global.unit_knight_cost;
							alarm_set(3,ai_kn_train_delay);
							// spawn
							// replace with enemy ranger unit once that is completed.
							instance_create_layer(enemy_spawn_location_x,enemy_spawn_location_y,"NPCs",obj_knight_enemy);
						
						}
						// pikeman training
						if (alarm[1] <= 0 && global.enemy_gold_amount >= global.unit_pikeman_cost && can_train_pm == true && global.player_unit_count_enemy < global.player_unit_cap){
							// alarm is at 0s, and we have the funds, and this unit is available.
							// Debug
							ai_choice = "Counter P. SM, training pikeman";
							
							// Detract cost from ai pocket
							global.enemy_gold_amount -= global.unit_pikeman_cost;
							alarm_set(1,ai_pm_train_delay);
							// spawn
							// replace with enemy ranger unit once that is completed.
							instance_create_layer(enemy_spawn_location_x,enemy_spawn_location_y,"NPCs",obj_pikeman_enemy);
						
						}
						// swordman training
						if (alarm[0] <= 0 && global.enemy_gold_amount >= global.unit_swordman_cost && can_train_sm == true && global.player_unit_count_enemy < global.player_unit_cap){
							// alarm is at 0s, and we have the funds, and this unit is available.
							// Debug
							ai_choice = "Counter P. SM, training swordman";
							
							// Detract cost from ai pocket
							global.enemy_gold_amount -= global.unit_swordman_cost;
							alarm_set(0,ai_sm_train_delay);
							// spawn
							// replace with enemy ranger unit once that is completed.
							instance_create_layer(enemy_spawn_location_x,enemy_spawn_location_y,"NPCs",obj_swordman_enemy);
						
						}
						
						
					}
				
				}
				// If we dont:
				else {
					// Debug
					ai_choice = "AI wants to counter swordmen, NO access to ranged units";
					// Train these units in upper most priority (most expensive to least expensive)
					// Magician training
					if (alarm[10] <= 0 && global.enemy_gold_amount >= global.unit_magician_cost && can_train_mg == true && global.player_unit_count_enemy < global.player_unit_cap){
						// alarm is at 0s, and we have the funds, and this unit is available.
						// Debug
						ai_choice = "Counter P. SM + Range, training magician";
						
						// Detract cost from ai pocket
						global.enemy_gold_amount -= global.unit_magician_cost;
						alarm_set(10,ai_mg_train_delay);
						// spawn
						// replace with enemy ranger unit once that is completed.
						instance_create_layer(enemy_spawn_location_x,enemy_spawn_location_y,"NPCs",obj_magician_enemy);
						
					}
					// Halberd training
					if (alarm[5] <= 0 && global.enemy_gold_amount >= global.unit_halberd_cost && can_train_hb == true && global.player_unit_count_enemy < global.player_unit_cap){
						// alarm is at 0s, and we have the funds, and this unit is available.
						// Debug
						ai_choice = "Counter P. SM, training halberdier";
							
						// Detract cost from ai pocket
						global.enemy_gold_amount -= global.unit_halberd_cost;
						alarm_set(5,ai_hb_train_delay);
						// spawn
						// replace with enemy ranger unit once that is completed.
						instance_create_layer(enemy_spawn_location_x,enemy_spawn_location_y,"NPCs",obj_halberdier_enemy);
						
					}
					// Knight training
					if (alarm[3] <= 0 && global.enemy_gold_amount >= global.unit_knight_cost && can_train_kn == true && global.player_unit_count_enemy < global.player_unit_cap){
						// alarm is at 0s, and we have the funds, and this unit is available.
						// Debug
						ai_choice = "Counter P. SM, training knight";
							
						// Detract cost from ai pocket
						global.enemy_gold_amount -= global.unit_knight_cost;
						alarm_set(3,ai_kn_train_delay);
						// spawn
						// replace with enemy ranger unit once that is completed.
						instance_create_layer(enemy_spawn_location_x,enemy_spawn_location_y,"NPCs",obj_knight_enemy);
						
					}
					// pikeman training
					if (alarm[1] <= 0 && global.enemy_gold_amount >= global.unit_pikeman_cost && can_train_pm == true && global.player_unit_count_enemy < global.player_unit_cap){
						// alarm is at 0s, and we have the funds, and this unit is available.
						// Debug
						ai_choice = "Counter P. SM, training pikeman";
							
						// Detract cost from ai pocket
						global.enemy_gold_amount -= global.unit_pikeman_cost;
						alarm_set(1,ai_pm_train_delay);
						// spawn
						// replace with enemy ranger unit once that is completed.
						instance_create_layer(enemy_spawn_location_x,enemy_spawn_location_y,"NPCs",obj_pikeman_enemy);
						
					}
					// swordman training
					if (alarm[0] <= 0 && global.enemy_gold_amount >= global.unit_swordman_cost && can_train_sm == true && global.player_unit_count_enemy < global.player_unit_cap){
						// alarm is at 0s, and we have the funds, and this unit is available.
						// Debug
						ai_choice = "Counter P. SM, training swordman";
						
						// Detract cost from ai pocket
						global.enemy_gold_amount -= global.unit_swordman_cost;
						alarm_set(0,ai_sm_train_delay);
						// spawn
						// replace with enemy ranger unit once that is completed.
						instance_create_layer(enemy_spawn_location_x,enemy_spawn_location_y,"NPCs",obj_swordman_enemy);
						
					}
						
				
				}
			
			}
			
		}
		// What if the player is running a pikeman heavy army composition?
		else if (p_pm_to_army_ratio >= cntr_p_army_pm_thres){
			// Debug
			ai_choice = "AI wants to counter pikeman";
				
			if ((can_train_pm == true || can_train_hb == true) && (can_train_ab == true || can_train_rg == true)){
				// We do
				// Make sure we dont train too many ranged units, so that we have a front line
				// Debug
				ai_choice = "cntr. army. PM. Is possible";
					
				if (ai_ranged_army_percent < ai_ranged_army_perc_targ && (alarm[4] <= 0 || alarm[2] <= 0 || alarm[10] <= 0)){
						// Train ranged units
						// Debug
						ai_choice = "def. army. 1. training range";
						
						// Train arbalest in highest priority
						// then train ranger in next highest priority
						// are we able to train an arbalest? if so, train one
						if (alarm[4] <= 0 && global.enemy_gold_amount >= global.unit_arbalest_cost && can_train_ab == true && global.player_unit_count_enemy < global.player_unit_cap){
							// alarm is at 0s, and we have the funds, and this unit is available.
							// Debug
							ai_choice = "Counter P. SM + Range, training arbalest";
							
							// Detract cost from ai pocket
							global.enemy_gold_amount -= global.unit_arbalest_cost;
							alarm_set(4,ai_ab_train_delay);
							// spawn
							instance_create_layer(enemy_spawn_location_x,enemy_spawn_location_y,"NPCs",obj_arbalest_enemy);
						
						}
						// are we able to train ranger?
						if (alarm[2] <= 0 && global.enemy_gold_amount >= global.unit_ranger_cost && can_train_rg == true && global.player_unit_count_enemy < global.player_unit_cap){
							// alarm is at 0s, and we have the funds, and this unit is available.
							// Debug
							ai_choice = "Counter P. SM + Range, training ranger";
							
							// Detract cost from ai pocket
							global.enemy_gold_amount -= global.unit_ranger_cost;
							alarm_set(2,ai_rg_train_delay);
							// spawn
							// replace with enemy ranger unit once that is completed.
							instance_create_layer(enemy_spawn_location_x,enemy_spawn_location_y,"NPCs",obj_ranger_enemy);
						
						}
					}
				// We can train melee units
				else {
					// Debug
					ai_choice = "def. army. 1. training melee";
						
					// Halberd training
					if (alarm[5] <= 0 && global.enemy_gold_amount >= global.unit_halberd_cost && can_train_hb == true && global.player_unit_count_enemy < global.player_unit_cap){
							// alarm is at 0s, and we have the funds, and this unit is available.
							// Debug
							ai_choice = "Counter P. SM, training halberdier";
							
							// Detract cost from ai pocket
							global.enemy_gold_amount -= global.unit_halberd_cost;
							alarm_set(5,ai_hb_train_delay);
							// spawn
							// replace with enemy ranger unit once that is completed.
							instance_create_layer(enemy_spawn_location_x,enemy_spawn_location_y,"NPCs",obj_halberdier_enemy);
						
						}
					// pikeman training
					if (alarm[1] <= 0 && global.enemy_gold_amount >= global.unit_pikeman_cost && can_train_pm == true && global.player_unit_count_enemy < global.player_unit_cap){
							// alarm is at 0s, and we have the funds, and this unit is available.
							// Debug
							ai_choice = "Counter P. SM, training pikeman";
							
							// Detract cost from ai pocket
							global.enemy_gold_amount -= global.unit_pikeman_cost;
							alarm_set(1,ai_pm_train_delay);
							// spawn
							// replace with enemy ranger unit once that is completed.
							instance_create_layer(enemy_spawn_location_x,enemy_spawn_location_y,"NPCs",obj_pikeman_enemy);
						
						}
					
				}
				
			}
			else {
				// We do NOT
				// Just train anything you have available
				ai_choice = "cntr. army. PM. not poss. Use Assorted Army";
					
				if ((ai_ranged_army_percent < ai_ranged_army_perc_targ) && (alarm[4] <= 0 || alarm[2] <= 0 || alarm[10] <= 0 || alarm[11] <= 0) && (can_train_rg == true || can_train_ab == true || can_train_mg == true || can_train_nc == true) 
					&& (can_train_hb == true || can_train_kn == true || can_train_pm == true || can_train_sm == true)){
					// Train ranged units
					// Debug
					ai_choice = "cntr. army. PM. not poss. training range";
						
					// Train arbalest in highest priority
					// then train ranger in next highest priority
					// are we able to train an arbalest? if so, train one
					if (alarm[4] <= 0 && global.enemy_gold_amount >= global.unit_arbalest_cost && can_train_ab == true && global.player_unit_count_enemy < global.player_unit_cap){
							// alarm is at 0s, and we have the funds, and this unit is available.
							// Debug
							ai_choice = "Counter P. SM + Range, training arbalest";
							
							// Detract cost from ai pocket
							global.enemy_gold_amount -= global.unit_arbalest_cost;
							alarm_set(4,ai_ab_train_delay);
							// spawn
							instance_create_layer(enemy_spawn_location_x,enemy_spawn_location_y,"NPCs",obj_arbalest_enemy);
						
						}
					// are we able to train ranger?
					if (alarm[2] <= 0 && global.enemy_gold_amount >= global.unit_ranger_cost && can_train_rg == true && global.player_unit_count_enemy < global.player_unit_cap){
							// alarm is at 0s, and we have the funds, and this unit is available.
							// Debug
							ai_choice = "Counter P. SM + Range, training ranger";
							
							// Detract cost from ai pocket
							global.enemy_gold_amount -= global.unit_ranger_cost;
							alarm_set(2,ai_rg_train_delay);
							// spawn
							// replace with enemy ranger unit once that is completed.
							instance_create_layer(enemy_spawn_location_x,enemy_spawn_location_y,"NPCs",obj_ranger_enemy);
						
						}
					if (alarm[10] <= 0 && global.enemy_gold_amount >= global.unit_magician_cost && can_train_mg == true && global.player_unit_count_enemy < global.player_unit_cap){
						// alarm is at 0s, and we have the funds, and this unit is available.
						// Debug
						ai_choice = "Counter P. SM, training magician";
						
						// Detract cost from ai pocket
						global.enemy_gold_amount -= global.unit_magician_cost;
						alarm_set(10,ai_mg_train_delay);
						// spawn
						// replace with enemy ranger unit once that is completed.
						instance_create_layer(enemy_spawn_location_x,enemy_spawn_location_y,"NPCs",obj_magician_enemy);
						
					}
					if (alarm[11] <= 0 && global.enemy_gold_amount >= global.unit_necromancer_cost && can_train_nc == true && global.player_unit_count_enemy < global.player_unit_cap){
						// alarm is at 0s, and we have the funds, and this unit is available.
						// Debug
						ai_choice = "Counter P. Range, training necromancer";
						
						// Detract cost from ai pocket
						global.enemy_gold_amount -= global.unit_necromancer_cost;
						alarm_set(11,ai_nc_train_delay);
						// spawn
						// replace with enemy ranger unit once that is completed.
						instance_create_layer(enemy_spawn_location_x,enemy_spawn_location_y,"NPCs",obj_necromancer_enemy);
						
					}
				}
				// If we do not have access to ANY melee units, just train ranged units without caring for range army % targets.
				else if ((alarm[4] <= 0 || alarm[2] <= 0 || alarm[10] <= 0) && (can_train_rg == true || can_train_ab == true || can_train_mg == true) && can_train_hb == false && can_train_kn == false && can_train_pm == false && can_train_sm == false){
					// Train ranged units
					// Debug
					ai_choice = "cntr. army. Range. not poss. training range";
					
					// Train arbalest in highest priority
					// then train ranger in next highest priority
					// are we able to train an arbalest? if so, train one
					if (alarm[4] <= 0 && global.enemy_gold_amount >= global.unit_arbalest_cost && can_train_ab == true && global.player_unit_count_enemy < global.player_unit_cap){
						// alarm is at 0s, and we have the funds, and this unit is available.
						// Debug
						ai_choice = "Counter P. SM + Range, training arbalest";
						
						// Detract cost from ai pocket
						global.enemy_gold_amount -= global.unit_arbalest_cost;
						alarm_set(4,ai_ab_train_delay);
						// spawn
						instance_create_layer(enemy_spawn_location_x,enemy_spawn_location_y,"NPCs",obj_arbalest_enemy);
						
					}
					// are we able to train ranger?
					if (alarm[2] <= 0 && global.enemy_gold_amount >= global.unit_ranger_cost && can_train_rg == true && global.player_unit_count_enemy < global.player_unit_cap){
						// alarm is at 0s, and we have the funds, and this unit is available.
						// Debug
						ai_choice = "Counter P. SM + Range, training ranger";
							
						// Detract cost from ai pocket
						global.enemy_gold_amount -= global.unit_ranger_cost;
						alarm_set(2,ai_rg_train_delay);
						// spawn
						// replace with enemy ranger unit once that is completed.
						instance_create_layer(enemy_spawn_location_x,enemy_spawn_location_y,"NPCs",obj_ranger_enemy);
						
					}
					if (alarm[10] <= 0 && global.enemy_gold_amount >= global.unit_magician_cost && can_train_mg == true && global.player_unit_count_enemy < global.player_unit_cap){
						// alarm is at 0s, and we have the funds, and this unit is available.
						// Debug
						ai_choice = "Counter P. SM, training magician";
						
						// Detract cost from ai pocket
						global.enemy_gold_amount -= global.unit_magician_cost;
						alarm_set(10,ai_mg_train_delay);
						// spawn
						// replace with enemy ranger unit once that is completed.
						instance_create_layer(enemy_spawn_location_x,enemy_spawn_location_y,"NPCs",obj_magician_enemy);
						
					}
				}
				// We can train melee units
				else {
						// Debug
						ai_choice = "cntr. army. PM. not poss. training melee";
						
						// Train these units in upper most priority (most expensive to least expensive)
						// Halberd training
						if (alarm[5] <= 0 && global.enemy_gold_amount >= global.unit_halberd_cost && can_train_hb == true && global.player_unit_count_enemy < global.player_unit_cap){
							// alarm is at 0s, and we have the funds, and this unit is available.
							// Debug
							ai_choice = "Counter P. SM, training halberdier";
							
							// Detract cost from ai pocket
							global.enemy_gold_amount -= global.unit_halberd_cost;
							alarm_set(5,ai_hb_train_delay);
							// spawn
							// replace with enemy ranger unit once that is completed.
							instance_create_layer(enemy_spawn_location_x,enemy_spawn_location_y,"NPCs",obj_halberdier_enemy);
						
						}
						// Knight training
						if (alarm[3] <= 0 && global.enemy_gold_amount >= global.unit_knight_cost && can_train_kn == true && global.player_unit_count_enemy < global.player_unit_cap){
							// alarm is at 0s, and we have the funds, and this unit is available.
							// Debug
							ai_choice = "Counter P. SM, training knight";
							
							// Detract cost from ai pocket
							global.enemy_gold_amount -= global.unit_knight_cost;
							alarm_set(3,ai_kn_train_delay);
							// spawn
							// replace with enemy ranger unit once that is completed.
							instance_create_layer(enemy_spawn_location_x,enemy_spawn_location_y,"NPCs",obj_knight_enemy);
						
						}
						// pikeman training
						if (alarm[1] <= 0 && global.enemy_gold_amount >= global.unit_pikeman_cost && can_train_pm == true && global.player_unit_count_enemy < global.player_unit_cap){
							// alarm is at 0s, and we have the funds, and this unit is available.
							// Debug
							ai_choice = "Counter P. SM, training pikeman";
							
							// Detract cost from ai pocket
							global.enemy_gold_amount -= global.unit_pikeman_cost;
							alarm_set(1,ai_pm_train_delay);
							// spawn
							// replace with enemy ranger unit once that is completed.
							instance_create_layer(enemy_spawn_location_x,enemy_spawn_location_y,"NPCs",obj_pikeman_enemy);
						
						}
						// swordman training
						if (alarm[0] <= 0 && global.enemy_gold_amount >= global.unit_swordman_cost && can_train_sm == true && global.player_unit_count_enemy < global.player_unit_cap){
							// alarm is at 0s, and we have the funds, and this unit is available.
							// Debug
							ai_choice = "Counter P. SM, training swordman";
						
							// Detract cost from ai pocket
							global.enemy_gold_amount -= global.unit_swordman_cost;
							alarm_set(0,ai_sm_train_delay);
							// spawn
							// replace with enemy ranger unit once that is completed.
							instance_create_layer(enemy_spawn_location_x,enemy_spawn_location_y,"NPCs",obj_swordman_enemy);
						
						}
					
				}
				
			}
		
		
		}
		// What if the player is running a knight heavy army composition?
		else if (p_kn_to_army_ratio >= cntr_p_army_kn_thres){
			// Debug
			ai_choice = "AI wants to counter knights";
			
			if ((can_train_hb == true || can_train_pm == true || can_train_mg == true)){
			// We do
			// Make sure we dont train too many ranged units, so that we have a front line
			// Debug
			ai_choice = "cntr. army. KN. possible";
			
			// Halberd training
			if (alarm[5] <= 0 && global.enemy_gold_amount >= global.unit_halberd_cost && can_train_hb == true && global.player_unit_count_enemy < global.player_unit_cap){
							// alarm is at 0s, and we have the funds, and this unit is available.
							// Debug
							ai_choice = "Counter P. SM, training halberdier";
							
							// Detract cost from ai pocket
							global.enemy_gold_amount -= global.unit_halberd_cost;
							alarm_set(5,ai_hb_train_delay);
							// spawn
							// replace with enemy ranger unit once that is completed.
							instance_create_layer(enemy_spawn_location_x,enemy_spawn_location_y,"NPCs",obj_halberdier_enemy);
						
						}
			// pikeman training
			if (alarm[1] <= 0 && global.enemy_gold_amount >= global.unit_pikeman_cost && can_train_pm == true && global.player_unit_count_enemy < global.player_unit_cap){
							// alarm is at 0s, and we have the funds, and this unit is available.
							// Debug
							ai_choice = "Counter P. SM, training pikeman";
							
							// Detract cost from ai pocket
							global.enemy_gold_amount -= global.unit_pikeman_cost;
							alarm_set(1,ai_pm_train_delay);
							// spawn
							// replace with enemy ranger unit once that is completed.
							instance_create_layer(enemy_spawn_location_x,enemy_spawn_location_y,"NPCs",obj_pikeman_enemy);
						
						}
			if (alarm[10] <= 0 && global.enemy_gold_amount >= global.unit_magician_cost && can_train_mg == true && global.player_unit_count_enemy < global.player_unit_cap){
				// alarm is at 0s, and we have the funds, and this unit is available.
				// Debug
				ai_choice = "Counter P. SM, training magician";
						
				// Detract cost from ai pocket
				global.enemy_gold_amount -= global.unit_magician_cost;
				alarm_set(10,ai_mg_train_delay);
				// spawn
				// replace with enemy ranger unit once that is completed.
				instance_create_layer(enemy_spawn_location_x,enemy_spawn_location_y,"NPCs",obj_magician_enemy);
						
			}
						
				
				
			}
			else {
				// We do NOT
				// Just train anything you have available
				ai_choice = "cntr. army. KN. not poss. Use Assorted Army";
					
				if ((ai_ranged_army_percent < ai_ranged_army_perc_targ) && (alarm[4] <= 0 || alarm[2] <= 0 || alarm[10] <= 0) && (can_train_rg == true || can_train_ab == true) 
					&& (can_train_hb == true || can_train_kn == true || can_train_pm == true || can_train_sm == true)){
						// Train ranged units
						// Debug
						ai_choice = "cntr. army. KN. not poss. training range";
						
						// Train arbalest in highest priority
						// then train ranger in next highest priority
						// are we able to train an arbalest? if so, train one
						if (alarm[4] <= 0 && global.enemy_gold_amount >= global.unit_arbalest_cost && can_train_ab == true && global.player_unit_count_enemy < global.player_unit_cap){
							// alarm is at 0s, and we have the funds, and this unit is available.
							// Debug
							ai_choice = "Counter P. SM + Range, training arbalest";
							
							// Detract cost from ai pocket
							global.enemy_gold_amount -= global.unit_arbalest_cost;
							alarm_set(4,ai_ab_train_delay);
							// spawn
							instance_create_layer(enemy_spawn_location_x,enemy_spawn_location_y,"NPCs",obj_arbalest_enemy);
						
						}
						// are we able to train ranger?
						if (alarm[2] <= 0 && global.enemy_gold_amount >= global.unit_ranger_cost && can_train_rg == true && global.player_unit_count_enemy < global.player_unit_cap){
							// alarm is at 0s, and we have the funds, and this unit is available.
							// Debug
							ai_choice = "Counter P. SM + Range, training ranger";
							
							// Detract cost from ai pocket
							global.enemy_gold_amount -= global.unit_ranger_cost;
							alarm_set(2,ai_rg_train_delay);
							// spawn
							// replace with enemy ranger unit once that is completed.
							instance_create_layer(enemy_spawn_location_x,enemy_spawn_location_y,"NPCs",obj_ranger_enemy);
						
						}
					}
				// If we do not have access to ANY melee units, just train ranged units without caring for range army % targets.
				else if ((alarm[4] <= 0 || alarm[2] <= 0 || alarm[10] <= 0 || alarm[11] <= 0) && (can_train_rg == true || can_train_ab == true || can_train_mg == true || can_train_nc == true) && can_train_hb == false && can_train_kn == false && can_train_pm == false && can_train_sm == false){
					// Train ranged units
					// Debug
					ai_choice = "cntr. army. Range. not poss. training range";
					
					// Train arbalest in highest priority
					// then train ranger in next highest priority
					// are we able to train an arbalest? if so, train one
					if (alarm[4] <= 0 && global.enemy_gold_amount >= global.unit_arbalest_cost && can_train_ab == true && global.player_unit_count_enemy < global.player_unit_cap){
						// alarm is at 0s, and we have the funds, and this unit is available.
						// Debug
						ai_choice = "Counter P. SM + Range, training arbalest";
						
						// Detract cost from ai pocket
						global.enemy_gold_amount -= global.unit_arbalest_cost;
						alarm_set(4,ai_ab_train_delay);
						// spawn
						instance_create_layer(enemy_spawn_location_x,enemy_spawn_location_y,"NPCs",obj_arbalest_enemy);
						
					}
					// are we able to train ranger?
					if (alarm[2] <= 0 && global.enemy_gold_amount >= global.unit_ranger_cost && can_train_rg == true && global.player_unit_count_enemy < global.player_unit_cap){
						// alarm is at 0s, and we have the funds, and this unit is available.
						// Debug
						ai_choice = "Counter P. SM + Range, training ranger";
							
						// Detract cost from ai pocket
						global.enemy_gold_amount -= global.unit_ranger_cost;
						alarm_set(2,ai_rg_train_delay);
						// spawn
						// replace with enemy ranger unit once that is completed.
						instance_create_layer(enemy_spawn_location_x,enemy_spawn_location_y,"NPCs",obj_ranger_enemy);
						
					}
					if (alarm[10] <= 0 && global.enemy_gold_amount >= global.unit_magician_cost && can_train_mg == true && global.player_unit_count_enemy < global.player_unit_cap){
						// alarm is at 0s, and we have the funds, and this unit is available.
						// Debug
						ai_choice = "Counter P. SM, training magician";
						
						// Detract cost from ai pocket
						global.enemy_gold_amount -= global.unit_magician_cost;
						alarm_set(10,ai_mg_train_delay);
						// spawn
						// replace with enemy ranger unit once that is completed.
						instance_create_layer(enemy_spawn_location_x,enemy_spawn_location_y,"NPCs",obj_magician_enemy);
						
					}
					if (alarm[11] <= 0 && global.enemy_gold_amount >= global.unit_necromancer_cost && can_train_nc == true && global.player_unit_count_enemy < global.player_unit_cap){
						// alarm is at 0s, and we have the funds, and this unit is available.
						// Debug
						ai_choice = "Counter P. Range, training necromancer";
						
						// Detract cost from ai pocket
						global.enemy_gold_amount -= global.unit_necromancer_cost;
						alarm_set(11,ai_nc_train_delay);
						// spawn
						// replace with enemy ranger unit once that is completed.
						instance_create_layer(enemy_spawn_location_x,enemy_spawn_location_y,"NPCs",obj_necromancer_enemy);
						
					}
				}
				// We can train melee units
				else {
						// Debug
						ai_choice = "cntr. army. KN. not poss. training melee";
						
						// Train these units in upper most priority (most expensive to least expensive)
						// Halberd training
						if (alarm[5] <= 0 && global.enemy_gold_amount >= global.unit_halberd_cost && can_train_hb == true && global.player_unit_count_enemy < global.player_unit_cap){
							// alarm is at 0s, and we have the funds, and this unit is available.
							// Debug
							ai_choice = "Counter P. SM, training halberdier";
							
							// Detract cost from ai pocket
							global.enemy_gold_amount -= global.unit_halberd_cost;
							alarm_set(5,ai_hb_train_delay);
							// spawn
							// replace with enemy ranger unit once that is completed.
							instance_create_layer(enemy_spawn_location_x,enemy_spawn_location_y,"NPCs",obj_halberdier_enemy);
						
						}
						// Knight training
						if (alarm[3] <= 0 && global.enemy_gold_amount >= global.unit_knight_cost && can_train_kn == true && global.player_unit_count_enemy < global.player_unit_cap){
							// alarm is at 0s, and we have the funds, and this unit is available.
							// Debug
							ai_choice = "Counter P. SM, training knight";
							
							// Detract cost from ai pocket
							global.enemy_gold_amount -= global.unit_knight_cost;
							alarm_set(3,ai_kn_train_delay);
							// spawn
							// replace with enemy ranger unit once that is completed.
							instance_create_layer(enemy_spawn_location_x,enemy_spawn_location_y,"NPCs",obj_knight_enemy);
						
						}
						// pikeman training
						if (alarm[1] <= 0 && global.enemy_gold_amount >= global.unit_pikeman_cost && can_train_pm == true && global.player_unit_count_enemy < global.player_unit_cap){
							// alarm is at 0s, and we have the funds, and this unit is available.
							// Debug
							ai_choice = "Counter P. SM, training pikeman";
							
							// Detract cost from ai pocket
							global.enemy_gold_amount -= global.unit_pikeman_cost;
							alarm_set(1,ai_pm_train_delay);
							// spawn
							// replace with enemy ranger unit once that is completed.
							instance_create_layer(enemy_spawn_location_x,enemy_spawn_location_y,"NPCs",obj_pikeman_enemy);
						
						}
						// swordman training
						if (alarm[0] <= 0 && global.enemy_gold_amount >= global.unit_swordman_cost && can_train_sm == true && global.player_unit_count_enemy < global.player_unit_cap){
							// alarm is at 0s, and we have the funds, and this unit is available.
							// Debug
							ai_choice = "Counter P. SM, training swordman";
						
							// Detract cost from ai pocket
							global.enemy_gold_amount -= global.unit_swordman_cost;
							alarm_set(0,ai_sm_train_delay);
							// spawn
							// replace with enemy ranger unit once that is completed.
							instance_create_layer(enemy_spawn_location_x,enemy_spawn_location_y,"NPCs",obj_swordman_enemy);
						
						}
					
					}
				
			}
			
		
		
		}
		// What if the player is running Halberdier heavy army composition?
		else if (p_hb_to_army_ratio >= cntr_p_army_hb_thres){
			// Debug
			ai_choice = "AI wants to counter halberdiers";
			if ((can_train_hb == true || can_train_pm == true) && (can_train_rg == true || can_train_mg == true)){
				// We do
				// Make sure we dont train too many ranged units, so that we have a front line
				// Debug
				ai_choice = "cntr. army. HB. possible";
					
				if (ai_ranged_army_percent < ai_ranged_army_perc_targ && (alarm[2] <= 0 || alarm[10] <= 0)){
						// Train ranged units
						// Debug
						ai_choice = "cntr. army. HB. training range";
						
						// Train arbalest in highest priority
						// then train ranger in next highest priority
						// are we able to train ranger?
						if (alarm[2] <= 0 && global.enemy_gold_amount >= global.unit_ranger_cost && can_train_rg == true && global.player_unit_count_enemy < global.player_unit_cap){
							// alarm is at 0s, and we have the funds, and this unit is available.
							// Debug
							ai_choice = "Counter P. SM + Range, training ranger";
							
							// Detract cost from ai pocket
							global.enemy_gold_amount -= global.unit_ranger_cost;
							alarm_set(2,ai_rg_train_delay);
							// spawn
							// replace with enemy ranger unit once that is completed.
							instance_create_layer(enemy_spawn_location_x,enemy_spawn_location_y,"NPCs",obj_ranger_enemy);
						
						}
						if (alarm[10] <= 0 && global.enemy_gold_amount >= global.unit_magician_cost && can_train_mg == true && global.player_unit_count_enemy < global.player_unit_cap){
							// alarm is at 0s, and we have the funds, and this unit is available.
							// Debug
							ai_choice = "Counter P. SM, training magician";
						
							// Detract cost from ai pocket
							global.enemy_gold_amount -= global.unit_magician_cost;
							alarm_set(10,ai_mg_train_delay);
							// spawn
							// replace with enemy ranger unit once that is completed.
							instance_create_layer(enemy_spawn_location_x,enemy_spawn_location_y,"NPCs",obj_magician_enemy);
						
						}
					}
				// We can train melee units
			else {
				// Debug
				ai_choice = "cntr. army. HB. training melee";
						
				// Halberd training
				if (alarm[5] <= 0 && global.enemy_gold_amount >= global.unit_halberd_cost && can_train_hb == true && global.player_unit_count_enemy < global.player_unit_cap){
							// alarm is at 0s, and we have the funds, and this unit is available.
							// Debug
							ai_choice = "Counter P. SM, training halberdier";
							
							// Detract cost from ai pocket
							global.enemy_gold_amount -= global.unit_halberd_cost;
							alarm_set(5,ai_hb_train_delay);
							// spawn
							// replace with enemy ranger unit once that is completed.
							instance_create_layer(enemy_spawn_location_x,enemy_spawn_location_y,"NPCs",obj_halberdier_enemy);
						
						}
				// pikeman training
				if (alarm[1] <= 0 && global.enemy_gold_amount >= global.unit_pikeman_cost && can_train_pm == true && global.player_unit_count_enemy < global.player_unit_cap){
							// alarm is at 0s, and we have the funds, and this unit is available.
							// Debug
							ai_choice = "Counter P. SM, training pikeman";
							
							// Detract cost from ai pocket
							global.enemy_gold_amount -= global.unit_pikeman_cost;
							alarm_set(1,ai_pm_train_delay);
							// spawn
							// replace with enemy ranger unit once that is completed.
							instance_create_layer(enemy_spawn_location_x,enemy_spawn_location_y,"NPCs",obj_pikeman_enemy);
						
						}
						
				}
				
			}
			else {
				// We do NOT
				// Just train anything you have available
				ai_choice = "cntr. army. HB. not poss. Use Assorted Army";
					
				if ((ai_ranged_army_percent < ai_ranged_army_perc_targ) && (alarm[4] <= 0 || alarm[2] <= 0 || alarm[10] <= 0 || alarm[11] <= 0) && (can_train_rg == true || can_train_ab == true || can_train_mg == true || can_train_nc == true) 
					&& (can_train_hb == true || can_train_kn == true || can_train_pm == true || can_train_sm == true)){
						// Train ranged units
						// Debug
						ai_choice = "cntr. army. HB. not poss. training range";
						
						// Train arbalest in highest priority
						// then train ranger in next highest priority
						// are we able to train an arbalest? if so, train one
						if (alarm[4] <= 0 && global.enemy_gold_amount >= global.unit_arbalest_cost && can_train_ab == true && global.player_unit_count_enemy < global.player_unit_cap){
							// alarm is at 0s, and we have the funds, and this unit is available.
							// Debug
							ai_choice = "Counter P. SM + Range, training arbalest";
							
							// Detract cost from ai pocket
							global.enemy_gold_amount -= global.unit_arbalest_cost;
							alarm_set(4,ai_ab_train_delay);
							// spawn
							instance_create_layer(enemy_spawn_location_x,enemy_spawn_location_y,"NPCs",obj_arbalest_enemy);
						
						}
						// are we able to train ranger?
						if (alarm[2] <= 0 && global.enemy_gold_amount >= global.unit_ranger_cost && can_train_rg == true && global.player_unit_count_enemy < global.player_unit_cap){
							// alarm is at 0s, and we have the funds, and this unit is available.
							// Debug
							ai_choice = "Counter P. SM + Range, training ranger";
							
							// Detract cost from ai pocket
							global.enemy_gold_amount -= global.unit_ranger_cost;
							alarm_set(2,ai_rg_train_delay);
							// spawn
							// replace with enemy ranger unit once that is completed.
							instance_create_layer(enemy_spawn_location_x,enemy_spawn_location_y,"NPCs",obj_ranger_enemy);
						
						}
						if (alarm[10] <= 0 && global.enemy_gold_amount >= global.unit_magician_cost && can_train_mg == true && global.player_unit_count_enemy < global.player_unit_cap){
							// alarm is at 0s, and we have the funds, and this unit is available.
							// Debug
							ai_choice = "Counter P. SM, training magician";
						
							// Detract cost from ai pocket
							global.enemy_gold_amount -= global.unit_magician_cost;
							alarm_set(10,ai_mg_train_delay);
							// spawn
							// replace with enemy ranger unit once that is completed.
							instance_create_layer(enemy_spawn_location_x,enemy_spawn_location_y,"NPCs",obj_magician_enemy);
						
						}
						if (alarm[11] <= 0 && global.enemy_gold_amount >= global.unit_necromancer_cost && can_train_nc == true && global.player_unit_count_enemy < global.player_unit_cap){
							// alarm is at 0s, and we have the funds, and this unit is available.
							// Debug
							ai_choice = "Counter P. Range, training necromancer";
						
							// Detract cost from ai pocket
							global.enemy_gold_amount -= global.unit_necromancer_cost;
							alarm_set(11,ai_nc_train_delay);
							// spawn
							// replace with enemy ranger unit once that is completed.
							instance_create_layer(enemy_spawn_location_x,enemy_spawn_location_y,"NPCs",obj_necromancer_enemy);
						
						}
					}
				// If we do not have access to ANY melee units, just train ranged units without caring for range army % targets.
				else if ((alarm[4] <= 0 || alarm[2] <= 0 || alarm[10] <= 0 || alarm[11] <= 0) && (can_train_rg == true || can_train_ab == true || can_train_nc == true) && can_train_hb == false && can_train_kn == false && can_train_pm == false && can_train_sm == false){
					// Train ranged units
					// Debug
					ai_choice = "cntr. army. Range. not poss. training range";
					
					// Train arbalest in highest priority
					// then train ranger in next highest priority
					// are we able to train an arbalest? if so, train one
					if (alarm[4] <= 0 && global.enemy_gold_amount >= global.unit_arbalest_cost && can_train_ab == true && global.player_unit_count_enemy < global.player_unit_cap){
						// alarm is at 0s, and we have the funds, and this unit is available.
						// Debug
						ai_choice = "Counter P. SM + Range, training arbalest";
						
						// Detract cost from ai pocket
						global.enemy_gold_amount -= global.unit_arbalest_cost;
						alarm_set(4,ai_ab_train_delay);
						// spawn
						instance_create_layer(enemy_spawn_location_x,enemy_spawn_location_y,"NPCs",obj_arbalest_enemy);
						
					}
					// are we able to train ranger?
					if (alarm[2] <= 0 && global.enemy_gold_amount >= global.unit_ranger_cost && can_train_rg == true && global.player_unit_count_enemy < global.player_unit_cap){
						// alarm is at 0s, and we have the funds, and this unit is available.
						// Debug
						ai_choice = "Counter P. SM + Range, training ranger";
							
						// Detract cost from ai pocket
						global.enemy_gold_amount -= global.unit_ranger_cost;
						alarm_set(2,ai_rg_train_delay);
						// spawn
						// replace with enemy ranger unit once that is completed.
						instance_create_layer(enemy_spawn_location_x,enemy_spawn_location_y,"NPCs",obj_ranger_enemy);
						
					}
					if (alarm[11] <= 0 && global.enemy_gold_amount >= global.unit_necromancer_cost && can_train_nc == true && global.player_unit_count_enemy < global.player_unit_cap){
						// alarm is at 0s, and we have the funds, and this unit is available.
						// Debug
						ai_choice = "Counter P. Range, training necromancer";
						
						// Detract cost from ai pocket
						global.enemy_gold_amount -= global.unit_necromancer_cost;
						alarm_set(11,ai_nc_train_delay);
						// spawn
						// replace with enemy ranger unit once that is completed.
						instance_create_layer(enemy_spawn_location_x,enemy_spawn_location_y,"NPCs",obj_necromancer_enemy);
						
					}
				}
				// We can train melee units
				else {
						// Debug
						ai_choice = "cntr. army. HB. not poss. training melee";
						
						// Train these units in upper most priority (most expensive to least expensive)
						// Halberd training
						if (alarm[5] <= 0 && global.enemy_gold_amount >= global.unit_halberd_cost && can_train_hb == true && global.player_unit_count_enemy < global.player_unit_cap){
							// alarm is at 0s, and we have the funds, and this unit is available.
							// Debug
							ai_choice = "Counter P. SM, training halberdier";
							
							// Detract cost from ai pocket
							global.enemy_gold_amount -= global.unit_halberd_cost;
							alarm_set(5,ai_hb_train_delay);
							// spawn
							// replace with enemy ranger unit once that is completed.
							instance_create_layer(enemy_spawn_location_x,enemy_spawn_location_y,"NPCs",obj_halberdier_enemy);
						
						}
						// Knight training
						if (alarm[3] <= 0 && global.enemy_gold_amount >= global.unit_knight_cost && can_train_kn == true && global.player_unit_count_enemy < global.player_unit_cap){
							// alarm is at 0s, and we have the funds, and this unit is available.
							// Debug
							ai_choice = "Counter P. SM, training knight";
							
							// Detract cost from ai pocket
							global.enemy_gold_amount -= global.unit_knight_cost;
							alarm_set(3,ai_kn_train_delay);
							// spawn
							// replace with enemy ranger unit once that is completed.
							instance_create_layer(enemy_spawn_location_x,enemy_spawn_location_y,"NPCs",obj_knight_enemy);
						
						}
						// pikeman training
						if (alarm[1] <= 0 && global.enemy_gold_amount >= global.unit_pikeman_cost && can_train_pm == true && global.player_unit_count_enemy < global.player_unit_cap){
							// alarm is at 0s, and we have the funds, and this unit is available.
							// Debug
							ai_choice = "Counter P. SM, training pikeman";
							
							// Detract cost from ai pocket
							global.enemy_gold_amount -= global.unit_pikeman_cost;
							alarm_set(1,ai_pm_train_delay);
							// spawn
							// replace with enemy ranger unit once that is completed.
							instance_create_layer(enemy_spawn_location_x,enemy_spawn_location_y,"NPCs",obj_pikeman_enemy);
						
						}
						// swordman training
						if (alarm[0] <= 0 && global.enemy_gold_amount >= global.unit_swordman_cost && can_train_sm == true && global.player_unit_count_enemy < global.player_unit_cap){
							// alarm is at 0s, and we have the funds, and this unit is available.
							// Debug
							ai_choice = "Counter P. SM, training swordman";
						
							// Detract cost from ai pocket
							global.enemy_gold_amount -= global.unit_swordman_cost;
							alarm_set(0,ai_sm_train_delay);
							// spawn
							// replace with enemy ranger unit once that is completed.
							instance_create_layer(enemy_spawn_location_x,enemy_spawn_location_y,"NPCs",obj_swordman_enemy);
						
						}
					
					}
				
			}
			
		
		}
		// what if the player is running a primarily ranger only army
		// the bulk of their army is made up of rangers and arbalests
		else if ((p_rg_to_army_ratio >= cntr_p_army_rg_thres && p_ab_to_army_ratio >= cntr_p_army_ab_thres)
			|| (p_army_range_to_melee_ratio >= cntr_p_army_rg_thres || p_army_range_to_melee_ratio >= cntr_p_army_ab_thres)){
			// Debug
			ai_choice = "AI wants to counter a range-heavy army";
			if ((can_train_hb == true || can_train_kn == true || can_train_nc == true) && (can_train_rg == true)){
				// We do
				// Make sure we dont train too many ranged units, so that we have a front line
				// Debug
				ai_choice = "cntr. army. Range. possible";
					
				if (ai_ranged_army_percent < ai_ranged_army_perc_targ && (alarm[2] <= 0 || alarm[10] <= 0)){
						// Train ranged units
						// Debug
						ai_choice = "cntr. army. Range. training range";
						
						// Train arbalest in highest priority
						// then train ranger in next highest priority
						// are we able to train ranger?
						if (alarm[2] <= 0 && global.enemy_gold_amount >= global.unit_ranger_cost && can_train_rg == true && global.player_unit_count_enemy < global.player_unit_cap){
							// alarm is at 0s, and we have the funds, and this unit is available.
							// Debug
							ai_choice = "Counter P. SM + Range, training ranger";
							
							// Detract cost from ai pocket
							global.enemy_gold_amount -= global.unit_ranger_cost;
							alarm_set(2,ai_rg_train_delay);
							// spawn
							// replace with enemy ranger unit once that is completed.
							instance_create_layer(enemy_spawn_location_x,enemy_spawn_location_y,"NPCs",obj_ranger_enemy);
						
						}
						if (alarm[10] <= 0 && global.enemy_gold_amount >= global.unit_magician_cost && can_train_mg == true && global.player_unit_count_enemy < global.player_unit_cap && p_hb_amount > 0){
						// alarm is at 0s, and we have the funds, and this unit is available.
						// Debug
						ai_choice = "Counter P. Range, training magician";
						
						// Detract cost from ai pocket
						global.enemy_gold_amount -= global.unit_magician_cost;
						alarm_set(10,ai_mg_train_delay);
						// spawn
						// replace with enemy ranger unit once that is completed.
						instance_create_layer(enemy_spawn_location_x,enemy_spawn_location_y,"NPCs",obj_magician_enemy);
						
					}
					}
				// We can train melee units
				else {
						// Debug
						ai_choice = "cntr. army. Range. training melee";
						
						// Halberd training
						if (alarm[5] <= 0 && global.enemy_gold_amount >= global.unit_halberd_cost && can_train_hb == true && global.player_unit_count_enemy < global.player_unit_cap){
							// alarm is at 0s, and we have the funds, and this unit is available.
							// Debug
							ai_choice = "Counter P. SM, training halberdier";
							
							// Detract cost from ai pocket
							global.enemy_gold_amount -= global.unit_halberd_cost;
							alarm_set(5,ai_hb_train_delay);
							// spawn
							// replace with enemy ranger unit once that is completed.
							instance_create_layer(enemy_spawn_location_x,enemy_spawn_location_y,"NPCs",obj_halberdier_enemy);
						
						}
						// Knight training
						if (alarm[3] <= 0 && global.enemy_gold_amount >= global.unit_knight_cost && can_train_kn == true && global.player_unit_count_enemy < global.player_unit_cap){
							// alarm is at 0s, and we have the funds, and this unit is available.
							// Debug
							ai_choice = "Counter P. SM, training knight";
							
							// Detract cost from ai pocket
							global.enemy_gold_amount -= global.unit_knight_cost;
							alarm_set(3,ai_kn_train_delay);
							// spawn
							// replace with enemy ranger unit once that is completed.
							instance_create_layer(enemy_spawn_location_x,enemy_spawn_location_y,"NPCs",obj_knight_enemy);
						
						}
						if (alarm[11] <= 0 && global.enemy_gold_amount >= global.unit_necromancer_cost && can_train_nc == true && global.player_unit_count_enemy < global.player_unit_cap){
						// alarm is at 0s, and we have the funds, and this unit is available.
						// Debug
						ai_choice = "Counter P. Range, training necromancer";
						
						// Detract cost from ai pocket
						global.enemy_gold_amount -= global.unit_necromancer_cost;
						alarm_set(11,ai_nc_train_delay);
						// spawn
						// replace with enemy ranger unit once that is completed.
						instance_create_layer(enemy_spawn_location_x,enemy_spawn_location_y,"NPCs",obj_necromancer_enemy);
						
					}
					}
				
			}
			else {
				// We do NOT
				// Just train anything you have available
				ai_choice = "cntr. army. Range. not poss. Use Assorted Army";
					
				if ((ai_ranged_army_percent < ai_ranged_army_perc_targ) && (alarm[4] <= 0 || alarm[2] <= 0 || alarm[10] <= 0) && (can_train_rg == true || can_train_ab == true) 
					&& (can_train_hb == true || can_train_kn == true || can_train_pm == true || can_train_sm == true)){
						// Train ranged units
						// Debug
						ai_choice = "cntr. army. Range. not poss. training range";
						
						// Train arbalest in highest priority
						// then train ranger in next highest priority
						// are we able to train an arbalest? if so, train one
						if (alarm[4] <= 0 && global.enemy_gold_amount >= global.unit_arbalest_cost && can_train_ab == true && global.player_unit_count_enemy < global.player_unit_cap){
							// alarm is at 0s, and we have the funds, and this unit is available.
							// Debug
							ai_choice = "Counter P. SM + Range, training arbalest";
							
							// Detract cost from ai pocket
							global.enemy_gold_amount -= global.unit_arbalest_cost;
							alarm_set(4,ai_ab_train_delay);
							// spawn
							instance_create_layer(enemy_spawn_location_x,enemy_spawn_location_y,"NPCs",obj_arbalest_enemy);
						
						}
						// are we able to train ranger?
						if (alarm[2] <= 0 && global.enemy_gold_amount >= global.unit_ranger_cost && can_train_rg == true && global.player_unit_count_enemy < global.player_unit_cap){
							// alarm is at 0s, and we have the funds, and this unit is available.
							// Debug
							ai_choice = "Counter P. SM + Range, training ranger";
							
							// Detract cost from ai pocket
							global.enemy_gold_amount -= global.unit_ranger_cost;
							alarm_set(2,ai_rg_train_delay);
							// spawn
							// replace with enemy ranger unit once that is completed.
							instance_create_layer(enemy_spawn_location_x,enemy_spawn_location_y,"NPCs",obj_ranger_enemy);
						
						}
					}
				// If we do not have access to ANY melee units, just train ranged units without caring for range army % targets.
				
				else if ((alarm[4] <= 0 || alarm[2] <= 0 || alarm[10] <= 0 || alarm[11] <= 0) && (can_train_rg == true || can_train_ab == true || can_train_mg == true || can_train_nc == true) && can_train_hb == false && can_train_kn == false && can_train_pm == false && can_train_sm == false){
					// Train ranged units
					// Debug
					ai_choice = "cntr. army. Range. not poss. training range";
					
					// Train arbalest in highest priority
					// then train ranger in next highest priority
					// are we able to train an arbalest? if so, train one
					if (alarm[4] <= 0 && global.enemy_gold_amount >= global.unit_arbalest_cost && can_train_ab == true && global.player_unit_count_enemy < global.player_unit_cap){
						// alarm is at 0s, and we have the funds, and this unit is available.
						// Debug
						ai_choice = "Counter P. SM + Range, training arbalest";
						
						// Detract cost from ai pocket
						global.enemy_gold_amount -= global.unit_arbalest_cost;
						alarm_set(4,ai_ab_train_delay);
						// spawn
						instance_create_layer(enemy_spawn_location_x,enemy_spawn_location_y,"NPCs",obj_arbalest_enemy);
						
					}
					// are we able to train ranger?
					if (alarm[2] <= 0 && global.enemy_gold_amount >= global.unit_ranger_cost && can_train_rg == true && global.player_unit_count_enemy < global.player_unit_cap){
						// alarm is at 0s, and we have the funds, and this unit is available.
						// Debug
						ai_choice = "Counter P. SM + Range, training ranger";
							
						// Detract cost from ai pocket
						global.enemy_gold_amount -= global.unit_ranger_cost;
						alarm_set(2,ai_rg_train_delay);
						// spawn
						// replace with enemy ranger unit once that is completed.
						instance_create_layer(enemy_spawn_location_x,enemy_spawn_location_y,"NPCs",obj_ranger_enemy);
						
					}
					if (alarm[10] <= 0 && global.enemy_gold_amount >= global.unit_magician_cost && can_train_mg == true && global.player_unit_count_enemy < global.player_unit_cap){
						// alarm is at 0s, and we have the funds, and this unit is available.
						// Debug
						ai_choice = "Counter P. SM, training magician";
					
						// Detract cost from ai pocket
						global.enemy_gold_amount -= global.unit_magician_cost;
						alarm_set(10,ai_mg_train_delay);
						// spawn
						// replace with enemy ranger unit once that is completed.
						instance_create_layer(enemy_spawn_location_x,enemy_spawn_location_y,"NPCs",obj_magician_enemy);
						
					}
					if (alarm[11] <= 0 && global.enemy_gold_amount >= global.unit_necromancer_cost && can_train_nc == true && global.player_unit_count_enemy < global.player_unit_cap){
						// alarm is at 0s, and we have the funds, and this unit is available.
						// Debug
						ai_choice = "Counter P. Range, training necromancer";
						
						// Detract cost from ai pocket
						global.enemy_gold_amount -= global.unit_necromancer_cost;
						alarm_set(11,ai_nc_train_delay);
						// spawn
						// replace with enemy ranger unit once that is completed.
						instance_create_layer(enemy_spawn_location_x,enemy_spawn_location_y,"NPCs",obj_necromancer_enemy);
						
					}
				}
				// We can train melee units
				else {
						// Debug
						ai_choice = "cntr. army. Range. not poss. training melee";
						
						// Train these units in upper most priority (most expensive to least expensive)
						// Halberd training
						if (alarm[5] <= 0 && global.enemy_gold_amount >= global.unit_halberd_cost && can_train_hb == true && global.player_unit_count_enemy < global.player_unit_cap){
							// alarm is at 0s, and we have the funds, and this unit is available.
							// Debug
							ai_choice = "Counter P. SM, training halberdier";
							
							// Detract cost from ai pocket
							global.enemy_gold_amount -= global.unit_halberd_cost;
							alarm_set(5,ai_hb_train_delay);
							// spawn
							// replace with enemy ranger unit once that is completed.
							instance_create_layer(enemy_spawn_location_x,enemy_spawn_location_y,"NPCs",obj_halberdier_enemy);
						
						}
						// Knight training
						if (alarm[3] <= 0 && global.enemy_gold_amount >= global.unit_knight_cost && can_train_kn == true && global.player_unit_count_enemy < global.player_unit_cap){
							// alarm is at 0s, and we have the funds, and this unit is available.
							// Debug
							ai_choice = "Counter P. SM, training knight";
							
							// Detract cost from ai pocket
							global.enemy_gold_amount -= global.unit_knight_cost;
							alarm_set(3,ai_kn_train_delay);
							// spawn
							// replace with enemy ranger unit once that is completed.
							instance_create_layer(enemy_spawn_location_x,enemy_spawn_location_y,"NPCs",obj_knight_enemy);
						
						}
						// pikeman training
						if (alarm[1] <= 0 && global.enemy_gold_amount >= global.unit_pikeman_cost && can_train_pm == true && global.player_unit_count_enemy < global.player_unit_cap){
							// alarm is at 0s, and we have the funds, and this unit is available.
							// Debug
							ai_choice = "Counter P. SM, training pikeman";
							
							// Detract cost from ai pocket
							global.enemy_gold_amount -= global.unit_pikeman_cost;
							alarm_set(1,ai_pm_train_delay);
							// spawn
							// replace with enemy ranger unit once that is completed.
							instance_create_layer(enemy_spawn_location_x,enemy_spawn_location_y,"NPCs",obj_pikeman_enemy);
						
						}
						// swordman training
						if (alarm[0] <= 0 && global.enemy_gold_amount >= global.unit_swordman_cost && can_train_sm == true && global.player_unit_count_enemy < global.player_unit_cap){
							// alarm is at 0s, and we have the funds, and this unit is available.
							// Debug
							ai_choice = "Counter P. SM, training swordman";
						
							// Detract cost from ai pocket
							global.enemy_gold_amount -= global.unit_swordman_cost;
							alarm_set(0,ai_sm_train_delay);
							// spawn
							// replace with enemy ranger unit once that is completed.
							instance_create_layer(enemy_spawn_location_x,enemy_spawn_location_y,"NPCs",obj_swordman_enemy);
						
						}
					
					}
				
			}
			
		
		}
		
		// In the event we dont have an army comp to counter, just attempt to fill up our army
		// with unit types, cheapest to most expensive
		// while aiming for a certain army composition
		else {
			// Our default army set up is based on our ai type
			// 0 = swords (swordmen and knights) and archers, 1 = pikes (pikes and halberdiers) and archers and arbalests
			// 2 = ranged (archers and arbalests), 3 = heavy hitters (knights, halberds and rangers) 4 = trash army (swordmen, pikemen, rangers)
			// 5 = assorted (everything) you have available
			if (ai_type == 0){
				// We train swordmen and knights
				// Do we have the required units available to make this composition?
				// Debug
				ai_choice = "def. army. 0. Swords + Ranged";
				
				if ((can_train_kn == true || can_train_sm == true) && (can_train_ab == true || can_train_rg == true)){
					// We do
					// Make sure we dont train too many ranged units, so that we have a front line
					// Debug
					ai_choice = "def. army. 0. Swords + Ranged: possible";
					
					if (ai_ranged_army_percent < ai_ranged_army_perc_targ && (alarm[4] <= 0 || alarm[2] <= 0 || alarm[10] <= 0)){
						// Train ranged units
						// Debug
						ai_choice = "def. army. 0. training range";
						
						// Train arbalest in highest priority
						// then train ranger in next highest priority
						// are we able to train an arbalest? if so, train one
						if (alarm[4] <= 0 && global.enemy_gold_amount >= global.unit_arbalest_cost && can_train_ab == true && global.player_unit_count_enemy < global.player_unit_cap){
							// alarm is at 0s, and we have the funds, and this unit is available.
							// Debug
							ai_choice = "Counter P. SM + Range, training arbalest";
							
							// Detract cost from ai pocket
							global.enemy_gold_amount -= global.unit_arbalest_cost;
							alarm_set(4,ai_ab_train_delay);
							// spawn
							instance_create_layer(enemy_spawn_location_x,enemy_spawn_location_y,"NPCs",obj_arbalest_enemy);
						
						}
						// are we able to train ranger?
						if (alarm[2] <= 0 && global.enemy_gold_amount >= global.unit_ranger_cost && can_train_rg == true && global.player_unit_count_enemy < global.player_unit_cap){
							// alarm is at 0s, and we have the funds, and this unit is available.
							// Debug
							ai_choice = "Counter P. SM + Range, training ranger";
							
							// Detract cost from ai pocket
							global.enemy_gold_amount -= global.unit_ranger_cost;
							alarm_set(2,ai_rg_train_delay);
							// spawn
							// replace with enemy ranger unit once that is completed.
							instance_create_layer(enemy_spawn_location_x,enemy_spawn_location_y,"NPCs",obj_ranger_enemy);
						
						}
					}
					// We can train melee units
					else {
						// Debug
						ai_choice = "def. army. 0. training melee";
						
						// Train Knights in higher priority, then swordmen
						if (alarm[3] <= 0 && global.enemy_gold_amount >= global.unit_knight_cost && can_train_kn == true && global.player_unit_count_enemy < global.player_unit_cap){
							// alarm is at 0s, and we have the funds, and this unit is available.
							// Debug
							ai_choice = "Counter P. SM, training knight";
							
							// Detract cost from ai pocket
							global.enemy_gold_amount -= global.unit_knight_cost;
							alarm_set(3,ai_kn_train_delay);
							// spawn
							// replace with enemy ranger unit once that is completed.
							instance_create_layer(enemy_spawn_location_x,enemy_spawn_location_y,"NPCs",obj_knight_enemy);
						
						}
						// Swordmen
						if (alarm[0] <= 0 && global.enemy_gold_amount >= global.unit_swordman_cost && can_train_sm == true && global.player_unit_count_enemy < global.player_unit_cap){
							// alarm is at 0s, and we have the funds, and this unit is available.
							// Debug
							ai_choice = "Counter P. SM, training swordman";
						
							// Detract cost from ai pocket
							global.enemy_gold_amount -= global.unit_swordman_cost;
							alarm_set(0,ai_sm_train_delay);
							// spawn
							// replace with enemy ranger unit once that is completed.
							instance_create_layer(enemy_spawn_location_x,enemy_spawn_location_y,"NPCs",obj_swordman_enemy);
						
						}
					
					}
				
				}
				else {
					// We do NOT
					// Just train anything you have available
					ai_choice = "def. army. 0. S + W  not poss. Use Assorted Army";
					
					if ((ai_ranged_army_percent < ai_ranged_army_perc_targ) && (alarm[4] <= 0 || alarm[2] <= 0 || alarm[10] <= 0) && (can_train_rg == true || can_train_ab == true) 
					&& (can_train_hb == true || can_train_kn == true || can_train_pm == true || can_train_sm == true)){
						// Train ranged units
						// Debug
						ai_choice = "def. army. 0. not poss. training range";
						
						// Train arbalest in highest priority
						// then train ranger in next highest priority
						// are we able to train an arbalest? if so, train one
						if (alarm[4] <= 0 && global.enemy_gold_amount >= global.unit_arbalest_cost && can_train_ab == true && global.player_unit_count_enemy < global.player_unit_cap){
							// alarm is at 0s, and we have the funds, and this unit is available.
							// Debug
							ai_choice = "Counter P. SM + Range, training arbalest";
							
							// Detract cost from ai pocket
							global.enemy_gold_amount -= global.unit_arbalest_cost;
							alarm_set(4,ai_ab_train_delay);
							// spawn
							instance_create_layer(enemy_spawn_location_x,enemy_spawn_location_y,"NPCs",obj_arbalest_enemy);
						
						}
						// are we able to train ranger?
						if (alarm[2] <= 0 && global.enemy_gold_amount >= global.unit_ranger_cost && can_train_rg == true && global.player_unit_count_enemy < global.player_unit_cap){
							// alarm is at 0s, and we have the funds, and this unit is available.
							// Debug
							ai_choice = "Counter P. SM + Range, training ranger";
							
							// Detract cost from ai pocket
							global.enemy_gold_amount -= global.unit_ranger_cost;
							alarm_set(2,ai_rg_train_delay);
							// spawn
							// replace with enemy ranger unit once that is completed.
							instance_create_layer(enemy_spawn_location_x,enemy_spawn_location_y,"NPCs",obj_ranger_enemy);
						
						}
					}
					else if ((alarm[4] <= 0 || alarm[2] <= 0 || alarm[10] <= 0) && (can_train_rg == true || can_train_ab == true) && can_train_hb == false && can_train_kn == false && can_train_pm == false && can_train_sm == false){
						// Train ranged units
						// Debug
						ai_choice = "cntr. army. Range. not poss. training range";
					
						// Train arbalest in highest priority
						// then train ranger in next highest priority
						// are we able to train an arbalest? if so, train one
						if (alarm[4] <= 0 && global.enemy_gold_amount >= global.unit_arbalest_cost && can_train_ab == true && global.player_unit_count_enemy < global.player_unit_cap){
							// alarm is at 0s, and we have the funds, and this unit is available.
							// Debug
							ai_choice = "Counter P. SM + Range, training arbalest";
						
							// Detract cost from ai pocket
							global.enemy_gold_amount -= global.unit_arbalest_cost;
							alarm_set(4,ai_ab_train_delay);
							// spawn
							instance_create_layer(enemy_spawn_location_x,enemy_spawn_location_y,"NPCs",obj_arbalest_enemy);
						
						}
						// are we able to train ranger?
						if (alarm[2] <= 0 && global.enemy_gold_amount >= global.unit_ranger_cost && can_train_rg == true && global.player_unit_count_enemy < global.player_unit_cap){
							// alarm is at 0s, and we have the funds, and this unit is available.
							// Debug
							ai_choice = "Counter P. SM + Range, training ranger";
							
							// Detract cost from ai pocket
							global.enemy_gold_amount -= global.unit_ranger_cost;
							alarm_set(2,ai_rg_train_delay);
							// spawn
							// replace with enemy ranger unit once that is completed.
							instance_create_layer(enemy_spawn_location_x,enemy_spawn_location_y,"NPCs",obj_ranger_enemy);
						
						}
					}
					// We can train melee units
					else {
						// Debug
						ai_choice = "def. army. 0. not poss. training melee";
						
						// Train these units in upper most priority (most expensive to least expensive)
						// Halberd training
						if (alarm[5] <= 0 && global.enemy_gold_amount >= global.unit_halberd_cost && can_train_hb == true && global.player_unit_count_enemy < global.player_unit_cap){
							// alarm is at 0s, and we have the funds, and this unit is available.
							// Debug
							ai_choice = "Counter P. SM, training halberdier";
							
							// Detract cost from ai pocket
							global.enemy_gold_amount -= global.unit_halberd_cost;
							alarm_set(5,ai_hb_train_delay);
							// spawn
							// replace with enemy ranger unit once that is completed.
							instance_create_layer(enemy_spawn_location_x,enemy_spawn_location_y,"NPCs",obj_halberdier_enemy);
						
						}
						// Knight training
						if (alarm[3] <= 0 && global.enemy_gold_amount >= global.unit_knight_cost && can_train_kn == true && global.player_unit_count_enemy < global.player_unit_cap){
							// alarm is at 0s, and we have the funds, and this unit is available.
							// Debug
							ai_choice = "Counter P. SM, training knight";
							
							// Detract cost from ai pocket
							global.enemy_gold_amount -= global.unit_knight_cost;
							alarm_set(3,ai_kn_train_delay);
							// spawn
							// replace with enemy ranger unit once that is completed.
							instance_create_layer(enemy_spawn_location_x,enemy_spawn_location_y,"NPCs",obj_knight_enemy);
						
						}
						// pikeman training
						if (alarm[1] <= 0 && global.enemy_gold_amount >= global.unit_pikeman_cost && can_train_pm == true && global.player_unit_count_enemy < global.player_unit_cap){
							// alarm is at 0s, and we have the funds, and this unit is available.
							// Debug
							ai_choice = "Counter P. SM, training pikeman";
							
							// Detract cost from ai pocket
							global.enemy_gold_amount -= global.unit_pikeman_cost;
							alarm_set(1,ai_pm_train_delay);
							// spawn
							// replace with enemy ranger unit once that is completed.
							instance_create_layer(enemy_spawn_location_x,enemy_spawn_location_y,"NPCs",obj_pikeman_enemy);
						
						}
						// swordman training
						if (alarm[0] <= 0 && global.enemy_gold_amount >= global.unit_swordman_cost && can_train_sm == true && global.player_unit_count_enemy < global.player_unit_cap){
							// alarm is at 0s, and we have the funds, and this unit is available.
							// Debug
							ai_choice = "Counter P. SM, training swordman";
						
							// Detract cost from ai pocket
							global.enemy_gold_amount -= global.unit_swordman_cost;
							alarm_set(0,ai_sm_train_delay);
							// spawn
							// replace with enemy ranger unit once that is completed.
							instance_create_layer(enemy_spawn_location_x,enemy_spawn_location_y,"NPCs",obj_swordman_enemy);
						
						}
					
					}
				
				}
			
			}
			else if (ai_type == 1){
				// The pointy boys
				// We train pikeman, Halberdiers and range
				// Debug
				ai_choice = "def. army. 1. Pikes + Halbs + Ranged";
				
				if ((can_train_pm == true || can_train_hb == true) && (can_train_ab == true || can_train_rg == true)){
					// We do
					// Make sure we dont train too many ranged units, so that we have a front line
					// Debug
					ai_choice = "def. army. 1. Pikes + Halbs + Ranged: possible";
					
					if (ai_ranged_army_percent < ai_ranged_army_perc_targ && (alarm[4] <= 0 || alarm[2] <= 0 || alarm[10] <= 0)){
						// Train ranged units
						// Debug
						ai_choice = "def. army. 1. training range";
						
						// Train arbalest in highest priority
						// then train ranger in next highest priority
						// are we able to train an arbalest? if so, train one
						if (alarm[4] <= 0 && global.enemy_gold_amount >= global.unit_arbalest_cost && can_train_ab == true && global.player_unit_count_enemy < global.player_unit_cap){
							// alarm is at 0s, and we have the funds, and this unit is available.
							// Debug
							ai_choice = "Counter P. SM + Range, training arbalest";
							
							// Detract cost from ai pocket
							global.enemy_gold_amount -= global.unit_arbalest_cost;
							alarm_set(4,ai_ab_train_delay);
							// spawn
							instance_create_layer(enemy_spawn_location_x,enemy_spawn_location_y,"NPCs",obj_arbalest_enemy);
						
						}
						// are we able to train ranger?
						if (alarm[2] <= 0 && global.enemy_gold_amount >= global.unit_ranger_cost && can_train_rg == true && global.player_unit_count_enemy < global.player_unit_cap){
							// alarm is at 0s, and we have the funds, and this unit is available.
							// Debug
							ai_choice = "Counter P. SM + Range, training ranger";
							
							// Detract cost from ai pocket
							global.enemy_gold_amount -= global.unit_ranger_cost;
							alarm_set(2,ai_rg_train_delay);
							// spawn
							// replace with enemy ranger unit once that is completed.
							instance_create_layer(enemy_spawn_location_x,enemy_spawn_location_y,"NPCs",obj_ranger_enemy);
						
						}
					}
					// We can train melee units
					else {
						// Debug
						ai_choice = "def. army. 1. training melee";
						
						// Halberd training
						if (alarm[5] <= 0 && global.enemy_gold_amount >= global.unit_halberd_cost && can_train_hb == true && global.player_unit_count_enemy < global.player_unit_cap){
							// alarm is at 0s, and we have the funds, and this unit is available.
							// Debug
							ai_choice = "Counter P. SM, training halberdier";
							
							// Detract cost from ai pocket
							global.enemy_gold_amount -= global.unit_halberd_cost;
							alarm_set(5,ai_hb_train_delay);
							// spawn
							// replace with enemy ranger unit once that is completed.
							instance_create_layer(enemy_spawn_location_x,enemy_spawn_location_y,"NPCs",obj_halberdier_enemy);
						
						}
						// pikeman training
						if (alarm[1] <= 0 && global.enemy_gold_amount >= global.unit_pikeman_cost && can_train_pm == true && global.player_unit_count_enemy < global.player_unit_cap){
							// alarm is at 0s, and we have the funds, and this unit is available.
							// Debug
							ai_choice = "Counter P. SM, training pikeman";
							
							// Detract cost from ai pocket
							global.enemy_gold_amount -= global.unit_pikeman_cost;
							alarm_set(1,ai_pm_train_delay);
							// spawn
							// replace with enemy ranger unit once that is completed.
							instance_create_layer(enemy_spawn_location_x,enemy_spawn_location_y,"NPCs",obj_pikeman_enemy);
						
						}
					
					}
				
				}
				else {
					// We do NOT
					// Just train anything you have available
					ai_choice = "def. army. 1. PM + HB + range not poss. Use Assorted Army";
					
					if ((ai_ranged_army_percent < ai_ranged_army_perc_targ) && (alarm[4] <= 0 || alarm[2] <= 0 || alarm[10] <= 0) && (can_train_rg == true || can_train_ab == true) 
					&& (can_train_hb == true || can_train_kn == true || can_train_pm == true || can_train_sm == true)){
						// Train ranged units
						// Debug
						ai_choice = "def. army. 1. not poss. training range";
						
						// Train arbalest in highest priority
						// then train ranger in next highest priority
						// are we able to train an arbalest? if so, train one
						if (alarm[4] <= 0 && global.enemy_gold_amount >= global.unit_arbalest_cost && can_train_ab == true && global.player_unit_count_enemy < global.player_unit_cap){
							// alarm is at 0s, and we have the funds, and this unit is available.
							// Debug
							ai_choice = "Counter P. SM + Range, training arbalest";
							
							// Detract cost from ai pocket
							global.enemy_gold_amount -= global.unit_arbalest_cost;
							alarm_set(4,ai_ab_train_delay);
							// spawn
							instance_create_layer(enemy_spawn_location_x,enemy_spawn_location_y,"NPCs",obj_arbalest_enemy);
						
						}
						// are we able to train ranger?
						if (alarm[2] <= 0 && global.enemy_gold_amount >= global.unit_ranger_cost && can_train_rg == true && global.player_unit_count_enemy < global.player_unit_cap){
							// alarm is at 0s, and we have the funds, and this unit is available.
							// Debug
							ai_choice = "Counter P. SM + Range, training ranger";
							
							// Detract cost from ai pocket
							global.enemy_gold_amount -= global.unit_ranger_cost;
							alarm_set(2,ai_rg_train_delay);
							// spawn
							// replace with enemy ranger unit once that is completed.
							instance_create_layer(enemy_spawn_location_x,enemy_spawn_location_y,"NPCs",obj_ranger_enemy);
						
						}
					}
					else if ((alarm[4] <= 0 || alarm[2] <= 0 || alarm[10] <= 0) && (can_train_rg == true || can_train_ab == true) && can_train_hb == false && can_train_kn == false && can_train_pm == false && can_train_sm == false){
						// Train ranged units
						// Debug
						ai_choice = "cntr. army. Range. not poss. training range";
					
						// Train arbalest in highest priority
						// then train ranger in next highest priority
						// are we able to train an arbalest? if so, train one
						if (alarm[4] <= 0 && global.enemy_gold_amount >= global.unit_arbalest_cost && can_train_ab == true && global.player_unit_count_enemy < global.player_unit_cap){
							// alarm is at 0s, and we have the funds, and this unit is available.
							// Debug
							ai_choice = "Counter P. SM + Range, training arbalest";
						
							// Detract cost from ai pocket
							global.enemy_gold_amount -= global.unit_arbalest_cost;
							alarm_set(4,ai_ab_train_delay);
							// spawn
							instance_create_layer(enemy_spawn_location_x,enemy_spawn_location_y,"NPCs",obj_arbalest_enemy);
						
						}
						// are we able to train ranger?
						if (alarm[2] <= 0 && global.enemy_gold_amount >= global.unit_ranger_cost && can_train_rg == true && global.player_unit_count_enemy < global.player_unit_cap){
							// alarm is at 0s, and we have the funds, and this unit is available.
							// Debug
							ai_choice = "Counter P. SM + Range, training ranger";
							
							// Detract cost from ai pocket
							global.enemy_gold_amount -= global.unit_ranger_cost;
							alarm_set(2,ai_rg_train_delay);
							// spawn
							// replace with enemy ranger unit once that is completed.
							instance_create_layer(enemy_spawn_location_x,enemy_spawn_location_y,"NPCs",obj_ranger_enemy);
						
						}
					}
					// We can train melee units
					else {
						// Debug
						ai_choice = "def. army. 1. not poss. training melee";
						
						// Train these units in upper most priority (most expensive to least expensive)
						// Halberd training
						if (alarm[5] <= 0 && global.enemy_gold_amount >= global.unit_halberd_cost && can_train_hb == true && global.player_unit_count_enemy < global.player_unit_cap){
							// alarm is at 0s, and we have the funds, and this unit is available.
							// Debug
							ai_choice = "Counter P. SM, training halberdier";
							
							// Detract cost from ai pocket
							global.enemy_gold_amount -= global.unit_halberd_cost;
							alarm_set(5,ai_hb_train_delay);
							// spawn
							// replace with enemy ranger unit once that is completed.
							instance_create_layer(enemy_spawn_location_x,enemy_spawn_location_y,"NPCs",obj_halberdier_enemy);
						
						}
						// Knight training
						if (alarm[3] <= 0 && global.enemy_gold_amount >= global.unit_knight_cost && can_train_kn == true && global.player_unit_count_enemy < global.player_unit_cap){
							// alarm is at 0s, and we have the funds, and this unit is available.
							// Debug
							ai_choice = "Counter P. SM, training knight";
							
							// Detract cost from ai pocket
							global.enemy_gold_amount -= global.unit_knight_cost;
							alarm_set(3,ai_kn_train_delay);
							// spawn
							// replace with enemy ranger unit once that is completed.
							instance_create_layer(enemy_spawn_location_x,enemy_spawn_location_y,"NPCs",obj_knight_enemy);
						
						}
						// pikeman training
						if (alarm[1] <= 0 && global.enemy_gold_amount >= global.unit_pikeman_cost && can_train_pm == true && global.player_unit_count_enemy < global.player_unit_cap){
							// alarm is at 0s, and we have the funds, and this unit is available.
							// Debug
							ai_choice = "Counter P. SM, training pikeman";
							
							// Detract cost from ai pocket
							global.enemy_gold_amount -= global.unit_pikeman_cost;
							alarm_set(1,ai_pm_train_delay);
							// spawn
							// replace with enemy ranger unit once that is completed.
							instance_create_layer(enemy_spawn_location_x,enemy_spawn_location_y,"NPCs",obj_pikeman_enemy);
						
						}
						// swordman training
						if (alarm[0] <= 0 && global.enemy_gold_amount >= global.unit_swordman_cost && can_train_sm == true && global.player_unit_count_enemy < global.player_unit_cap){
							// alarm is at 0s, and we have the funds, and this unit is available.
							// Debug
							ai_choice = "Counter P. SM, training swordman";
						
							// Detract cost from ai pocket
							global.enemy_gold_amount -= global.unit_swordman_cost;
							alarm_set(0,ai_sm_train_delay);
							// spawn
							// replace with enemy ranger unit once that is completed.
							instance_create_layer(enemy_spawn_location_x,enemy_spawn_location_y,"NPCs",obj_swordman_enemy);
						
						}
					
					}
				
				}
			
			}
			else if (ai_type == 2){
				// The ranged
				// We train Range only, Archers and Arbalests
				// Debug
				ai_choice = "def. army. 2. Ranged";
				
				if (can_train_rg == true || can_train_ab == true){
					// We do
					// Make sure we dont train too many ranged units, so that we have a front line
					// Debug
					ai_choice = "def. army. 2. training range";
						
					// Train arbalest in highest priority
					// then train ranger in next highest priority
					// are we able to train an arbalest? if so, train one
					if (alarm[4] <= 0 && global.enemy_gold_amount >= global.unit_arbalest_cost && can_train_ab == true && global.player_unit_count_enemy < global.player_unit_cap){
						// alarm is at 0s, and we have the funds, and this unit is available.
						// Debug
						ai_choice = "Counter P. SM + Range, training arbalest";
						
						// Detract cost from ai pocket
						global.enemy_gold_amount -= global.unit_arbalest_cost;
						alarm_set(4,ai_ab_train_delay);
						// spawn
						instance_create_layer(enemy_spawn_location_x,enemy_spawn_location_y,"NPCs",obj_arbalest_enemy);
						
					}
					// are we able to train ranger?
					if (alarm[2] <= 0 && global.enemy_gold_amount >= global.unit_ranger_cost && can_train_rg == true && global.player_unit_count_enemy < global.player_unit_cap){
						// alarm is at 0s, and we have the funds, and this unit is available.
						// Debug
						ai_choice = "Counter P. SM + Range, training ranger";
							
						// Detract cost from ai pocket
						global.enemy_gold_amount -= global.unit_ranger_cost;
						alarm_set(2,ai_rg_train_delay);
						// spawn
						// replace with enemy ranger unit once that is completed.
						instance_create_layer(enemy_spawn_location_x,enemy_spawn_location_y,"NPCs",obj_ranger_enemy);
						
					}
				
				}
				else {
					// We do NOT
					// Just train anything you have available
					ai_choice = "def. army. 2. range not poss. Use Assorted Army";
					
					if ((ai_ranged_army_percent < ai_ranged_army_perc_targ) && (alarm[4] <= 0 || alarm[2] <= 0 || alarm[10] <= 0) && (can_train_rg == true || can_train_ab == true) 
					&& (can_train_hb == true || can_train_kn == true || can_train_pm == true || can_train_sm == true)){
						// Train ranged units
						// Debug
						ai_choice = "def. army. 2. not poss. training range";
						
						// Train arbalest in highest priority
						// then train ranger in next highest priority
						// are we able to train an arbalest? if so, train one
						if (alarm[4] <= 0 && global.enemy_gold_amount >= global.unit_arbalest_cost && can_train_ab == true && global.player_unit_count_enemy < global.player_unit_cap){
							// alarm is at 0s, and we have the funds, and this unit is available.
							// Debug
							ai_choice = "Counter P. SM + Range, training arbalest";
							
							// Detract cost from ai pocket
							global.enemy_gold_amount -= global.unit_arbalest_cost;
							alarm_set(4,ai_ab_train_delay);
							// spawn
							instance_create_layer(enemy_spawn_location_x,enemy_spawn_location_y,"NPCs",obj_arbalest_enemy);
						
						}
						// are we able to train ranger?
						if (alarm[2] <= 0 && global.enemy_gold_amount >= global.unit_ranger_cost && can_train_rg == true && global.player_unit_count_enemy < global.player_unit_cap){
							// alarm is at 0s, and we have the funds, and this unit is available.
							// Debug
							ai_choice = "Counter P. SM + Range, training ranger";
							
							// Detract cost from ai pocket
							global.enemy_gold_amount -= global.unit_ranger_cost;
							alarm_set(2,ai_rg_train_delay);
							// spawn
							// replace with enemy ranger unit once that is completed.
							instance_create_layer(enemy_spawn_location_x,enemy_spawn_location_y,"NPCs",obj_ranger_enemy);
						
						}
					}
					else if ((alarm[4] <= 0 || alarm[2] <= 0 || alarm[10] <= 0) && (can_train_rg == true || can_train_ab == true) && can_train_hb == false && can_train_kn == false && can_train_pm == false && can_train_sm == false){
						// Train ranged units
						// Debug
						ai_choice = "cntr. army. Range. not poss. training range";
					
						// Train arbalest in highest priority
						// then train ranger in next highest priority
						// are we able to train an arbalest? if so, train one
						if (alarm[4] <= 0 && global.enemy_gold_amount >= global.unit_arbalest_cost && can_train_ab == true && global.player_unit_count_enemy < global.player_unit_cap){
							// alarm is at 0s, and we have the funds, and this unit is available.
							// Debug
							ai_choice = "Counter P. SM + Range, training arbalest";
						
							// Detract cost from ai pocket
							global.enemy_gold_amount -= global.unit_arbalest_cost;
							alarm_set(4,ai_ab_train_delay);
							// spawn
							instance_create_layer(enemy_spawn_location_x,enemy_spawn_location_y,"NPCs",obj_arbalest_enemy);
						
						}
						// are we able to train ranger?
						if (alarm[2] <= 0 && global.enemy_gold_amount >= global.unit_ranger_cost && can_train_rg == true && global.player_unit_count_enemy < global.player_unit_cap){
							// alarm is at 0s, and we have the funds, and this unit is available.
							// Debug
							ai_choice = "Counter P. SM + Range, training ranger";
							
							// Detract cost from ai pocket
							global.enemy_gold_amount -= global.unit_ranger_cost;
							alarm_set(2,ai_rg_train_delay);
							// spawn
							// replace with enemy ranger unit once that is completed.
							instance_create_layer(enemy_spawn_location_x,enemy_spawn_location_y,"NPCs",obj_ranger_enemy);
						
						}
					}
					// We can train melee units
					else {
						// Debug
						ai_choice = "def. army. 2. not poss. training melee";
						
						// Train these units in upper most priority (most expensive to least expensive)
						// Halberd training
						if (alarm[5] <= 0 && global.enemy_gold_amount >= global.unit_halberd_cost && can_train_hb == true && global.player_unit_count_enemy < global.player_unit_cap){
							// alarm is at 0s, and we have the funds, and this unit is available.
							// Debug
							ai_choice = "Counter P. SM, training halberdier";
							
							// Detract cost from ai pocket
							global.enemy_gold_amount -= global.unit_halberd_cost;
							alarm_set(5,ai_hb_train_delay);
							// spawn
							// replace with enemy ranger unit once that is completed.
							instance_create_layer(enemy_spawn_location_x,enemy_spawn_location_y,"NPCs",obj_halberdier_enemy);
						
						}
						// Knight training
						if (alarm[3] <= 0 && global.enemy_gold_amount >= global.unit_knight_cost && can_train_kn == true && global.player_unit_count_enemy < global.player_unit_cap){
							// alarm is at 0s, and we have the funds, and this unit is available.
							// Debug
							ai_choice = "Counter P. SM, training knight";
							
							// Detract cost from ai pocket
							global.enemy_gold_amount -= global.unit_knight_cost;
							alarm_set(3,ai_kn_train_delay);
							// spawn
							// replace with enemy ranger unit once that is completed.
							instance_create_layer(enemy_spawn_location_x,enemy_spawn_location_y,"NPCs",obj_knight_enemy);
						
						}
						// pikeman training
						if (alarm[1] <= 0 && global.enemy_gold_amount >= global.unit_pikeman_cost && can_train_pm == true && global.player_unit_count_enemy < global.player_unit_cap){
							// alarm is at 0s, and we have the funds, and this unit is available.
							// Debug
							ai_choice = "Counter P. SM, training pikeman";
							
							// Detract cost from ai pocket
							global.enemy_gold_amount -= global.unit_pikeman_cost;
							alarm_set(1,ai_pm_train_delay);
							// spawn
							// replace with enemy ranger unit once that is completed.
							instance_create_layer(enemy_spawn_location_x,enemy_spawn_location_y,"NPCs",obj_pikeman_enemy);
						
						}
						// swordman training
						if (alarm[0] <= 0 && global.enemy_gold_amount >= global.unit_swordman_cost && can_train_sm == true && global.player_unit_count_enemy < global.player_unit_cap){
							// alarm is at 0s, and we have the funds, and this unit is available.
							// Debug
							ai_choice = "Counter P. SM, training swordman";
						
							// Detract cost from ai pocket
							global.enemy_gold_amount -= global.unit_swordman_cost;
							alarm_set(0,ai_sm_train_delay);
							// spawn
							// replace with enemy ranger unit once that is completed.
							instance_create_layer(enemy_spawn_location_x,enemy_spawn_location_y,"NPCs",obj_swordman_enemy);
						
						}
					
					}
				
				}
			
			}
			else if (ai_type == 3){
				// The Heavy Hitters
				// Here we spawn only the tankier and harder hitting units
				// spawn rangers, halberds and knights
				// Debug
				ai_choice = "def. army. 3. Heavy Hitters";
				
				if ((can_train_hb == true || can_train_kn == true) && (can_train_rg == true)){
					// We do
					// Make sure we dont train too many ranged units, so that we have a front line
					// Debug
					ai_choice = "def. army. 3. Heavy Hitters: possible";
					
					if (ai_ranged_army_percent < ai_ranged_army_perc_targ && (alarm[2] <= 0)){
						// Train ranged units
						// Debug
						ai_choice = "def. army. 3. training range";
						
						// Train arbalest in highest priority
						// then train ranger in next highest priority
						// are we able to train ranger?
						if (alarm[2] <= 0 && global.enemy_gold_amount >= global.unit_ranger_cost && can_train_rg == true && global.player_unit_count_enemy < global.player_unit_cap){
							// alarm is at 0s, and we have the funds, and this unit is available.
							// Debug
							ai_choice = "Counter P. SM + Range, training ranger";
							
							// Detract cost from ai pocket
							global.enemy_gold_amount -= global.unit_ranger_cost;
							alarm_set(2,ai_rg_train_delay);
							// spawn
							// replace with enemy ranger unit once that is completed.
							instance_create_layer(enemy_spawn_location_x,enemy_spawn_location_y,"NPCs",obj_ranger_enemy);
						
						}
					}
					// We can train melee units
					else {
						// Debug
						ai_choice = "def. army. 3. training melee";
						
						// Halberd training
						if (alarm[5] <= 0 && global.enemy_gold_amount >= global.unit_halberd_cost && can_train_hb == true && global.player_unit_count_enemy < global.player_unit_cap){
							// alarm is at 0s, and we have the funds, and this unit is available.
							// Debug
							ai_choice = "Counter P. SM, training halberdier";
							
							// Detract cost from ai pocket
							global.enemy_gold_amount -= global.unit_halberd_cost;
							alarm_set(5,ai_hb_train_delay);
							// spawn
							// replace with enemy ranger unit once that is completed.
							instance_create_layer(enemy_spawn_location_x,enemy_spawn_location_y,"NPCs",obj_halberdier_enemy);
						
						}
						// Knight training
						if (alarm[3] <= 0 && global.enemy_gold_amount >= global.unit_knight_cost && can_train_kn == true && global.player_unit_count_enemy < global.player_unit_cap){
							// alarm is at 0s, and we have the funds, and this unit is available.
							// Debug
							ai_choice = "Counter P. SM, training knight";
							
							// Detract cost from ai pocket
							global.enemy_gold_amount -= global.unit_knight_cost;
							alarm_set(3,ai_kn_train_delay);
							// spawn
							// replace with enemy ranger unit once that is completed.
							instance_create_layer(enemy_spawn_location_x,enemy_spawn_location_y,"NPCs",obj_knight_enemy);
						
						}
					}
				
				}
				else {
					// We do NOT
					// Just train anything you have available
					ai_choice = "def. army. 3. Heavy Hitters not poss. Use Assorted Army";
					
					if ((ai_ranged_army_percent < ai_ranged_army_perc_targ) && (alarm[4] <= 0 || alarm[2] <= 0 || alarm[10] <= 0) && (can_train_rg == true || can_train_ab == true) 
					&& (can_train_hb == true || can_train_kn == true || can_train_pm == true || can_train_sm == true)){
						// Train ranged units
						// Debug
						ai_choice = "def. army. 1. not poss. training range";
						
						// Train arbalest in highest priority
						// then train ranger in next highest priority
						// are we able to train an arbalest? if so, train one
						if (alarm[4] <= 0 && global.enemy_gold_amount >= global.unit_arbalest_cost && can_train_ab == true && global.player_unit_count_enemy < global.player_unit_cap){
							// alarm is at 0s, and we have the funds, and this unit is available.
							// Debug
							ai_choice = "Counter P. SM + Range, training arbalest";
							
							// Detract cost from ai pocket
							global.enemy_gold_amount -= global.unit_arbalest_cost;
							alarm_set(4,ai_ab_train_delay);
							// spawn
							instance_create_layer(enemy_spawn_location_x,enemy_spawn_location_y,"NPCs",obj_arbalest_enemy);
						
						}
						// are we able to train ranger?
						if (alarm[2] <= 0 && global.enemy_gold_amount >= global.unit_ranger_cost && can_train_rg == true && global.player_unit_count_enemy < global.player_unit_cap){
							// alarm is at 0s, and we have the funds, and this unit is available.
							// Debug
							ai_choice = "Counter P. SM + Range, training ranger";
							
							// Detract cost from ai pocket
							global.enemy_gold_amount -= global.unit_ranger_cost;
							alarm_set(2,ai_rg_train_delay);
							// spawn
							// replace with enemy ranger unit once that is completed.
							instance_create_layer(enemy_spawn_location_x,enemy_spawn_location_y,"NPCs",obj_ranger_enemy);
						
						}
					}
					else if ((alarm[4] <= 0 || alarm[2] <= 0 || alarm[10] <= 0) && (can_train_rg == true || can_train_ab == true) && can_train_hb == false && can_train_kn == false && can_train_pm == false && can_train_sm == false){
						// Train ranged units
						// Debug
						ai_choice = "cntr. army. Range. not poss. training range";
					
						// Train arbalest in highest priority
						// then train ranger in next highest priority
						// are we able to train an arbalest? if so, train one
						if (alarm[4] <= 0 && global.enemy_gold_amount >= global.unit_arbalest_cost && can_train_ab == true && global.player_unit_count_enemy < global.player_unit_cap){
							// alarm is at 0s, and we have the funds, and this unit is available.
							// Debug
							ai_choice = "Counter P. SM + Range, training arbalest";
						
							// Detract cost from ai pocket
							global.enemy_gold_amount -= global.unit_arbalest_cost;
							alarm_set(4,ai_ab_train_delay);
							// spawn
							instance_create_layer(enemy_spawn_location_x,enemy_spawn_location_y,"NPCs",obj_arbalest_enemy);
						
						}
						// are we able to train ranger?
						if (alarm[2] <= 0 && global.enemy_gold_amount >= global.unit_ranger_cost && can_train_rg == true && global.player_unit_count_enemy < global.player_unit_cap){
							// alarm is at 0s, and we have the funds, and this unit is available.
							// Debug
							ai_choice = "Counter P. SM + Range, training ranger";
							
							// Detract cost from ai pocket
							global.enemy_gold_amount -= global.unit_ranger_cost;
							alarm_set(2,ai_rg_train_delay);
							// spawn
							// replace with enemy ranger unit once that is completed.
							instance_create_layer(enemy_spawn_location_x,enemy_spawn_location_y,"NPCs",obj_ranger_enemy);
						
						}
					}
					// We can train melee units
					else {
						// Debug
						ai_choice = "def. army. 1. not poss. training melee";
						
						// Train these units in upper most priority (most expensive to least expensive)
						// Halberd training
						if (alarm[5] <= 0 && global.enemy_gold_amount >= global.unit_halberd_cost && can_train_hb == true && global.player_unit_count_enemy < global.player_unit_cap){
							// alarm is at 0s, and we have the funds, and this unit is available.
							// Debug
							ai_choice = "Counter P. SM, training halberdier";
							
							// Detract cost from ai pocket
							global.enemy_gold_amount -= global.unit_halberd_cost;
							alarm_set(5,ai_hb_train_delay);
							// spawn
							// replace with enemy ranger unit once that is completed.
							instance_create_layer(enemy_spawn_location_x,enemy_spawn_location_y,"NPCs",obj_halberdier_enemy);
						
						}
						// Knight training
						if (alarm[3] <= 0 && global.enemy_gold_amount >= global.unit_knight_cost && can_train_kn == true && global.player_unit_count_enemy < global.player_unit_cap){
							// alarm is at 0s, and we have the funds, and this unit is available.
							// Debug
							ai_choice = "Counter P. SM, training knight";
							
							// Detract cost from ai pocket
							global.enemy_gold_amount -= global.unit_knight_cost;
							alarm_set(3,ai_kn_train_delay);
							// spawn
							// replace with enemy ranger unit once that is completed.
							instance_create_layer(enemy_spawn_location_x,enemy_spawn_location_y,"NPCs",obj_knight_enemy);
						
						}
						// pikeman training
						if (alarm[1] <= 0 && global.enemy_gold_amount >= global.unit_pikeman_cost && can_train_pm == true && global.player_unit_count_enemy < global.player_unit_cap){
							// alarm is at 0s, and we have the funds, and this unit is available.
							// Debug
							ai_choice = "Counter P. SM, training pikeman";
							
							// Detract cost from ai pocket
							global.enemy_gold_amount -= global.unit_pikeman_cost;
							alarm_set(1,ai_pm_train_delay);
							// spawn
							// replace with enemy ranger unit once that is completed.
							instance_create_layer(enemy_spawn_location_x,enemy_spawn_location_y,"NPCs",obj_pikeman_enemy);
						
						}
						// swordman training
						if (alarm[0] <= 0 && global.enemy_gold_amount >= global.unit_swordman_cost && can_train_sm == true && global.player_unit_count_enemy < global.player_unit_cap){
							// alarm is at 0s, and we have the funds, and this unit is available.
							// Debug
							ai_choice = "Counter P. SM, training swordman";
						
							// Detract cost from ai pocket
							global.enemy_gold_amount -= global.unit_swordman_cost;
							alarm_set(0,ai_sm_train_delay);
							// spawn
							// replace with enemy ranger unit once that is completed.
							instance_create_layer(enemy_spawn_location_x,enemy_spawn_location_y,"NPCs",obj_swordman_enemy);
						
						}
					
					}
				
				}
			
			}
			else if (ai_type == 4){
				// trash army
				// Here we spawn a cheap army to get population quicker
				// spawn Swordmen, pikeman, and rangers
				// Debug
				ai_choice = "def. army. 4. Trash";
				
				if ((can_train_sm == true || can_train_pm == true) && (can_train_rg == true)){
					// We do
					// Make sure we dont train too many ranged units, so that we have a front line
					// Debug
					ai_choice = "def. army. 4. Trash: possible";
					
					if (ai_ranged_army_percent < ai_ranged_army_perc_targ && (alarm[2] <= 0)){
						// Train ranged units
						// Debug
						ai_choice = "def. army. 3. training range";
						
						// Train arbalest in highest priority
						// then train ranger in next highest priority
						// are we able to train ranger?
						if (alarm[2] <= 0 && global.enemy_gold_amount >= global.unit_ranger_cost && can_train_rg == true && global.player_unit_count_enemy < global.player_unit_cap){
							// alarm is at 0s, and we have the funds, and this unit is available.
							// Debug
							ai_choice = "Counter P. SM + Range, training ranger";
							
							// Detract cost from ai pocket
							global.enemy_gold_amount -= global.unit_ranger_cost;
							alarm_set(2,ai_rg_train_delay);
							// spawn
							// replace with enemy ranger unit once that is completed.
							instance_create_layer(enemy_spawn_location_x,enemy_spawn_location_y,"NPCs",obj_ranger_enemy);
						
						}
					}
					// We can train melee units
					else {
						// Debug
						ai_choice = "def. army. 4. training melee";
						
						// pikeman training
						if (alarm[1] <= 0 && global.enemy_gold_amount >= global.unit_pikeman_cost && can_train_pm == true && global.player_unit_count_enemy < global.player_unit_cap){
							// alarm is at 0s, and we have the funds, and this unit is available.
							// Debug
							ai_choice = "Counter P. SM, training pikeman";
							
							// Detract cost from ai pocket
							global.enemy_gold_amount -= global.unit_pikeman_cost;
							alarm_set(1,ai_pm_train_delay);
							// spawn
							// replace with enemy ranger unit once that is completed.
							instance_create_layer(enemy_spawn_location_x,enemy_spawn_location_y,"NPCs",obj_pikeman_enemy);
						
						}
						// swordman training
						if (alarm[0] <= 0 && global.enemy_gold_amount >= global.unit_swordman_cost && can_train_sm == true && global.player_unit_count_enemy < global.player_unit_cap){
							// alarm is at 0s, and we have the funds, and this unit is available.
							// Debug
							ai_choice = "Counter P. SM, training swordman";
						
							// Detract cost from ai pocket
							global.enemy_gold_amount -= global.unit_swordman_cost;
							alarm_set(0,ai_sm_train_delay);
							// spawn
							// replace with enemy ranger unit once that is completed.
							instance_create_layer(enemy_spawn_location_x,enemy_spawn_location_y,"NPCs",obj_swordman_enemy);
						
						}
					}
				
				}
				else {
					// We do NOT
					// Just train anything you have available
					ai_choice = "def. army. 4. Trash not poss. Use Assorted Army";
					
					if ((ai_ranged_army_percent < ai_ranged_army_perc_targ) && (alarm[4] <= 0 || alarm[2] <= 0 || alarm[10] <= 0) && (can_train_rg == true || can_train_ab == true) 
					&& (can_train_hb == true || can_train_kn == true || can_train_pm == true || can_train_sm == true)){
						// Train ranged units
						// Debug
						ai_choice = "def. army. 1. not poss. training range";
						
						// Train arbalest in highest priority
						// then train ranger in next highest priority
						// are we able to train an arbalest? if so, train one
						if (alarm[4] <= 0 && global.enemy_gold_amount >= global.unit_arbalest_cost && can_train_ab == true && global.player_unit_count_enemy < global.player_unit_cap){
							// alarm is at 0s, and we have the funds, and this unit is available.
							// Debug
							ai_choice = "Counter P. SM + Range, training arbalest";
							
							// Detract cost from ai pocket
							global.enemy_gold_amount -= global.unit_arbalest_cost;
							alarm_set(4,ai_ab_train_delay);
							// spawn
							instance_create_layer(enemy_spawn_location_x,enemy_spawn_location_y,"NPCs",obj_arbalest_enemy);
						
						}
						// are we able to train ranger?
						if (alarm[2] <= 0 && global.enemy_gold_amount >= global.unit_ranger_cost && can_train_rg == true && global.player_unit_count_enemy < global.player_unit_cap){
							// alarm is at 0s, and we have the funds, and this unit is available.
							// Debug
							ai_choice = "Counter P. SM + Range, training ranger";
							
							// Detract cost from ai pocket
							global.enemy_gold_amount -= global.unit_ranger_cost;
							alarm_set(2,ai_rg_train_delay);
							// spawn
							// replace with enemy ranger unit once that is completed.
							instance_create_layer(enemy_spawn_location_x,enemy_spawn_location_y,"NPCs",obj_ranger_enemy);
						
						}
					}
					// If we do not have access to ANY melee units, just train ranged units without caring for range army % targets.
					else if ((alarm[4] <= 0 || alarm[2] <= 0 || alarm[10] <= 0) && (can_train_rg == true || can_train_ab == true) && can_train_hb == false && can_train_kn == false && can_train_pm == false && can_train_sm == false){
						// Train ranged units
						// Debug
						ai_choice = "cntr. army. Range. not poss. training range";
					
						// Train arbalest in highest priority
						// then train ranger in next highest priority
						// are we able to train an arbalest? if so, train one
						if (alarm[4] <= 0 && global.enemy_gold_amount >= global.unit_arbalest_cost && can_train_ab == true && global.player_unit_count_enemy < global.player_unit_cap){
							// alarm is at 0s, and we have the funds, and this unit is available.
							// Debug
							ai_choice = "Counter P. SM + Range, training arbalest";
						
							// Detract cost from ai pocket
							global.enemy_gold_amount -= global.unit_arbalest_cost;
							alarm_set(4,ai_ab_train_delay);
							// spawn
							instance_create_layer(enemy_spawn_location_x,enemy_spawn_location_y,"NPCs",obj_arbalest_enemy);
						
						}
						// are we able to train ranger?
						if (alarm[2] <= 0 && global.enemy_gold_amount >= global.unit_ranger_cost && can_train_rg == true && global.player_unit_count_enemy < global.player_unit_cap){
							// alarm is at 0s, and we have the funds, and this unit is available.
							// Debug
							ai_choice = "Counter P. SM + Range, training ranger";
							
							// Detract cost from ai pocket
							global.enemy_gold_amount -= global.unit_ranger_cost;
							alarm_set(2,ai_rg_train_delay);
							// spawn
							// replace with enemy ranger unit once that is completed.
							instance_create_layer(enemy_spawn_location_x,enemy_spawn_location_y,"NPCs",obj_ranger_enemy);
						
						}
					}
						// We can train melee units 
					else {
						// Debug
						ai_choice = "def. army. 4. not poss. training melee";
						
						// Train these units in upper most priority (most expensive to least expensive)
						// Halberd training
						if (alarm[5] <= 0 && global.enemy_gold_amount >= global.unit_halberd_cost && can_train_hb == true && global.player_unit_count_enemy < global.player_unit_cap){
							// alarm is at 0s, and we have the funds, and this unit is available.
							// Debug
							ai_choice = "Counter P. SM, training halberdier";
							
							// Detract cost from ai pocket
							global.enemy_gold_amount -= global.unit_halberd_cost;
							alarm_set(5,ai_hb_train_delay);
							// spawn
							// replace with enemy ranger unit once that is completed.
							instance_create_layer(enemy_spawn_location_x,enemy_spawn_location_y,"NPCs",obj_halberdier_enemy);
						
						}
						// Knight training
						if (alarm[3] <= 0 && global.enemy_gold_amount >= global.unit_knight_cost && can_train_kn == true && global.player_unit_count_enemy < global.player_unit_cap){
							// alarm is at 0s, and we have the funds, and this unit is available.
							// Debug
							ai_choice = "Counter P. SM, training knight";
							
							// Detract cost from ai pocket
							global.enemy_gold_amount -= global.unit_knight_cost;
							alarm_set(3,ai_kn_train_delay);
							// spawn
							// replace with enemy ranger unit once that is completed.
							instance_create_layer(enemy_spawn_location_x,enemy_spawn_location_y,"NPCs",obj_knight_enemy);
						
						}
						// pikeman training
						if (alarm[1] <= 0 && global.enemy_gold_amount >= global.unit_pikeman_cost && can_train_pm == true && global.player_unit_count_enemy < global.player_unit_cap){
							// alarm is at 0s, and we have the funds, and this unit is available.
							// Debug
							ai_choice = "Counter P. SM, training pikeman";
							
							// Detract cost from ai pocket
							global.enemy_gold_amount -= global.unit_pikeman_cost;
							alarm_set(1,ai_pm_train_delay);
							// spawn
							// replace with enemy ranger unit once that is completed.
							instance_create_layer(enemy_spawn_location_x,enemy_spawn_location_y,"NPCs",obj_pikeman_enemy);
						
						}
						// swordman training
						if (alarm[0] <= 0 && global.enemy_gold_amount >= global.unit_swordman_cost && can_train_sm == true && global.player_unit_count_enemy < global.player_unit_cap){
							// alarm is at 0s, and we have the funds, and this unit is available.
							// Debug
							ai_choice = "Counter P. SM, training swordman";
						
							// Detract cost from ai pocket
							global.enemy_gold_amount -= global.unit_swordman_cost;
							alarm_set(0,ai_sm_train_delay);
							// spawn
							// replace with enemy ranger unit once that is completed.
							instance_create_layer(enemy_spawn_location_x,enemy_spawn_location_y,"NPCs",obj_swordman_enemy);
						
						}
					
					}
				
				}
			
			}
			else if (ai_type == 5){
				// Assorted
				ai_choice = "def. army. 5. Use Assorted Army";
					
				if ((ai_ranged_army_percent < ai_ranged_army_perc_targ) && (alarm[4] <= 0 || alarm[2] <= 0 || alarm[10] <= 0) && (can_train_rg == true || can_train_ab == true) 
					&& (can_train_hb == true || can_train_kn == true || can_train_pm == true || can_train_sm == true)){
					// Train ranged units
					// Debug
					ai_choice = "def. army. 1. not poss. training range";
						
					// Train arbalest in highest priority
					// then train ranger in next highest priority
					// are we able to train an arbalest? if so, train one
					if (alarm[4] <= 0 && global.enemy_gold_amount >= global.unit_arbalest_cost && can_train_ab == true && global.player_unit_count_enemy < global.player_unit_cap){
							// alarm is at 0s, and we have the funds, and this unit is available.
							// Debug
							ai_choice = "Counter P. SM + Range, training arbalest";
							
							// Detract cost from ai pocket
							global.enemy_gold_amount -= global.unit_arbalest_cost;
							alarm_set(4,ai_ab_train_delay);
							// spawn
							instance_create_layer(enemy_spawn_location_x,enemy_spawn_location_y,"NPCs",obj_arbalest_enemy);
						
						}
					// are we able to train ranger?
					if (alarm[2] <= 0 && global.enemy_gold_amount >= global.unit_ranger_cost && can_train_rg == true && global.player_unit_count_enemy < global.player_unit_cap){
							// alarm is at 0s, and we have the funds, and this unit is available.
							// Debug
							ai_choice = "Counter P. SM + Range, training ranger";
							
							// Detract cost from ai pocket
							global.enemy_gold_amount -= global.unit_ranger_cost;
							alarm_set(2,ai_rg_train_delay);
							// spawn
							// replace with enemy ranger unit once that is completed.
							instance_create_layer(enemy_spawn_location_x,enemy_spawn_location_y,"NPCs",obj_ranger_enemy);
						
						}
				}
				else if ((alarm[4] <= 0 || alarm[2] <= 0 || alarm[10] <= 0) && (can_train_rg == true || can_train_ab == true) && can_train_hb == false && can_train_kn == false && can_train_pm == false && can_train_sm == false){
						// Train ranged units
						// Debug
						ai_choice = "cntr. army. Range. not poss. training range";
					
						// Train arbalest in highest priority
						// then train ranger in next highest priority
						// are we able to train an arbalest? if so, train one
						if (alarm[4] <= 0 && global.enemy_gold_amount >= global.unit_arbalest_cost && can_train_ab == true && global.player_unit_count_enemy < global.player_unit_cap){
							// alarm is at 0s, and we have the funds, and this unit is available.
							// Debug
							ai_choice = "Counter P. SM + Range, training arbalest";
						
							// Detract cost from ai pocket
							global.enemy_gold_amount -= global.unit_arbalest_cost;
							alarm_set(4,ai_ab_train_delay);
							// spawn
							instance_create_layer(enemy_spawn_location_x,enemy_spawn_location_y,"NPCs",obj_arbalest_enemy);
						
						}
						// are we able to train ranger?
						if (alarm[2] <= 0 && global.enemy_gold_amount >= global.unit_ranger_cost && can_train_rg == true && global.player_unit_count_enemy < global.player_unit_cap){
							// alarm is at 0s, and we have the funds, and this unit is available.
							// Debug
							ai_choice = "Counter P. SM + Range, training ranger";
							
							// Detract cost from ai pocket
							global.enemy_gold_amount -= global.unit_ranger_cost;
							alarm_set(2,ai_rg_train_delay);
							// spawn
							// replace with enemy ranger unit once that is completed.
							instance_create_layer(enemy_spawn_location_x,enemy_spawn_location_y,"NPCs",obj_ranger_enemy);
						
						}
					}
				// We can train melee units
				else {
					// Debug
					ai_choice = "def. army. 1. not poss. training melee";
						
					// Train these units in upper most priority (most expensive to least expensive)
					// Halberd training
					if (alarm[5] <= 0 && global.enemy_gold_amount >= global.unit_halberd_cost && can_train_hb == true && global.player_unit_count_enemy < global.player_unit_cap){
							// alarm is at 0s, and we have the funds, and this unit is available.
							// Debug
							ai_choice = "Counter P. SM, training halberdier";
							
							// Detract cost from ai pocket
							global.enemy_gold_amount -= global.unit_halberd_cost;
							alarm_set(5,ai_hb_train_delay);
							// spawn
							// replace with enemy ranger unit once that is completed.
							instance_create_layer(enemy_spawn_location_x,enemy_spawn_location_y,"NPCs",obj_halberdier_enemy);
						
						}
					// Knight training
					if (alarm[3] <= 0 && global.enemy_gold_amount >= global.unit_knight_cost && can_train_kn == true && global.player_unit_count_enemy < global.player_unit_cap){
							// alarm is at 0s, and we have the funds, and this unit is available.
							// Debug
							ai_choice = "Counter P. SM, training knight";
							
							// Detract cost from ai pocket
							global.enemy_gold_amount -= global.unit_knight_cost;
							alarm_set(3,ai_kn_train_delay);
							// spawn
							// replace with enemy ranger unit once that is completed.
							instance_create_layer(enemy_spawn_location_x,enemy_spawn_location_y,"NPCs",obj_knight_enemy);
						
						}
					// pikeman training
					if (alarm[1] <= 0 && global.enemy_gold_amount >= global.unit_pikeman_cost && can_train_pm == true && global.player_unit_count_enemy < global.player_unit_cap){
							// alarm is at 0s, and we have the funds, and this unit is available.
							// Debug
							ai_choice = "Counter P. SM, training pikeman";
							
							// Detract cost from ai pocket
							global.enemy_gold_amount -= global.unit_pikeman_cost;
							alarm_set(1,ai_pm_train_delay);
							// spawn
							// replace with enemy ranger unit once that is completed.
							instance_create_layer(enemy_spawn_location_x,enemy_spawn_location_y,"NPCs",obj_pikeman_enemy);
						
						}
					// swordman training
					if (alarm[0] <= 0 && global.enemy_gold_amount >= global.unit_swordman_cost && can_train_sm == true && global.player_unit_count_enemy < global.player_unit_cap){
							// alarm is at 0s, and we have the funds, and this unit is available.
							// Debug
							ai_choice = "Counter P. SM, training swordman";
						
							// Detract cost from ai pocket
							global.enemy_gold_amount -= global.unit_swordman_cost;
							alarm_set(0,ai_sm_train_delay);
							// spawn
							// replace with enemy ranger unit once that is completed.
							instance_create_layer(enemy_spawn_location_x,enemy_spawn_location_y,"NPCs",obj_swordman_enemy);
						
						}
					
				}
			}
			
		}
		
	}
	// We are low health, Spawn whatever you can as a last ditch effort to live
	
	else if ((ai_eco_up_save == false) && (global.player_unit_count_enemy < global.player_unit_cap) && ai_king_health <= 0.25){
		ai_choice = "AI Is training whatever it can, ASAP";
		// train whatever we can
		// Train these units in upper most priority (most expensive to least expensive)
		if (alarm[10] <= 0 && global.enemy_gold_amount >= global.unit_magician_cost && can_train_mg == true && global.player_unit_count_enemy < global.player_unit_cap){
						// alarm is at 0s, and we have the funds, and this unit is available.
						// Debug
						ai_choice = "Counter P. SM + Range, training magician";
						
						// Detract cost from ai pocket
						global.enemy_gold_amount -= global.unit_magician_cost;
						alarm_set(10,ai_mg_train_delay);
						// spawn
						// replace with enemy ranger unit once that is completed.
						instance_create_layer(enemy_spawn_location_x,enemy_spawn_location_y,"NPCs",obj_magician_enemy);
						
					}
		if (alarm[11] <= 0 && global.enemy_gold_amount >= global.unit_necromancer_cost && can_train_nc == true && global.player_unit_count_enemy < global.player_unit_cap){
						// alarm is at 0s, and we have the funds, and this unit is available.
						// Debug
						ai_choice = "Counter P. SM + Range, training magician";
						
						// Detract cost from ai pocket
						global.enemy_gold_amount -= global.unit_necromancer_cost;
						alarm_set(11,ai_nc_train_delay);
						// spawn
						// replace with enemy ranger unit once that is completed.
						instance_create_layer(enemy_spawn_location_x,enemy_spawn_location_y,"NPCs",obj_necromancer_enemy);
						
					}
		// Halberd training
		if (alarm[5] <= 0 && global.enemy_gold_amount >= global.unit_halberd_cost && can_train_hb == true && global.player_unit_count_enemy < global.player_unit_cap){
						// alarm is at 0s, and we have the funds, and this unit is available.
						// Debug
						ai_choice = "Counter P. SM + Range, training halberdier";
							
						// Detract cost from ai pocket
						global.enemy_gold_amount -= global.unit_halberd_cost;
						alarm_set(5,ai_hb_train_delay);
						// spawn
						// replace with enemy ranger unit once that is completed.
						instance_create_layer(enemy_spawn_location_x,enemy_spawn_location_y,"NPCs",obj_halberdier_enemy);
						
					}
		// Knight training
		if (alarm[3] <= 0 && global.enemy_gold_amount >= global.unit_knight_cost && can_train_kn == true && global.player_unit_count_enemy < global.player_unit_cap){
						// alarm is at 0s, and we have the funds, and this unit is available.
						// Debug
						ai_choice = "Counter P. SM + Range, training knight";
							
						// Detract cost from ai pocket
						global.enemy_gold_amount -= global.unit_knight_cost;
						alarm_set(3,ai_kn_train_delay);
						// spawn
						// replace with enemy ranger unit once that is completed.
						instance_create_layer(enemy_spawn_location_x,enemy_spawn_location_y,"NPCs",obj_knight_enemy);
						
					}
		if (alarm[4] <= 0 && global.enemy_gold_amount >= global.unit_arbalest_cost && can_train_ab == true && global.player_unit_count_enemy < global.player_unit_cap){
							// alarm is at 0s, and we have the funds, and this unit is available.
							// Debug
							ai_choice = "Counter P. SM + Range, training arbalest";
							
							// Detract cost from ai pocket
							global.enemy_gold_amount -= global.unit_arbalest_cost;
							alarm_set(4,ai_ab_train_delay);
							// spawn
							instance_create_layer(enemy_spawn_location_x,enemy_spawn_location_y,"NPCs",obj_arbalest_enemy);
						
						}
		// are we able to train ranger?
		if (alarm[2] <= 0 && global.enemy_gold_amount >= global.unit_ranger_cost && can_train_rg == true && global.player_unit_count_enemy < global.player_unit_cap){
							// alarm is at 0s, and we have the funds, and this unit is available.
							// Debug
							ai_choice = "Counter P. SM + Range, training ranger";
							
							// Detract cost from ai pocket
							global.enemy_gold_amount -= global.unit_ranger_cost;
							alarm_set(2,ai_rg_train_delay);
							// spawn
							// replace with enemy ranger unit once that is completed.
							instance_create_layer(enemy_spawn_location_x,enemy_spawn_location_y,"NPCs",obj_ranger_enemy);
						
						}
		// pikeman training
		if (alarm[1] <= 0 && global.enemy_gold_amount >= global.unit_pikeman_cost && can_train_pm == true && global.player_unit_count_enemy < global.player_unit_cap){
						// alarm is at 0s, and we have the funds, and this unit is available.
						// Debug
						ai_choice = "Counter P. SM + Range, training pikeman";
							
						// Detract cost from ai pocket
						global.enemy_gold_amount -= global.unit_pikeman_cost;
						alarm_set(1,ai_pm_train_delay);
						// spawn
						// replace with enemy ranger unit once that is completed.
						instance_create_layer(enemy_spawn_location_x,enemy_spawn_location_y,"NPCs",obj_pikeman_enemy);
						
					}
		// swordman training
		if (alarm[0] <= 0 && global.enemy_gold_amount >= global.unit_swordman_cost && can_train_sm == true && global.player_unit_count_enemy < global.player_unit_cap){
						// alarm is at 0s, and we have the funds, and this unit is available.
						// Debug
						ai_choice = "Counter P. SM + Range, training swordman";
						
						// Detract cost from ai pocket
						global.enemy_gold_amount -= global.unit_swordman_cost;
						alarm_set(0,ai_sm_train_delay);
						// spawn
						// replace with enemy ranger unit once that is completed.
						instance_create_layer(enemy_spawn_location_x,enemy_spawn_location_y,"NPCs",obj_swordman_enemy);
						
					}
	}
	
	// Here is where we handle eco upgrades
	// If we are saving up, hence ai_eco_upgrade != false
	// that means we are going to save up and buy eco upgrades
	// first determine what level of eco we are on
	if (ai_eco_lv == 0 && ai_eco_up_save == true){
		
		// Debug purposes
		ai_choice = "AI wants to save up for economy upgrade";
		
		if (global.enemy_gold_amount >= global.econ_up_cost_lv_0){
			ai_eco_lv += 1; // raise eco level
			global.enemy_gold_amount -= global.econ_up_cost_lv_0; // charge the ai upgrade cost
			ai_eco_up_save = false; // toggle back to off
	
		}
	
	}
	else if (ai_eco_lv == 1 && ai_eco_up_save == true){
		
		// Debug purposes
		ai_choice = "AI wants to save up for economy upgrade";
		
		if (global.enemy_gold_amount >= global.econ_up_cost_lv_1){
			ai_eco_lv += 1; // raise eco level
			global.enemy_gold_amount -= global.econ_up_cost_lv_1; // charge the ai upgrade cost
			ai_eco_up_save = false; // toggle back to off
	
		}
		
	}	
	else if (ai_eco_lv == 2 && ai_eco_up_save == true){
		
		// Debug purposes
		ai_choice = "AI wants to save up for economy upgrade";
		
		if (global.enemy_gold_amount >= global.econ_up_cost_lv_2){
			ai_eco_lv += 1; // raise eco level
			global.enemy_gold_amount -= global.econ_up_cost_lv_2; // charge the ai upgrade cost
			ai_eco_up_save = false; // toggle back to off
	
		}
		
	}
	else if (ai_eco_lv == 3 && ai_eco_up_save == true){
		
		// Debug purposes
		ai_choice = "AI wants to save up for economy upgrade";
		
		if (global.enemy_gold_amount >= global.econ_up_cost_lv_3){
			ai_eco_lv += 1; // raise eco level
			global.enemy_gold_amount -= global.econ_up_cost_lv_3; // charge the ai upgrade cost
			ai_eco_up_save = false; // toggle back to off
	
		}
		
	}
	else if (ai_eco_lv == 4 && ai_eco_up_save == true){
		
		// Debug purposes
		ai_choice = "AI wants to save up for economy upgrade";
		
		if (global.enemy_gold_amount >= global.econ_up_cost_lv_4){
			ai_eco_lv += 1; // raise eco level
			global.enemy_gold_amount -= global.econ_up_cost_lv_4; // charge the ai upgrade cost
			ai_eco_up_save = false; // toggle back to off
	
		}
		
	}
	else if (ai_eco_lv == 5 && ai_eco_up_save == true){
		
		// Debug purposes
		ai_choice = "AI wants to save up for economy upgrade";
		
		if (global.enemy_gold_amount >= global.econ_up_cost_lv_5){
			ai_eco_lv += 1; // raise eco level
			global.enemy_gold_amount -= global.econ_up_cost_lv_5; // charge the ai upgrade cost
			ai_eco_up_save = false; // toggle back to off
	
		}
		
	}
	else if (ai_eco_lv == 6 && ai_eco_up_save == true){
		
		// Debug purposes
		ai_choice = "AI wants to save up for economy upgrade";
		
		if (global.enemy_gold_amount >= global.econ_up_cost_lv_6){
			ai_eco_lv += 1; // raise eco level
			global.enemy_gold_amount -= global.econ_up_cost_lv_6; // charge the ai upgrade cost
			ai_eco_up_save = false; // toggle back to off
	
		}
		
	}
	
	// Here is where we handle orders
	// Do not update ai army order until a certain threshold of time passes
	if ((ai_restrict_attack_order == false) && (ai_patience > 0)){
		// Army matchups
		// Situation 1:
		// Player is ranged army type
		if (p_army_range_to_melee_ratio > cntr_p_army_range_thres){
			// Debug
			ai_order_situation = "Sit, 1";
			// If the AI has access to knights or halberdiers
			if ((can_train_kn == true || can_train_hb == true) && (ai_kn_amount || ai_hb_amount > 0)){
				if ((global.player_unit_count >= ((ai_kn_amount + ai_hb_amount) * 10.0) && (ai_king_health > ai_retr_cutoff_perc)) && (global.player_order == 2)){
					// If the player has 10x the amount of knights and halberdiers
					// AND King health is greater than 30%
					// Retreat
					global.enemy_order = 0; // Retreat
		
				}
				else if (global.player_unit_count >= ((ai_kn_amount + ai_hb_amount) * 7.5)){
					// If the player has 7.5x the amount of knights and halberdiers
					// Defend
					global.enemy_order = 1; // Defend
					
				}
				else if (global.player_unit_count < ((ai_kn_amount + ai_hb_amount) * 7.5)){
					// If the player has less than 7.5x the amount of ai knights and halberdiers
					// Defend
					global.enemy_order = 2; // Attack
		
				}
				else {
					// No situation applies, attack
					global.enemy_order = 2; // Attack
				
				}
	
			}
			// If the AI does not have access to knights, but does have access to swordmen and pikemen
			else if ((can_train_pm == true || can_train_sm == true) && (ai_pm_amount || ai_sm_amount > 0)){
				if ((global.player_unit_count >= ((ai_sm_amount + ai_pm_amount) * 4.0) && (ai_king_health > ai_retr_cutoff_perc)) && (global.player_order == 2)){
					// If the player has 4x the amount of swordmen and pikemen
					// AND King health is greater than 30%
					// Retreat
					global.enemy_order = 0; // Retreat
		
				}
				else if (global.player_unit_count >= ((ai_sm_amount + ai_pm_amount) * 2.0)){
					// If the player has 2x the amount of swordmen and pikemen
					// Defend
					global.enemy_order = 1; // Defend
					
				}
				else if (global.player_unit_count < ((ai_sm_amount + ai_pm_amount) * 2.0)){
					// If the player has less than 2x the amount of ai swordmen and pikemen
					// Defend
					global.enemy_order = 2; // Attack
		
				}
				else {
					// No situation applies, attack
					global.enemy_order = 2; // Attack
				
				}
			
			}
			// ai only has access to magicians
			else if ((can_train_mg == true) && (can_train_sm == false && can_train_pm == false && can_train_rg == false && can_train_kn == false && can_train_ab == false && can_train_hb == false)){
				// since we are going against range, but have no other unit types, just always attack
				// cant afford to let the player build range
				global.enemy_order = 2;
			}
			// ai only has access to ranged units
			else {
				if ((global.player_unit_count >= ((ai_rg_amount + ai_ab_amount) * 2.0) && (ai_king_health > ai_retr_cutoff_perc)) && (global.player_order == 2)){
					// If the player has 2x the amount of rangers and arbalests
					// AND King health is greater than 30%
					// Retreat
					global.enemy_order = 0; // Retreat
		
				}
				else if (global.player_unit_count >= ((ai_rg_amount + ai_ab_amount) * 1.0)){
					// If the player has 1x the amount of rangers and arbalests
					// Defend
					global.enemy_order = 1; // Defend
					
				}
				else if (global.player_unit_count < ((ai_rg_amount + ai_ab_amount) * 1.0)){
					// If the player has less than 1x the amount of ai rangers and arbalests
					// Defend
					global.enemy_order = 2; // Attack
		
				}
				else {
					// No situation applies, attack
					global.enemy_order = 2; // Attack
				
				}
			
			
			}
		
		}
		
		// Situation 2: 
		// Player is swords army type
		else if (p_sm_to_army_ratio > cntr_p_army_sm_thres){
			// Debug
			ai_order_situation = "Sit. 2";
			// If the AI has access to knights or halberdiers
			if ((can_train_kn == true || can_train_hb == true) && (ai_kn_amount || ai_hb_amount > 0)){
				if ((global.player_unit_count >= ((ai_kn_amount + ai_hb_amount) * 10.0) && (ai_king_health > ai_retr_cutoff_perc)) && (global.player_order == 2)){
					// If the player has 10x the amount of knights and halberdiers
					// AND King health is greater than 30%
					// Retreat
					global.enemy_order = 0; // Retreat
		
				}
				else if (global.player_unit_count >= ((ai_kn_amount + ai_hb_amount) * 5.0)){
					// If the player has 5.0x the amount of knights and halberdiers
					// Defend
					global.enemy_order = 1; // Defend
					
				}
				else if (global.player_unit_count < ((ai_kn_amount + ai_hb_amount) * 5.0)){
					// If the player has less than 5.0x the amount of ai knights and halberdiers
					// Attack
					global.enemy_order = 2; // Attack
		
				}
				else {
					// No situation applies, attack
					global.enemy_order = 2; // Attack
				
				}
	
			}
			// If the AI does not have access to knights, but does have access to swordmen and pikemen
			else if ((can_train_pm == true || can_train_sm == true) && (ai_pm_amount || ai_sm_amount > 0)){
				if ((global.player_unit_count >= ((ai_sm_amount + ai_pm_amount) * 2.0) && (ai_king_health > ai_retr_cutoff_perc)) && (global.player_order == 2)){
					// If the player has 2x the amount of swordmen and pikemen
					// AND King health is greater than 30%
					// Retreat
					global.enemy_order = 0; // Retreat
		
				}
				else if (global.player_unit_count >= ((ai_sm_amount + ai_pm_amount) * 1.5)){
					// If the player has 1.5x the amount of swordmen and pikemen
					// Defend
					global.enemy_order = 1; // Defend
					
				}
				else if (global.player_unit_count < ((ai_sm_amount + ai_pm_amount) * 1.5)){
					// If the player has less than 1.5x the amount of ai swordmen and pikemen
					// Defend
					global.enemy_order = 2; // Attack
		
				}
				else {
					// No situation applies, attack
					global.enemy_order = 2; // Attack
				
				}
			
			}
			// ai only has access to magicians
			else if ((can_train_mg == true) && (can_train_sm == false && can_train_pm == false && can_train_rg == false && can_train_kn == false && can_train_ab == false && can_train_hb == false)){
				// order logic
				// player has any amount of range
				if (p_ab_amount > 0 || p_rg_amount > 0){
					// attack
					global.enemy_order = 2;
				}
				// player has no range, so you can be more choose-y
				else{
					// under what situations do we Retreat?
					// if we do not have enough troops to defend attackers
					// halberdiers
					if((p_hb_amount > 0) && (ai_mg_amount < 5) && (ai_king_health > ai_retr_cutoff_perc) && (global.player_order == 2)){
						global.enemy_order = 0;
					}
					// knights
					else if((p_kn_amount > 0) && (ai_mg_amount < 4) && (ai_king_health > ai_retr_cutoff_perc) && (global.player_order == 2)){
						global.enemy_order = 0;
					}
					// knights
					else if((p_pm_amount > 0 || p_sm_amount > 0) && (ai_mg_amount < 3) && (ai_king_health > ai_retr_cutoff_perc) && (global.player_order == 2)){
						global.enemy_order = 0;
					}
					// if player has 5 or more halberdiers and we dont have sufficient amount of magicians to defend (less than 10)
					else if((p_hb_amount > 4) && (ai_mg_amount < 10) && (ai_king_health > ai_retr_cutoff_perc) && (global.player_order == 2)){
						global.enemy_order = 0;
					}
					// if player has 10 or more knights and we dont have sufficient amount of magicians to defend (less than 7)
					else if((p_kn_amount > 10) && (ai_mg_amount < 7) && (ai_king_health > ai_retr_cutoff_perc) && (global.player_order == 2)){
						global.enemy_order = 0;
					}
					// if player has 15 or more pikemen and we dont have sufficient amount of magicians to defend (less than 5)
					else if((p_pm_amount > 14) && (ai_mg_amount < 5) && (ai_king_health > ai_retr_cutoff_perc) && (global.player_order == 2)){
						global.enemy_order = 0;
					}
					// if player has 15 or more swordmen and we dont have sufficient amount of magicians to defend (less than 3)
					else if((p_sm_amount > 14) && (ai_mg_amount < 3) && (ai_king_health > ai_retr_cutoff_perc) && (global.player_order == 2)){
						global.enemy_order = 0;
					}
					// under which situation do we defend?
					// the next four are the same as above, but player is not attacking
					else if((p_hb_amount > 4) && (ai_mg_amount < 10) && (ai_king_health > ai_def_cutoff_perc) && (global.player_order != 2)){
						global.enemy_order = 1;
					}
					// if player has 10 or more knights and we dont have sufficient amount of magicians to defend (less than 7)
					else if((p_kn_amount > 10) && (ai_mg_amount < 7) && (ai_king_health > ai_def_cutoff_perc) && (global.player_order != 2)){
						global.enemy_order = 1;
					}
					// if player has 15 or more pikemen and we dont have sufficient amount of magicians to defend (less than 5)
					else if((p_pm_amount > 14) && (ai_mg_amount < 5) && (ai_king_health > ai_def_cutoff_perc) && (global.player_order != 2)){
						global.enemy_order = 1;
					}
					// if player has 15 or more swordmen and we dont have sufficient amount of magicians to defend (less than 3)
					else if((p_sm_amount > 14) && (ai_mg_amount < 3) && (ai_king_health > ai_def_cutoff_perc) && (global.player_order != 2)){
						global.enemy_order = 1;
					}
					// if player has at least 1 swordmen and we do not have enough magicians
					else if((p_sm_amount > 0) && (ai_mg_amount < 2)){
						global.enemy_order = 1;
					}
					// if player has at least 1 pikeman and we do not have enough magicians
					else if((p_pm_amount > 0) && (ai_mg_amount < 3)){
						global.enemy_order = 1;
					}	
					// if player has at least 1 knight and we do not have enough magicians
					else if((p_kn_amount > 0) && (ai_mg_amount < 5)){
						global.enemy_order = 1;
					}
					// if player has at least 1 halberdier and we do not have enough magicians
					else if((p_hb_amount > 0) && (ai_mg_amount < 7)){
						global.enemy_order = 1;
					}
					// if nothing applies, you can attack
					else{
						global.enemy_order = 2;
					}
				
				}
			}
			// ai only has access to ranged units
			else {
				if ((global.player_unit_count >= ((ai_rg_amount + ai_ab_amount) * 2.0) && (ai_king_health > ai_retr_cutoff_perc)) && (global.player_order == 2)){
					// If the player has 3x the amount of rangers and arbalests
					// AND king health is higher than 30%
					// Retreat
					global.enemy_order = 0; // Retreat
		
				}
				else if ((global.player_unit_count >= ((ai_rg_amount + ai_ab_amount) * 1.5)) && ((ai_rg_amount + ai_ab_amount) < (global.player_unit_cap * 0.5))
					&& (global.player_order == 2)){
					// If the player has 2x the amount of rangers and arbalests
					// AND the ai has less than 50% army capacity filled with range
					// AND player is on attack order
					// Defend
					global.enemy_order = 1; // Defend
					
				}
				else if((global.player_unit_count >= ((ai_rg_amount + ai_ab_amount) * 1.25)) && ((p_rg_amount + p_ab_amount) > 0)){
					// If player has 1.25x amount units the amount of rangers and arbalests ai has
					// AND has ranged units
					global.enemy_order = 1; // Defend
				
				}
				else if (global.player_unit_count < ((ai_rg_amount + ai_ab_amount) * 1.5) && ((ai_rg_amount + ai_ab_amount) > (global.player_unit_cap * 0.25))){
					// If the player has less than 2.0x the amount of ai rangers and arbalests
					// AND the ai has more than 25% army capacity filled with range
					// Attack
					global.enemy_order = 2; // Attack
		
				}
				else {
					// No situation applies, attack
					global.enemy_order = 2; // Attack
				
				}
			
			
			}
		
		}
		
		// Situation 3:
		// Player is Pikes army type
		else if (p_pm_to_army_ratio > cntr_p_army_pm_thres){
			// Debug
			ai_order_situation = "Sit. 3";
			// If the AI has access to knights or halberdiers
			if ((can_train_kn == true || can_train_hb == true) && (ai_kn_amount || ai_hb_amount > 0)){
				if ((global.player_unit_count >= ((ai_kn_amount + ai_hb_amount) * 3.0) && (ai_king_health > ai_retr_cutoff_perc)) && (global.player_order == 2)){
					// If the player has 3x the amount of knights and halberdiers
					// AND King health is greater than 30%
					// Retreat
					global.enemy_order = 0; // Retreat
		
				}
				else if (global.player_unit_count >= ((ai_kn_amount + ai_hb_amount) * 2.0)){
					// If the player has 2.0x the amount of knights and halberdiers
					// Defend
					global.enemy_order = 1; // Defend
					
				}
				else if (global.player_unit_count < ((ai_kn_amount + ai_hb_amount) * 2.0)){
					// If the player has less than 5.0x the amount of ai knights and halberdiers
					// Attack
					global.enemy_order = 2; // Attack
		
				}
				else {
					// No situation applies, attack
					global.enemy_order = 2; // Attack
				
				}
	
			}
			// If the AI does not have access to knights, but does have access to swordmen and pikemen
			else if ((can_train_pm == true || can_train_sm == true) && (ai_pm_amount || ai_sm_amount > 0)){
				if ((global.player_unit_count >= ((ai_sm_amount + ai_pm_amount) * 2.0) && (ai_king_health > ai_retr_cutoff_perc)) && (global.player_order == 2)){
					// If the player has 2x the amount of swordmen and pikemen
					// AND King health is greater than 30%
					// Retreat
					global.enemy_order = 0; // Retreat
		
				}
				else if (global.player_unit_count >= ((ai_sm_amount + ai_pm_amount) * 1.5)){
					// If the player has 1.5x the amount of swordmen and pikemen
					// Defend
					global.enemy_order = 1; // Defend
					
				}
				else if (global.player_unit_count < ((ai_sm_amount + ai_pm_amount) * 1.5)){
					// If the player has less than 1.5x the amount of ai swordmen and pikemen
					// Defend
					global.enemy_order = 2; // Attack
		
				}
				else {
					// No situation applies, attack
					global.enemy_order = 2; // Attack
				
				}
			
			}
			// ai only has access to magicians
			else if ((can_train_mg == true) && (can_train_sm == false && can_train_pm == false && can_train_rg == false && can_train_kn == false && can_train_ab == false && can_train_hb == false)){
				// order logic
				// player has any amount of range
				if (p_ab_amount > 0 || p_rg_amount > 0){
					// attack
					global.enemy_order = 2;
				}
				// player has no range, so you can be more choose-y
				else{
					// under what situations do we Retreat?
					// if we do not have enough troops to defend attackers
					// halberdiers
					if((p_hb_amount > 0) && (ai_mg_amount < 5) && (ai_king_health > ai_retr_cutoff_perc) && (global.player_order == 2)){
						global.enemy_order = 0;
					}
					// knights
					else if((p_kn_amount > 0) && (ai_mg_amount < 4) && (ai_king_health > ai_retr_cutoff_perc) && (global.player_order == 2)){
						global.enemy_order = 0;
					}
					// knights
					else if((p_pm_amount > 0 || p_sm_amount > 0) && (ai_mg_amount < 3) && (ai_king_health > ai_retr_cutoff_perc) && (global.player_order == 2)){
						global.enemy_order = 0;
					}
					// if player has 5 or more halberdiers and we dont have sufficient amount of magicians to defend (less than 10)
					else if((p_hb_amount > 4) && (ai_mg_amount < 10) && (ai_king_health > ai_retr_cutoff_perc) && (global.player_order == 2)){
						global.enemy_order = 0;
					}
					// if player has 10 or more knights and we dont have sufficient amount of magicians to defend (less than 7)
					else if((p_kn_amount > 10) && (ai_mg_amount < 7) && (ai_king_health > ai_retr_cutoff_perc) && (global.player_order == 2)){
						global.enemy_order = 0;
					}
					// if player has 15 or more pikemen and we dont have sufficient amount of magicians to defend (less than 5)
					else if((p_pm_amount > 14) && (ai_mg_amount < 5) && (ai_king_health > ai_retr_cutoff_perc) && (global.player_order == 2)){
						global.enemy_order = 0;
					}
					// if player has 15 or more swordmen and we dont have sufficient amount of magicians to defend (less than 3)
					else if((p_sm_amount > 14) && (ai_mg_amount < 3) && (ai_king_health > ai_retr_cutoff_perc) && (global.player_order == 2)){
						global.enemy_order = 0;
					}
					// under which situation do we defend?
					// the next four are the same as above, but player is not attacking
					else if((p_hb_amount > 4) && (ai_mg_amount < 10) && (ai_king_health > ai_def_cutoff_perc) && (global.player_order != 2)){
						global.enemy_order = 1;
					}
					// if player has 10 or more knights and we dont have sufficient amount of magicians to defend (less than 7)
					else if((p_kn_amount > 10) && (ai_mg_amount < 7) && (ai_king_health > ai_def_cutoff_perc) && (global.player_order != 2)){
						global.enemy_order = 1;
					}
					// if player has 15 or more pikemen and we dont have sufficient amount of magicians to defend (less than 5)
					else if((p_pm_amount > 14) && (ai_mg_amount < 5) && (ai_king_health > ai_def_cutoff_perc) && (global.player_order != 2)){
						global.enemy_order = 1;
					}
					// if player has 15 or more swordmen and we dont have sufficient amount of magicians to defend (less than 3)
					else if((p_sm_amount > 14) && (ai_mg_amount < 3) && (ai_king_health > ai_def_cutoff_perc) && (global.player_order != 2)){
						global.enemy_order = 1;
					}
					// if player has at least 1 swordmen and we do not have enough magicians
					else if((p_sm_amount > 0) && (ai_mg_amount < 2)){
						global.enemy_order = 1;
					}
					// if player has at least 1 pikeman and we do not have enough magicians
					else if((p_pm_amount > 0) && (ai_mg_amount < 3)){
						global.enemy_order = 1;
					}	
					// if player has at least 1 knight and we do not have enough magicians
					else if((p_kn_amount > 0) && (ai_mg_amount < 5)){
						global.enemy_order = 1;
					}
					// if player has at least 1 halberdier and we do not have enough magicians
					else if((p_hb_amount > 0) && (ai_mg_amount < 7)){
						global.enemy_order = 1;
					}
					// if nothing applies, you can attack
					else{
						global.enemy_order = 2;
					}
				
				}
			}
			// ai only has access to ranged units
			else {
				if ((global.player_unit_count >= ((ai_rg_amount + ai_ab_amount) * 2.0) && (ai_king_health > ai_retr_cutoff_perc)) && (global.player_order == 2)){
					// If the player has 2x the amount of rangers and arbalests
					// AND king health is higher than 30%
					// Retreat
					global.enemy_order = 0; // Retreat
		
				}
				else if ((global.player_unit_count >= ((ai_rg_amount + ai_ab_amount) * 1.25)) && ((ai_rg_amount + ai_ab_amount) < (global.player_unit_cap * 0.5))
					&& (global.player_order == 2)){
					// If the player has 1.25x the amount of rangers and arbalests
					// AND the ai has less than 50% army capacity filled with range
					// AND player is on attack order
					// Defend
					global.enemy_order = 1; // Defend
					
				}
				else if((global.player_unit_count >= ((ai_rg_amount + ai_ab_amount) * 1.1)) && ((p_rg_amount + p_ab_amount) > 0)){
					// If player has 1.1x amount units the amount of rangers and arbalests ai has
					// AND has ranged units
					global.enemy_order = 1; // Defend
				
				}
				else if (global.player_unit_count < ((ai_rg_amount + ai_ab_amount) * 1.75) && ((ai_rg_amount + ai_ab_amount) > (global.player_unit_cap * 0.25))){
					// If the player has less than 1.75x the amount of ai rangers and arbalests
					// AND the ai has more than 25% army capacity filled with range
					// Attack
					global.enemy_order = 2; // Attack
		
				}
				else {
					// No situation applies, attack
					global.enemy_order = 2; // Attack
				
				}
			
			
			}
		
		}
		
		// Situation 4: 
		// Player is knights army type
		else if (p_kn_to_army_ratio > cntr_p_army_kn_thres){
			// Debug
			ai_order_situation = "Sit. 4";
			// If the AI has access to knights or halberdiers
			if ((can_train_kn == true || can_train_hb == true) && (ai_kn_amount || ai_hb_amount > 0)){
				if ((global.player_unit_count >= ((ai_kn_amount + ai_hb_amount) * 2.0) && (ai_king_health > ai_retr_cutoff_perc)) && (global.player_order == 2)){
					// If the player has 2x the amount of knights and halberdiers
					// AND King health is greater than 30%
					// Retreat
					global.enemy_order = 0; // Retreat
		
				}
				else if (global.player_unit_count >= ((ai_kn_amount + ai_hb_amount) * 1.5)){
					// If the player has 1.5x the amount of knights and halberdiers
					// Defend
					global.enemy_order = 1; // Defend
					
				}
				else if (global.player_unit_count < ((ai_kn_amount + ai_hb_amount) * 1.5)){
					// If the player has less than 1.5x the amount of ai knights and halberdiers
					// Attack
					global.enemy_order = 2; // Attack
		
				}
				else {
					// No situation applies, attack
					global.enemy_order = 2; // Attack
				
				}
	
			}
			// If the AI does not have access to knights, but does have access to swordmen and pikemen
			else if ((can_train_pm == true || can_train_sm == true) && (ai_pm_amount || ai_sm_amount > 0)){
				if ((global.player_unit_count >= ((ai_sm_amount + ai_pm_amount) * 1.75) && (ai_king_health > ai_retr_cutoff_perc)) && (global.player_order == 2)){
					// If the player has 2x the amount of swordmen and pikemen
					// AND King health is greater than 30%
					// Retreat
					global.enemy_order = 0; // Retreat
		
				}
				else if (global.player_unit_count >= ((ai_sm_amount + ai_pm_amount) * 1.25)){
					// If the player has 1.25x the amount of swordmen and pikemen
					// Defend
					global.enemy_order = 1; // Defend
					
				}
				else if (global.player_unit_count < ((ai_sm_amount + ai_pm_amount) * 1.25)){
					// If the player has less than 1.25x the amount of ai swordmen and pikemen
					// Defend
					global.enemy_order = 2; // Attack
		
				}
				else {
					// No situation applies, attack
					global.enemy_order = 2; // Attack
				
				}
			
			}
			// ai only has access to magicians
			else if ((can_train_mg == true) && (can_train_sm == false && can_train_pm == false && can_train_rg == false && can_train_kn == false && can_train_ab == false && can_train_hb == false)){
				// order logic
				// player has any amount of range
				if (p_ab_amount > 0 || p_rg_amount > 0){
					// attack
					global.enemy_order = 2;
				}
				// player has no range, so you can be more choose-y
				else{
					// under what situations do we Retreat?
					// if we do not have enough troops to defend attackers
					// halberdiers
					if((p_hb_amount > 0) && (ai_mg_amount < 5) && (ai_king_health > ai_retr_cutoff_perc) && (global.player_order == 2)){
						global.enemy_order = 0;
					}
					// knights
					else if((p_kn_amount > 0) && (ai_mg_amount < 4) && (ai_king_health > ai_retr_cutoff_perc) && (global.player_order == 2)){
						global.enemy_order = 0;
					}
					// knights
					else if((p_pm_amount > 0 || p_sm_amount > 0) && (ai_mg_amount < 3) && (ai_king_health > ai_retr_cutoff_perc) && (global.player_order == 2)){
						global.enemy_order = 0;
					}
					// if player has 5 or more halberdiers and we dont have sufficient amount of magicians to defend (less than 10)
					else if((p_hb_amount > 4) && (ai_mg_amount < 10) && (ai_king_health > ai_retr_cutoff_perc) && (global.player_order == 2)){
						global.enemy_order = 0;
					}
					// if player has 10 or more knights and we dont have sufficient amount of magicians to defend (less than 7)
					else if((p_kn_amount > 10) && (ai_mg_amount < 7) && (ai_king_health > ai_retr_cutoff_perc) && (global.player_order == 2)){
						global.enemy_order = 0;
					}
					// if player has 15 or more pikemen and we dont have sufficient amount of magicians to defend (less than 5)
					else if((p_pm_amount > 14) && (ai_mg_amount < 5) && (ai_king_health > ai_retr_cutoff_perc) && (global.player_order == 2)){
						global.enemy_order = 0;
					}
					// if player has 15 or more swordmen and we dont have sufficient amount of magicians to defend (less than 3)
					else if((p_sm_amount > 14) && (ai_mg_amount < 3) && (ai_king_health > ai_retr_cutoff_perc) && (global.player_order == 2)){
						global.enemy_order = 0;
					}
					// under which situation do we defend?
					// the next four are the same as above, but player is not attacking
					else if((p_hb_amount > 4) && (ai_mg_amount < 10) && (ai_king_health > ai_def_cutoff_perc) && (global.player_order != 2)){
						global.enemy_order = 1;
					}
					// if player has 10 or more knights and we dont have sufficient amount of magicians to defend (less than 7)
					else if((p_kn_amount > 10) && (ai_mg_amount < 7) && (ai_king_health > ai_def_cutoff_perc) && (global.player_order != 2)){
						global.enemy_order = 1;
					}
					// if player has 15 or more pikemen and we dont have sufficient amount of magicians to defend (less than 5)
					else if((p_pm_amount > 14) && (ai_mg_amount < 5) && (ai_king_health > ai_def_cutoff_perc) && (global.player_order != 2)){
						global.enemy_order = 1;
					}
					// if player has 15 or more swordmen and we dont have sufficient amount of magicians to defend (less than 3)
					else if((p_sm_amount > 14) && (ai_mg_amount < 3) && (ai_king_health > ai_def_cutoff_perc) && (global.player_order != 2)){
						global.enemy_order = 1;
					}
					// if player has at least 1 swordmen and we do not have enough magicians
					else if((p_sm_amount > 0) && (ai_mg_amount < 2)){
						global.enemy_order = 1;
					}
					// if player has at least 1 pikeman and we do not have enough magicians
					else if((p_pm_amount > 0) && (ai_mg_amount < 3)){
						global.enemy_order = 1;
					}	
					// if player has at least 1 knight and we do not have enough magicians
					else if((p_kn_amount > 0) && (ai_mg_amount < 5)){
						global.enemy_order = 1;
					}
					// if player has at least 1 halberdier and we do not have enough magicians
					else if((p_hb_amount > 0) && (ai_mg_amount < 7)){
						global.enemy_order = 1;
					}
					// if nothing applies, you can attack
					else{
						global.enemy_order = 2;
					}
				
				}
			}
			// ai only has access to ranged units
			else {
				if ((global.player_unit_count >= ((ai_rg_amount + ai_ab_amount) * 1.0) && (ai_king_health > ai_retr_cutoff_perc)) && (global.player_order == 2)){
					// If the player has 1.0x the amount of rangers and arbalests
					// AND king health is higher than 30%
					// Retreat
					global.enemy_order = 0; // Retreat
		
				}
				else if ((global.player_unit_count >= ((ai_rg_amount + ai_ab_amount) * 0.5)) && ((ai_rg_amount + ai_ab_amount) < (global.player_unit_cap * 0.5))
					&& (global.player_order == 2)){
					// If the player has 0.5x the amount of rangers and arbalests
					// AND the ai has less than 50% army capacity filled with range
					// AND player is on attack order
					// Defend
					global.enemy_order = 1; // Defend
					
				}
				else if((global.player_unit_count >= ((ai_rg_amount + ai_ab_amount) * 0.4)) && ((p_rg_amount + p_ab_amount) > 0)){
					// If player has 0.4x amount units the amount of rangers and arbalests ai has
					// AND has ranged units
					global.enemy_order = 1; // Defend
				
				}
				else if (global.player_unit_count < ((ai_rg_amount + ai_ab_amount) * 0.75) && ((ai_rg_amount + ai_ab_amount) > (global.player_unit_cap * 0.25))){
					// If the player has less than 0.75x the amount of ai rangers and arbalests
					// AND the ai has more than 25% army capacity filled with range
					// Attack
					global.enemy_order = 2; // Attack
		
				}
				else {
					// No situation applies, attack
					global.enemy_order = 2; // Attack
				
				}
			
			
			}
		
		}
		
		// Situation 5: 
		// Player is Halberdier army type
		else if (p_hb_to_army_ratio > cntr_p_army_hb_thres){
			// Debug
			ai_order_situation = "Sit. 5";
			// If the AI has access to knights or halberdiers
			if ((can_train_kn == true || can_train_hb == true) && (ai_kn_amount || ai_hb_amount > 0)){
				if ((global.player_unit_count >= ((ai_kn_amount + ai_hb_amount) * 1.5) && (ai_king_health > ai_retr_cutoff_perc)) && (global.player_order == 2)){
					// If the player has 1.5x the amount of knights and halberdiers
					// AND King health is greater than 30%
					// Retreat
					global.enemy_order = 0; // Retreat
		
				}
				else if (global.player_unit_count >= ((ai_kn_amount + ai_hb_amount) * 1.25)){
					// If the player has 1.25x the amount of knights and halberdiers
					// Defend
					global.enemy_order = 1; // Defend
					
				}
				else if (global.player_unit_count < ((ai_kn_amount + ai_hb_amount) * 1.25)){
					// If the player has less than 1.25x the amount of ai knights and halberdiers
					// Attack
					global.enemy_order = 2; // Attack
		
				}
				else {
					// No situation applies, attack
					global.enemy_order = 2; // Attack
				
				}
	
			}
			// If the AI does not have access to knights, but does have access to swordmen and pikemen
			else if ((can_train_pm == true || can_train_sm == true) && (ai_pm_amount || ai_sm_amount > 0)){
				if ((global.player_unit_count >= ((ai_sm_amount + ai_pm_amount) * 1.25) && (ai_king_health > ai_retr_cutoff_perc)) && (global.player_order == 2)){
					// If the player has 1.25x the amount of swordmen and pikemen
					// AND King health is greater than 30%
					// Retreat
					global.enemy_order = 0; // Retreat
		
				}
				else if (global.player_unit_count >= ((ai_sm_amount + ai_pm_amount) * 1.1)){
					// If the player has 1.1x the amount of swordmen and pikemen
					// Defend
					global.enemy_order = 1; // Defend
					
				}
				else if (global.player_unit_count < ((ai_sm_amount + ai_pm_amount) * 1.1)){
					// If the player has less than 1.1x the amount of ai swordmen and pikemen
					// Defend
					global.enemy_order = 2; // Attack
		
				}
				else {
					// No situation applies, attack
					global.enemy_order = 2; // Attack
				
				}
			
			}
			// ai only has access to magicians
			else if ((can_train_mg == true) && (can_train_sm == false && can_train_pm == false && can_train_rg == false && can_train_kn == false && can_train_ab == false && can_train_hb == false)){
				// order logic
				// player has any amount of range
				if (p_ab_amount > 0 || p_rg_amount > 0){
					// attack
					global.enemy_order = 2;
				}
				// player has no range, so you can be more choose-y
				else{
					// under what situations do we Retreat?
					// if we do not have enough troops to defend attackers
					// halberdiers
					if((p_hb_amount > 0) && (ai_mg_amount < 5) && (ai_king_health > ai_retr_cutoff_perc) && (global.player_order == 2)){
						global.enemy_order = 0;
					}
					// knights
					else if((p_kn_amount > 0) && (ai_mg_amount < 4) && (ai_king_health > ai_retr_cutoff_perc) && (global.player_order == 2)){
						global.enemy_order = 0;
					}
					// knights
					else if((p_pm_amount > 0 || p_sm_amount > 0) && (ai_mg_amount < 3) && (ai_king_health > ai_retr_cutoff_perc) && (global.player_order == 2)){
						global.enemy_order = 0;
					}
					// if player has 5 or more halberdiers and we dont have sufficient amount of magicians to defend (less than 10)
					else if((p_hb_amount > 4) && (ai_mg_amount < 10) && (ai_king_health > ai_retr_cutoff_perc) && (global.player_order == 2)){
						global.enemy_order = 0;
					}
					// if player has 10 or more knights and we dont have sufficient amount of magicians to defend (less than 7)
					else if((p_kn_amount > 10) && (ai_mg_amount < 7) && (ai_king_health > ai_retr_cutoff_perc) && (global.player_order == 2)){
						global.enemy_order = 0;
					}
					// if player has 15 or more pikemen and we dont have sufficient amount of magicians to defend (less than 5)
					else if((p_pm_amount > 14) && (ai_mg_amount < 5) && (ai_king_health > ai_retr_cutoff_perc) && (global.player_order == 2)){
						global.enemy_order = 0;
					}
					// if player has 15 or more swordmen and we dont have sufficient amount of magicians to defend (less than 3)
					else if((p_sm_amount > 14) && (ai_mg_amount < 3) && (ai_king_health > ai_retr_cutoff_perc) && (global.player_order == 2)){
						global.enemy_order = 0;
					}
					// under which situation do we defend?
					// the next four are the same as above, but player is not attacking
					else if((p_hb_amount > 4) && (ai_mg_amount < 10) && (ai_king_health > ai_def_cutoff_perc) && (global.player_order != 2)){
						global.enemy_order = 1;
					}
					// if player has 10 or more knights and we dont have sufficient amount of magicians to defend (less than 7)
					else if((p_kn_amount > 10) && (ai_mg_amount < 7) && (ai_king_health > ai_def_cutoff_perc) && (global.player_order != 2)){
						global.enemy_order = 1;
					}
					// if player has 15 or more pikemen and we dont have sufficient amount of magicians to defend (less than 5)
					else if((p_pm_amount > 14) && (ai_mg_amount < 5) && (ai_king_health > ai_def_cutoff_perc) && (global.player_order != 2)){
						global.enemy_order = 1;
					}
					// if player has 15 or more swordmen and we dont have sufficient amount of magicians to defend (less than 3)
					else if((p_sm_amount > 14) && (ai_mg_amount < 3) && (ai_king_health > ai_def_cutoff_perc) && (global.player_order != 2)){
						global.enemy_order = 1;
					}
					// if player has at least 1 swordmen and we do not have enough magicians
					else if((p_sm_amount > 0) && (ai_mg_amount < 2)){
						global.enemy_order = 1;
					}
					// if player has at least 1 pikeman and we do not have enough magicians
					else if((p_pm_amount > 0) && (ai_mg_amount < 3)){
						global.enemy_order = 1;
					}	
					// if player has at least 1 knight and we do not have enough magicians
					else if((p_kn_amount > 0) && (ai_mg_amount < 5)){
						global.enemy_order = 1;
					}
					// if player has at least 1 halberdier and we do not have enough magicians
					else if((p_hb_amount > 0) && (ai_mg_amount < 7)){
						global.enemy_order = 1;
					}
					// if nothing applies, you can attack
					else{
						global.enemy_order = 2;
					}
				
				}
			}
			// ai only has access to ranged units
			else {
				if ((global.player_unit_count >= ((ai_rg_amount + ai_ab_amount) * 0.75) && (ai_king_health > ai_retr_cutoff_perc)) && (global.player_order == 2)){
					// If the player has 0.75x the amount of rangers and arbalests
					// AND king health is higher than 30%
					// Retreat
					global.enemy_order = 0; // Retreat
		
				}
				else if ((global.player_unit_count >= ((ai_rg_amount + ai_ab_amount) * 0.4)) && ((ai_rg_amount + ai_ab_amount) < (global.player_unit_cap * 0.5))
					&& (global.player_order == 2)){
					// If the player has 0.4x the amount of rangers and arbalests
					// AND the ai has less than 50% army capacity filled with range
					// AND player is on attack order
					// Defend
					global.enemy_order = 1; // Defend
					
				}
				else if((global.player_unit_count >= ((ai_rg_amount + ai_ab_amount) * 0.3)) && ((p_rg_amount + p_ab_amount) > 0)){
					// If player has 0.3x amount units the amount of rangers and arbalests ai has
					// AND has ranged units
					global.enemy_order = 1; // Defend
				
				}
				else if (global.player_unit_count < ((ai_rg_amount + ai_ab_amount) * 0.5) && ((ai_rg_amount + ai_ab_amount) > (global.player_unit_cap * 0.25))){
					// If the player has less than 0.5x the amount of ai rangers and arbalests
					// AND the ai has more than 25% army capacity filled with range
					// Attack
					global.enemy_order = 2; // Attack
		
				}
				else {
					// No situation applies, attack
					global.enemy_order = 2; // Attack
				
				}
			
			
			}
		
		}
		
		// No counter situations, run generic logic
		else {
			// Debug
			ai_order_situation = "Sit. Gen.";
			
			// what unit types are we able to train?
			// Mono unit ai logic
			if ((can_train_mg == true) && (can_train_sm == false && can_train_pm == false && can_train_rg == false && can_train_kn == false && can_train_ab == false && can_train_hb == false)){
				// order logic
				// player has any amount of range
				if (p_ab_amount > 0 || p_rg_amount > 0){
					// attack
					global.enemy_order = 2;
				}
				// player has no range, so you can be more choose-y
				else{
					// under what situations do we Retreat?
					// if we do not have enough troops to defend attackers
					// halberdiers
					if((p_hb_amount > 0) && (ai_mg_amount < 5) && (ai_king_health > ai_retr_cutoff_perc) && (global.player_order == 2)){
						global.enemy_order = 0;
					}
					// knights
					else if((p_kn_amount > 0) && (ai_mg_amount < 4) && (ai_king_health > ai_retr_cutoff_perc) && (global.player_order == 2)){
						global.enemy_order = 0;
					}
					// knights
					else if((p_pm_amount > 0 || p_sm_amount > 0) && (ai_mg_amount < 3) && (ai_king_health > ai_retr_cutoff_perc) && (global.player_order == 2)){
						global.enemy_order = 0;
					}
					// if player has 5 or more halberdiers and we dont have sufficient amount of magicians to defend (less than 10)
					else if((p_hb_amount > 4) && (ai_mg_amount < 10) && (ai_king_health > ai_retr_cutoff_perc) && (global.player_order == 2)){
						global.enemy_order = 0;
					}
					// if player has 10 or more knights and we dont have sufficient amount of magicians to defend (less than 7)
					else if((p_kn_amount > 10) && (ai_mg_amount < 7) && (ai_king_health > ai_retr_cutoff_perc) && (global.player_order == 2)){
						global.enemy_order = 0;
					}
					// if player has 15 or more pikemen and we dont have sufficient amount of magicians to defend (less than 5)
					else if((p_pm_amount > 14) && (ai_mg_amount < 5) && (ai_king_health > ai_retr_cutoff_perc) && (global.player_order == 2)){
						global.enemy_order = 0;
					}
					// if player has 15 or more swordmen and we dont have sufficient amount of magicians to defend (less than 3)
					else if((p_sm_amount > 14) && (ai_mg_amount < 3) && (ai_king_health > ai_retr_cutoff_perc) && (global.player_order == 2)){
						global.enemy_order = 0;
					}
					// under which situation do we defend?
					// the next four are the same as above, but player is not attacking
					else if((p_hb_amount > 4) && (ai_mg_amount < 10) && (ai_king_health > ai_def_cutoff_perc) && (global.player_order != 2)){
						global.enemy_order = 1;
					}
					// if player has 10 or more knights and we dont have sufficient amount of magicians to defend (less than 7)
					else if((p_kn_amount > 10) && (ai_mg_amount < 7) && (ai_king_health > ai_def_cutoff_perc) && (global.player_order != 2)){
						global.enemy_order = 1;
					}
					// if player has 15 or more pikemen and we dont have sufficient amount of magicians to defend (less than 5)
					else if((p_pm_amount > 14) && (ai_mg_amount < 5) && (ai_king_health > ai_def_cutoff_perc) && (global.player_order != 2)){
						global.enemy_order = 1;
					}
					// if player has 15 or more swordmen and we dont have sufficient amount of magicians to defend (less than 3)
					else if((p_sm_amount > 14) && (ai_mg_amount < 3) && (ai_king_health > ai_def_cutoff_perc) && (global.player_order != 2)){
						global.enemy_order = 1;
					}
					// if player has at least 1 swordmen and we do not have enough magicians
					else if((p_sm_amount > 0) && (ai_mg_amount < 2)){
						global.enemy_order = 1;
					}
					// if player has at least 1 pikeman and we do not have enough magicians
					else if((p_pm_amount > 0) && (ai_mg_amount < 3)){
						global.enemy_order = 1;
					}	
					// if player has at least 1 knight and we do not have enough magicians
					else if((p_kn_amount > 0) && (ai_mg_amount < 5)){
						global.enemy_order = 1;
					}
					// if player has at least 1 halberdier and we do not have enough magicians
					else if((p_hb_amount > 0) && (ai_mg_amount < 7)){
						global.enemy_order = 1;
					}
					// if nothing applies, you can attack
					else{
						global.enemy_order = 2;
					}
				
				}
			}

			else {
				// Retreat Conditions
				// So under which situation should the ai retreat?
				if ((global.player_unit_count > (global.player_unit_count_enemy * 1.5)) && (ai_king_health > ai_retr_cutoff_perc) && (global.player_order == 2)){
					// If the player has 50% more units than the enemy
					global.enemy_order = 0; // Retreat
				}
				// Defend Conditions
		
				// So under which situations should the AI defend?
				else if ((global.player_unit_count > (global.player_unit_count_enemy * 1.25)) && (ai_king_health > ai_def_cutoff_perc)){
					// If the player has 25% more units than the ai
					global.enemy_order = 1; // Defend
				}
				// If neither, just attack :)
				else{
					global.enemy_order = 2; // Attack
		
				}
			}
		
		}
		
		
		// since we are here, patience hasn't run out, decrease patience
		ai_patience --;
	}
	// we are to restrict attack order but are not impatient
	else if ((ai_restrict_attack_order == true) && (ai_patience > 0)){
		global.enemy_order = 1;
		ai_patience --;
	}
	else {
		// If the patience is run out, just attack, do not defend or retreat, ai gets "bored"
		global.enemy_order = 2;
	
	}
	// if it is not false, it will not run the above block, ai will not change its order from the default.
	
	// Destroy object when the enemy castle dies
	if (global.player_castle_health_enemy <= 0){
		// Set enemy AI order to attack
		global.enemy_order = 2; // Attack
		// Destroy
		instance_destroy();
	
	}
	
	
	// spawn in reinforcements
	if (ai_king_health <= reinf_hp_thres && reinf_spawned == false){
		// we havent spawned reinforcements yet
		// spawn them in
		if (reinf_sm_amount > 0){
			// spawn
			instance_create_layer(enemy_spawn_location_x + (irandom_range(0,16)*4),enemy_spawn_location_y,"NPCs",obj_swordman_enemy);
			// decrease counter
			reinf_sm_amount --;
		
		}
		if (reinf_pm_amount > 0){
			// spawn
			instance_create_layer(enemy_spawn_location_x + (irandom_range(0,16)*4),enemy_spawn_location_y,"NPCs",obj_pikeman_enemy);
			// decrease counter
			reinf_pm_amount --;
		
		}
		if (reinf_rg_amount > 0){
			// spawn
			instance_create_layer(enemy_spawn_location_x + (irandom_range(0,16)*4),enemy_spawn_location_y,"NPCs",obj_ranger_enemy);
			// decrease counter
			reinf_rg_amount --;
		
		}
		if (reinf_kn_amount > 0){
			// spawn
			instance_create_layer(enemy_spawn_location_x + (irandom_range(0,16)*4),enemy_spawn_location_y,"NPCs",obj_knight_enemy);
			// decrease counter
			reinf_kn_amount --;
		
		}
		if (reinf_ab_amount > 0){
			// spawn
			instance_create_layer(enemy_spawn_location_x  + (irandom_range(0,16)*4),enemy_spawn_location_y,"NPCs",obj_arbalest_enemy);
			// decrease counter
			reinf_ab_amount --;
		
		}
		if (reinf_hb_amount > 0){
			// spawn
			instance_create_layer(enemy_spawn_location_x + (irandom_range(0,16)*4),enemy_spawn_location_y,"NPCs",obj_halberdier_enemy);
			// decrease counter
			reinf_hb_amount --;
		
		}
		if (reinf_mg_amount > 0){
			// spawn
			instance_create_layer(enemy_spawn_location_x + (irandom_range(0,16)*4),enemy_spawn_location_y,"NPCs",obj_magician_enemy);
			// decrease counter
			reinf_mg_amount --;
		
		}
		if (reinf_nc_amount > 0){
			// spawn
			instance_create_layer(enemy_spawn_location_x + (irandom_range(0,16)*4),enemy_spawn_location_y,"NPCs",obj_necromancer_enemy);
			// decrease counter
			reinf_nc_amount --;
		
		}
		
		
		// once all the unit amounts reached 0, set reinf_spawned to true
		if (reinf_sm_amount > 0 || reinf_pm_amount > 0 || reinf_rg_amount > 0 || reinf_kn_amount > 0 || reinf_ab_amount > 0 || reinf_hb_amount > 0
			 || reinf_mg_amount > 0 || reinf_nc_amount > 0){
			 // we havent depleted all reinforcements yet
			 
			 
		}
		else {
			// we have depleted, set reinf_spawned to true
			reinf_spawned = true;
		
		}
	
	
	}
	
	// spawn in last stand
	if (ai_king_health <= lstand_hp_thres && lstand_spawned == false){
		// we havent spawned reinforcements yet
		// spawn them in
		if (lstand_sm_amount > 0){
			// spawn
			instance_create_layer(enemy_spawn_location_x + (irandom_range(0,16)*4),enemy_spawn_location_y,"NPCs",obj_swordman_enemy);
			// decrease counter
			lstand_sm_amount --;
		
		}
		if (lstand_pm_amount > 0){
			// spawn
			instance_create_layer(enemy_spawn_location_x + (irandom_range(0,16)*4),enemy_spawn_location_y,"NPCs",obj_pikeman_enemy);
			// decrease counter
			lstand_pm_amount --;
		
		}
		if (lstand_rg_amount > 0){
			// spawn
			instance_create_layer(enemy_spawn_location_x + (irandom_range(0,16)*4),enemy_spawn_location_y,"NPCs",obj_ranger_enemy);
			// decrease counter
			lstand_rg_amount --;
		
		}
		if (lstand_kn_amount > 0){
			// spawn
			instance_create_layer(enemy_spawn_location_x + (irandom_range(0,16)*4),enemy_spawn_location_y,"NPCs",obj_knight_enemy);
			// decrease counter
			lstand_kn_amount --;
		
		}
		if (lstand_ab_amount > 0){
			// spawn
			instance_create_layer(enemy_spawn_location_x + (irandom_range(0,16)*4),enemy_spawn_location_y,"NPCs",obj_arbalest_enemy);
			// decrease counter
			lstand_ab_amount --;
		
		}
		if (lstand_hb_amount > 0){
			// spawn
			instance_create_layer(enemy_spawn_location_x + (irandom_range(0,16)*4),enemy_spawn_location_y,"NPCs",obj_halberdier_enemy);
			// decrease counter
			lstand_hb_amount --;
		
		}
		if (lstand_mg_amount > 0){
			// spawn
			instance_create_layer(enemy_spawn_location_x + (irandom_range(0,16)*4),enemy_spawn_location_y,"NPCs",obj_magician_enemy);
			// decrease counter
			lstand_mg_amount --;
		
		}
		if (lstand_nc_amount > 0){
			// spawn
			instance_create_layer(enemy_spawn_location_x + (irandom_range(0,16)*4),enemy_spawn_location_y,"NPCs",obj_necromancer_enemy);
			// decrease counter
			lstand_nc_amount --;
		
		}
		
		
		// once all the unit amounts reached 0, set lstand_spawned to true
		if (lstand_sm_amount > 0 || lstand_pm_amount > 0 || lstand_rg_amount > 0 || lstand_kn_amount > 0 || lstand_ab_amount > 0 || lstand_hb_amount > 0
			 || lstand_mg_amount > 0 || lstand_nc_amount > 0){
			 // we havent depleted all reinforcements yet
			 
			 
		}
		else {
			// we have depleted, set lstand_spawned to true
			lstand_spawned = true;
		
		}
	
	
	}
	
}


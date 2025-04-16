//// @description update army ratios
/// every time this is triggered, recalculate ratios
// Player army composition modifiers, the player army composition is tracked here.
// Ranged units to melee units ratio
opposition_army_range_to_melee_ratio = (opposition_rg_amount + opposition_ab_amount)/(global.player_unit_count_enemy + global.enemy_2_unit_count + global.enemy_3_unit_count + global.enemy_4_unit_count);

// Swordman ratio to rest of army
opposition_sm_to_army_ratio = (opposition_sm_amount)/(global.player_unit_count_enemy + global.enemy_2_unit_count + global.enemy_3_unit_count + global.enemy_4_unit_count);

// Pikeman ratio to rest of army
opposition_pm_to_army_ratio = (opposition_pm_amount)/(global.player_unit_count_enemy + global.enemy_2_unit_count + global.enemy_3_unit_count + global.enemy_4_unit_count);

// Ranger ratio to rest of army
opposition_rg_to_army_ratio = (opposition_rg_amount)/(global.player_unit_count_enemy + global.enemy_2_unit_count + global.enemy_3_unit_count + global.enemy_4_unit_count);

// Knight ratio to rest of army
opposition_kn_to_army_ratio = (opposition_kn_amount)/(global.player_unit_count_enemy + global.enemy_2_unit_count + global.enemy_3_unit_count + global.enemy_4_unit_count);

// Arbalest ratio to rest of army
opposition_ab_to_army_ratio = (opposition_ab_amount)/(global.player_unit_count_enemy + global.enemy_2_unit_count + global.enemy_3_unit_count + global.enemy_4_unit_count);

// Halberdier ratio to rest of army
opposition_hb_to_army_ratio = (opposition_hb_amount)/(global.player_unit_count_enemy + global.enemy_2_unit_count + global.enemy_3_unit_count + global.enemy_4_unit_count);

// Magician ratio to rest of army
opposition_mg_to_army_ratio = (opposition_mg_amount)/(global.player_unit_count_enemy + global.enemy_2_unit_count + global.enemy_3_unit_count + global.enemy_4_unit_count);

// Catapult ratio to rest of army
opposition_cp_to_army_ratio = (opposition_cp_amount)/(global.player_unit_count_enemy + global.enemy_2_unit_count + global.enemy_3_unit_count + global.enemy_4_unit_count);

// Necromancer ratio to rest of army
opposition_nc_to_army_ratio = (opposition_nc_amount)/(global.player_unit_count_enemy + global.enemy_2_unit_count + global.enemy_3_unit_count + global.enemy_4_unit_count);

// Gold Income
// formula in algebriac form is 5x^{2}+5
if (our_gold_amount > (our_gold_cap - ((our_gold_gen * (ai_eco_lv * ai_eco_lv)) + our_gold_gen))){
	// If we are going to go above the gold cap, do nothing.

}
else{
	// We will not reach gold cap
	our_gold_amount = our_gold_amount + ((our_gold_gen * (ai_eco_lv * ai_eco_lv)) + our_gold_gen);
	
}

// reset alarm
alarm_set(6,(3 / (delta_time/1000000)));

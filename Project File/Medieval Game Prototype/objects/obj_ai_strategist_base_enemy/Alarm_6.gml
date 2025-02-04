//// @description update army ratios
/// every time this is triggered, recalculate ratios
// Player army composition modifiers, the player army composition is tracked here.
// Ranged units to melee units ratio
allied_army_range_to_melee_ratio = (allied_rg_amount + allied_ab_amount)/(global.player_unit_count + global.ally_1_unit_count + global.ally_2_unit_count + global.ally_3_unit_count);

// Swordman ratio to rest of army
allied_sm_to_army_ratio = (allied_sm_amount)/(global.player_unit_count + global.ally_1_unit_count + global.ally_2_unit_count + global.ally_3_unit_count);

// Pikeman ratio to rest of army
allied_pm_to_army_ratio = (allied_pm_amount)/(global.player_unit_count + global.ally_1_unit_count + global.ally_2_unit_count + global.ally_3_unit_count);

// Ranger ratio to rest of army
allied_rg_to_army_ratio = (allied_rg_amount)/(global.player_unit_count + global.ally_1_unit_count + global.ally_2_unit_count + global.ally_3_unit_count);

// Knight ratio to rest of army
allied_kn_to_army_ratio = (allied_kn_amount)/(global.player_unit_count + global.ally_1_unit_count + global.ally_2_unit_count + global.ally_3_unit_count);

// Arbalest ratio to rest of army
allied_ab_to_army_ratio = (allied_ab_amount)/(global.player_unit_count + global.ally_1_unit_count + global.ally_2_unit_count + global.ally_3_unit_count);

// Halberdier ratio to rest of army
allied_hb_to_army_ratio = (allied_hb_amount)/(global.player_unit_count + global.ally_1_unit_count + global.ally_2_unit_count + global.ally_3_unit_count);

// Magician ratio to rest of army
allied_mg_to_army_ratio = (allied_mg_amount)/(global.player_unit_count + global.ally_1_unit_count + global.ally_2_unit_count + global.ally_3_unit_count);

// Catapult ratio to rest of army
allied_cp_to_army_ratio = (allied_cp_amount)/(global.player_unit_count + global.ally_1_unit_count + global.ally_2_unit_count + global.ally_3_unit_count);

// Necromancer ratio to rest of army
allied_nc_to_army_ratio = (allied_nc_amount)/(global.player_unit_count + global.ally_1_unit_count + global.ally_2_unit_count + global.ally_3_unit_count);

// Gold Income
// formula in algebriac form is 5x^{2}+5
if (global.enemy_gold_amount > (global.enemy_gold_cap - ((global.enemy_gold_gen * (ai_eco_lv * ai_eco_lv)) + global.enemy_gold_gen))){
	// If we are going to go above the gold cap, do nothing.

}
else{
	// We will not reach gold cap
	global.enemy_gold_amount = global.enemy_gold_amount + ((global.enemy_gold_gen * (ai_eco_lv * ai_eco_lv)) + global.enemy_gold_gen);
	
}

// reset alarm
alarm_set(6,(3*fps));

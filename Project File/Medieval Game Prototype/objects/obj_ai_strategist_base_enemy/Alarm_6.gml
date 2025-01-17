//// @description update army ratios
/// every time this is triggered, recalculate ratios
// Player army composition modifiers, the player army composition is tracked here.
// Ranged units to melee units ratio
p_army_range_to_melee_ratio = (p_rg_amount + p_ab_amount)/(global.player_unit_count);

// Swordman ratio to rest of army
p_sm_to_army_ratio = (p_sm_amount)/(global.player_unit_count);

// Pikeman ratio to rest of army
p_pm_to_army_ratio = (p_pm_amount)/(global.player_unit_count);

// Ranger ratio to rest of army
p_rg_to_army_ratio = (p_rg_amount)/(global.player_unit_count);

// Knight ratio to rest of army
p_kn_to_army_ratio = (p_kn_amount)/(global.player_unit_count);

// Arbalest ratio to rest of army
p_ab_to_army_ratio = (p_ab_amount)/(global.player_unit_count);

// Halberdier ratio to rest of army
p_hb_to_army_ratio = (p_hb_amount)/(global.player_unit_count);

// Magician ratio to rest of army
p_mg_to_army_ratio = (p_mg_amount)/(global.player_unit_count);

// Catapult ratio to rest of army
p_cp_to_army_ratio = (p_cp_amount)/(global.player_unit_count);

// Necromancer ratio to rest of army
p_nc_to_army_ratio = (p_nc_amount)/(global.player_unit_count);

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

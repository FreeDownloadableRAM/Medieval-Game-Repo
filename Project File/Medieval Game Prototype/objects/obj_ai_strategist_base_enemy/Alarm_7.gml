//// @description track player army
/// every time this is triggered, update personal variables that track player unit counts.
// Trackers
// Here we keep track of the units the player is using, these values are taken from the units spawned by the player themself.
p_sm_amount = global.player_sm_count;
p_pm_amount = global.player_pm_count;
p_rg_amount = global.player_rg_count;
p_kn_amount = global.player_kn_count;
p_ab_amount = global.player_ab_count;
p_hb_amount = global.player_hb_count;
p_mg_amount = global.player_mg_count;
p_cp_amount = global.player_cp_count;
p_nc_amount = global.player_nc_count;
p_gh_amount = global.player_gh_count;

// here we track what units we are using
ai_sm_amount = global.enemy_sm_count;
ai_pm_amount = global.enemy_pm_count;
ai_rg_amount = global.enemy_rg_count;
ai_kn_amount = global.enemy_kn_count;
ai_ab_amount = global.enemy_ab_count;
ai_hb_amount = global.enemy_hb_count;
ai_mg_amount = global.enemy_mg_count;
// ai_cp_amount = global.enemy_cp_count; // NOT YET AVAILABLE
ai_nc_amount = global.enemy_nc_count;
ai_gh_amount = global.enemy_gh_count;


// keep track of our army variables
ai_total_mel_units = ai_sm_amount + ai_pm_amount + ai_kn_amount + ai_hb_amount + ai_gh_amount;
ai_total_rg_units = ai_rg_amount + ai_ab_amount + ai_mg_amount + ai_nc_amount;

// Track player and AI king health %
ai_king_health = global.player_castle_health_enemy / global.starting_player_castle_health_enemy;
p_king_health = global.player_castle_health / global.starting_player_castle_health;

// if the AI does not have units, just set range army percent and all other percents to 0.
if (global.player_unit_count_enemy == 0){
	// just set percentages to 0
	ai_ranged_army_percent = 0.0;

}
else {
	// Proceed with calculations
	ai_ranged_army_percent = ai_total_rg_units / global.player_unit_count_enemy;

}

// reset alarm
alarm_set(7,(1*fps));
//// @description track player army
/// every time this is triggered, update personal variables that track player unit counts.
// Trackers
// Here we keep track of the units the player is using, these values are taken from the units spawned by the player themself.
opposition_sm_amount = global.player_sm_count + global.ally_1_sm_count + global.ally_2_sm_count + global.ally_3_sm_count;
opposition_pm_amount = global.player_pm_count + global.ally_1_pm_count + global.ally_2_pm_count + global.ally_3_pm_count;
opposition_rg_amount = global.player_rg_count + global.ally_1_rg_count + global.ally_2_rg_count + global.ally_3_rg_count;
opposition_kn_amount = global.player_kn_count + global.ally_1_kn_count + global.ally_2_kn_count + global.ally_3_kn_count;
opposition_ab_amount = global.player_ab_count + global.ally_1_ab_count + global.ally_2_ab_count + global.ally_3_ab_count;
opposition_hb_amount = global.player_hb_count + global.ally_1_hb_count + global.ally_2_hb_count + global.ally_3_hb_count;
opposition_mg_amount = global.player_mg_count + global.ally_1_mg_count + global.ally_2_mg_count + global.ally_3_mg_count;
opposition_cp_amount = global.player_cp_count + global.ally_1_cp_count + global.ally_2_cp_count + global.ally_3_cp_count;
opposition_nc_amount = global.player_nc_count + global.ally_1_nc_count + global.ally_2_nc_count + global.ally_3_nc_count;
opposition_gh_amount = global.player_gh_count + global.ally_1_gh_count + global.ally_2_gh_count + global.ally_3_gh_count;

// total
opposition_unit_amount = global.player_unit_count + global.ally_1_unit_count + global.ally_2_unit_count + global.ally_3_unit_count;

// here we track what units we are using
allied_sm_amount = global.enemy_sm_count + global.enemy_2_sm_count + global.enemy_3_sm_count + global.enemy_4_sm_count;
allied_pm_amount = global.enemy_pm_count + global.enemy_2_pm_count + global.enemy_3_pm_count + global.enemy_4_pm_count;
allied_rg_amount = global.enemy_rg_count + global.enemy_2_rg_count + global.enemy_3_rg_count + global.enemy_4_rg_count;
allied_kn_amount = global.enemy_kn_count + global.enemy_2_kn_count + global.enemy_3_kn_count + global.enemy_4_kn_count;
allied_ab_amount = global.enemy_ab_count + global.enemy_2_ab_count + global.enemy_3_ab_count + global.enemy_4_ab_count;
allied_hb_amount = global.enemy_hb_count + global.enemy_2_hb_count + global.enemy_3_hb_count + global.enemy_4_hb_count;
allied_mg_amount = global.enemy_mg_count + global.enemy_2_mg_count + global.enemy_3_mg_count + global.enemy_4_mg_count;
// ai_cp_amount = global.enemy_cp_count; // NOT YET AVAILABLE
allied_nc_amount = global.enemy_nc_count + global.enemy_2_nc_count + global.enemy_3_nc_count + global.enemy_4_nc_count;
allied_gh_amount = global.enemy_gh_count + global.enemy_2_gh_count + global.enemy_3_gh_count + global.enemy_4_gh_count;

// total
allied_unit_amount = global.player_unit_count_enemy + global.enemy_2_unit_count + global.enemy_3_unit_count + global.enemy_4_unit_count;

// keep track of our army variables
allied_total_mel_units = allied_sm_amount + allied_pm_amount + allied_kn_amount + allied_hb_amount + allied_gh_amount;
allied_total_rg_units = allied_rg_amount + allied_ab_amount + allied_mg_amount + allied_nc_amount;

// Track player and AI king health %
allies_king_health = global.player_castle_health_enemy / global.starting_player_castle_health_enemy;
opposition_king_health = global.player_castle_health / global.starting_player_castle_health;

// if the AI does not have units, just set range army percent and all other percents to 0.
if (global.player_unit_count_enemy == 0){
	// just set percentages to 0
	allied_ranged_army_percent = 0.0;

}
else {
	// Proceed with calculations
	allied_ranged_army_percent = allied_total_rg_units / (global.player_unit_count_enemy + global.enemy_2_unit_count + global.enemy_3_unit_count + global.enemy_4_unit_count);

}

// reset alarm
alarm_set(7,(1*fps));
//// @description track player army
/// every time this is triggered, update personal variables that track player unit counts.
// Trackers
// Here we keep track of the units the player is using, these values are taken from the units spawned by the player themself.
allied_sm_amount = global.player_sm_count + global.ally_1_sm_count + global.ally_2_sm_count + global.ally_3_sm_count;
allied_pm_amount = global.player_pm_count + global.ally_1_pm_count + global.ally_2_pm_count + global.ally_3_pm_count;
allied_rg_amount = global.player_rg_count + global.ally_1_rg_count + global.ally_2_rg_count + global.ally_3_rg_count;
allied_kn_amount = global.player_kn_count + global.ally_1_kn_count + global.ally_2_kn_count + global.ally_3_kn_count;
allied_ab_amount = global.player_ab_count + global.ally_1_ab_count + global.ally_2_ab_count + global.ally_3_ab_count;
allied_hb_amount = global.player_hb_count + global.ally_1_hb_count + global.ally_2_hb_count + global.ally_3_hb_count;
allied_mg_amount = global.player_mg_count + global.ally_1_mg_count + global.ally_2_mg_count + global.ally_3_mg_count;
allied_cp_amount = global.player_cp_count + global.ally_1_cp_count + global.ally_2_cp_count + global.ally_3_cp_count;
allied_nc_amount = global.player_nc_count + global.ally_1_nc_count + global.ally_2_nc_count + global.ally_3_nc_count;
allied_gh_amount = global.player_gh_count + global.ally_1_gh_count + global.ally_2_gh_count + global.ally_3_gh_count;

// total
allied_unit_amount = global.player_unit_count + global.ally_1_unit_count + global.ally_2_unit_count + global.ally_3_unit_count;

// here we track what units we are using
enemies_sm_amount = global.enemy_sm_count + global.enemy_2_sm_count + global.enemy_3_sm_count + global.enemy_4_sm_count;
enemies_pm_amount = global.enemy_pm_count + global.enemy_2_pm_count + global.enemy_3_pm_count + global.enemy_4_pm_count;
enemies_rg_amount = global.enemy_rg_count + global.enemy_2_rg_count + global.enemy_3_rg_count + global.enemy_4_rg_count;
enemies_kn_amount = global.enemy_kn_count + global.enemy_2_kn_count + global.enemy_3_kn_count + global.enemy_4_kn_count;
enemies_ab_amount = global.enemy_ab_count + global.enemy_2_ab_count + global.enemy_3_ab_count + global.enemy_4_ab_count;
enemies_hb_amount = global.enemy_hb_count + global.enemy_2_hb_count + global.enemy_3_hb_count + global.enemy_4_hb_count;
enemies_mg_amount = global.enemy_mg_count + global.enemy_2_mg_count + global.enemy_3_mg_count + global.enemy_4_mg_count;
// ai_cp_amount = global.enemy_cp_count; // NOT YET AVAILABLE
enemies_nc_amount = global.enemy_nc_count + global.enemy_2_nc_count + global.enemy_3_nc_count + global.enemy_4_nc_count;
enemies_gh_amount = global.enemy_gh_count + global.enemy_2_gh_count + global.enemy_3_gh_count + global.enemy_4_gh_count;

// total
enemy_unit_amount = global.player_unit_count_enemy + global.enemy_2_unit_count + global.enemy_3_unit_count + global.enemy_4_unit_count;

// keep track of our army variables
enemies_total_mel_units = enemies_sm_amount + enemies_pm_amount + enemies_kn_amount + enemies_hb_amount + enemies_gh_amount;
enemies_total_rg_units = enemies_rg_amount + enemies_ab_amount + enemies_mg_amount + enemies_nc_amount;

// Track player and AI king health %
ai_king_health = global.player_castle_health_enemy / global.starting_player_castle_health_enemy;
p_king_health = global.player_castle_health / global.starting_player_castle_health;

// if the AI does not have units, just set range army percent and all other percents to 0.
if (global.player_unit_count_enemy == 0){
	// just set percentages to 0
	enemies_ranged_army_percent = 0.0;

}
else {
	// Proceed with calculations
	enemies_ranged_army_percent = enemies_total_rg_units / (global.player_unit_count_enemy + global.enemy_2_unit_count + global.enemy_3_unit_count + global.enemy_4_unit_count);

}

// reset alarm
alarm_set(7,(1*fps));
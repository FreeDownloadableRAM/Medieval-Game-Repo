// We dont want player vs ai mode modifiers to persist into campaign levels.
// on this object create event, just reset all of these to their default values
// on the case of unit types we can train, etc. those will be over rided on level select event.
// Colour Controllers (these are the default colours, 0-3 ally, 4-7 enemy)
// whilst its written here as one-eight, the value for palettes are 0-7.
global.slot_one_colour = 0; // 0 = blue, 1 = green, 2 = cyan. 3 = purple
global.slot_two_colour = 1; // 4 = red, 5 = orange, 6 = yellow. 7 = gray
global.slot_three_colour = 2;
global.slot_four_colour = 3;
global.slot_five_colour = 4;
global.slot_six_colour = 5;
global.slot_seven_colour = 6;
global.slot_eight_colour = 7;

// This is eco modifiers for ai vs mode
// gold gen
// 1 = 100% (no changes), 2 = 200% (2 times as much), 3 = 300%, etc...
global.slot_one_eco_gen_multiplier = 1; 
global.slot_two_eco_gen_multiplier = 1;
global.slot_three_eco_gen_multiplier = 1;
global.slot_four_eco_gen_multiplier = 1; 
global.slot_five_eco_gen_multiplier = 1;
global.slot_six_eco_gen_multiplier = 1;
global.slot_seven_eco_gen_multiplier = 1;
global.slot_eight_eco_gen_multiplier = 1;

// gold capacity
// 1 = 100% (no changes), 2 = 200% (2 times as much), 3 = 300%, etc...
global.slot_one_eco_cap_multiplier = 1; 
global.slot_two_eco_cap_multiplier = 1;
global.slot_three_eco_cap_multiplier = 1;
global.slot_four_eco_cap_multiplier = 1; 
global.slot_five_eco_cap_multiplier = 1;
global.slot_six_eco_cap_multiplier = 1;
global.slot_seven_eco_cap_multiplier = 1;
global.slot_eight_eco_cap_multiplier = 1;

// gold starting amount
// 1 = 100% (no changes), 2 = 200% (2 times as much), 3 = 300%, etc...
global.slot_one_eco_start_multiplier = 1; 
global.slot_two_eco_start_multiplier = 1;
global.slot_three_eco_start_multiplier = 1;
global.slot_four_eco_start_multiplier = 1; 
global.slot_five_eco_start_multiplier = 1;
global.slot_six_eco_start_multiplier = 1;
global.slot_seven_eco_start_multiplier = 1;
global.slot_eight_eco_start_multiplier = 1;

// is ai enabled? (VS MODE)
// player is ALWAYS enabled, so theres no variable here to track if its on or off
// this is the case with slot 4, enemy 1. no variable here to affect them, they will be spawned regardless.
global.ally_1_enabled = true;
global.ally_2_enabled = true;
global.ally_3_enabled = true;
global.enemy_2_enabled = true;
global.enemy_3_enabled = true;
global.enemy_4_enabled = true;

// map settings
// 0 = default (forest), 1 = rocky canyons, 2 = desert hills, 3 = swamp lands
// 4 = autumn forest, 5 = ice valley, 6 = castle town, 7 = volcano / black mountain ranges
global.ai_vs_mode_map_theme = 0; // 8 options, 0 - 7

// affects what music will play in vs mode.
// 0 = conflicting interests, 1 = medieval warfare, 2 = liberty awaits
// 3 = standing orders, 4 = price paid, 5 = rebel alliance
// 6 = nearing journeys end, 7 = the elites, 8 = travel at night
// 9 = last stand
global.ai_vs_mode_music_track = 0;

// reset training modifiers
// player army trackers // slot 0
global.player_sm_count = 0;
global.player_pm_count = 0;
global.player_rg_count = 0;
global.player_kn_count = 0;
global.player_ab_count = 0;
global.player_hb_count = 0;
global.player_mg_count = 0;
global.player_cp_count = 0;
global.player_nc_count = 0;
global.player_gh_count = 0;

// this is for vs mode in particular, NOT CAMPAIGN
global.player_can_train_sm = true;
global.player_can_train_pm = true;
global.player_can_train_rg = true;
global.player_can_train_kn = true;
global.player_can_train_ab = true;
global.player_can_train_hb = true;
global.player_can_train_mg = true;
global.player_can_train_cp = true;
global.player_can_train_nc = true;
global.player_can_train_gh = true;

// ally 1
// ally ai 1 unit ai trackers // slot 1
global.ally_1_sm_count = 0;
global.ally_1_pm_count = 0;
global.ally_1_rg_count = 0;
global.ally_1_kn_count = 0;
global.ally_1_ab_count = 0;
global.ally_1_hb_count = 0;
global.ally_1_mg_count = 0;
global.ally_1_cp_count = 0;
global.ally_1_nc_count = 0;
global.ally_1_gh_count = 0;

global.ally_1_can_train_sm = true;
global.ally_1_can_train_pm = true;
global.ally_1_can_train_rg = true;
global.ally_1_can_train_kn = true;
global.ally_1_can_train_ab = true;
global.ally_1_can_train_hb = true;
global.ally_1_can_train_mg = true;
global.ally_1_can_train_cp = true;
global.ally_1_can_train_nc = true;
global.ally_1_can_train_gh = true;

// ally 2
// ally ai 2 unit ai trackers // slot 2
global.ally_2_sm_count = 0;
global.ally_2_pm_count = 0;
global.ally_2_rg_count = 0;
global.ally_2_kn_count = 0;
global.ally_2_ab_count = 0;
global.ally_2_hb_count = 0;
global.ally_2_mg_count = 0;
global.ally_2_cp_count = 0;
global.ally_2_nc_count = 0;
global.ally_2_gh_count = 0;

global.ally_2_can_train_sm = true;
global.ally_2_can_train_pm = true;
global.ally_2_can_train_rg = true;
global.ally_2_can_train_kn = true;
global.ally_2_can_train_ab = true;
global.ally_2_can_train_hb = true;
global.ally_2_can_train_mg = true;
global.ally_2_can_train_cp = true;
global.ally_2_can_train_nc = true;
global.ally_2_can_train_gh = true;

// ally 3
// ally ai 3 unit ai trackers // slot 3
global.ally_3_sm_count = 0;
global.ally_3_pm_count = 0;
global.ally_3_rg_count = 0;
global.ally_3_kn_count = 0;
global.ally_3_ab_count = 0;
global.ally_3_hb_count = 0;
global.ally_3_mg_count = 0;
global.ally_3_cp_count = 0;
global.ally_3_nc_count = 0;
global.ally_3_gh_count = 0;

global.ally_3_can_train_sm = true;
global.ally_3_can_train_pm = true;
global.ally_3_can_train_rg = true;
global.ally_3_can_train_kn = true;
global.ally_3_can_train_ab = true;
global.ally_3_can_train_hb = true;
global.ally_3_can_train_mg = true;
global.ally_3_can_train_cp = true;
global.ally_3_can_train_nc = true;
global.ally_3_can_train_gh = true;

// enemy army trackers
// enemy unit ai trackers // slot 4
global.enemy_sm_count = 0;
global.enemy_pm_count = 0;
global.enemy_rg_count = 0;
global.enemy_kn_count = 0;
global.enemy_ab_count = 0;
global.enemy_hb_count = 0;
global.enemy_mg_count = 0;
global.enemy_cp_count = 0;
global.enemy_nc_count = 0;
global.enemy_gh_count = 0;

global.enemy_can_train_sm = true;
global.enemy_can_train_pm = true;
global.enemy_can_train_rg = true;
global.enemy_can_train_kn = true;
global.enemy_can_train_ab = true;
global.enemy_can_train_hb = true;
global.enemy_can_train_mg = true;
global.enemy_can_train_cp = true;
global.enemy_can_train_nc = true;
global.enemy_can_train_gh = true;

// enemy 2
// enemy ai 2 unit ai trackers // slot 5
global.enemy_2_sm_count = 0;
global.enemy_2_pm_count = 0;
global.enemy_2_rg_count = 0;
global.enemy_2_kn_count = 0;
global.enemy_2_ab_count = 0;
global.enemy_2_hb_count = 0;
global.enemy_2_mg_count = 0;
global.enemy_2_cp_count = 0;
global.enemy_2_nc_count = 0;
global.enemy_2_gh_count = 0;

global.enemy_2_can_train_sm = true;
global.enemy_2_can_train_pm = true;
global.enemy_2_can_train_rg = true;
global.enemy_2_can_train_kn = true;
global.enemy_2_can_train_ab = true;
global.enemy_2_can_train_hb = true;
global.enemy_2_can_train_mg = true;
global.enemy_2_can_train_cp = true;
global.enemy_2_can_train_nc = true;
global.enemy_2_can_train_gh = true;

// enemy 3
// enemy ai 3 unit ai trackers // slot 6
global.enemy_3_sm_count = 0;
global.enemy_3_pm_count = 0;
global.enemy_3_rg_count = 0;
global.enemy_3_kn_count = 0;
global.enemy_3_ab_count = 0;
global.enemy_3_hb_count = 0;
global.enemy_3_mg_count = 0;
global.enemy_3_cp_count = 0;
global.enemy_3_nc_count = 0;
global.enemy_3_gh_count = 0;

global.enemy_3_can_train_sm = true;
global.enemy_3_can_train_pm = true;
global.enemy_3_can_train_rg = true;
global.enemy_3_can_train_kn = true;
global.enemy_3_can_train_ab = true;
global.enemy_3_can_train_hb = true;
global.enemy_3_can_train_mg = true;
global.enemy_3_can_train_cp = true;
global.enemy_3_can_train_nc = true;
global.enemy_3_can_train_gh = true;

// enemy 4
// enemy ai 4 unit ai trackers // slot 7
global.enemy_4_sm_count = 0;
global.enemy_4_pm_count = 0;
global.enemy_4_rg_count = 0;
global.enemy_4_kn_count = 0;
global.enemy_4_ab_count = 0;
global.enemy_4_hb_count = 0;
global.enemy_4_mg_count = 0;
global.enemy_4_cp_count = 0;
global.enemy_4_nc_count = 0;
global.enemy_4_gh_count = 0;

global.enemy_4_can_train_sm = true;
global.enemy_4_can_train_pm = true;
global.enemy_4_can_train_rg = true;
global.enemy_4_can_train_kn = true;
global.enemy_4_can_train_ab = true;
global.enemy_4_can_train_hb = true;
global.enemy_4_can_train_mg = true;
global.enemy_4_can_train_cp = true;
global.enemy_4_can_train_nc = true;
global.enemy_4_can_train_gh = true;
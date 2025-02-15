/// Here is what we run when the game begins
// This will be on the room before entering the main menu


// Dev Globals
global.dev_mode = false;

// Pausing
global.is_game_paused = false;

// Global world characteristics
global.gravity_value = 9.8;

// Player room tracker, are we in a menu? this will help us keep track
// this will be set to true whenever we are put into a menu room
global.is_player_in_menu = false

// Game Room Dimensions
global.game_room_top_value = 0;
global.game_room_bottom_value = 512;
global.game_room_left_value = 0;
global.game_room_top_value = 2048;

global.current_map_size_x = 3456; // 3456 is medium
global.current_map_size_y = 864; // 756 is height, which is always the same

// Spawning constants
global.left_side_spawn_offset_x = -128;

global.right_side_spawn_offset_x = 128;
global.spawn_height = 704;

// Variables AI Use to help with navigating
global.player_king_x_location = 0;
global.enemy_king_x_location = 0;

// AI Trackers
// player ai trackers
// player caps
// ally cap
global.player_unit_count = 0; // player // slot 0
global.ally_1_unit_count = 0; // ai 1 // slot 1
global.ally_2_unit_count = 0; // ai 2 // slot 2
global.ally_3_unit_count = 0; // ai 3 // slot 3

// enemy cap
global.player_unit_count_enemy = 0; // ai 4 // slot 4
global.enemy_2_unit_count = 0; // ai 5 // slot 5
global.enemy_3_unit_count = 0; // ai 6 // slot 6
global.enemy_4_unit_count = 0; // ai 7 // slot 7

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
global.ally_1_can_train_cp = false;
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
global.ally_2_can_train_cp = false;
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
global.ally_3_can_train_cp = false;
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
global.enemy_can_train_cp = false;
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
global.enemy_2_can_train_cp = false;
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
global.enemy_3_can_train_cp = false;
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
global.enemy_4_can_train_cp = false;
global.enemy_4_can_train_nc = true;
global.enemy_4_can_train_gh = true;

// AI training timers
global.ai_train_delay_sm = 3; // These are in seconds
global.ai_train_delay_pm = 5;
global.ai_train_delay_rg = 7;
global.ai_train_delay_kn = 10;
global.ai_train_delay_ab = 12;
global.ai_train_delay_hb = 15;
global.ai_train_delay_mg = 25;
global.ai_train_delay_cp = 45;
global.ai_train_delay_nc = 60;

// Economic Trackers
// player
global.player_gold_gen = 5; // default is 5
global.player_gold_amount = 75;
global.player_gold_start_amount = 250; // 125 is default
global.player_gold_cap = 10000;

// player allies
// ally 1
global.ally_1_gold_gen = 5; // default is 5
global.ally_1_gold_amount = 75;
global.ally_1_gold_start_amount = 250; // 125 is default
global.ally_1_gold_cap = 10000;

// ally 2
global.ally_2_gold_gen = 5; // default is 5
global.ally_2_gold_amount = 75;
global.ally_2_gold_start_amount = 250; // 125 is default
global.ally_2_gold_cap = 10000;

// ally 3
global.ally_3_gold_gen = 5; // default is 5
global.ally_3_gold_amount = 75;
global.ally_3_gold_start_amount = 250; // 125 is default
global.ally_3_gold_cap = 10000;

// enemy ai economy trackers
// enemy
global.enemy_gold_gen = 5;
global.enemy_gold_amount = 75;
global.enemy_gold_start_amount = 250;
global.enemy_gold_cap = 10000;

// enemy 2
global.enemy_2_gold_gen = 5;
global.enemy_2_gold_amount = 75;
global.enemy_2_gold_start_amount = 250;
global.enemy_2_gold_cap = 10000;

// enemy 3
global.enemy_3_gold_gen = 5;
global.enemy_3_gold_amount = 75;
global.enemy_3_gold_start_amount = 250;
global.enemy_3_gold_cap = 10000;

// enemy 4
global.enemy_4_gold_gen = 5;
global.enemy_4_gold_amount = 75;
global.enemy_4_gold_start_amount = 250;
global.enemy_4_gold_cap = 10000;

// Global Economy variables
// formula for these values are:
// formula in algebriac form is 25x + 5x^{3}+5
// 75, 105, 165, 285, 495, 825, 1305
global.econ_up_cost_lv_0 = 75;
global.econ_up_cost_lv_1 = 105;
global.econ_up_cost_lv_2 = 165;
global.econ_up_cost_lv_3 = 285;
global.econ_up_cost_lv_4 = 495;
global.econ_up_cost_lv_5 = 825;
global.econ_up_cost_lv_6 = 1305;


// Military Trackers Cap
// we cannot train or summon units once this amount is reached
// player
global.player_unit_cap = 50;

// allies
// ally ai 1
global.ally_1_unit_cap = 50;

// ally ai 2
global.ally_2_unit_cap = 50;

// ally ai 3
global.ally_3_unit_cap = 50;

// enemies
// enemy ai 1
global.enemy_unit_cap = 50; 

// enemy ai 2
global.enemy_2_unit_cap = 50; 

// enemy ai 3
global.enemy_3_unit_cap = 50; 

// enemy ai 4
global.enemy_4_unit_cap = 50; 


// Order 
// control unit movement with these global ai orders.
// player
global.player_order = 1; // 0 = retreat, 1 = defend / hold, 2 = attack

// ai
// allies
global.ally_1_order = 1; // 0 = retreat, 1 = defend / hold, 2 = attack
global.ally_2_order = 1; // 0 = retreat, 1 = defend / hold, 2 = attack
global.ally_3_order = 1; // 0 = retreat, 1 = defend / hold, 2 = attack

// enemies
global.enemy_order = 0; // 0 = retreat, 1 = defend / hold, 2 = attack / 3 = force idle only
global.enemy_2_order = 0; // 0 = retreat, 1 = defend / hold, 2 = attack
global.enemy_3_order = 0; // 0 = retreat, 1 = defend / hold, 2 = attack
global.enemy_4_order = 0; // 0 = retreat, 1 = defend / hold, 2 = attack

// go to the next room
alarm_set(0,180);

// Unit Constants
// Swordman
global.swordman_atk = 20; 
global.swordman_atk_duration = 60;
global.unit_swordman_cost = 10;

// Pikeman
global.pikeman_atk = 30; // 16 is default, but for testing purposes, lets make it faster
global.pikeman_atk_duration = 60;
global.unit_pikeman_cost = 25;

// Ranger
global.ranger_atk = 35; 
global.ranger_atk_duration = (73/9) * 60;
global.unit_ranger_cost = 75;
global.ranger_arrow_weight = 0.008; // kg
global.ranger_arrow_initial_velocity = 40; // 128 pixels per second

// Knight
global.knight_atk = 75; 
global.knight_atk_duration = 180;
global.unit_knight_cost = 125;

// Arbalest
global.arbalest_atk = 30; 
global.arbalest_atk_duration = (32/12) * 60; //32 frames. 12 fps, 60 fps
global.unit_arbalest_cost = 175;
global.arbalest_bolt_weight = 0.005; // kg
global.arbalest_bolt_initial_velocity = 32; // 128 pixels per second

// Halberd
global.halberd_atk_slash = 60; 
global.halberd_atk_thrust = 90; 
global.halberd_atk_duration = (42/14) * 60; //42 frames. 14 fps, 60 fps
global.unit_halberd_cost = 250;

// Magician
global.magician_atk = 1; // hits every frame
global.magician_atk_duration = (20/12) * 60; //20 frames. 12 fps, 60 fps
global.unit_magician_cost = 1250;

// Catapult
global.catapult_atk = 250; 
global.catapult_atk_duration = (28/6) * 60;
global.unit_catapult_cost = 1500;
global.catapult_proj_weight = 0.25; // kg
global.catapult_proj_initial_velocity = 8.5; // 32 pixels per second

// necromancer
global.necromancer_projectile_speed = 4;
global.necromancer_atk = 15; // hits every frame
global.necromancer_atk_duration = (16/8) * 60; //16 frames. 8 fps, 60 fps
global.unit_necromancer_cost = 2000;

// ghoul
global.ghoul_atk = 25; // hits every frame
global.ghoul_atk_duration = (7/12) * 60; //7 frames. 12 fps, 60 fps

// Castle Properties
global.player_castle_health = 2500;
global.starting_player_castle_health = 2500;
global.player_castle_health_enemy = 2500;
global.starting_player_castle_health_enemy = 2500;

// Map properties
//global.ground_tile = obj_ground_b_stone; // sand and bricks is large (x: 128), rest are normal sized (x: 96)
//global.ground_tile_width = 96; // 128 for the larger tiles, 96 is standard

// save data 
// PLACEHOLDER UNTIL SAVE STATES ARE IMPLEMENTED
// game is non linear, you can complete all levels in multiple orders.
// As long as you cleared
// the nation next to whatever you wish to take on, you can take on the adjacent nations.
global.lvl_1_clear = true;
global.lvl_2_clear = true;
global.lvl_3_clear = true;
global.lvl_4_clear = true;
global.lvl_5_clear = true;
global.lvl_6_clear = true;
global.lvl_7_clear = true;
global.lvl_8_clear = true;
global.lvl_9_clear = true;
global.lvl_10_clear = true;

// global audio controllers
global.music_amp_decimal = 0.5;
global.music_amp_slider_x = 0;

global.sound_effects_amp_decimal = 0.75;
global.sound_effects_slider_x = 0;

// 8 more unit slots to go
// 2 siege: siege ram, trebuchet
// 4 cavalry: swordman, pikeman, knight (all have shields), archer (no shield)
// 2 support: bard (heals all units in an aoe around them), necromancer (summons undead skele soldiers, weak and brittle but immune to magic)

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

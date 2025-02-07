// Inherit the parent event
event_inherited();

// override certain variables
// Training Modifiers
// Training pool, what units are we allowed to train?
can_train_sm = global.enemy_2_can_train_sm;
can_train_pm = global.enemy_2_can_train_pm;
can_train_rg = global.enemy_2_can_train_rg;
can_train_kn = global.enemy_2_can_train_kn;
can_train_ab = global.enemy_2_can_train_ab;
can_train_hb = global.enemy_2_can_train_hb;
can_train_mg = global.enemy_2_can_train_mg;
// can_train_cp = global.enemy_can_train_cp;
can_train_nc = global.enemy_2_can_train_nc;

// objects that we train ourselves
ai_swordsman = obj_swordman_enemy;
ai_pikeman = obj_pikeman_enemy;
ai_ranger = obj_ranger_enemy;
ai_knight = obj_knight_enemy;
ai_arbalest = obj_arbalest_e2;
ai_halberdier = obj_halberdier_enemy;
ai_magician = obj_magician_enemy;
ai_necromancer = obj_necromancer_enemy;

// AI modifiers
// Here we tweak modifiers that influence how the ai determines importance of different variables.
// These are represented as a decimal, from 0-1.
cntr_p_army_range_thres = 0.3; // if the player army is made up of x% ranged units
cntr_p_army_sm_thres = 0.5; // if the player army is made up of x% swordman units
cntr_p_army_pm_thres = 0.35; // if the player army is made up of x% pikeman units
cntr_p_army_rg_thres = 0.4; // if the player army is made up of x% ranger units
cntr_p_army_kn_thres = 0.5; // if the player army is made up of x% knight units
cntr_p_army_ab_thres = 0.3; // if the player army is made up of x% arbalest units
cntr_p_army_hb_thres = 0.35; // if the player army is made up of x% halberdier units
cntr_p_army_mg_thres = 0.1; // if the player army is made up of x% magician units
cntr_p_army_cp_thres = 0.1; // if the player army is made up of x% catapult units
cntr_p_army_nc_thres = 0.05; // if the player army is made up of x% necromancer units

// Decision making
ai_retr_cutoff_perc = 0.5;
ai_def_cutoff_perc = 0.25;

// Economic level tracker
// formula in algebriac form is 5x^{2}+5
// formula is (gold_gen * (ai_eco_lv ^ 2)) + gold_gen
ai_eco_lv = 0; // 0 is base, // 7 is max
// 5, 10, 25, 50, 85. 130, 185, 250

// % chances to save up for eco upgrades:
eco_up_ch_thres_lv_0 = 0.8;
eco_up_ch_thres_lv_1 = 0.75;
eco_up_ch_thres_lv_2 = 0.5;
eco_up_ch_thres_lv_3 = 0.4;
eco_up_ch_thres_lv_4 = 0.35;
eco_up_ch_thres_lv_5 = 0.2;
eco_up_ch_thres_lv_6 = 0.1;

// Must set // reset these
// Set starting ai order
global.enemy_2_order = 0;

// reset enemy gold amount
our_gold_amount = global.enemy_2_gold_start_amount;

our_gold_gen = global.enemy_2_gold_gen;
our_gold_cap = global.enemy_2_gold_cap;

// reinforcement properties
// here we define the quantity of each unit type to spawn when we reach a certain threshold
reinf_hp_thres = 0.5; // 50%

// unit amounts
// we will spawn these regardless of what unit types we are able to train
reinf_sm_amount = 0;
reinf_pm_amount = 0;
reinf_rg_amount = 0;
reinf_kn_amount = 0;
reinf_ab_amount = 0;
reinf_hb_amount = 0;
reinf_mg_amount = 0;
// reinf_cp_amount = 0; NOT YET AVAILABLE
reinf_nc_amount = 0;

// last stand hp reinforcement threshold
lstand_hp_thres = 0.25; // 25%

// track if we spawned reinforcement units
reinf_spawned = false;

// unit amounts
// we will spawn these regardless of what unit types we are able to train
lstand_sm_amount = 0;
lstand_pm_amount = 0;
lstand_rg_amount = 0;
lstand_kn_amount = 0;
lstand_ab_amount = 0;
lstand_hb_amount = 0;
lstand_mg_amount = 0;
// reinf_cp_amount = 0; NOT YET AVAILABLE
lstand_nc_amount = 0;

// track if we spawned last stand units
lstand_spawned = false;
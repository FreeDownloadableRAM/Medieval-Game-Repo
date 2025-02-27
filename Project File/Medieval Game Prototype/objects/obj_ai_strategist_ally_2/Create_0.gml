// Inherit the parent event
event_inherited();

// override certain variables
// Training Modifiers
// Training pool, what units are we allowed to train?
can_train_sm = global.ally_2_can_train_sm;
can_train_pm = global.ally_2_can_train_pm;
can_train_rg = global.ally_2_can_train_rg;
can_train_kn = global.ally_2_can_train_kn;
can_train_ab = global.ally_2_can_train_ab;
can_train_hb = global.ally_2_can_train_hb;
can_train_mg = global.ally_2_can_train_mg;
// can_train_cp = global.ally_can_train_cp;
can_train_nc = global.ally_2_can_train_nc;

// objects that we train ourselves
ai_swordsman = obj_swordman_a2;
ai_pikeman = obj_pikeman_a2;
ai_ranger = obj_ranger_a2;
ai_knight = obj_knight_a2;
ai_arbalest = obj_arbalest_a2;
ai_halberdier = obj_halberdier_a2;
ai_magician = obj_magician_a2;
ai_necromancer = obj_necromancer_a2;

// AI modifiers
// Here we tweak modifiers that influence how the ai determines importance of different variables.
// These are represented as a decimal, from 0-1.
cntr_p_army_range_thres = 0.9; // if the player army is made up of x% ranged units
cntr_p_army_sm_thres = 0.95; // if the player army is made up of x% swordman units
cntr_p_army_pm_thres = 0.95; // if the player army is made up of x% pikeman units
cntr_p_army_rg_thres = 0.90; // if the player army is made up of x% ranger units
cntr_p_army_kn_thres = 0.95; // if the player army is made up of x% knight units
cntr_p_army_ab_thres = 0.90; // if the player army is made up of x% arbalest units
cntr_p_army_hb_thres = 0.65; // if the player army is made up of x% halberdier units
cntr_p_army_mg_thres = 0.75; // if the player army is made up of x% magician units
cntr_p_army_cp_thres = 0.8; // if the player army is made up of x% catapult units
cntr_p_army_nc_thres = 0.85; // if the player army is made up of x% necromancer units

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
eco_up_ch_thres_lv_2 = 0.75;
eco_up_ch_thres_lv_3 = 0.4;
eco_up_ch_thres_lv_4 = 0.25;
eco_up_ch_thres_lv_5 = 0.75;
eco_up_ch_thres_lv_6 = 0.8;

// Must set // reset these
// Set starting ai order
global.ally_2_order = 0;

// reset enemy gold amount
our_gold_amount = global.ally_2_gold_start_amount * global.slot_three_eco_start_multiplier;

our_gold_gen = global.ally_2_gold_gen * global.slot_three_eco_gen_multiplier;
our_gold_cap = global.ally_2_gold_cap * global.slot_three_eco_cap_multiplier;

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

// reset unit counters
global.ally_2_unit_count = 0;
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

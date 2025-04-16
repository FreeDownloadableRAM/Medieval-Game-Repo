/// This is the parameters the ai logic will use in its decision making, 
// the ai logic will be the same no matter what, its the parameters that change in the objects children.
// This creates different "AI" personalities, of differing levels of aggresiveness and eco-emphasis.
// As more units are added to the game, more gets added here to this ai base, requiring
// no further edits to each child object

// AI is all-knowing. It will know every Unit type the player trains as they train it.
// And Keep Track, In order to decision make.

// Training Modifiers
// Training pool, what units are we allowed to train?
can_train_sm = global.enemy_can_train_sm;
can_train_pm = global.enemy_can_train_pm;
can_train_rg = global.enemy_can_train_rg;
can_train_kn = global.enemy_can_train_kn;
can_train_ab = global.enemy_can_train_ab;
can_train_hb = global.enemy_can_train_hb;
can_train_mg = global.enemy_can_train_mg;
can_train_cp = global.enemy_can_train_cp;
can_train_nc = global.enemy_can_train_nc;

// objects that we train ourselves
ai_swordsman = obj_swordman_enemy;
ai_pikeman = obj_pikeman_enemy;
ai_ranger = obj_ranger_enemy;
ai_knight = obj_knight_enemy;
ai_arbalest = obj_arbalest_enemy;
ai_halberdier = obj_halberdier_enemy;
ai_magician = obj_magician_enemy;
ai_necromancer = obj_necromancer_enemy;
ai_catapult = obj_catapult_enemy;

// Trackers
// Here we keep track of the units the player is using, these values are taken from the units spawned by the player themself.
opposition_sm_amount = global.player_sm_count + global.ally_1_sm_count + global.ally_2_sm_count + global.ally_3_sm_count;
opposition_pm_amount = global.player_pm_count + global.ally_1_pm_count + global.ally_2_pm_count + global.ally_3_pm_count;
opposition_rg_amount = global.player_rg_count + global.ally_1_rg_count + global.ally_2_rg_count + global.ally_3_rg_count;
opposition_kn_amount = global.player_kn_count + global.ally_1_kn_count + global.ally_2_kn_count + global.ally_3_kn_count;
opposition_ab_amount = global.player_ab_count + global.ally_1_ab_count + global.ally_2_ab_count + global.ally_3_ab_count;
opposition_hb_amount = global.player_hb_count + global.ally_1_hb_count + global.ally_2_hb_count + global.ally_3_hb_count;
opposition_mg_amount = global.player_mg_count + global.ally_1_mg_count + global.ally_2_mg_count + global.ally_3_mg_count;
// wip
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
// wip
allied_cp_amount = global.enemy_cp_count + global.enemy_2_cp_count + global.enemy_3_cp_count + global.enemy_4_cp_count; // NOT AVAILABLE YET
allied_nc_amount = global.enemy_nc_count + global.enemy_2_nc_count + global.enemy_3_nc_count + global.enemy_4_nc_count;
allied_gh_amount = global.enemy_gh_count + global.enemy_2_gh_count + global.enemy_3_gh_count + global.enemy_4_gh_count;

// total
allied_total_rg_units = 0;
allied_total_mel_units = 0;

// maintain army compositions ratios
allied_ranged_army_perc_targ = 0.75; 
allied_ranged_army_percent = 0.0;

// total
allied_unit_amount = global.player_unit_count_enemy + global.enemy_2_unit_count + global.enemy_3_unit_count + global.enemy_4_unit_count;


// Training timers
ai_sm_train_delay = global.ai_train_delay_sm * fps; // here we set the seconds in to terms of fps.
ai_pm_train_delay = global.ai_train_delay_pm * fps;
ai_rg_train_delay = global.ai_train_delay_rg * fps;
ai_kn_train_delay = global.ai_train_delay_kn * fps;
ai_ab_train_delay = global.ai_train_delay_ab * fps;
ai_hb_train_delay = global.ai_train_delay_hb * fps;
ai_mg_train_delay = global.ai_train_delay_mg * fps;
ai_nc_train_delay = global.ai_train_delay_nc * fps;
ai_cp_train_delay = global.ai_train_delay_cp * fps;
ai_cp_train_counter = 0;

// Handle alarms
// Whenever these reach zero, toggle a variable
// When they are invoked in the step event, the timers are reset.
alarm_set(0,ai_sm_train_delay); // swordman training delay time
alarm_set(1,ai_pm_train_delay); // pikeman training delay time
alarm_set(2,ai_rg_train_delay); // ranger training delay time
alarm_set(3,ai_kn_train_delay); // knight training delay time
alarm_set(4,ai_ab_train_delay); // arbalest training delay time
alarm_set(5,ai_hb_train_delay); // halberdier training delay time
alarm_set(10,ai_mg_train_delay); // magician training delay time
alarm_set(11,ai_nc_train_delay); // necromancer training delay time

// We DONT want to calculate ratios and other operations EVERY frame, so we only calculate that whenever alarm[6] is triggered.
alarm_set(6,(3 / (delta_time/1000000))); // every 3 seconds

// Update personal variables every second
alarm_set(7,(1 / (delta_time/1000000))); // every second

// We only want to consider upgrading our economy every 7 seconds
alarm_set(8,(7 / (delta_time/1000000))); // every 7 seconds

// Player army composition modifiers, the player army composition is tracked here.
// Ranged units to melee units ratio
opposition_army_range_to_melee_ratio = (opposition_rg_amount + opposition_ab_amount)/(global.player_unit_count);

// Swordman ratio to rest of army
opposition_sm_to_army_ratio = (opposition_sm_amount)/(global.player_unit_count + global.ally_1_unit_count + global.ally_2_unit_count + global.ally_3_unit_count);

// Pikeman ratio to rest of army
opposition_pm_to_army_ratio = (opposition_pm_amount)/(global.player_unit_count + global.ally_1_unit_count + global.ally_2_unit_count + global.ally_3_unit_count);

// Ranger ratio to rest of army
opposition_rg_to_army_ratio = (opposition_rg_amount)/(global.player_unit_count + global.ally_1_unit_count + global.ally_2_unit_count + global.ally_3_unit_count);

// Knight ratio to rest of army
opposition_kn_to_army_ratio = (opposition_kn_amount)/(global.player_unit_count + global.ally_1_unit_count + global.ally_2_unit_count + global.ally_3_unit_count);

// Arbalest ratio to rest of army
opposition_ab_to_army_ratio = (opposition_ab_amount)/(global.player_unit_count + global.ally_1_unit_count + global.ally_2_unit_count + global.ally_3_unit_count);

// Halberdier ratio to rest of army
opposition_hb_to_army_ratio = (opposition_hb_amount)/(global.player_unit_count + global.ally_1_unit_count + global.ally_2_unit_count + global.ally_3_unit_count);

// Magician ratio to rest of army
opposition_mg_to_army_ratio = (opposition_mg_amount)/(global.player_unit_count + global.ally_1_unit_count + global.ally_2_unit_count + global.ally_3_unit_count);

// Catapult ratio to rest of army
opposition_cp_to_army_ratio = (opposition_cp_amount)/(global.player_unit_count + global.ally_1_unit_count + global.ally_2_unit_count + global.ally_3_unit_count);

// Necromancer ratio to rest of army
opposition_nc_to_army_ratio = (opposition_nc_amount)/(global.player_unit_count + global.ally_1_unit_count + global.ally_2_unit_count + global.ally_3_unit_count);

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

// AI perception (%)
// Track your King's health
allies_king_health = 1.0;

// Track player king health
opposition_king_health = 1.0;

// Decision making
ai_retr_cutoff_perc = 0.5;
ai_def_cutoff_perc = 0.25;

// Random AI type
//ai_type = irandom_range(0,5); 
// 0 = swords (swordmen and knights) and archers, 1 = pikes (pikes and halberdiers) and archers
// 2 = ranged (archers and arbalests), 3 = heavy hitters (knights, halberds and rangers) 4 = trash army (swordmen, pikemen, rangers)
// 5 = assorted (everything) you have available

// For debugging purposes, just set at to 0.
ai_type = irandom_range(0,5);

// Track what the ai is attempting to do
ai_choice = "Nothing";
ai_order_situation = "Nothing";

// Control AI Orders
// ai order is tracked via a global variable
// This is to prevent the ai from attacking for a set period of time
// a sort of grace period, so that they won't attack the player for a set duration.
ai_restrict_attack_order = true;
alarm_set(9,(irandom_range(15,60) / (delta_time/1000000))); // after 15-60 seconds, set ai_restrict_attack_order to false.

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

// Store whether or not the ai wants to save up for eco upgrade
ai_eco_up_save = false;
ai_upgrade_econ_chance = 0.99;

unit_train_timer = 3*fps;

// Change to USE FPS so its not framerate dependent, but Time dependent
unit_train_time_freq = random_range((5*fps),(12*fps)); // 60 fps,

// Spawn Locations
unit_spawn_location_x = global.current_map_size_x + 256;
unit_spawn_location_y = global.current_map_size_y - 160;

attack_population_threshold = 20;

// Set starting ai order
global.enemy_order = 0;

// reset enemy gold amount
our_gold_amount = global.enemy_gold_start_amount * global.slot_five_eco_start_multiplier;

our_gold_gen = global.enemy_gold_gen * global.slot_five_eco_gen_multiplier;
our_gold_cap = global.enemy_gold_cap * global.slot_five_eco_cap_multiplier;

// Prevent forever games
ai_patience = ((irandom_range(5,8) * 60) / (delta_time/1000000)); // 5 to 8 mins randomly

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
reinf_cp_amount = 0; 
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
lstand_cp_amount = 0; 
lstand_nc_amount = 0;

// track if we spawned last stand units
lstand_spawned = false;
/// This is the parameters the ai logic will use in its decision making, 
// the ai logic will be the same no matter what, its the parameters that change in the objects children.
// This creates different "AI" personalities, of differing levels of aggresiveness and eco-emphasis.
// As more units are added to the game, more gets added here to this ai base, requiring
// no further edits to each child object

// AI is all-knowing. It will know every Unit type the player trains as they train it.
// And Keep Track, In order to decision make.

// Training Modifiers
// Training pool, what units are we allowed to train?
can_train_sm = true;
can_train_pm = true;
can_train_rg = true;
can_train_kn = true;
can_train_ab = true;
can_train_hb = true;
can_train_mg = true;
// can_train_cp = true;
can_train_nc = true;

// Trackers
// Here we keep track of the units the player is using, these values are taken from the units spawned by the player themself.
p_sm_amount = global.player_sm_count;
p_pm_amount = global.player_pm_count;
p_rg_amount = global.player_rg_count;
p_kn_amount = global.player_kn_count;
p_ab_amount = global.player_ab_count;
p_hb_amount = global.player_hb_count;
p_mg_amount = global.player_mg_count;
// wip
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
// wip
// ai_cp_amount = global.enemy_cp_count; // NOT AVAILABLE YET
ai_nc_amount = global.enemy_nc_count;
ai_gh_amount = global.enemy_gh_count;

// total
ai_total_rg_units = 0;
ai_total_mel_units = 0;

// maintain army compositions ratios
ai_ranged_army_perc_targ = 0.75; 
ai_ranged_army_percent = 0.0;


// Training timers
ai_sm_train_delay = global.ai_train_delay_sm * fps; // here we set the seconds in to terms of fps.
ai_pm_train_delay = global.ai_train_delay_pm * fps;
ai_rg_train_delay = global.ai_train_delay_rg * fps;
ai_kn_train_delay = global.ai_train_delay_kn * fps;
ai_ab_train_delay = global.ai_train_delay_ab * fps;
ai_hb_train_delay = global.ai_train_delay_hb * fps;
ai_mg_train_delay = global.ai_train_delay_mg * fps;

// wip
ai_nc_train_delay = global.ai_train_delay_nc * fps;

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
alarm_set(6,(3*fps)); // every 3 seconds

// Update personal variables every second
alarm_set(7,(1*fps)); // every second

// We only want to consider upgrading our economy every 7 seconds
alarm_set(8,(7*fps)); // every 7 seconds

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

// Necromancer ratio to rest of army
p_cp_to_army_ratio = (p_cp_amount)/(global.player_unit_count);

// Necromancer ratio to rest of army
p_nc_to_army_ratio = (p_nc_amount)/(global.player_unit_count);

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
ai_king_health = 1.0;

// Track player king health
p_king_health = 1.0;

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
alarm_set(9,(10*fps)); // after 10 seconds, set ai_restrict_attack_order to false.

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
enemy_spawn_location_x = global.current_map_size_x + 256;
enemy_spawn_location_y = global.current_map_size_y - 160;

attack_population_threshold = 20;

// Set starting ai order
global.enemy_order = 0;

// reset enemy gold amount
global.enemy_gold_amount = global.enemy_gold_start_amount;

// Prevent forever games
ai_patience = irandom_range((300*fps),(420*fps)); // 5 to 8 mins randomly

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
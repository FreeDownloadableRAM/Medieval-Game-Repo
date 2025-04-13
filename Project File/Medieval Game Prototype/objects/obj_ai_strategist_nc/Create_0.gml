/// @description change ai properties
// inherent parent event, then override

// Inherit the parent event
event_inherited();

// Change trainable units
can_train_sm = false;
can_train_pm = false;
can_train_rg = false;
can_train_kn = false;
can_train_ab = false;
can_train_hb = false;
can_train_mg = false;
can_train_nc = true;
can_train_cp = false;

// dont attack too early, or its too unfair
alarm_set(9,(irandom_range(90,120) / (delta_time/1000000))); // after 15-60 seconds, set ai_restrict_attack_order to false.

// starting units
instance_create_layer(unit_spawn_location_x,unit_spawn_location_y,"NPCs",obj_necromancer_enemy);

// set eco level
ai_eco_lv = 6; // 0 is base, // 7 is max

// reinforcement properties
reinf_mg_amount = 0;
reinf_nc_amount = 1;

lstand_mg_amount = 0;
lstand_nc_amount = 3;

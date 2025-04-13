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
can_train_mg = true;
can_train_nc = true;
can_train_cp = false;

// set eco level
ai_eco_lv = 7; // 0 is base, // 7 is max


// reinforcement properties
reinf_mg_amount = 2;
reinf_nc_amount = 1;

lstand_mg_amount = 3;
lstand_nc_amount = 2;

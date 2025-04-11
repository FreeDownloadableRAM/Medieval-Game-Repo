/// @description change ai properties
// inherent parent event, then override

// Inherit the parent event
event_inherited();

// Change trainable units
can_train_sm = false;
can_train_pm = false;
can_train_rg = false;
can_train_kn = true;
can_train_ab = false;
can_train_hb = true;
can_train_mg = true;
can_train_nc = true;
can_train_cp = false;

// set eco level
ai_eco_lv = 3; // 0 is base, // 7 is max


// reinforcement properties
reinf_hb_amount = 1;
reinf_kn_amount = 2;
reinf_mg_amount = 1;

lstand_hb_amount = 2;
lstand_kn_amount = 3;
lstand_mg_amount = 1;
lstand_nc_amount = 1;
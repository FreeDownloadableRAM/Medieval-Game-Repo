/// @description change ai properties
// inherent parent event, then override

// Inherit the parent event
event_inherited();

// Change trainable units
can_train_sm = false;
can_train_pm = false;
can_train_rg = true;
can_train_kn = true;
can_train_ab = false;
can_train_hb = false;
can_train_mg = false;
can_train_nc = false;
can_train_cp = false;

// set eco level
ai_eco_lv = 2; // 0 is base, // 7 is max


// reinforcement properties
reinf_kn_amount = 2;
reinf_rg_amount = 3;

lstand_kn_amount = 5;
lstand_rg_amount = 10;

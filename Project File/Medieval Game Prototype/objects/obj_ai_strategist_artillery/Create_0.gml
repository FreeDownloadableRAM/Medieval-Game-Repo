/// @description change ai properties
// inherent parent event, then override

// Inherit the parent event
event_inherited();

// Change trainable units
can_train_sm = false;
can_train_pm = true;
can_train_rg = false;
can_train_kn = true;
can_train_ab = false;
can_train_hb = false;
can_train_mg = false;
can_train_nc = false;
can_train_cp = true;

// set eco level
ai_eco_lv = 3; // 0 is base, // 7 is max


// reinforcement properties
reinf_pm_amount = 3;
reinf_kn_amount = 2;

lstand_pm_amount = 2;
lstand_kn_amount = 3;

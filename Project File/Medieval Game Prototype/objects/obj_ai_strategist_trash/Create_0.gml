/// @description change ai properties
// inherent parent event, then override

// Inherit the parent event
event_inherited();

// Change trainable units
can_train_sm = true;
can_train_pm = true;
can_train_rg = true;
can_train_kn = false;
can_train_ab = true;
can_train_hb = false;
can_train_mg = false;
can_train_nc = false;
can_train_cp = false;

// set eco level
ai_eco_lv = 1; // 0 is base, // 7 is max


// reinforcement properties
reinf_sm_amount = 3;
reinf_pm_amount = 2;
reinf_rg_amount = 1;

lstand_sm_amount = 4;
lstand_pm_amount = 4;
lstand_rg_amount = 2;
lstand_ab_amount = 3;
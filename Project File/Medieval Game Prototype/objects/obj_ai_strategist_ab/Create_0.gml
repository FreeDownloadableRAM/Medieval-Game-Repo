/// @description change ai properties
// inherent parent event, then override

// Inherit the parent event
event_inherited();

// Change trainable units
can_train_sm = false;
can_train_pm = false;
can_train_rg = false;
can_train_kn = false;
can_train_ab = true;
can_train_hb = false;
can_train_mg = false;
can_train_nc = false;

ai_eco_lv = 3; // 0 is base, // 7 is max

// reinforcement properties
reinf_ab_amount = 3;

lstand_ab_amount = 5;
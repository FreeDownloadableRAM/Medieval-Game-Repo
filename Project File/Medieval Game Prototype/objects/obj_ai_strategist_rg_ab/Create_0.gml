/// @description change ai properties
// inherent parent event, then override

// Inherit the parent event
event_inherited();

// Change trainable units
can_train_sm = false;
can_train_pm = false;
can_train_rg = true;
can_train_kn = false;
can_train_ab = true;
can_train_hb = false;
can_train_mg = false;
can_train_nc = false;

// reinforcement properties
reinf_ab_amount = 2;
reinf_rg_amount = 3;

lstand_ab_amount = 3;
lstand_rg_amount = 7;
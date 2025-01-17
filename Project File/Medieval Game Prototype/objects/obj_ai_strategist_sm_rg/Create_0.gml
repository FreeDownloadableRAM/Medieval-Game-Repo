/// @description change ai properties
// inherent parent event, then override

// Inherit the parent event
event_inherited();

// Change trainable units
can_train_sm = true;
can_train_pm = false;
can_train_rg = true;
can_train_kn = false;
can_train_ab = false;
can_train_hb = false;
can_train_mg = false;
can_train_nc = false;

// reinforcement properties
reinf_sm_amount = 5;
reinf_rg_amount = 3;

lstand_sm_amount = 10;
lstand_rg_amount = 5;
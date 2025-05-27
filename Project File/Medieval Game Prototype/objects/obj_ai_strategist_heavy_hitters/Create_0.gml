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
can_train_hb = true;
can_train_mg = false;
can_train_nc = false;
can_train_cp = true;

// reinforcement properties
reinf_hb_amount = 2;
reinf_mg_amount = 1;

lstand_hb_amount = 2;
lstand_kn_amount = 3;
lstand_mg_amount = 1;
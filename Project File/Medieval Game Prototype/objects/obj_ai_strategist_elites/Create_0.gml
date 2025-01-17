/// @description change ai properties
// inherent parent event, then override

// Inherit the parent event
event_inherited();

// Change trainable units
can_train_sm = false;
can_train_pm = true;
can_train_rg = true;
can_train_kn = true;
can_train_ab = true;
can_train_hb = true;
can_train_mg = false;
can_train_nc = true;

// reinforcement properties
reinf_pm_amount = 1;
reinf_kn_amount = 1;
reinf_rg_amount = 1;


lstand_pm_amount = 2;
lstand_kn_amount = 2;
lstand_nc_amount = 1;
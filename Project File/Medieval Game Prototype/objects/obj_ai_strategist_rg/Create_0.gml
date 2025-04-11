/// @description change ai properties
// inherent parent event, then override

// Inherit the parent event
event_inherited();

// Change trainable units
can_train_sm = false;
can_train_pm = false;
can_train_rg = true;
can_train_kn = false;
can_train_ab = false;
can_train_hb = false;
can_train_mg = false;
can_train_cp = false;

// since this is the default first lvl, we make the ai very hesitant to upgrade eco

// Economic level tracker
// formula in algebriac form is 5x^{2}+5
// formula is (gold_gen * (ai_eco_lv ^ 2)) + gold_gen
ai_eco_lv = 0; // 0 is base, // 7 is max
// 5, 10, 25, 50, 85. 130, 185, 250

// % chances to save up for eco upgrades:
eco_up_ch_thres_lv_0 = 0.25;
eco_up_ch_thres_lv_1 = 0.1;
eco_up_ch_thres_lv_2 = 0.05;
eco_up_ch_thres_lv_3 = 0.01;
eco_up_ch_thres_lv_4 = 0.01;
eco_up_ch_thres_lv_5 = 0.01;
eco_up_ch_thres_lv_6 = 0.01;

// reinforcement properties
reinf_rg_amount = 2;

lstand_rg_amount = 3;
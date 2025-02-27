/// set starting player gold
global.player_gold_amount = global.player_gold_start_amount * global.slot_one_eco_start_multiplier;

// Upgrade tiers will be doubling, ex. 50 -> 100 -> 200 -> 400 -> 800 -> 1600 etc.
// gold income per tier will not double but will go up by a set amount, itself + 5
// gold comes in every specified amount of frames
gold_income_speed = 3*fps; // 180 = 3 seconds as we go 60 fps
gold_income_timer = 0;
gold_income_tier_cost = 50;
gold_income_addition = 0;

player_eco_lv = 0;

button_width_from_center = 48;
button_height_from_center = 48;
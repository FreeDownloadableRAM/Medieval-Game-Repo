// Castle Properties
castle_health = global.player_castle_health;
castle_health_max = global.player_castle_health;

// Defence Properties
castle_slash_defence = 0.5; 
castle_pierce_defence = 0.8;
castle_thrust_defence = 0.75;
castle_blunt_defence = 0.45;
castle_magic_defence = 0.85;

// Tell the game where this king is located:
global.player_king_x_location = x;

// Reset trackers
global.player_unit_count = 0;
global.player_unit_count_enemy = 0;

// Player Trackers
global.player_sm_count = 0;
global.player_pm_count = 0;
global.player_rg_count = 0;
global.player_kn_count = 0;
global.player_ab_count = 0;
global.player_hb_count = 0;
global.player_mg_count = 0;
global.player_cp_count = 0;

// Enemy unit ai trackers
global.enemy_sm_count = 0;
global.enemy_pm_count = 0;
global.enemy_rg_count = 0;
global.enemy_kn_count = 0;
global.enemy_ab_count = 0;
global.enemy_hb_count = 0;
global.enemy_mg_count = 0;
global.enemy_cp_count = 0;

// Health
global.player_castle_health = global.starting_player_castle_health;

// Reset Order
global.player_order = 1;

// health bar UI
hp_bar_width = 128;
hp_bar_height = 4;
hp_bar_offset_y = -33;

// Position coordinates of HP bar
hp_l_coord_x = x - (hp_bar_width / 2);
hp_t_coord_y = y + hp_bar_offset_y;
hp_r_coord_x = x + (hp_bar_width / 2);
hp_b_coord_y = y + hp_bar_offset_y + hp_bar_height;
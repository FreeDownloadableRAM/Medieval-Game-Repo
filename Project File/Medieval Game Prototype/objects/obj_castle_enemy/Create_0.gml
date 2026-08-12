// Castle Properties
castle_health = global.starting_player_castle_health_enemy;
castle_health_max = global.starting_player_castle_health_enemy;

// Defence Properties
castle_slash_defence = 0.5; 
castle_pierce_defence = 0.8;
castle_thrust_defence = 0.75;
castle_blunt_defence = 0.45;
castle_magic_defence = 0.85;

global.enemy_king_x_location = x;

// Reset Health
global.player_castle_health_enemy = global.starting_player_castle_health_enemy;

// health bar UI
hp_bar_width = 128;
hp_bar_height = 4;
hp_bar_offset_y = -33;

// Position coordinates of HP bar
hp_l_coord_x = x - (hp_bar_width / 2);
hp_t_coord_y = y + hp_bar_offset_y;
hp_r_coord_x = x + (hp_bar_width / 2);
hp_b_coord_y = y + hp_bar_offset_y + hp_bar_height;
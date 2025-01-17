// Castle Properties
castle_health = global.player_castle_health;

// Defence Properties
castle_slash_defence = 0.5; 
castle_pierce_defence = 0.8;
castle_thrust_defence = 0.75;
castle_blunt_defence = 0.0;
castle_magic_defence = 0.25;

// health bar UI
hp_bar_width = 128;
hp_bar_height = 4;
hp_bar_offset_x = 128;
hp_bar_offset_y = -64;

// Position coordinates of HP bar
hp_l_coord_x = x + hp_bar_offset_x;
hp_t_coord_y = y + hp_bar_offset_y;
hp_r_coord_x = x + hp_bar_offset_x + hp_bar_width;
hp_b_coord_y = y + hp_bar_offset_y + hp_bar_height;
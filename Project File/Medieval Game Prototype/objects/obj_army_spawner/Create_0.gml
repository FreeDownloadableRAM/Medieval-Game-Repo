/// units
sm = obj_swordman;
pm = obj_pikeman;
rg = obj_ranger;
kn = obj_knight;
ab = obj_arbalest;
hb = obj_halberdier;
mg = obj_magician;

sm_enemy = obj_swordman_enemy;
pm_enemy = obj_pikeman_enemy;
rg_enemy = obj_ranger_enemy;
kn_enemy = obj_knight_enemy;
ab_enemy = obj_arbalest_enemy;
hb_enemy = obj_halberdier_enemy;
mg_enemy = obj_magician_enemy;

// Spawn Locations
spawn_location_x = -128;
spawn_location_y = 928;

spawn_location_x_enemy = 2048; // 2048
spawn_location_y_enemy = 928;

// Set enemy orders
global.player_order = 2;
global.enemy_order = 2;

// Set alarms
alarm_set(0,60);
alarm_set(1,180);

// Spawner timer variable
random_spawn_delay = irandom_range(1,3);
blue_spawn_index = irandom_range(1,5);
red_spawn_index = irandom_range(1,5);

// Reset global unit trackers
global.player_unit_count = 0;
global.player_unit_count_enemy = 0;

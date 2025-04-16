// King of the Hill Properties
score_threshold = 100;
score_timer = 3; // every 3 seconds, add points
score_increment = 1;

score_allies = 0;
score_opposition = 0;

alarm_set(0,score_timer / (delta_time/1000000));

koth_ownership = 0; // 0 = no one, 1 = player, 2 = enemy

image_index = koth_ownership;

// center the koth the middle of map
// and set it to correct Y value
x = global.current_map_size_x / 2;
y = 512;

// ai behaviour trick - HAHA
// set global variable for king health at 40% so the AI only defends or attacks
// for both sides
global.player_castle_health = global.starting_player_castle_health * 0.4;
global.player_castle_health_enemy = global.starting_player_castle_health_enemy * 0.4;
/// Here we will set character properties
// Global AI trackers
global.enemy_2_unit_count += 1;

// Information about myself
internal_unit_number = global.enemy_2_unit_count;
internal_unit_type = "generic_ranged_NPC";
num_of_debug_items = 12;

// Character physical Properties
// Attack Properties
character_slash_attack = 0.0; // in hitpoints
character_pierce_attack = 0.0; 
character_thrust_attack = 1.0; 
character_blunt_attack = 0.0;
character_magic_attack = 0.0; 

character_reach = 592.0 // in pixels

// Defence Properties
character_health = 150.0;
character_slash_defence = 0.75; 
character_pierce_defence = 0.0;
character_thrust_defence = 0.25;
character_blunt_defence = 0.7;
character_magic_defence = 0.9;

// Movement Properties
character_walking_speed = 0.42;
character_running_speed = 1.52;

// walk distance boundary, if the distance is smaller than this distance, walk, if not, run
character_walking_boundary = random_range(12,48);

// Set Sprites
// Sprite
if (global.slot_six_colour == 0){
	// 0 = blue
	character_idle_anim = spr_mg_00_idle;
	character_ready_anim = spr_mg_01_ready;
	character_walk_anim = spr_mg_02_walking;
	character_run_anim = spr_mg_03_running;
	character_attack_anim_1 = spr_mg_04_attacking_1;
	character_attack_projectile = obj_magician_spell_0;
	character_defend_anim = spr_mg_05_defend;
	character_death_anim_1 = spr_mg_06_death_1;
}
else if (global.slot_six_colour == 1){
	// 0 = green
	character_idle_anim = spr_mg_00_idle_green;
	character_ready_anim = spr_mg_01_ready_green;
	character_walk_anim = spr_mg_02_walking_green;
	character_run_anim = spr_mg_03_running_green;
	character_attack_anim_1 = spr_mg_04_attacking_1_green;
	character_attack_projectile = obj_magician_spell_0;
	character_defend_anim = spr_mg_05_defend_green;
	character_death_anim_1 = spr_mg_06_death_1_green;
}
else if (global.slot_six_colour == 2){
	// 2 = cyan
	character_idle_anim = spr_mg_00_idle_cyan;
	character_ready_anim = spr_mg_01_ready_cyan;
	character_walk_anim = spr_mg_02_walking_cyan;
	character_run_anim = spr_mg_03_running_cyan;
	character_attack_anim_1 = spr_mg_04_attacking_1_cyan;
	character_attack_projectile = obj_magician_spell_0;
	character_defend_anim = spr_mg_05_defend_cyan;
	character_death_anim_1 = spr_mg_06_death_1_cyan;
}
else if (global.slot_six_colour == 3){
	// 3 = purple
	character_idle_anim = spr_mg_00_idle_purple;
	character_ready_anim = spr_mg_01_ready_purple;
	character_walk_anim = spr_mg_02_walking_purple;
	character_run_anim = spr_mg_03_running_purple;
	character_attack_anim_1 = spr_mg_04_attacking_1_purple;
	character_attack_projectile = obj_magician_spell_0;
	character_defend_anim = spr_mg_05_defend_purple;
	character_death_anim_1 = spr_mg_06_death_1_purple;
}
else if (global.slot_six_colour == 4){
	// 4 = red
	character_idle_anim = spr_mg_00_idle_enemy;
	character_ready_anim = spr_mg_01_ready_enemy;
	character_walk_anim = spr_mg_02_walking_enemy;
	character_run_anim = spr_mg_03_running_enemy;
	character_attack_anim_1 = spr_mg_04_attacking_1_enemy;
	character_attack_projectile = obj_magician_spell_0;
	character_defend_anim = spr_mg_05_defend_enemy;
	character_death_anim_1 = spr_mg_06_death_1_enemy;
}
else if (global.slot_six_colour == 5){
	// 5 = orange
	character_idle_anim = spr_mg_00_idle_orange;
	character_ready_anim = spr_mg_01_ready_orange;
	character_walk_anim = spr_mg_02_walking_orange;
	character_run_anim = spr_mg_03_running_orange;
	character_attack_anim_1 = spr_mg_04_attacking_1_orange;
	character_attack_projectile = obj_magician_spell_0;
	character_defend_anim = spr_mg_05_defend_orange;
	character_death_anim_1 = spr_mg_06_death_1_orange;
}
else if (global.slot_six_colour == 6){
	// 6 = yellow
	character_idle_anim = spr_mg_00_idle_yellow;
	character_ready_anim = spr_mg_01_ready_yellow;
	character_walk_anim = spr_mg_02_walking_yellow;
	character_run_anim = spr_mg_03_running_yellow;
	character_attack_anim_1 = spr_mg_04_attacking_1_yellow;
	character_attack_projectile = obj_magician_spell_0;
	character_defend_anim = spr_mg_05_defend_yellow;
	character_death_anim_1 = spr_mg_06_death_1_yellow;
}
else {
	// 7 = gray
	character_idle_anim = spr_mg_00_idle_gray;
	character_ready_anim = spr_mg_01_ready_gray;
	character_walk_anim = spr_mg_02_walking_gray;
	character_run_anim = spr_mg_03_running_gray;
	character_attack_anim_1 = spr_mg_04_attacking_1_gray;
	character_attack_projectile = obj_magician_spell_0;
	character_defend_anim = spr_mg_05_defend_gray;
	character_death_anim_1 = spr_mg_06_death_1_gray;
}


// Ranged Properties
projectile_weight = 0.0; // kg
projectile_velocity = 0.0; // metres per second, pixels per second
launch_x_position = 0.0; // pixels
launch_y_position = 0.0; // pixels
//target_displacement_x = 0.0;
//target_displacement_y = 0.0;
target_distance_x = 0.0; // pixels
target_distance_y = 0.0; // pixels
launch_angle = 0.0; // degress

// error angle
launch_error_margin = 0.0; //so we slightly miss each shot

//maybe can add wind speed later on for more interesting levels?
// windspeed = 0.0; <- (- numbers push projectile to the left) -- (+ numbers push projectile to the right) ->


// AI properties
// AI State
ai_state = "Idle"; // used to debug where in the ai code are we
// attack properties
character_attack_speed = 0; // in fps
random_ai_attack_delay = random_range(3,10);

// ai boundaries
lower_ai_attack_delay_boundary = 3.0;
upper_ai_attack_delay_boundary = 10.0;
ai_movement_margin_of_error_allowed = 4;

// ai Perception
character_vision_distance = 1080; // 32 pixel size tiles, 45 tiles long
character_engage_distance = 128;

// animation handler

character_anim_frames_amount = 16;
character_anim_fps = 8;

// launch projectile frame
character_anim_launch_frame = ((character_anim_frames_amount/character_anim_fps)*fps) - ((4/character_anim_fps)*fps);
char_attack_frame=4;

character_attack_animation_duration = (character_anim_frames_amount/character_anim_fps)*fps; // in fps, 60 = 1 second

in_attack_anim = false;

// We want to set enemy target to something (ideally obj_generic_NPC_Enemy, but since not, we just set it to obj_dbg_enemy).
enemy_target = obj_generic_npc;
defend_rally_target = obj_enemy_rally_target;
retreat_rally_target = obj_retreat_enemy_rally_object;
enemy_castle_target = obj_castle_player;

// Directional Headers, This is used for animation sprites and hitbox creation
forward_direction = 1;
backward_direction = -1;

// distance location
//ai_rally_distance_offset = (16 * (global.player_unit_count - 1)) + 16;

// Random rally distance offset (random_range(-4,4)) * 4;
ai_rally_distance_offset = (irandom_range(-132,-8)) * 4;
ai_attack_distance_offset = (irandom_range(-8,0)) * 4;
// ai_rally_distance_offset = 0;

//on death spawn this obj
death_character = obj_magician_dead_e2;

// Help AI track Information
global.enemy_2_mg_count = global.enemy_2_mg_count + 1;

// retreat offset
ai_range_retreat_offset = (irandom_range(1,12))*4;
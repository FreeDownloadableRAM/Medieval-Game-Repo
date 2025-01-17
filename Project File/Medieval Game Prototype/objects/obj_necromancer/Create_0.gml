/// Here we will set character properties
// Global AI trackers
global.player_unit_count += 1;

// Information about myself
internal_unit_number = global.player_unit_count;
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
character_reach_summon = 1776.0;
character_reach_original = 592.0;

// Defence Properties
character_health = 150.0;
character_slash_defence = 0.0; 
character_pierce_defence = 0.0;
character_thrust_defence = 0.0;
character_blunt_defence = 0.7;
character_magic_defence = 0.95;

// Movement Properties
character_walking_speed = 0.44;
character_running_speed = 0.62;

// walk distance boundary, if the distance is smaller than this distance, walk, if not, run
character_walking_boundary = random_range(6,32);

// Set Sprites
// The defaults are set to Pikeman, just because he was the first one made
character_idle_anim = spr_nc_00_idle;
character_ready_anim = spr_nc_01_ready;
character_walk_anim = spr_nc_02_walking;
character_run_anim = spr_nc_02_walking;
character_attack_anim_1 = spr_nc_04_attacking_1;
character_attack_projectile = obj_necro_proj;
character_defend_anim = spr_nc_01_ready;
character_death_anim_1 = spr_nc_06_death_1;

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
random_ai_attack_delay = random_range(2,5);

// ai boundaries
lower_ai_attack_delay_boundary = 2.0;
upper_ai_attack_delay_boundary = 5.0;
ai_movement_margin_of_error_allowed = 4;

// ai Perception
character_vision_distance = 512; // 32 pixel size tiles, 45 tiles long
character_engage_distance = 96;

// animation handler

character_anim_frames_amount = 16;
character_anim_fps = 8;

// launch projectile frame
character_anim_launch_frame = ((character_anim_frames_amount/character_anim_fps)*fps) - ((15/character_anim_fps)*fps);
char_attack_frame = 16;

character_attack_animation_duration = (character_anim_frames_amount/character_anim_fps)*fps; // in fps, 60 = 1 second

in_attack_anim = false;

// spawn units countdown
// every time we attack, increment this down by 1. when it reaches 0, we summon ghouls instead of attacking, then once done
// set this timer back to max
summon_countdown = 0;

// We want to set enemy target to something (ideally obj_generic_NPC_Enemy, but since not, we just set it to obj_dbg_enemy).
enemy_target = obj_generic_npc_enemy;
defend_rally_target = obj_player_rally_target;
retreat_rally_target = obj_retreat_player_rally_object;
enemy_castle_target = obj_castle_enemy;

// Directional Headers, This is used for animation sprites and hitbox creation
forward_direction = 1;
backward_direction = -1;

// distance location
//ai_rally_distance_offset = (16 * (global.player_unit_count - 1)) + 16;

// Random rally distance offset (random_range(-4,4)) * 4;
ai_rally_distance_offset = (irandom_range(132,8)) * 4;
ai_attack_distance_offset = (irandom_range(0,8)) * 4;
// ai_rally_distance_offset = 0;

//on death spawn this obj
death_character = obj_necromancer_dead;

// Help AI track Information
global.player_nc_count = global.player_nc_count + 1;

// retreat offset
ai_range_retreat_offset = (irandom_range(1,12))*4;
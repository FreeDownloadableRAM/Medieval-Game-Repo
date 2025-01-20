/// Here we will set character properties
// Global AI trackers
global.player_unit_count += 1;

// Information about myself
internal_unit_number = global.player_unit_count;
internal_unit_type = "swordman_NPC";
num_of_debug_items = 8;

// Character physical Properties
// Attack Properties
character_slash_attack = 0.0; // in hitpoints
character_pierce_attack = 0.0; 
character_thrust_attack = 1.0; 
character_blunt_attack = 0.0;
character_magic_attack = 0.0; 

character_reach = 48.0 // in pixels

// Defence Properties
character_health = 75.0;
character_slash_defence = 0.2; // these are percent values
character_pierce_defence = 0.0;
character_thrust_defence = 0.2;
character_blunt_defence = 0.7;
character_magic_defence = 0.0;

// Movement Properties
character_walking_speed = 0.7;
character_running_speed = 1.9;

// walk distance boundary, if the distance is smaller than this distance, walk, if not, run
character_walking_boundary = random_range(8,32);

// Set Sprites
// The defaults are set to Pikeman, just because he was the first one made
character_idle_anim = spr_sm_00_idle_indx;
character_ready_anim = spr_sm_01_ready_indx;
character_walk_anim = spr_sm_02_walking_indx;
character_run_anim = spr_sm_03_running_indx;
character_attack_anim_1 = spr_sm_04_attacking_1_indx;
character_attack_hitbox_1 = obj_swordman_atk_hitbox;
character_defend_anim = spr_sm_05_defend_indx;
character_death_anim_1 = spr_sm_06_death_1_indx;


// AI properties
// AI State
ai_state = "Idle"; // used to debug where in the ai code are we
// attack properties
character_attack_speed = 0; // in fps
random_ai_attack_delay = random_range(0,2);

// ai boundaries
lower_ai_attack_delay_boundary = 0.25;
upper_ai_attack_delay_boundary = 1.4;
ai_movement_margin_of_error_allowed = 4;

// ai Perception
character_vision_distance = 320; // 32 pixel size tiles, 20 tiles long
character_engage_distance = 208;

character_attack_animation_duration = 60; // in fps, 60 = 1 second

character_anim_frames_amount = 16;
character_anim_fps = 16;

in_attack_anim = false;

// We want to set enemy target to something (ideally obj_generic_NPC_Enemy, but since not, we just set it to obj_dbg_enemy).
enemy_target = obj_generic_npc_enemy;
defend_rally_target = obj_player_rally_target;
retreat_rally_target = obj_retreat_player_rally_object;
enemy_castle_target = obj_castle_enemy;

// Directional Headers, This is used for animation sprites and hitbox creation
forward_direction = 1;
backward_direction = 0 - 1;

// distance location
//ai_rally_distance_offset = (16 * (global.player_unit_count - 1)) + 16;

// Random rally distance offset (random_range(-4,4)) * 4;
ai_rally_distance_offset = (irandom_range(-16,8)) * 4;
ai_attack_distance_offset = (irandom_range(0,4)) * 4;

// ai_rally_distance_offset = 0;

//on death spawn this obj
death_character = obj_swordman_dead;

// Help AI track Information
global.player_sm_count += 1;

// colour palette properties
colour_palette_index = 1; // 0 def, 1-3 allies, 4 enemy def, 5-7 enemy allies

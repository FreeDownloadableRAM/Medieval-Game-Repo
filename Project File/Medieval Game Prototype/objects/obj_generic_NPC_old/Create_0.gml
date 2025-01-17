/// Here we will set character properties
// Global AI trackers
global.player_unit_count += 1;

// Information about myself
internal_unit_number = global.player_unit_count;
internal_unit_type = "generic_NPC";
num_of_debug_items = 8;

// Character physical Properties
// Attack Properties
character_slash_attack = 0.0; // in hitpoints
character_pierce_attack = 0.0; 
character_thrust_attack = 1.0; 
character_blunt_attack = 0.0;
character_magic_attack = 0.0; 

character_reach = 80.0 // in pixels

// Defence Properties
character_slash_defence = 2.0; 
character_pierce_defence = 1.0;
character_thrust_defence = 0.2;
character_blunt_defence = 0.5;
character_magic_defence = 1.0;

// Movement Properties
character_walking_speed = 1.0;
character_running_speed = 2.0;

// walk distance boundary, if the distance is smaller than this distance, walk, if not, run
character_walking_boundary = random_range(8,128);

// Set Sprites
// The defaults are set to Pikeman, just because he was the first one made
character_idle_anim = spr_pm_00_idle;
character_ready_anim = spr_pm_01_ready;
character_walk_anim = spr_pm_02_walking;
character_run_anim = spr_pm_03_running;
character_attack_anim_1 = spr_pm_04_attacking_1;
character_attack_hitbox_1 = obj_pikeman_atk_hitbox;
character_defend_anim = spr_pm_05_defend;
character_death_anim_1 = spr_pm_06_death_1;


// AI properties
// AI State
ai_state = 0; // 0 = idle, 1 = ready,
					// 2 = defending, 3 = attacking, 4 = dying

// attack properties
character_attack_speed = 0; // in fps
random_ai_attack_delay = random_range(1,3);

// ai boundaries
lower_ai_attack_delay_boundary = 1;
upper_ai_attack_delay_boundary = 1.6;

// ai Perception
character_vision_distance = 320; // 32 pixel size tiles, 20 tiles long
character_engage_distance = 208;

character_attack_animation_duration = 60; // in fps, 60 = 1 second

in_attack_anim = false;

// We want to set enemy target to something (ideally obj_generic_NPC_Enemy, but since not, we just set it to obj_dbg_enemy).
enemy_target = obj_dbg_enemy;


// distance location
ai_rally_distance_offset = 16 * (global.player_unit_count - 1);
// ai_rally_distance_offset = 0;

/// Here we will set character properties
// Character physical Properties
float.character_weight = 72; // in kilograms
int.character_height = 25; // 7 pixels short from 32 max height
int.character_width = 10; // 10 pixels wide 

//Character Physics
float.character_gravity = 9.8; // in m/s

// Attack Properties
float.character_slash_attack = 0.0; // in hitpoints
float.character_pierce_attack = 0.0; 
float.character_thrust_attack = 1.0; 
float.character_blunt_attack = 0.0;
float.character_magic_attack = 0.0; 

float.character_reach = 32.0 // in pixels

// Defence Properties
float.character_slash_defence = 2.0; 
float.character_pierce_defence = 1.0;
float.character_thrust_defence = 0.2;
float.character_blunt_defence = 0.5;
float.character_magic_defence = 1.0;

// Movement Properties
float.character_walking_speed = 1.0;
float.character_running_speed = 2.0;
float.character_climbing_speed = 1.0;
float.character_pathfinding_radius = 16; // pixels
bool.can_climb = true;

// Pathfinding
int.pathfinding_update_timer =  60; // amount of frames we wait before updating our path

// Vitality
float.character_health = 10.0; // in hitpoints
float.character_poison_resistance = 0.2 // 0-1, 1 = fully poison resistant

// Sensory Properties
bool.can_see = true;
bool.can_hear = true;

// Sight
int.inner_vision_cone_angle = 30; // in degrees
int.peripheral_vision_cone_angle = 90; // in degrees
int.max_vision_distance = 512; // in pixels
int.sight_reaction_time = 30;

// Hearing
int.max_hearing_distance = 256; // in pixels
float.hearing_sensitivity = 0.5 // range from 0-1, 0.5 is standard human level
int.hearing_reaction_time = 10 // in frames

// AI properties
bool.self_preservation = true;
float.bravery = 0.75; // out of 100%
float.sympathy = 0.75;
float.energy = 0.75;
float.aggressiveness = 0.75;
float.curiousity = 0.25;

// Starting State
int.ai_state = 0; // 0 = idle, 1 = alert, 2 = searching
					// 3 = pursuing, 4 = attacking, 5 = defending, 6 = fleeing, 7 = death

// AI goal
bool.targets_peaceful_wildlife = false;
bool.targets_dangerous_wildlife = true;
bool.targets_monsters = true;
bool.targets_player = false;

// Game Mode
int.game_mode = 0; // 0 = war mode, 1 = platformer
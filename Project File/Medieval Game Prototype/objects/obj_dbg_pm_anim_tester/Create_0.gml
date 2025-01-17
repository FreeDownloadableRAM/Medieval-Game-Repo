/// This object is to test animation states, and is not indicative of in game ai behaviour
// Thus, it is PLAYER controlled

// Movement Properties
character_walking_speed = 1.0;
character_running_speed = 2.0;

// attack properties
character_attack_speed = 0; // in fps
random_ai_attack_delay = random_range(1,3);

// ai boundaries
lower_ai_attack_delay_boundary = 1;
upper_ai_attack_delay_boundary = 1.6;


character_attack_animation_duration = 60; // in fps

in_attack_anim = false;

// creation variables
var inst;
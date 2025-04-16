// Run once only
// Here we create the ai participants based off of vs ai menu settings
// then we create the music player object based off of the map theme selected.
// we want all conditionals to be checked here regardless so, no else ifs, only ifs

// reset game tracker
global.game_winner = 0;

// always place
// this allows player to train units
instance_create_layer(x,y,"initial_objects",obj_vs_ai_p_unit_slct_spwnr);

// allies

if (global.ally_1_enabled = true){
	instance_create_layer(x + 32,y,"initial_objects",obj_ai_strategist_base_ally);

}

if (global.ally_2_enabled = true){
	instance_create_layer(x + 64,y,"initial_objects",obj_ai_strategist_ally_2);

}

if (global.ally_3_enabled = true){
	instance_create_layer(x + 96,y,"initial_objects",obj_ai_strategist_ally_3);

}

// enemies
// always place base enemy
instance_create_layer(x + 128,y,"initial_objects",obj_ai_strategist_base_enemy);

// opposition
if (global.enemy_2_enabled = true){
	instance_create_layer(x - 32,y,"initial_objects",obj_ai_strategist_enemy_2);

}
if (global.enemy_3_enabled = true){
	instance_create_layer(x - 64,y,"initial_objects",obj_ai_strategist_enemy_3);

}
if (global.enemy_4_enabled = true){
	instance_create_layer(x - 96,y,"initial_objects",obj_ai_strategist_enemy_4);

}

// depending on game mode, we create king objects or not // for now, since there is only 1 gamemode, 
// we use that only.
// 0 is death match, 1 = KoTH
if (global.game_mode == 0){
	// place kings

}
else if (global.game_mode == 1){
	// place camp

}
// do nothing
else {

}

// constants that will be created no matter what are the rally flags and retreat wooden barricades.
// the rally flag will change positions based off of game mode. 
// By default it will be craeted on the default game mode deathmatch (kill enemy king to win).

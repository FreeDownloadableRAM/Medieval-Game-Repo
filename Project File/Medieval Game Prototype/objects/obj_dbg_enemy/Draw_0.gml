/// Here we handle its draw event
// this is a strictly debug item
// draw ourself
draw_self();

// draw debug text
if (global.dev_mode == true){
	
	draw_set_color(c_white);
	draw_text(x - 16,y + 128, "slash def: " + string(character_slash_defence));
	draw_text(x - 16,y + 112, "pierce def: " + string(character_pierce_defence));
	draw_text(x - 16,y + 96, "thrust def: " + string(character_thrust_defence));
	draw_text(x - 16,y + 80, "blunt def: " + string(character_blunt_defence));
	draw_text(x - 16,y + 64, "magic def: " + string(character_magic_defence));
	draw_text(x - 16,y + 48, "char health: " + string(character_health));
	
}
else{
	// Dont draw if we arent

}



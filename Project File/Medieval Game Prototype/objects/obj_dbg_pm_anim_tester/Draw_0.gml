/// Dubugging purposes
// draw ourself
draw_self();

// draw debug text
if (global.dev_mode == true){
	
	draw_set_color(c_white);
	draw_text(x,y - 80, "AI Attack delay Timer: " + string(character_attack_speed));
	draw_text(x,y - 64, "Character Attack Animation Timer: " + string(character_attack_animation_duration));
	
}
else{
	// Dont draw if we arent

}




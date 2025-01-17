/// Here we handle its draw event
// this is a strictly debug item
// draw ourself
draw_self();

// draw debug text
if (global.dev_mode == true){
	/*
	draw_set_color(c_white);
	draw_text(x - 16,y - 128, "slash def: " + string(castle_slash_defence));
	draw_text(x - 16,y - 112, "pierce def: " + string(castle_pierce_defence));
	draw_text(x - 16,y - 96, "thrust def: " + string(castle_thrust_defence));
	draw_text(x - 16,y - 80, "blunt def: " + string(castle_blunt_defence));
	draw_text(x - 16,y - 64, "magic def: " + string(castle_magic_defence));
	draw_text(x - 16,y - 48, "char health: " + string(castle_health));
	*/
	
	draw_healthbar(hp_l_coord_x,hp_t_coord_y,hp_r_coord_x,hp_b_coord_y,castle_health,c_black,c_red,c_green,0,true,false);
}
else{
	// Dont draw if we arent

}
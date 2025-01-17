/// if we are debugging, draw the sprite to show hitbox

// draw debug text
if (global.dev_mode == true){
	// draw ourself
	draw_self();
	//draw_set_color(c_white);
	//draw_text(x + 16,y + 32, "Hitbox duration: " + string(animation_duration));
	
}
else{
	// Dont draw if we arent
	//draw_self();
	//draw_set_color(c_white);
	//draw_text(x + 16,y + 32, "Hitbox duration: " + string(animation_duration));

}




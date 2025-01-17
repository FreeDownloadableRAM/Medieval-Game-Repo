/// Dubugging purposes
// draw ourself

if (global.player_castle_health_enemy <= 0 || global.player_castle_health <= 0){
	// Draw
	draw_sprite(sprite_index,0,camera_get_view_x(view_camera[0]) + 768,y);


}

// draw debug text
if (global.dev_mode == true){
	
	
	
	
}
else{
	// Dont draw if we arent

}
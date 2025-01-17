/// once this timer is triggered, spawn in that object

if (was_spell_spawned == false){
	// This is to make sure we ONLY create 1
	//instance_create_layer(spell_chain_object_x,spell_chain_object_y,"hitbox_layer",spell_chain_object);
	
	// Set bool to true, since we spawned one
	was_spell_spawned = true;
}
else {
	// Do not spawn

}
/// Here we determine life time of spell
// and which spell to spawn
// here is the next object to spawn after alarm[1] is set off
spell_chain_object = obj_magician_spell_5;
spell_chain_object_x = x + 64;
spell_chain_object_y = y;

was_spell_spawned = false;
//Clear Timer
// destroy object when 2 seconds have passed
alarm_set(0,((20/12)*fps));
alarm_set(1,(0.5*fps));

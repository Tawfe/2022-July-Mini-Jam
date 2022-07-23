if global.trunk_hitpoints  == 3
{
	sprite_index = s_trunk_1
}
else if global.trunk_hitpoints  == 2
{
	sprite_index = s_trunk_2
}
else if global.trunk_hitpoints  == 1
{
	sprite_index = s_trunk_3
}
else if global.trunk_hitpoints  <= 0
{
	instance_destroy()
}
show_debug_message(global.trunk_hitpoints)
_alpha = clamp(_alpha,0,1)
w_temp = (o_player.x - camera_get_view_width(cam) * 0.5) + camera_get_view_width(cam)/2
h_temp = (o_player.y - camera_get_view_height(cam) * 0.5) + camera_get_view_height(cam)/2
if keyboard_check(ord("T"))
{
	if keyboard_check_pressed(ord("T"))
	for(var i = 0; i < array_length(palettes);i++)
	{
		instance_create_layer(o_selection_wheel.x,o_selection_wheel.y,"ColorPalettes", palettes[i])	
	}
	release_trigger = false
}
if keyboard_check_released(ord("T"))
{ 
	release_trigger = true
}




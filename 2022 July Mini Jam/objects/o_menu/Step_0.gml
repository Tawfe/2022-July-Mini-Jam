//Audio Control
if position_meeting(mouse_x,mouse_y,o_play_bt) || position_meeting(mouse_x,mouse_y,o_how_to_play_bt) || position_meeting(mouse_x,mouse_y,o_exit_bt)
{
	if audio_controller > 0 in_button = true
	audio_controller--	
}
else if !position_meeting(mouse_x,mouse_y,o_play_bt) && !position_meeting(mouse_x,mouse_y,o_how_to_play_bt) && !position_meeting(mouse_x,mouse_y,o_exit_bt)
	audio_controller = 1
	
if in_button
{
	in_button = false
	audio_play_sound(Menu_Mouse_Hover_Over_Button,10,false)
}

if position_meeting(mouse_x,mouse_y,o_play_bt)
{
	o_play_bt.image_index = 1
	
}
else 
{
	o_play_bt.image_index = 0
}

if position_meeting(mouse_x,mouse_y,o_how_to_play_bt)
{
	o_how_to_play_bt.image_index = 1
	
}
else 
{
	o_how_to_play_bt.image_index = 0
}

if position_meeting(mouse_x,mouse_y,o_exit_bt)
{
	o_exit_bt.image_index = 1
	
}
else 
{
	o_exit_bt.image_index = 0
}
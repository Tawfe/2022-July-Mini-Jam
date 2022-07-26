buttons[0] = o_play_bt
buttons[1] = o_how_to_play_bt
buttons[2] = o_exit_bt


for(var i = 0; i < array_length(buttons); i++)
{
	with instance_create_layer(room_width/2, room_height/2 +(64*i), "Instances", buttons[i])
	{
		image_speed = 0
	}
}

//in_empty_space = true
audio_controller = 1
in_button = false
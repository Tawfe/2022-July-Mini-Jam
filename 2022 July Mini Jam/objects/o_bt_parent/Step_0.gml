if position_meeting(mouse_x,mouse_y,self)
{
	scale_control--
	if mouse_check_button_pressed(mb_left)
	{
		audio_play_sound(Menu_Click,10,false)
		bt_scale = 0.5
		switch(destination)
		{
			case noone: {game_end() break}
			case r_level1: {TransitionStart(destination, sqFadeOut, sqFadeIn) break}
			case r_how_to_play: {TransitionStart(destination, sqFadeOut, sqFadeIn) break}
			
		}
	}
}
else if !position_meeting(mouse_x,mouse_y,self)
{
	scale_control = 1
}

if scale_control <= 0 || bt_scale < 1
{
	bt_scale = lerp(bt_scale,1.5,0.1)
}
if scale_control >= 1
{
	bt_scale = lerp(bt_scale,1,0.1)
}
event_inherited()

if position_meeting(mouse_x,mouse_y,self)
{	
	var _ww = temp_valw-10+lengthdir_x(temp_valw,135)
	var _hh = temp_valh-10+lengthdir_y(temp_valh,135)
	if temp_valw > clamp_val temp_valw = lerp(temp_valw,_ww,0.01)
	if temp_valh > clamp_valh temp_valh = lerp(temp_valh,_hh,0.01)
	#region//Color Changing
	if global.switching_cooldown > 0 global.switching_cooldown--
	
	
	if mouse_check_button_pressed(mb_left) && global.switching_cooldown <= 0
	{
		audio_play_sound(Player_Colour_Change,10,false)
		global.color_change_trigger = true
		if prev_grey_chosen global.death = true
		prev_grey_chosen = true
		global.p_color = "Grey"; //Black and White
		if global.has_key global.key_color = "Grey"
		global.switching_cooldown = s_cd; 
	}
	
	#endregion
}
else 
{
	clamp_val = temp_valw-10
	clamp_valh = temp_valh-10
	x = o_selection_wheel.w_temp
	y = o_selection_wheel.h_temp
	temp_valw = lerp(temp_valw,o_selection_wheel.w_temp,0.1)
	temp_valh = lerp(temp_valh,o_selection_wheel.h_temp,0.1)
}

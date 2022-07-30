event_inherited()

if position_meeting(mouse_x,mouse_y,self)
{	
	if temp_valw > clamp_val temp_valw = lerp(temp_valw,temp_valw-10,0.1)
	#region//Color Changing
	if global.switching_cooldown > 0 global.switching_cooldown--
	
	if mouse_check_button_pressed(mb_left) && global.switching_cooldown <= 0
	{
		audio_play_sound(Player_Colour_Change,10,false)
		global.color_change_trigger = true
		if prev_yellow_chosen global.death = true
		prev_yellow_chosen = true
		global.p_color = "Yellow";
		if global.has_key global.key_color = "Yellow"
		jump_count = 2
		global.switching_cooldown = s_cd;
	}
	
	#endregion
}
else 
{
	clamp_val = temp_valw-10
	x = o_selection_wheel.w_temp
	y = o_selection_wheel.h_temp
	temp_valw = lerp(temp_valw,o_selection_wheel.w_temp,0.1)
	temp_valh = lerp(temp_valh,o_selection_wheel.h_temp,0.1)
}

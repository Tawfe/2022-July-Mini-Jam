event_inherited()

if position_meeting(mouse_x,mouse_y,self)
{	
	draw_control = true
	if temp_valh < clamp_val temp_valh = lerp(temp_valh,temp_valh+10,0.1)
	#region//Color Changing
	if global.switching_cooldown > 0 global.switching_cooldown--
	
	if mouse_check_button_pressed(mb_left) && global.switching_cooldown <= 0
	{
		audio_play_sound(Player_Colour_Change,10,false)
		global.color_change_trigger = true
		if global.prev_green_chosen global.death = true
		global.prev_green_chosen = true
		global.p_color = "Green";
		if global.has_key global.key_color = "Green"
		global.switching_cooldown = s_cd;
		choose_trigger = true
	}
	
	#endregion
}
else 
{
	draw_control = false
	clamp_val = temp_valh+10
	x = o_selection_wheel.w_temp
	y = o_selection_wheel.h_temp
	temp_valw = lerp(temp_valw,o_selection_wheel.w_temp,0.1)
	temp_valh = lerp(temp_valh,o_selection_wheel.h_temp,0.1)
}

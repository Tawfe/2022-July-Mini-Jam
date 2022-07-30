event_inherited()

if position_meeting(mouse_x,mouse_y,self)
{	
	if temp_valh < clamp_val temp_valh = lerp(temp_valh,temp_valh+10,0.1)
}
else 
{
	clamp_val = temp_valh+10
	x = o_selection_wheel.w_temp
	y = o_selection_wheel.h_temp
	temp_valw = lerp(temp_valw,o_selection_wheel.w_temp,0.1)
	temp_valh = lerp(temp_valh,o_selection_wheel.h_temp,0.1)
}

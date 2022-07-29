event_inherited()

if position_meeting(mouse_x,mouse_y,self)
{	
	
	if temp_valw < clamp_val temp_valw = lerp(temp_valw,temp_valw+lengthdir_x(temp_valw,45),0.1)
	if temp_valh > clamp_valh temp_valh = lerp(temp_valh,temp_valh+lengthdir_y(temp_valh,45),0.1)
}
else 
{
	clamp_val = temp_valw+10
	clamp_valh = temp_valh-10
	x = o_selection_wheel.w_temp
	y = o_selection_wheel.h_temp
	temp_valw = o_selection_wheel.w_temp
	temp_valh = o_selection_wheel.h_temp
}

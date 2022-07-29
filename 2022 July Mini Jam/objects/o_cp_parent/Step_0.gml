x = o_selection_wheel.w_temp
y = o_selection_wheel.h_temp


if position_meeting(mouse_x,mouse_y,self)
{
	x = lerp(x,x+10,0.1)
	show_debug_message("IS HERE")
}


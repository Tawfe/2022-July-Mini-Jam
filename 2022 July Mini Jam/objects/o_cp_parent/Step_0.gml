x = o_selection_wheel.x
y = o_selection_wheel.y


if position_meeting(mouse_x,mouse_y,self)
{
	x = lerp(x,x+10,0.1)
	show_debug_message("IS HERE")
}
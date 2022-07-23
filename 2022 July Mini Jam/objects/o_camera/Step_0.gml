//Upd destination
if instance_exists(follow)
{
	xTo = follow.x
	yTo = follow.y
}

//Upd obj Pos
x += (xTo - x) / 25
y += (yTo - y) / 25

x = clamp(x,view_w_half, room_width-view_w_half)
y = clamp(y,view_h_half, room_height-view_h_half)

//Upd cam view
camera_set_view_pos(cam,x-view_w_half,y-view_h_half)

if layer_exists("Background1")
{
	layer_x("Background1", x/2)
}
if layer_exists("Background2")
{
	layer_x("Background2", x/4)
}
if layer_exists("Background3")
{
	layer_x("Background3", x/6)
}
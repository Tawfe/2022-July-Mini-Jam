_alpha = clamp(_alpha,0,1)

if keyboard_check(ord("T"))
{
	_alpha = lerp(_alpha,2,0.1)
}
if keyboard_check_released(ord("T"))
{
	release_trigger = true
}
if release_trigger _alpha = lerp(_alpha,0,0.1)

w_temp = (o_player.x - camera_get_view_width(cam) * 0.5) + camera_get_view_width(cam)/2
h_temp = (o_player.y - camera_get_view_height(cam) * 0.5) + camera_get_view_height(cam)/2



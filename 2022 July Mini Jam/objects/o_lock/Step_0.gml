var _range = collision_circle(x,y,20,o_player,false,false)
if _range global.in_unlockable_range = true else global.in_unlockable_range = false

if global.door_opened
{
	_lvsp += 0.3 // gravity
	
	if (place_meeting(x, y+_lvsp, o_platform)) 
	{
		while (!place_meeting(x, y+sign(_lvsp), o_platform)) 
		{
			y += sign(_lvsp);
		}
		_lvsp = 0
	}
	
	y += _lvsp //gravity when lock is unlocked
	
	if !_p_lock_fxcontrol
	{
		_p_lock_fxcontrol = true
		audio_play_sound(Door_Unlock,10,false)
	}
}

if global.lock_color == "Red"
{
	sprite_index = s_lock_red
}
if global.lock_color == "Blue"
{
	sprite_index = s_lock_blue
}
if global.lock_color == "Green"
{
	sprite_index = s_lock_green
}
if global.lock_color == "Yellow"
{
	sprite_index = s_lock_yellow
}
if global.lock_color == "Grey"
{
	sprite_index = s_lock_grey
}
if global.lock_color == "Rainbow"
{
	sprite_index = s_lock_rainbow
}
if global.lock_color == "Orange"
{
	sprite_index = s_lock_orange
}
var _range = collision_circle(x,y,20,o_player,false,false)
if _range global.key_in_range = true else global.key_in_range = false

if global.has_key
{
	x = o_player.x
	y = o_player.y-10
}
else
{
	
	_kvsp += 0.3 // gravity
	
	if (place_meeting(x, y+_kvsp, o_platform)) 
	{
		while (!place_meeting(x, y+sign(_kvsp), o_platform)) 
		{
			y += sign(_kvsp);
		}
		_kvsp = 0
		if !_keydrop_fxcontrol
		{
			_keydrop_fxcontrol = true
			audio_play_sound(Rock_key_Land,10,false)
		}
		
	}
	
	y += _kvsp //gravity when key is dropped
}

if global.key_color == "Red"
{
	sprite_index = s_key_red
}
if global.key_color == "Blue"
{
	sprite_index = s_key_blue
}
if global.key_color == "Green"
{
	sprite_index = s_key_green
}
if global.key_color == "Yellow"
{
	sprite_index = s_key_yellow
}
if global.key_color == "Grey"
{
	sprite_index = s_key_grey
}
if global.key_color == "Rainbow"
{
	sprite_index = s_key_rainbow
}
if global.key_color == "Orange"
{
	sprite_index = s_key_orange
}

if global.door_opened instance_destroy() // animation for key thrown instead of destroy



if global.has_key
{
	 
	if !_key_fxcontrol 
	{
		_key_fxcontrol = true
		_keydrop_fxcontrol = false
		audio_play_sound(Key_equip,10,false)
	}
}
else
{
	_key_fxcontrol = false
	
}
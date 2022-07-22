var _range = collision_circle(x,y,20,o_player,false,false)
if _range global.key_in_range = true else global.key_in_range = false

if global.has_key
{
	x = o_player.x+3
	y = o_player.y-4
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
	}
	
	y += _kvsp //gravity when key is dropped
}
var _range = collision_circle(x,y,20,o_player,false,false)
if _range global.rock_in_range = true else global.rock_in_range = false

if global.has_rock
{
	x = o_player.x+3
	y = o_player.y-4
	visible = false
}
else
{
	visible = true
	if (place_meeting(x+_khsp, y, o_platform)) 
	{
		while (!place_meeting(x+sign(_khsp), y, o_platform)) 
		{
			x += sign(_khsp);
		}
	
		_khsp = 0;
	}
	_kvsp += 0.3 // gravity
	
	if (place_meeting(x, y+_kvsp, o_platform)) 
	{
		while (!place_meeting(x, y+sign(_kvsp), o_platform)) 
		{
			y += sign(_kvsp);
		}
		_kvsp = 0
	
	}
	
	
}

if global.throw_rock
{
	_kvsp = -5
	_khsp = 5
	global.throw_rock = false
}

if _khsp > 0 _khsp = lerp(_khsp,0,0.05) // Horizontal velocity throwing power
y += _kvsp 

// make the rock get thrown based on the direction player is facing
if o_player.image_xscale == 1
x += lengthdir_x(_khsp,0)
else if o_player.image_xscale == -1
x -= lengthdir_x(_khsp,0)
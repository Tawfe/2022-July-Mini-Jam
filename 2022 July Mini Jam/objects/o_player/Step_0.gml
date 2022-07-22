// Get Player Input
if (hascontrol)
{
	key_left = keyboard_check(ord("A")) || keyboard_check(vk_left);
	key_right = keyboard_check(ord("D")) || keyboard_check(vk_right);
	key_jump = keyboard_check_pressed(ord("W")) || keyboard_check_pressed(vk_space);
}
else
{
	key_left = 0;
	key_right = 0;
	key_jump = 0;
}
//Calculate Movement
var move = key_right - key_left;
hsp = move * walksp;

//Gravity
vsp = vsp + grv;

//Jumping
canjump--;
if (canjump > 0) && (key_jump) 
{
	vsp = -9;
	canjump = 0;
}

//Horizontal Collision
if (place_meeting(x+hsp, y, o_platform)) 
{
	while (!place_meeting(x+sign(hsp), y, o_platform)) 
	{
		x += sign(hsp);
	}
	
	hsp = 0;
}

	
//Vertical Collision	
if (place_meeting(x, y+vsp, o_platform)) 
{
	canjump = 10
	while (!place_meeting(x, y+sign(vsp), o_platform)) 
	{
		y += sign(vsp);
	}
	
	vsp = 0;
}
	
	
//Red Obscale collision
if (place_meeting(x+hsp, y, o_walls)) 
{
	
		while (!place_meeting(x+sign(hsp), y, o_walls)) 
		{
			x += sign(hsp);
		}
	
		hsp = 0;
	
}	
//Blue Obscale collision
//Kill the player if he attempts to go in blue obstacle without being blue
	
	//Color Changing
	if global.switching_cooldown > 0 global.switching_cooldown--
	if global.p_color == "Red" global.red_ability = true else global.red_ability = false
	
	if keyboard_check_pressed(ord("1")) && global.switching_cooldown <= 0
	{
		global.p_color = "Red";
		global.red_ability = true
		global.switching_cooldown = s_cd;
	}
	if keyboard_check_pressed(ord("2")) && global.switching_cooldown <= 0
	{
		global.p_color = "Blue"; 
		global.switching_cooldown = s_cd; 
	}
	if keyboard_check_pressed(ord("3")) && global.switching_cooldown <= 0
	{
		global.p_color = "Orange";
		global.switching_cooldown = s_cd;
	}
	if keyboard_check_pressed(ord("4")) && global.switching_cooldown <= 0
	{
		global.p_color = "Yellow"; 
		global.switching_cooldown = s_cd; 
	}
	if keyboard_check_pressed(ord("5")) && global.switching_cooldown <= 0
	{
		global.p_color = "Green";
		global.switching_cooldown = s_cd;
	}
	if keyboard_check_pressed(ord("6")) && global.switching_cooldown <= 0
	{
		global.p_color = "bw"; //Black and White
		global.switching_cooldown = s_cd; 
	}
	if keyboard_check_pressed(ord("7")) && global.switching_cooldown <= 0
	{
		global.p_color = "Rainbow";
		global.switching_cooldown = s_cd;
	}
	
	
	#region//Punching
	if !global.is_punching x_prev = x
	if global.p_color == "Red" && keyboard_check_pressed(ord("F"))
	{
		global.is_punching = true
		
		x += 20	
	}
	
	if global.is_punching
	{
		x = lerp(x,x_prev,0.1)
		
		if x <= x_prev - 5 global.is_punching = false
	}
	show_debug_message(x)
	#endregion
	#region//Key Pickup
	if global.key_in_range && keyboard_check_pressed(ord("E"))
	{
		global.has_key = true
	}
	
	#endregion
	x += hsp;
	y += vsp;
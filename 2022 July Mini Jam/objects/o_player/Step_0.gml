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
if (place_meeting(x+hsp, y, o_red_obstacle)) 
{
	if !global.red_ability
	{
		while (!place_meeting(x+sign(hsp), y, o_red_obstacle)) 
		{
			x += sign(hsp);
		}
	
		hsp = 0;
	}
}	
//Blue Obscale collision
//Kill the player if he attempts to go in blue obstacle without being blue
	
	//Color Changing
	switching_cooldown--
	if global.p_color == "Red" global.red_ability = true else global.red_ability = false
	
	if keyboard_check_pressed(ord("1")) && switching_cooldown <= 0
	{
		global.p_color = "Red";
		global.red_ability = true
		switching_cooldown = 60*5;
	}
	if keyboard_check_pressed(ord("2")) && switching_cooldown <= 0
	{
		global.p_color = "Blue"; 
		switching_cooldown = 60*5; 
	}
	if keyboard_check_pressed(ord("3")) && switching_cooldown <= 0
	{
		global.p_color = "Orange";
		switching_cooldown = 60*5;
	}
	if keyboard_check_pressed(ord("4")) && switching_cooldown <= 0
	{
		global.p_color = "Yellow"; 
		switching_cooldown = 60*5; 
	}
	if keyboard_check_pressed(ord("5")) && switching_cooldown <= 0
	{
		global.p_color = "Green";
		switching_cooldown = 60*5;
	}
	if keyboard_check_pressed(ord("6")) && switching_cooldown <= 0
	{
		global.p_color = "Black & White"; 
		switching_cooldown = 60*5; 
	}
	if keyboard_check_pressed(ord("7")) && switching_cooldown <= 0
	{
		global.p_color = "Rainbow";
		switching_cooldown = 60*5;
	}

	x += hsp;
	y += vsp;
// Get Player Input
if (hascontrol)
{
	key_left = keyboard_check(ord("A")) || keyboard_check(vk_left);
	key_right = keyboard_check(ord("D")) || keyboard_check(vk_right);
	key_jump =  keyboard_check_pressed(vk_space);
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
if   (key_jump) && jump_count > 0
{
	vsp = -9;
	//canjump = 0;
	jump_count--
}
show_debug_message(jump_count)

	#region //Collisions
//Horizontal Collision
for(var i = 0; i < array_length(vc_objects); i++)
{
	if vc_objects[i] == o_door_trigger
	{
		if !global.door_opened
		if (place_meeting(x+hsp, y, vc_objects[i])) 
		{
			while (!place_meeting(x+sign(hsp), y, vc_objects[i])) 
			{
				x += sign(hsp);
			}
	
			hsp = 0;
		}
	}
	else
	if (place_meeting(x+hsp, y, vc_objects[i])) 
	{
		while (!place_meeting(x+sign(hsp), y, vc_objects[i])) 
		{
			x += sign(hsp);
		}
	
		hsp = 0;
	}
}

	
//Vertical Collision	
if (place_meeting(x, y+vsp, o_platform)) 
{
	canjump = 10
	if global.p_color != "Yellow" && jump_count <= 0 jump_count = 1
	if global.p_color == "Yellow" && jump_count <= 0 jump_count = 2 // set up is in color change region
	while (!place_meeting(x, y+sign(vsp), o_platform)) 
	{
		y += sign(vsp);
	}
	
	vsp = 0;
}
	
//Blue Obscale collision
//Kill the player if he attempts to go in blue obstacle without being blue
#endregion
	#region//Color Changing
	if global.switching_cooldown > 0 global.switching_cooldown--
	if global.p_color == "Red" global.red_ability = true else global.red_ability = false
	
	if keyboard_check_pressed(ord("1")) && global.switching_cooldown <= 0
	{
		global.p_color = "Red";
		if global.has_key global.key_color = "Red"
		global.red_ability = true
		global.switching_cooldown = s_cd;
	}
	if keyboard_check_pressed(ord("2")) && global.switching_cooldown <= 0
	{
		global.p_color = "Blue"; 
		if global.has_key global.key_color = "Blue"
		global.switching_cooldown = s_cd; 
	}
	if keyboard_check_pressed(ord("3")) && global.switching_cooldown <= 0
	{
		global.p_color = "Yellow";
		if global.has_key global.key_color = "Yellow"
		jump_count = 2
		global.switching_cooldown = s_cd;
	}
	if keyboard_check_pressed(ord("4")) && global.switching_cooldown <= 0
	{
		global.p_color = "Orange"; 
		if global.has_key global.key_color = "Orange"
		global.switching_cooldown = s_cd; 
	}
	if keyboard_check_pressed(ord("5")) && global.switching_cooldown <= 0
	{
		global.p_color = "Green";
		if global.has_key global.key_color = "Green"
		global.switching_cooldown = s_cd;
	}
	if keyboard_check_pressed(ord("6")) && global.switching_cooldown <= 0
	{
		global.p_color = "bw"; //Black and White
		if global.has_key global.key_color = "bw"
		global.switching_cooldown = s_cd; 
	}
	if keyboard_check_pressed(ord("7")) && global.switching_cooldown <= 0
	{
		global.p_color = "Rainbow";
		if global.has_key global.key_color = "Rainbow"
		global.switching_cooldown = s_cd;
	}
	#endregion
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
	//show_debug_message(x)
	#endregion
	#region//Key Pickup
	if global.key_in_range && keyboard_check_pressed(ord("E"))
	{
		global.has_key = true
	}
	if global.has_key && keyboard_check_pressed(ord("Q"))
	{
		global.has_key = false
	}
	#endregion
	#region//Unlock Door
	if global.in_unlockable_range && global.has_key && global.key_color == global.lock_color
	{
		if keyboard_check_pressed(ord("G"))
		{
			global.door_opened = true
		}
	}
	#endregion
	#region//Create a vine when Green is selected
	if global.p_color == "Green" && keyboard_check_pressed(ord("F"))
	{
			instance_destroy(o_vine)
			instance_create_layer(x+10,y,"Platforms",o_vine)	
	}
	#endregion
	if instance_exists(o_vine) // Vine Climbing
	{
		if global.p_on_vine && keyboard_check(ord("W"))
		{
			key_up = keyboard_check(ord("W"))
			vsp = -key_up
		}
	}
	
	x += hsp;
	y += vsp;
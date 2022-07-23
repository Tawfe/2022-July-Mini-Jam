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
if move > 0 image_xscale = 1 else if move < 0 image_xscale = -1
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
	if (place_meeting(x, bbox_bottom, o_platform)) // to prevent multi-jump when hitting the roof
	{
		canjump = 10
		if global.p_color != "Yellow" && jump_count <= 0 jump_count = 1
		if global.p_color == "Yellow" && jump_count <= 0 jump_count = 2 // set up is in color change region
	}
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
		global.p_color = "Grey"; //Black and White
		if global.has_key global.key_color = "Grey"
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
	
	if global.p_color == "Red" && keyboard_check_pressed(ord("F"))
	{
		global.ability_on = true
		global.is_punching = true
		
	}
	if global.p_color == "Red" && global.ability_on
	{
		sprite_index = s_red_punch
		image_speed = 1
		if image_index >= 3
		{
			sprite_index = s_red_idle
			global.ability_on = false
			if trunk_collide global.trunk_hitpoints--
		}
	}
	
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
			
			global.ability_on = true
			if image_xscale == 1 instance_create_layer(x+10,y,"Platforms",o_vine)
			else if image_xscale == -1 instance_create_layer(x-26,y,"Platforms",o_vine)
	}
	if global.p_color == "Green" && global.ability_on
	{
		sprite_index = s_green_plant
		image_speed = 1
		if image_index >= 3
		{
			sprite_index = s_green_idle
			global.ability_on = false
				
		}
	}
	#endregion
	#region //Animation
	if !global.ability_on && !global.death
	{
		if hsp == 0 && global.p_color = "Red"
		{
			sprite_index = s_red_idle;
		}
		else if hsp != 0 && global.p_color = "Red"
		{
			
			sprite_index = s_red_run;
		}
		else if hsp == 0 && global.p_color = "Blue"
		{
			
			sprite_index = s_blue_idle;
		}
		else if hsp != 0 && global.p_color = "Blue"
		{
			
			sprite_index = s_blue_run;
		}
		else if hsp == 0 && global.p_color = "Yellow"
		{
			
			sprite_index = s_yellow_idle;
		}
		else if hsp != 0 && global.p_color = "Yellow"
		{
			
			sprite_index = s_yellow_run;
		}
		else if hsp == 0 && global.p_color = "Green"
		{
			
			sprite_index = s_green_idle;
		}
		else if hsp != 0 && global.p_color = "Green"
		{
			
			sprite_index = s_green_run;
		}
		else if hsp == 0 && global.p_color = "Orange"
		{
			
			sprite_index = s_orange_idle;
		}
		else if hsp != 0 && global.p_color = "Orange"
		{
			
			sprite_index = s_orange_run;
		}
		else if hsp == 0 && global.p_color = "Grey"
		{
			
			sprite_index = s_grey_idle;
		}
		else if hsp != 0 && global.p_color = "Grey"
		{
			
			sprite_index = s_grey_run;
		}
		else if hsp == 0 && global.p_color = "Rainbow"
		{
			
			sprite_index = s_rainbow_idle;
		}
		else if hsp != 0 && global.p_color = "Rainbow"
		{
			
			sprite_index = s_rainbow_run;
		}
	}
	#endregion
	if instance_exists(o_vine) // Vine Climbing
	{
		if global.p_on_vine && keyboard_check(ord("W"))
		{
			if (!place_meeting(x, y+vsp, o_platform)) 
			{
				while (place_meeting(x, y+sign(vsp), o_platform)) 
				{
					y += sign(vsp);
				}
				key_up = keyboard_check(ord("W"))
				vsp = -key_up
			}
		}
	}
	if instance_exists(o_rock) //Rock Throwing
	{
		if global.rock_in_range && keyboard_check_pressed(ord("E"))
		{
			global.has_rock = true
		}
		if global.has_rock && keyboard_check_pressed(ord("F"))
		{
			global.has_rock = false
			global.throw_rock =  true
		}
	}
	if global.p_color == "Grey" && keyboard_check_pressed(ord("T"))
	{
		global.key_reveal = true
	}
	#region // Swimming Ability
	if (global.p_color == "Blue" || global.p_color == "Rainbow") && place_meeting(x,y,o_water)
	{
		global.ability_on = true
		if global.p_color == "Blue" sprite_index = s_blue_swim
		if global.p_color == "Rainbow" sprite_index = s_rainbow_swim
	}
	else if (global.p_color != "Blue" || global.p_color != "Rainbow") && !place_meeting(x,y,o_water)
	{
		if sprite_index == s_blue_swim global.ability_on = false
		if sprite_index == s_rainbow_swim global.ability_on = false
	}
	else if (global.p_color != "Blue" || global.p_color != "Rainbow") && place_meeting(x,y,o_water)
	{
		
		global.death = true
		if !lighting_on 
		{
			lighting_on = true
			instance_create_layer(x,y,"Instances",o_lighting)
			walksp = 0	
		}
		
	}
	#endregion
	#region Death / correlated with water for now
	if place_meeting(x,y,o_lighting) sprite_index = s_death_anim
	if sprite_index == s_death_anim && image_index > 6 
	{
		image_speed = 0
		if global.has_key global.has_key = false
		if global.has_rock global.has_rock = false
		d_cd--
		if d_cd <= 0
		{
			reTarget = room
			TransitionStart(reTarget, sqFadedeathOut, sqFadedeathIn)
			room_restart()
		}
	}
	#endregion
	
	x += hsp;
	y += vsp;
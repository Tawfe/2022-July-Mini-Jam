#region Movement
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

if hsp != 0 && vsp = 0
{
	_p_walk_fxcontrol--
	
	if !audio_is_playing(Player_Step_Single) && _p_walk_fxcontrol <= 0
	{
		
		  audio_play_sound(Player_Step_Single,10,false)
		  _p_walk_fxcontrol = _p_wcd
	}
}
//Gravity
vsp = vsp + grv;

//Jumping
canjump--;
if   (key_jump) && jump_count > 0
{
	vsp = jump_power;
	//canjump = 0;
	jump_count--
	is_jumping = true
	sprite_index = s_blue_jump
	
	audio_play_sound(Player_Jump,10,false)
}
//Jumping frame
//if vsp != 0 sprite_index = s_blue_jump
#endregion
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
		if is_jumping 
		{
			is_jumping = false
		
		}
		canjump = 10
		if global.p_color != "Yellow" && jump_count <= 0 jump_count = 1
		if global.p_color == "Yellow" && jump_count <= 0 jump_count = 2 // set up is in color change region
		if !_p_land_fxcontrol
		{
			_p_land_fxcontrol = true
			audio_play_sound(Player_Land,10,false)
		}
	}
	while (!place_meeting(x, y+sign(vsp), o_platform)) 
	{
		y += sign(vsp);
		_p_land_fxcontrol = false
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
		audio_play_sound(Player_Colour_Change,10,false)
		color_change_trigger = true
		if prev_red_chosen global.death = true
		prev_red_chosen = true
		global.p_color = "Red";
		if global.has_key global.key_color = "Red"
		global.red_ability = true
		global.switching_cooldown = s_cd;
	}
	if keyboard_check_pressed(ord("2")) && global.switching_cooldown <= 0
	{
		audio_play_sound(Player_Colour_Change,10,false)
		color_change_trigger = true
		if prev_blue_chosen global.death = true
		prev_blue_chosen = true
		global.p_color = "Blue"; 
		if global.has_key global.key_color = "Blue"
		global.switching_cooldown = s_cd; 
	}
	if keyboard_check_pressed(ord("3")) && global.switching_cooldown <= 0
	{
		audio_play_sound(Player_Colour_Change,10,false)
		color_change_trigger = true
		if prev_yellow_chosen global.death = true
		prev_yellow_chosen = true
		global.p_color = "Yellow";
		if global.has_key global.key_color = "Yellow"
		jump_count = 2
		global.switching_cooldown = s_cd;
	}
	if keyboard_check_pressed(ord("4")) && global.switching_cooldown <= 0
	{
		audio_play_sound(Player_Colour_Change,10,false)
		color_change_trigger = true
		if prev_orange_chosen global.death = true
		prev_orange_chosen = true
		global.p_color = "Orange"; 
		if global.has_key global.key_color = "Orange"
		global.switching_cooldown = s_cd; 
	}
	if keyboard_check_pressed(ord("5")) && global.switching_cooldown <= 0
	{
		audio_play_sound(Player_Colour_Change,10,false)
		color_change_trigger = true
		if prev_green_chosen global.death = true
		prev_green_chosen = true
		global.p_color = "Green";
		if global.has_key global.key_color = "Green"
		global.switching_cooldown = s_cd;
	}
	if keyboard_check_pressed(ord("6")) && global.switching_cooldown <= 0
	{
		audio_play_sound(Player_Colour_Change,10,false)
		color_change_trigger = true
		if prev_grey_chosen global.death = true
		prev_grey_chosen = true
		global.p_color = "Grey"; //Black and White
		if global.has_key global.key_color = "Grey"
		global.switching_cooldown = s_cd; 
	}
	if keyboard_check_pressed(ord("7")) && global.switching_cooldown <= 0
	{
		audio_play_sound(Player_Colour_Change,10,false)
		color_change_trigger = true
		if prev_rainbow_chosen global.death = true
		prev_rainbow_chosen = true
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
			if place_meeting(x,y,o_walls) global.trunk_hitpoints--
			sprite_index = s_red_idle
			global.ability_on = false
			_p_punch_fxcontrol = false
		}
		if !_p_punch_fxcontrol
		{
			_p_punch_fxcontrol = true
			audio_play_sound(Player_Punch,10,false)
		}
	}
	
	#endregion
	#region//Key Pickup
	if global.key_in_range && keyboard_check_pressed(ord("E"))
	{
		global.has_key = true
		for(var i = 0; i < array_length(cc); i++)
		{
			if global.p_color == cc[i]
			{
				sprite_index = gk_sprite[i]
				keygrab_sprite_temp = gk_sprite[i]
				break;
			}
		}
		
		
	}
	if global.has_key && keyboard_check_pressed(ord("Q"))
	{
		global.has_key = false
	}
	
	if sprite_index == keygrab_sprite_temp && image_index == 1
	{
		image_index = 1 
		image_speed = 0
		for(var i = 0; i < array_length(cc); i++)
		{
			if global.p_color == cc[i]
			{
				sprite_index = gk_sprite[i]
				keygrab_sprite_temp = gk_sprite[i]
				break;
			}
		}	
	}
	else image_speed = 1
	
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
	if (global.p_color == "Green" || global.p_color == "Rainbow") && keyboard_check_pressed(ord("F"))
	{
			instance_destroy(o_vine)
			
			global.ability_on = true
			if image_xscale == 1 instance_create_layer(x+10,y+10,"Platforms",o_vine)
			else if image_xscale == -1 instance_create_layer(x-26,y+10,"Platforms",o_vine)
	}
	if (global.p_color == "Green" || global.p_color == "Rainbow") && global.ability_on
	{
		if global.p_color == "Green" sprite_index = s_green_plant
		if global.p_color == "Rainbow" sprite_index = s_rainbow_plant
		image_speed = 1
		if image_index >= 3
		{
			if global.p_color == "Green" sprite_index = s_green_idle
			if global.p_color == "Rainbow" sprite_index = s_rainbow_idle
			global.ability_on = false
				
		}
	}
	#endregion
	#region //Animation
	if !global.ability_on && !global.death && !global.has_key && !is_jumping
	{
		if hsp == 0 && global.p_color = "Red"
		{
			if color_change_trigger
			{
				sprite_index = s_color_change
				if sprite_index == s_color_change && image_index >= 2
				{
					color_change_trigger = false
					sprite_index = s_red_idle
				}
			}
			if sprite_index != s_color_change sprite_index = s_red_idle
		}
		else if hsp != 0 && global.p_color = "Red"
		{
			
			sprite_index = s_red_run;
		}
		else if hsp == 0 && global.p_color = "Blue"
		{
			if color_change_trigger
			{
				sprite_index = s_color_change
				if sprite_index == s_color_change && image_index >= 2
				{
					color_change_trigger = false
					sprite_index = s_blue_idle;
				}
			}
			if sprite_index != s_color_change sprite_index = s_blue_idle
			
		}
		else if hsp != 0 && global.p_color = "Blue"
		{
			
			sprite_index = s_blue_run;
		}
		else if hsp == 0 && global.p_color = "Yellow"
		{
			if color_change_trigger
			{
				sprite_index = s_color_change
				if sprite_index == s_color_change && image_index >= 2
				{
					color_change_trigger = false
					sprite_index = s_yellow_idle
				}
			}
			if sprite_index != s_color_change sprite_index = s_yellow_idle
		}
		else if hsp != 0 && global.p_color = "Yellow"
		{
			
			sprite_index = s_yellow_run;
		}
		else if hsp == 0 && global.p_color = "Green"
		{
			if color_change_trigger
			{
				sprite_index = s_color_change
				if sprite_index == s_color_change && image_index >= 2
				{
					color_change_trigger = false
					sprite_index = s_green_idle;
				}
			}
			if sprite_index != s_color_change sprite_index = s_green_idle;
			
		}
		else if hsp != 0 && global.p_color = "Green"
		{
			
			sprite_index = s_green_run;
		}
		else if hsp == 0 && global.p_color = "Orange"
		{
			if color_change_trigger
			{
				sprite_index = s_color_change
				if sprite_index == s_color_change && image_index >= 2
				{
					color_change_trigger = false
					sprite_index = s_orange_idle;
				}
			}
			if sprite_index != s_color_change sprite_index = s_orange_idle;
			
		}
		else if hsp != 0 && global.p_color = "Orange"
		{
			
			sprite_index = s_orange_run;
		}
		else if hsp == 0 && global.p_color = "Grey"
		{
			if color_change_trigger
			{
				sprite_index = s_color_change
				if sprite_index == s_color_change && image_index >= 2
				{
					color_change_trigger = false
					sprite_index = s_grey_idle;
				}
			}
			if sprite_index != s_color_change sprite_index = s_grey_idle;
			
		}
		else if hsp != 0 && global.p_color = "Grey"
		{
			
			sprite_index = s_grey_run;
		}
		else if hsp == 0 && global.p_color = "Rainbow"
		{
			if color_change_trigger
			{
				sprite_index = s_color_change
				if sprite_index == s_color_change && image_index >= 2
				{
					color_change_trigger = false
					sprite_index = s_rainbow_idle;
				}
			}
			if sprite_index != s_color_change sprite_index = s_rainbow_idle;
			
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
			if global.p_color == "Green" sprite_index = s_green_climb
			if global.p_color == "Rainbow" sprite_index = s_rainbow_climb
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
	if place_meeting(x,y,o_lighting) 
	{
		if !_p_death_fxcontrol
		{
			_p_death_fxcontrol = true
			audio_play_sound(Water_Death,10,false)
		}
		sprite_index = s_death_anim
	}
	
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
	
	#region Death
	if global.death
	{
		if !die
		{
			die = true
			instance_create_layer(x,y,"Instances",o_lighting)
			walksp = 0	
		}
	}
	#endregion
	
	//Destroy vine if exists when color changes
	if instance_exists(o_vine) && color_change_trigger instance_destroy(o_vine)
	
	x += hsp;
	y += vsp;
hsp = 0;
vsp = 0;
grv = 0.3;
walksp = 1; // def = 1
hascontrol = true;
canjump = 0;
jump_count = 1
jump_power = -5
//Objects that can have vertical collision
vc_objects[0] = o_platform
vc_objects[1] = o_door_trigger
vc_objects[2] = o_walls


global.p_color = "Red"
global.has_key = false
global.key_in_range = false
global.rock_in_range = false
global.has_rock = false
global.throw_rock = false
global.red_ability = false
s_cd = 60*2 // 60 * 5 default
d_cd = 60
global.switching_cooldown = 0 //60*5 seconds cooldown
global.is_punching = false
global.key_reveal = false
global.ability_on = false
global.vinegate_open = false
global.death = false

lighting_on = false

_p_land_fxcontrol = true
_p_punch_fxcontrol = false
_p_death_fxcontrol = false

_p_wcd = 21
_p_walk_fxcontrol = _p_wcd
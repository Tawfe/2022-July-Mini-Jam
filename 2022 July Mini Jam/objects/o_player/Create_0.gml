hsp = 0;
vsp = 0;
grv = 0.3;
walksp = 4; // def = 1
hascontrol = true;
canjump = 0;
jump_count = 1
jump_power = -9 // def = -5
//Objects that can have vertical collision
vc_objects[0] = o_platform
vc_objects[1] = o_door_trigger
vc_objects[2] = o_walls

//Character colors
cc[0] = "Red"
cc[1] = "Blue"
cc[2] = "Yellow"
cc[3] = "Orange"
cc[4] = "Grey"
cc[5] = "Green"
cc[6] = "Rainbow"
//Grab key sprites for all characters
gk_sprite[0] = s_red_grabkey
gk_sprite[1] = s_blue_grabkey
gk_sprite[2] = s_yellow_grabkey
gk_sprite[3] = s_orange_grabkey
gk_sprite[4] = s_grey_grabkey
gk_sprite[5] = s_green_grabkey
gk_sprite[6] = s_rainbow_grabkey

keygrab_sprite_temp = s_red_grabkey //random def value

//Jumping sprites for all characters
jump_sprite[0] = s_red_jump
jump_sprite[1] = s_blue_jump
jump_sprite[2] = s_yellow_jump
jump_sprite[3] = s_orange_jump
jump_sprite[4] = s_grey_jump
jump_sprite[5] = s_green_jump
jump_sprite[6] = s_rainbow_jump

global.p_color = "Red"
global.has_key = false
global.key_in_range = false
global.rock_in_range = false
global.has_rock = false
global.throw_rock = false
global.red_ability = false
s_cd = 1 // 60 * 5 default
d_cd = 60
global.switching_cooldown = 0 //60*5 seconds cooldown
global.is_punching = false
global.key_reveal = false
global.ability_on = false
global.vinegate_open = false
global.death = false
is_jumping = false

prev_red_chosen = false
prev_blue_chosen = false
prev_green_chosen = false
prev_yellow_chosen = false
prev_grey_chosen = false
prev_orange_chosen = false
prev_rainbow_chosen = false

lighting_on = false
die = false

_p_land_fxcontrol = true
_p_punch_fxcontrol = false
_p_death_fxcontrol = false

_p_wcd = 21
_p_walk_fxcontrol = _p_wcd

color_change_trigger = false
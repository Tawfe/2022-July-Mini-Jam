//Grows the Vine
if _scale < 200 _scale = lerp(_scale, 200, 0.1)

global.p_on_vine = collision_rectangle(x,y-_scale,x+16,y,o_player,false,false)
show_debug_message(global.p_on_vine)
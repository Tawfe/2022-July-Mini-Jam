draw_set_valign(fa_center)
draw_set_halign(fa_middle)
draw_text(80,80, global.p_color)

if global.p_color == "Red" //Selected
draw_sprite_ext(s_red_selector,1,40,43,1,1,0,c_white,1)
else
draw_sprite_ext(s_red_selector,0,40,40,1,1,0,c_white,1)
if global.p_color == "Blue" //Selected
draw_sprite_ext(s_blue_selector,1,80,43,1,1,0,c_white,1)
else
draw_sprite_ext(s_blue_selector,0,80,40,1,1,0,c_white,1)
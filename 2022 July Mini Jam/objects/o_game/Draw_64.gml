draw_set_valign(fa_center)
draw_set_halign(fa_middle)
//draw_text_transformed(80,80, global.p_color)

if global.p_color == "Red" //Selected
{
	draw_sprite_ext(s_red_selector,1,40,43,1,1,0,c_white,1)
	draw_text_transformed(40,63, "Selected",0.5,0.5,0)
}
else
{
	draw_text_transformed(40,20,"1",0.5,0.5,0)
	draw_sprite_ext(s_red_selector,0,40,40,1,1,0,c_white,1)
}
//-----------------------------------------------------------------
if global.p_color == "Blue" //Selected
{
	draw_sprite_ext(s_blue_selector,1,80,43,1,1,0,c_white,1)
	draw_text_transformed(80,63, "Selected",0.5,0.5,0)
}
else
{
	draw_text_transformed(80,20,"2",0.5,0.5,0)
	draw_sprite_ext(s_blue_selector,0,80,40,1,1,0,c_white,1)
}
//-----------------------------------------------------------------
if global.p_color == "Yellow" //Selected
{
	draw_sprite_ext(s_yellow_selector,1,120,43,1,1,0,c_white,1)
	draw_text_transformed(120,63, "Selected",0.5,0.5,0)
}
else
{
	draw_text_transformed(120,20,"3",0.5,0.5,0)
	draw_sprite_ext(s_yellow_selector,0,120,40,1,1,0,c_white,1)
}
//-----------------------------------------------------------------
if global.p_color == "Orange" //Selected
{
	draw_sprite_ext(s_orange_selector,1,160,43,1,1,0,c_white,1)
	draw_text_transformed(160,63, "Selected",0.5,0.5,0)
}
else
{
	draw_text_transformed(160,20,"4",0.5,0.5,0)
	draw_sprite_ext(s_orange_selector,0,160,40,1,1,0,c_white,1)
}
//-----------------------------------------------------------------
if global.p_color == "Green" //Selected
{
	draw_sprite_ext(s_green_selector,1,200,43,1,1,0,c_white,1)
	draw_text_transformed(200,63, "Selected",0.5,0.5,0)
}
else
{
	draw_text_transformed(200,20,"5",0.5,0.5,0)
	draw_sprite_ext(s_green_selector,0,200,40,1,1,0,c_white,1)
}
//-----------------------------------------------------------------
if global.p_color == "Grey" //Selected (Black and White)
{
	draw_sprite_ext(s_grey_selector,1,240,43,1,1,0,c_white,1)
	draw_text_transformed(240,63, "Selected",0.5,0.5,0)
}
else
{
	draw_text_transformed(240,20,"6",0.5,0.5,0)
	draw_sprite_ext(s_grey_selector,0,240,40,1,1,0,c_white,1)
}
//-----------------------------------------------------------------
if global.p_color == "Rainbow" //Selected
{
	draw_sprite_ext(s_rainbow_selector,1,280,43,1,1,0,c_white,1)
	draw_text_transformed(280,63, "Selected",0.5,0.5,0)
}
else
{
	draw_text_transformed(280,20,"7",0.5,0.5,0)
	draw_sprite_ext(s_rainbow_selector,0,280,40,1,1,0,c_white,1)
}

draw_text_transformed(320,40,global.switching_cooldown / 60,0.5,0.5,0)

if global.key_reveal
{
	draw_sprite_ext(s_key_indicator,0,o_key.x,o_key.y+_pos,1,1,0,c_white,1)
	
}
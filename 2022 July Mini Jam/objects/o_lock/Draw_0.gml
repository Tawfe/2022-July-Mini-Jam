draw_sprite_ext(sprite_index,0,x,y,1,1,0,c_white,1)

//draw_circle(x,y,20,true)

if global.in_unlockable_range && global.has_key && global.key_color == global.lock_color && !global.door_opened
{
	draw_text_transformed(x,y-20,"Press G to Unlock Door",0.5,0.5,0)
}
else if global.in_unlockable_range && global.has_key && global.key_color != global.lock_color
{
	draw_text_transformed(x,y-20,"Wrong Key",0.5,0.5,0)
}
else if global.in_unlockable_range && !global.has_key
{
	draw_text_transformed(x,y-20,"Find the key",0.5,0.5,0)
}

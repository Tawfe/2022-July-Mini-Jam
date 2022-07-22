draw_sprite_ext(sprite_index,0,x,y,1,1,0,c_white,1)

//draw_circle(x,y,20,true)

if global.p_color == "Orange" && global.ball_in_range && !global.has_ball draw_text_transformed(x,y-20,"Press E to grab",0.5,0.5,0)
else if global.p_color != "Orange" && global.ball_in_range && !global.has_ball draw_text_transformed(x,y-20,"Select Orange Color",0.5,0.5,0)
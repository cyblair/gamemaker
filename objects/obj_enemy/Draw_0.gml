//draw_text(x,y,string(alerted));

if (collision_line(x,y,obj_player.x,obj_player.y,obj_wall,true,true))   {
    draw_set_colour(c_red);
}
else    {
    draw_set_colour(c_aqua);
    draw_self();
}

//draw_line_width(x,y,obj_player.x,obj_player.y,4);


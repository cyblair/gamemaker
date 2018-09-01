if (point_in_rectangle(x,y,__view_get( e__VW.XView, 0 ),__view_get( e__VW.YView, 0 ),__view_get( e__VW.XView, 0 )+__view_get( e__VW.WView, 0 ),__view_get( e__VW.YView, 0 )+__view_get( e__VW.HView, 0 )))  {
    px = obj_player.x;
    py = obj_player.y;
    
    x1 = x-(w/2);
    y1 = y-(w/2);
    x2 = x-(w/2);
    y2 = y+(w/2);
    x3 = x+(w/2);
    y3 = y+(w/2);
    x4 = x+(w/2);
    y4 = y-(w/2);
    
    direc = point_direction(px,py,x1,y1);
    a1 = x1+lengthdir_x(600,direc);
    b1 = y1+lengthdir_y(600,direc);
    
    direc = point_direction(px,py,x2,y2);
    a2 = x2+lengthdir_x(600,direc);
    b2 = y2+lengthdir_y(600,direc);
    
    direc = point_direction(px,py,x3,y3);
    a3 = x3+lengthdir_x(600,direc);
    b3 = y3+lengthdir_y(600,direc);
    
    direc = point_direction(px,py,x4,y4);
    a4 = x4+lengthdir_x(600,direc);
    b4 = y4+lengthdir_y(600,direc);
    
    draw_set_colour(c_black);
    draw_primitive_begin(pr_trianglestrip);
    draw_vertex(x1-__view_get( e__VW.XView, 0 ),y1-__view_get( e__VW.YView, 0 ));
    draw_vertex(a1-__view_get( e__VW.XView, 0 ),b1-__view_get( e__VW.YView, 0 ));
    draw_vertex(x2-__view_get( e__VW.XView, 0 ),y2-__view_get( e__VW.YView, 0 ));
    draw_vertex(a2-__view_get( e__VW.XView, 0 ),b2-__view_get( e__VW.YView, 0 ));
    draw_vertex(x3-__view_get( e__VW.XView, 0 ),y3-__view_get( e__VW.YView, 0 ));
    draw_vertex(a3-__view_get( e__VW.XView, 0 ),b3-__view_get( e__VW.YView, 0 ));
    draw_vertex(x4-__view_get( e__VW.XView, 0 ),y4-__view_get( e__VW.YView, 0 ));
    draw_vertex(a4-__view_get( e__VW.XView, 0 ),b4-__view_get( e__VW.YView, 0 ));
    draw_vertex(x1-__view_get( e__VW.XView, 0 ),y1-__view_get( e__VW.YView, 0 ));
    draw_vertex(a1-__view_get( e__VW.XView, 0 ),b1-__view_get( e__VW.YView, 0 ));
    draw_primitive_end();
}

px = obj_player.x;
py = obj_player.y;

if (collision_line(px,py,x1,y1,obj_wall,true,true) and collision_line(px,py,x2,y2,obj_wall,true,true) and collision_line(px,py,x3,y3,obj_wall,true,true) and collision_line(px,py,x4,y4,obj_wall,true,true)) {
    image_alpha = .5;
}
else    {
    image_alpha = 1;
}


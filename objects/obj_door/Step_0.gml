/// @description  player interact
 
with (obj_player)   {
    if (place_meeting(lookingX,lookingY,other))    {
        lookingColor = c_lime;
        
        if (key_interact)   {
            if (not other.locked) {
                other.open = not other.open;
            }
        }
    }
}

/// shadow

if (false)    {
    px = obj_player.x;
    py = obj_player.y;
    
    x1 = x;
    y1 = y;
    x2 = x;
    y2 = y+5;
    x3 = x+w;
    y3 = y+5;
    x4 = x+w;
    y4 = y;
    
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
    
    if (not open)   {
        draw_set_colour(c_black);
        draw_primitive_begin(pr_trianglestrip);
        draw_vertex(x1,y1);
        draw_vertex(a1,b1);
        draw_vertex(x2,y2);
        draw_vertex(a2,b2);
        draw_vertex(x3,y3);
        draw_vertex(a3,b3);
        draw_vertex(x4,y4);
        draw_vertex(a4,b4);
        draw_vertex(x1,y1);
        draw_vertex(a1,b1);
        draw_primitive_end();
    }
}

/// solid

if (open)   {
    if (image_angle < baseRotation+90)   {
        image_angle += 5;
        solid = false;
        
    }
    else    {
        solid = not obj_player.liquified;
    }
}
else    {
    if (image_angle>baseRotation)  {
        image_angle -= 5;
        solid = false;
    }
    else    {
        solid = not obj_player.liquified;
    }
}

///alpha

if (instance_exists(obj_player))    {
    px = obj_player.x;
    py = obj_player.y;
    
    if (collision_line(px,py,x,y,obj_wall,true,true)) {
        image_alpha = .5;
    }
    else    {
        image_alpha = 1;
    }
    
    solid = not obj_player.liquified;
}


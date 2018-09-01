/// @description  enemy sounds

with (obj_enemy)    {
    draw_set_colour(c_red);
    enemyDir = point_direction(other.x,other.y,x,y);
    x1 = other.x+lengthdir_x(100, enemyDir);
    x2 = other.x+lengthdir_x(120, enemyDir);
    y1 = other.y+lengthdir_y(100, enemyDir);
    y2 = other.y+lengthdir_y(120, enemyDir);
    
    // 500 100
    arrowAlpha = 100/distance_to_object(obj_player);
    
    draw_set_alpha(arrowAlpha);
    
    if (moving)  {
        draw_arrow(gui(x1,true),gui(y1,false),gui(x2,true),gui(y2,false),60);
    }
    draw_set_alpha(1);
}

/// gui

draw_rectangle_colour(0,0,1920*(liquidTimer/liquidMax),40,c_navy,c_aqua,c_aqua,c_navy,false);
draw_rectangle_colour(0,1040,1920*(hp/hpMax),1080,c_maroon,c_red,c_red,c_maroon,false);


if (instance_exists(lastSeen))  {
    draw_set_color(c_maroon);
    draw_set_alpha(lastSeen.image_alpha);
    
    draw_set_font(fnt_main);
    draw_set_valign(fa_middle);
    draw_set_halign(fa_center);
    
    draw_text(960,100,string_hash_to_newline("Spotted"));
    draw_set_alpha(1);
    
}

draw_set_color(c_red);
draw_set_font(fnt_default);
draw_set_valign(fa_top);
draw_set_halign(fa_right);
draw_text(1920,40,string_hash_to_newline(string(fps_real)));



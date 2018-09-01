/// @description  gui general

draw_set_colour(c_black);
draw_rectangle(0,0,1920,200, false);


button(c_black,c_gray,"rectangle", 10,10,160,60, map_save);
button(c_black,c_gray,"rectangle", 10,70,160,120, map_load);
button(c_black,c_gray,"rectangle", 10,130,160,180, map_compile);
button(c_black,c_gray,"rectangle", 1510,10,1660,60, switch_edit_mode);

draw_set_font(fnt_button);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_colour(c_white);
draw_text(85,35,string_hash_to_newline("Save"));
draw_text(85,95,string_hash_to_newline("Load"));
draw_text(85,155,string_hash_to_newline("Compile"));
draw_text(1585,35,string_hash_to_newline("Swap Edit Mode"));

draw_set_colour(c_black);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_text(0,200,string_hash_to_newline(currentFile));
draw_text(0,225,string_hash_to_newline("Object Count: "+string(instance_number(levelObj))));
draw_text(0,250,string_hash_to_newline(object_get_name(selectedObj)));

//left button
if (pageNumber == 0) {
    draw_set_colour(c_dkgray);
}
else    {
    draw_set_colour(c_gray);
    if (mouse_in_rect(250,25,280,175))  {
        draw_set_colour(c_white);
        
        if (mouse_check_button_pressed(mb_left))   {
            pageNumber--;
        }
    }
}
draw_primitive_begin(pr_trianglelist);
draw_vertex(250,100);
draw_vertex(280,25);
draw_vertex(280,175);
draw_primitive_end();

//right button
if (pageNumber == maxPage) {
    draw_set_colour(c_dkgray);
}
else    {
    draw_set_colour(c_gray);
    if (mouse_in_rect(1120,25,1150,175))  {
        draw_set_colour(c_white);
        
        if (mouse_check_button_pressed(mb_left))   {
            pageNumber++;
        }
    }
}
draw_primitive_begin(pr_trianglelist);
draw_vertex(1150,100);
draw_vertex(1120,25);
draw_vertex(1120,175);
draw_primitive_end();

//object select
draw_set_colour(c_dkgray);
draw_rectangle(300,10,1100,190,false);

surface_free(objSurf);
objSurf = surface_create(800,180);
surface_set_target(objSurf);
draw_clear_alpha(c_white,0);

for (itm = 0; itm < array_height_2d(lvlObjects); itm++)    {
    spr = lvlObjects[itm, 1];
    draw_sprite_stretched(spr, textureValue, (133.3*itm)-(800*pageNumber)+28,40,100,100);
    if (mouse_in_rect((133.3*(itm+2))-(800*pageNumber)+28,40,(133.3*(itm+2))-(800*pageNumber)+128,140)) {
        if (mouse_check_button_pressed(mb_left))    {
            selectedObj = lvlObjects[itm, 0];
        }
    }
    if (selectedObj == lvlObjects[itm, 0])  {
        draw_sprite_stretched(spr_selected, 0, (133.3*itm)-(800*pageNumber)+28,40,100,100);
    }
}

surface_reset_target();

draw_surface(objSurf,300,10);

draw_set_font(fnt_default);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_colour(c_white);
draw_text(1350,50,string_hash_to_newline("Texture"));
draw_rectangle(1325,75,1375,100,false);
draw_text(1350,125,string_hash_to_newline("Rotation"));
draw_rectangle(1325,150,1375,175,false);

draw_set_colour(c_black);
draw_text(1350,87,string_hash_to_newline(string(textureValue)));
draw_text(1350,162,string_hash_to_newline(string(rotation)));

if (mouse_in_rect(1325,50,1375,100))    {
    if (mouse_wheel_up())    {
        textureValue++;
    }
    else if (mouse_wheel_down())  {
        textureValue--;
    }
}
if (mouse_in_rect(1325,150,1375,200))    {
    if (mouse_wheel_up())    {
        rotation += 5;
    }
    else if (mouse_wheel_down())  {
        rotation -= 5;
    }
}

/// gui details

if (mode == "details")   {
    draw_set_colour(c_black);
    draw_rectangle(1520,200,1920,1080,false);
    
    draw_background(BACKGROUND, 1570,250);
    draw_sprite(spr_selected,0,1586+tileLeft,266+tileTop);
    
    if (mouse_in_rect(1570,250,1826,506))   {
        if (mouse_check_button_pressed(mb_left))    {
            xx = device_mouse_x_to_gui(0)-1554;
            yy = device_mouse_y_to_gui(0)-266;
            tileLeft = (round(xx/32)*32)-32;
            tileTop = (round(yy/32)*32);
        }
    }
    
    draw_set_font(fnt_default);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_colour(c_white);
    draw_text(1750,550,string_hash_to_newline("Depth"));
    draw_rectangle(1725,575,1775,600,false);
    
    draw_set_colour(c_black);
    draw_text(1750,587,string_hash_to_newline(string(tileDepth)));
    
    if (mouse_in_rect(1725,575,1775,600))   {
        if (mouse_wheel_up())    {
            tileDepth++;
        }
        else if (mouse_wheel_down())  {
            tileDepth--;
        }
    }
}

/// dropdown

if (dropdown) {
    button(c_white,c_gray,"rectangle",dropDownX,dropDownY,dropDownX+200,dropDownY+30,dropdown_rotate);
    button(c_white,c_gray,"rectangle",dropDownX,dropDownY+30,dropDownX+200,dropDownY+60,dropdown_changeTexture);
    button(c_white,c_gray,"rectangle",dropDownX,dropDownY+60,dropDownX+200,dropDownY+90,dropdown_special);
    button(c_white,c_gray,"rectangle",dropDownX,dropDownY+90,dropDownX+200,dropDownY+120,dropdown_delete);
    draw_set_font(fnt_default);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_colour(c_black);
    
    draw_rectangle(dropDownX,dropDownY-1,dropDownX+200,dropDownY+120,true);
    
    draw_text(dropDownX+100,dropDownY+15,string_hash_to_newline("Rotate"));
    draw_text(dropDownX+100,dropDownY+45,string_hash_to_newline("Change Texture"));
    draw_text(dropDownX+100,dropDownY+75,string_hash_to_newline("Edit SpEcIaL"));
    draw_text(dropDownX+100,dropDownY+105,string_hash_to_newline("Delete"));
    
    if (not mouse_in_rect(dropDownX,dropDownY,dropDownX+200,dropDownY+120)) {
        dropdown = false;
    }
}


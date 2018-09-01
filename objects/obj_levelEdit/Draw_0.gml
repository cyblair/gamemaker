/// @description  draw grid
for (i = offset-1; i < room_width; i += gridSnap) {
    draw_set_color(GRIDCOLOR);
    draw_set_blend_mode_ext(bm_inv_dest_colour,bm_inv_dest_colour);
    draw_line(i,0,i,room_height);
    draw_set_blend_mode(bm_normal);
}
for (i = offset-1; i < room_height; i += gridSnap)    {
    draw_set_color(GRIDCOLOR);
    draw_set_blend_mode_ext(bm_inv_dest_colour,bm_inv_dest_colour);
    draw_line(0,i,room_width,i);
    draw_set_blend_mode(bm_normal);
}

if (boxSelect)  {
    draw_set_color(c_white);
    draw_set_blend_mode_ext(bm_inv_dest_colour,bm_inv_dest_colour);
    draw_rectangle(boxStartX,boxStartY,mouse_x,mouse_y,true);
    draw_set_blend_mode(bm_normal);
}


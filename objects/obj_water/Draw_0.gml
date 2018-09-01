/// @description  draw water

draw_set_colour(c_aqua);
draw_set_alpha(.7);

draw_primitive_begin(pr_trianglestrip);
for (v = 0; v < array_height_2d(verts); v++)    {
    draw_vertex(verts[v,0],verts[v,1]);
    draw_vertex(x,y);
}
draw_vertex(verts[0,0],verts[0,1]);
draw_primitive_end();
draw_set_alpha(1);


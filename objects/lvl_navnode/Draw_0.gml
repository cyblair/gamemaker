event_inherited();

ds_list_clear(neighbors);
with (lvl_navnode)  {
    if (self != other)  {
        if (not collision_line(x,y,other.x,other.y,lvl_wall,true,true)) {
            ds_list_insert(other.neighbors, 0, self);
        }
    }
}

for (line = 0; line < ds_list_size(neighbors); line++)  {
    next = neighbors[| line]
    draw_set_colour(c_fuchsia);
    draw_arrow(x,y,next.x,next.y,10);
}


if (setNeighbors)   {
    ds_list_clear(neighbors);
    with (obj_navnode)  {
        if (self != other)  {
            if (not collision_line(x,y,other.x,other.y,obj_wall,true,true)) {
                ds_list_insert(other.neighbors, 0, id);
            }
        }
    }
    setNeighbors = false;
}


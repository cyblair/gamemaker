/// @description  map_save()

file = currentFile;

if (file == "")  {
    file = get_save_filename("Editor file|*.lef", "");
}

if (file_exists(file))  {
    file_delete(file);
}
    
if (file != "") {
    currentFile = file;
    ini_open(file);
    instanceId = 0;
    with (levelObj)  {
        section = object_get_name(object_index)+string(other.instanceId);
        ini_write_string("instances", string(other.instanceId), section);
        ini_write_real(section, "x", x);
        ini_write_real(section, "y", y);
        ini_write_string(section, "object", object_get_name(object_index));
        ini_write_string(section, "variant", image_index);
        ini_write_string(section, "special", special);
        ini_write_real(section, "rotation", image_angle);
        other.instanceId++;
    }
    tiles = tile_get_ids();
    for (i = 0; i < array_length_1d(tiles); i++)  {
        section = "tile"+string(i);
        ini_write_string("tiles", string(i), section);
        ini_write_real(section,"x", tile_get_x(tiles[i]));
        ini_write_real(section,"y", tile_get_y(tiles[i]));
        ini_write_real(section,"background", tile_get_background(tiles[i]));
        ini_write_real(section,"left", tile_get_left(tiles[i]));
        ini_write_real(section,"top", tile_get_top(tiles[i]));
        ini_write_real(section,"width", tile_get_width(tiles[i]));
        ini_write_real(section,"height", tile_get_height(tiles[i]));
        ini_write_real(section,"depth", tile_get_depth(tiles[i]));
    }
    
    ini_write_real("instance count", "num", instanceId);
    ini_write_real("tile count","num",array_length_1d(tiles));
    ini_close();
}

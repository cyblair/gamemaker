/// @description  map_load(); 

file = get_open_filename("Editor file|*.lef", "");
if (file != "") {
    instance_destroy(levelObj);
    tiles = tile_get_ids();
    for (i = 0; i < array_length_1d(tiles); i++)  {
        tile_delete(tiles[i]);
    }
    
    ini_open(file);
    instanceCount = ini_read_real("instance count", "num", 0);
    for (inst = 0; inst < instanceCount; inst++)    {
        section = ini_read_string("instances", string(inst), "");
        createX = ini_read_real(section, "x", 0);
        createY = ini_read_real(section, "y", 0);
        index = asset_get_index(ini_read_string(section, "object", ""));
        variant = ini_read_real(section, "variant", 0);
        rotation = ini_read_real(section, "rotation", 0);
        special = ini_read_string(section, "special", "");
        
        if (object_exists(index))   {
            i = instance_create(createX,createY,index);
            i.image_index = variant;
            i.image_angle = rotation;
            i.special = special;
        }
    }
    /// load tiles

    tileCount = ini_read_real("tile count","num",0);
    for (tile = 0; tile < tileCount; tile++)    {
        section = "tile"+string(tile);
        xx = ini_read_real(section,"x",0);
        yy = ini_read_real(section,"y",0);
        background = ini_read_real(section,"background",0);
        left = ini_read_real(section,"left",0);
        top = ini_read_real(section,"top",0);
        width = ini_read_real(section,"width",0);
        height = ini_read_real(section,"height",0);
        depthh = ini_read_real(section,"depth",0);
        
        tile_add(background,left,top,width,height,xx,yy,depthh);
    }
    ini_close();
}
currentFile = file;

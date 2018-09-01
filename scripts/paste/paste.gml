/// @description  paste(); 

if (file_exists("clipboard.ini"))   {
    file = "clipboard.ini";
}

if (file != "") {
    with (levelObj) {
        selected = false;
    }
    ini_open(file);
    instanceCount = ini_read_real("instance count", "num", 0);
    for (inst = 0; inst < instanceCount; inst++)    {
        section = ini_read_string("instances", string(inst), "");
        createX = ini_read_real(section, "x", 0)+(mouse_x-ini_read_real("start","x",0));
        createY = ini_read_real(section, "y", 0)+(mouse_y-ini_read_real("start","y",0));
        index = asset_get_index(ini_read_string(section, "object", ""));
        variant = ini_read_real(section, "variant", 0);
        rotation = ini_read_real(section, "rotation", 0);
        special = ini_read_string(section, "special", "");
        
        if (object_exists(index))   {
            i = instance_create(createX,createY,index);
            i.image_index = variant;
            i.image_angle = rotation;
            i.special = special;
            i.selected = true;
        }
    }
    ini_close();
}

/// @description  copy()

if (file_exists("clipboard.ini"))   {
    file_delete("clipboard.ini");
}
file = "clipboard.ini";

if (file != "") {
    ini_open(file);
    instanceId = 0;
    with (levelObj)  {
        if (selected)   {
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
    }
    
    ini_write_real("instance count", "num", instanceId);
    ini_write_real("start","x",mouse_x);
    ini_write_real("start","y",mouse_y);
    ini_close();
}

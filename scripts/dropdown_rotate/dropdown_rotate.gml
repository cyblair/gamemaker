rot = get_integer("Set rotation for selected object.",0);
with (levelObj) {
    if (selected)   {
        image_angle = other.rot;
    }
}


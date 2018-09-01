texture = get_integer("Set texture value for the selected object.",0);
with (levelObj) {
    if (selected)   {
        image_index = other.texture;
    }
}

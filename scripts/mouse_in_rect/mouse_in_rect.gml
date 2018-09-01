/// @description mouse_in_rect(x1,y1,x2,y2);
/// @param x1
/// @param y1
/// @param x2
/// @param y2

x1 = argument0;
y1 = argument1;
x2 = argument2;
y2 = argument3;

if (point_in_rectangle(device_mouse_x_to_gui(0),device_mouse_y_to_gui(0),x1,y1,x2,y2))  {
    return true;
}
else    {
    return false;
}

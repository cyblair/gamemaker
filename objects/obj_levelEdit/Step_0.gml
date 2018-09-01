/// @description  level editor controls

if (device_mouse_y_to_gui(0) > 200 and mode == "blocks") {

    //place / move
    if (mouse_check_button_pressed(mb_left) and not dropdown)    {
        if (!position_empty(mouse_x,mouse_y))    {
            with (levelObj) {
                if (position_meeting(mouse_x,mouse_y,self)) {
                    other.moveSelection = true;
                    other.initialX = mouse_x;
                    other.initialY = mouse_y;
                    with (levelObj) {
                        if (selected)   {
                            initialX = x;
                            initialY = y;
                        }
                    }
                }
            }
        }
        dropdown = false;
    }
    else if (mouse_check_button(mb_left))   {
        if (position_empty(mouse_x,mouse_y) and not dropdown and not moveSelection) {
            if (selectedObj != "")  {
                i = instance_create(mouse_x,mouse_y,selectedObj);
                with (i)    {
                    move_snap(other.gridSnap,other.gridSnap);
                    image_angle = other.rotation;
                    special = other.special;
                    image_index = other.textureValue;
                }
                with (levelObj) {
                    selected = false;
                }
            }
        }
    }
    else if (mouse_check_button_released(mb_left))  {
        moveSelection = false;
    }
    
    // select
    if (mouse_check_button_pressed(mb_right))   {
        with (levelObj) {
            if (position_meeting(mouse_x,mouse_y,self)) {
                if (not selected)   {
                    selected = true;
                    other.selectedNum += 1;
                }
                else    {
                    other.dropdown = true;
                }
                other.textureValue = image_index;
                other.rotation = image_angle;                
                other.dropDownX = device_mouse_x_to_gui(0)-5;
                other.dropDownY = device_mouse_y_to_gui(0)-5;
            }
            else if (!keyboard_check(vk_shift))  {
                selected = false;
                other.selectedNum -= 1;
            }
        }
        if (position_empty(mouse_x,mouse_y))    {
            boxSelect = true;
            boxStartX = mouse_x;
            boxStartY = mouse_y;
        }
    }
    else if (mouse_check_button_released(mb_right)) {
        boxSelect = false;
    }
    
    //zoom
    if (mouse_wheel_up())   {
        __view_set( e__VW.WView, 0, __view_get( e__VW.WView, 0 ) - (__view_get( e__VW.WView, 0 )/20) );
        __view_set( e__VW.HView, 0, __view_get( e__VW.HView, 0 ) - (__view_get( e__VW.HView, 0 )/20) );
    }
    else if (mouse_wheel_down())    {
        __view_set( e__VW.WView, 0, __view_get( e__VW.WView, 0 ) + (__view_get( e__VW.WView, 0 )/20) );
        __view_set( e__VW.HView, 0, __view_get( e__VW.HView, 0 ) + (__view_get( e__VW.HView, 0 )/20) );
    }
}


//grid change
if (keyboard_check_pressed(vk_left))   {
    gridSnap /= 2;
    //offset = gridSnap/2;
}
else if (keyboard_check_pressed(vk_right))  {
    gridSnap *= 2;
    //offset = gridSnap/2;
}


//delete
if (keyboard_check_pressed(vk_delete))  {
    with (levelObj) {
        if (selected)   {
            instance_destroy();
        }
    }
}

if (keyboard_check(vk_control))    {
    if (keyboard_check_pressed(ord("S")))   {
        map_quicksave();
    }
    else if (keyboard_check_pressed(ord("C")))   {
        copy();
    }
    else if (keyboard_check_pressed(ord("X")))   {
        copy();
        with (levelObj) {
            if (selected)   {
                instance_destroy();
            }
        }
    }
    else if (keyboard_check_pressed(ord("V")))   {
        paste();
    }
}

//move view
if (keyboard_check(vk_alt)) {
    __view_set( e__VW.Object, 0, obj_cursor );
    __view_set( e__VW.VBorder, 0, __view_get( e__VW.HView, 0 )/3 );
    __view_set( e__VW.HBorder, 0, __view_get( e__VW.WView, 0 )/3 );
    __view_set( e__VW.VSpeed, 0, (__view_get( e__VW.HView, 0 )/360)*5 );
    __view_set( e__VW.HSpeed, 0, (__view_get( e__VW.WView, 0 )/640)*5 );
}
else    {
    __view_set( e__VW.Object, 0, noone );
}

///move selected

if (moveSelection = true)   {
    with (levelObj) {
        if (selected)   {
            x = initialX+(mouse_x-other.initialX);
            y = initialY+(mouse_y-other.initialY);
            move_snap(other.gridSnap,other.gridSnap);
        }
    }
}

/// box select
if (boxSelect)    {
    with (levelObj) {
        x1 = min(other.boxStartX,mouse_x);
        y1 = min(other.boxStartY,mouse_y);
        x2 = max(other.boxStartX,mouse_x);
        y2 = max(other.boxStartY,mouse_y);
        if (point_in_rectangle(x,y,x1,y1,x2,y2))   {
            selected = true;
            other.textureValue = image_index;
            other.rotation = image_angle;
        }
        else    {
            selected = false;
        }
    }
}

/// tile placing

if (device_mouse_x_to_gui(0) < 1520 and device_mouse_y_to_gui(0) > 200 and mode == "details")   {
    if (mouse_check_button(mb_left))    {
        tile = tile_layer_find(tileDepth, mouse_x, mouse_y);
        if (!tile_exists(tile))  {
            xx = (round(mouse_x/gridSnap)*gridSnap)-16;
            yy = (round(mouse_y/gridSnap)*gridSnap)-16;
        
            tile_add(BACKGROUND,tileLeft,tileTop,WIDTH,HEIGHT,xx,yy,tileDepth);
        }
    }
    if (mouse_check_button(mb_right))   {
        tile = tile_layer_find(tileDepth, mouse_x, mouse_y);
        if (tile_exists(tile))  {
            tile_delete(tile);
        }
    }
}


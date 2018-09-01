if (place_meeting(x,y,obj_player))  {
    if (on) {
        script = asset_get_index(special);
        script_execute(script);
        on = false;
    }
}


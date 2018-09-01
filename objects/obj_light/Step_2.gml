surface_reset_target();

with (obj_player)   {
    if (hp <= 0)    {
        room_restart();
    }
}

if (keyboard_check_pressed(vk_escape))   {
    room_goto(rm_mainMenu);
}


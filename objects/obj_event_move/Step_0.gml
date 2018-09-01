if (place_meeting(x,y,obj_player))  {
    switch (special)    {
        case "left":
            obj_player.x -= 2;
            break;
        case "right":
            obj_player.x += 2;
            break;
        case "up":
            obj_player.y -= 2;
            break;
        case "down":
            obj_player.y += 2;
            break;
    }
}


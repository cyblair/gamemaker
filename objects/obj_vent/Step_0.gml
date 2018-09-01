/// @description  alpha

px = obj_player.x;
py = obj_player.y;

if (collision_line(px,py,x,y,obj_wall,true,true)) {
    image_alpha = .5;
}
else    {
    image_alpha = normalAlpha;
}

solid = not obj_player.crouched;

if (place_meeting(x,y,obj_player))  {
    playerInGroup = true;
}
//if (distance_to_object(obj_enemy) < 64) {
//    solid = true;
//}

with (obj_vent) {
    if (is_adjacent(self,other))    {
        if (other.playerInGroup)    {
            playerInGroup = true;
        }
    }
    else    {
        playerInGroup = false;
    }
}

if (playerInGroup)  {
    if (normalAlpha > .4)   {
        normalAlpha -= .01;
    }
}
else    {    
    if (normalAlpha < 1)   {
        normalAlpha += .01;
    }
}


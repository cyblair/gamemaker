/// @description  pickup

with (obj_player)   {
    if (place_meeting(lookingX,lookingY,other))    {
        lookingColor = c_lime;
        
        if (key_interact)   {
            if (holding == "")  {
                holding = other;
            }
        }
    }
}

/// alpha

px = obj_player.x;
py = obj_player.y;

if (collision_line(px,py,x,y,obj_wall,true,true)) {
    image_alpha = .5;
}
else    {
    image_alpha = 1;
}

///speed 

if (speed > 0)  {
    speed -= .1;
}

/// hp at 0

if (hp <= 0 and sprite_index != spr_barrel_water_knocked)   {
    sprite_index = spr_barrel_water_knocked;
    image_angle = other.direction;
    instance_create(x,y,obj_water);
}


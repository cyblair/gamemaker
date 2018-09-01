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
if (hp <= 0)   {
    if (obj_player.holding == self) {
        obj_player.holding = "";
    }
    if (instance_exists(obj_enemy)) {  
        with (obj_enemy)    {
            if (distance_to_object(other) < other.radius) {
                hp -= 7;
            }
            if (distance_to_object(other) < 300)   {
                alerted = 100;
            }
        }
    }
    if (distance_to_object(obj_player) < radius)   {
        obj_player.hp -= 3;
    }
    if (instance_exists(obj_barrel_explosive))  {
        with (obj_barrel_explosive) {
            if (distance_to_object(other) < other.radius) {
                hp -= 3;
            }
        }
    }
    if (instance_exists(obj_barrel_water))   {
        with (obj_barrel_water) {
            if (distance_to_object(other) < other.radius) {
                hp -= 3;
            }
        }
    }
    if (instance_exists(obj_glass)) {
         with (obj_glass) {
            if (distance_to_object(other) < other.radius) {
                hp -= 1;
            }
        }
    }
    
    instance_destroy();
    part_emitter_region(explodeSys,explodeEmit,x,x,y,y,0,0);
    part_emitter_burst(explodeSys,explodeEmit,explodePart1,5);
    
    instance_destroy(lastHeard);
    instance_create(x,y,lastHeard);
}


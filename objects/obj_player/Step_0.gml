/// @description  controls

key_left = keyboard_check(ord("A"));
key_right = keyboard_check(ord("D"));
key_up = keyboard_check(ord("W"));
key_down = keyboard_check(ord("S"));
if (instance_exists(obj_event_move))    {
    with (obj_event_move) {
        if (place_meeting(x,y,obj_player))  {
            if (special != "")   {
                key_left = false;
                key_right = false
                key_up = false
                key_down = false
            }
        }
    }
}

key_run = keyboard_check(vk_shift);
key_crouch = keyboard_check(vk_control);
key_liquify = keyboard_check_pressed(ord("F"));

key_shoot = mouse_check_button(mb_left);

key_interact = keyboard_check_pressed(ord("E"));
key_throw = keyboard_check_pressed(vk_space);

/// movement

hsp = -key_left+key_right;
vsp = -key_up+key_down;

if (key_run)    {
    spdMult = runSpeed;
    crouched = false;
}
else if (key_crouch)    {
    crouched = true;
}
else    {
    spdMult = walkSpeed;
    crouched = false;
}

if (place_meeting(x,y,obj_vent))  {
    crouched = true;
}

if (crouched)   {
    spdMult = crouchSpeed;
}

nextx = x+(hsp*spdMult);
nexty = y+(vsp*spdMult);


if (not liquified)  {
    if (place_meeting(nextx,y,obj_bouncesurface))   {
        obj = instance_nearest(x,y,obj_bouncesurface);
        if (obj.solid)  {
            nextx = x+lengthdir_x(5,point_direction(obj.x,obj.y,x,y));
            nexty = y+lengthdir_y(5,point_direction(obj.x,obj.y,x,y));
        
            mp_potential_step_object(nextx,nexty,5,obj_wall);
        }
    }
    else    {
        if (!place_meeting(nextx,nexty,obj_bouncesurface))  {
            mp_potential_step_object(nextx,nexty,spdMult,obj_bouncesurface);
        }
    }
}
else    {
    mp_potential_step_object(nextx,nexty,spdMult,obj_wall);
}

    
if (hsp != 0 or vsp != 0)   {
    moving = true;
}
else    {
    moving = false;
}

if (moving) {
    image_angle = point_direction(xprevious,yprevious,x,y);
}

/// shoot
shotTimer--;

if (key_shoot)  {
    if (shotTimer <= 0) {
        shotDir = point_direction(x,y,mouse_x,mouse_y) ;
        createx = x+lengthdir_x(18,shotDir);
        createy = y+lengthdir_y(18,shotDir);
        bullet = instance_create(createx,createy,obj_bullet);
        bullet.speed = irandom(5)+12;
        bullet.direction = shotDir;
        bullet.image_index = image_index;
        
        shotTimer = fireSpeed;
    }
}

/// liquify

if (instance_exists(obj_water)) {
    with (obj_water)   {
        v = 1;
        {do  {
            if (point_in_triangle(other.x,other.y,x,y,verts[v-1,0],verts[v-1,1],verts[v,0],verts[v,1]))   {
                other.inWater = 1;                    
            }
            else    {
                other.inWater = 0;
            }
            v++;
        }
        until (v >= array_height_2d(verts) or other.inWater == 1)}
        if (other.inWater == 1) {
            break;
        }
    }
}

if (inWater)    {
    if (key_liquify)    {
        liquified = not liquified;
    }
}
else    {
    liquified = false;
}

if (liquified)   {
    image_blend = c_aqua;
    if (liquidTimer > 0)    {
        liquidTimer -= 1;
    }
    else    {
        liquified = false;
    }
}
else    {
    image_blend = c_white;
    if (liquidTimer < liquidMax)    {
        liquidTimer += 3;
    }
}

/// looking at / holding

lookingX = x+lengthdir_x(32,direction);
lookingY = y+lengthdir_y(32,direction);

if (holding != "")  {
    holding.x = lookingX;
    holding.y = lookingY;
    holding.image_angle = direction;
    
    if (key_throw)  {
        holding.speed = 7;
        holding.direction = direction;
        holding = "";
    }
    else if (key_interact)   {
        holding.x = x+lengthdir_x(64,direction);
        holding.y = y+lengthdir_y(64,direction);
        holding = "";
    }
}


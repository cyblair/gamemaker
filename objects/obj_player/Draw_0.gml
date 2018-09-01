draw_self();

r = 0;

if (moving and not liquified) {
    if (spdMult == runSpeed)    {
        r = runNoise;
    }
    else if (spdMult == crouchSpeed)    {
        r = crouchNoise;
    }
    else    {
        r = walkNoise;
    }       
}

if (key_shoot)  {
    r = fireNoise;
}

draw_set_colour(c_maroon);
draw_circle(x,y,r,true);

with (obj_enemy)    {
    if (distance_to_object(other) < other.r)   {
        if (other.key_shoot)  {
            alerted = 70;
        }
        if (alerted < 100)  {
            alerted++;
        }
        if (alerted > 20)   {
            instance_destroy(lastHeard);
            instance_create(other.x,other.y,lastHeard);
        }
    }
}

/// looking at

draw_set_color(lookingColor);
draw_circle(lookingX,lookingY,3,false);


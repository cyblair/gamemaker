/// @description  move

if (instance_exists(obj_door))  {
    doorSolidState = obj_door.solid;
    obj_door.solid = false;
}
if (instance_exists(obj_vent))   {
    ventSolidState = obj_vent.solid;
    obj_vent.solid = true;
}

if (alerted < 20)   {
    if (instance_exists(obj_navnode))   {
        if (currentNode == "")  {
            currentNode = instance_nearest(x,y,obj_navnode);
        }
        if (place_meeting(x,y,currentNode)) {
            timer++;
        }
        
        if (timer >= moveTrigger)   {
            randomize();
            currentNodeNeighbors = ds_list_size(currentNode.neighbors)-1;
            index = irandom(currentNodeNeighbors);
            currentNode = currentNode.neighbors[| index];
                 
            timer = 0;
        }
        
        mp_potential_step(currentNode.x,currentNode.y,spd,false);
    }
}
else    {
    currentNode = "";
    if (instance_exists(lastSeen))  {
        if (alerted > 70)   {
            mp_potential_step(lastSeen.x,lastSeen.y,chaseSpd,false);
        }
        else    {
            mp_potential_step(lastSeen.x,lastSeen.y,spd,false);
        }
    }
    else if (instance_exists(lastHeard))  {
        mp_potential_step(lastHeard.x,lastHeard.y,spd,false);
    }
}

image_angle = direction;

if (instance_exists(obj_door))  {
    obj_door.solid = doorSolidState;
}
if (instance_exists(obj_vent))  {
    obj_vent.solid = ventSolidState;
}

/// spot/shoot player
shotTimer--;

if (not collision_line(x,y,obj_player.x,obj_player.y,obj_wall,true,true) and not collision_line(x,y,obj_player.x,obj_player.y,obj_door,true,true) and not obj_player.liquified)   {
    playerDirec = point_direction(x,y,obj_player.x,obj_player.y);
    angleDif = angle_difference(playerDirec, direction);
    
    if (angleDif < 35 and angleDif > -35)  {
        if (not obj_player.liquified and distance_to_object(obj_player) < 180)   {
            alerted = 100;
            instance_destroy(lastSeen);
            instance_create(obj_player.x, obj_player.y, lastSeen);
            
            if (shotTimer <= 0) {
                shotDir = point_direction(x,y,obj_player.x,obj_player.y) ;
                createx = x+lengthdir_x(18,shotDir);
                createy = y+lengthdir_y(18,shotDir);
                bullet = instance_create(createx,createy,obj_bullet);
                bullet.speed = irandom(5)+12;
                bullet.direction = shotDir;
                
                shotTimer = fireSpeed;
            }
        }
    }
}

else    {
    if (alerted > 0)    {
        if (not instance_exists(lastSeen) and not instance_exists(lastHeard))   {
            alerted -= 1;
        }
    }
}

if (hp <= 0)    {
    instance_destroy();
}

if (x != xprevious or y != yprevious)   {
    moving = true;
}
else    {
    moving = false;
}

if (instance_exists(obj_door))   {
    if (place_meeting(x,y,obj_door))    {
        other.open = not other.open;
    }
}


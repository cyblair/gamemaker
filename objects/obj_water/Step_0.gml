/// @description  spread

volume += increaseRate;

pointsToDist = volume-currentVolume;

while (pointsToDist > 0)  {
    add = .1;///array_height_2d(verts);
     
    for (p = 0; p < array_height_2d(verts); p++) {
        if (verts[p,3]) {
            nextx = verts[p,0] + lengthdir_x(add,verts[p,2]);
            nexty = verts[p,1] + lengthdir_y(add,verts[p,2]);
            
            if (not position_meeting(nextx,nexty,obj_wall)) {
                verts[p,0] = nextx;
                verts[p,1] = nexty;
                currentVolume += add;
            }
            else    {
                verts[p,3] = false;
                functionalVerts--;
            }
        }        
    }
    pointsToDist = volume-currentVolume;
    
    if (functionalVerts <= 0)   {
        break;
    }
}

if (volume >= maxVolume)    {
    increaseRate = 0;
}
increaseRate -= increaseRate/200;

radius = distance_to_point(verts[0,0],verts[0,1]);


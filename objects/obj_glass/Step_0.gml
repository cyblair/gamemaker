//hp at 0

if (hp <= 0)   {
    part_emitter_region(glassSys,glassEmit,x,x,y,y,0,0);
    part_emitter_burst(glassSys,glassEmit,glassPart1,8);
    instance_destroy();
}


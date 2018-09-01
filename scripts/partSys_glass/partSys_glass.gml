globalvar glassSys;
glassSys = part_system_create();

globalvar glassPart1;
glassPart1 = part_type_create();
part_type_sprite(glassPart1,spr_glassShard,0,0,0);
part_type_size(glassPart1,1,2,0,0);
part_type_scale(glassPart1,1,1);
part_type_color1(glassPart1,16777215);
part_type_alpha3(glassPart1,1,1,0);
part_type_speed(glassPart1,1,2,-0.05,0);
part_type_direction(glassPart1,0,359,0,0);
part_type_gravity(glassPart1,0,270);
part_type_orientation(glassPart1,0,359,0,0,0);
part_type_blend(glassPart1,0);
part_type_life(glassPart1,300,600);

globalvar glassEmit;
glassEmit = part_emitter_create(glassSys);



globalvar explodeSys;
explodeSys = part_system_create();

explodePart1 = part_type_create();
part_type_shape(explodePart1,pt_shape_cloud);
part_type_size(explodePart1,0.10,0.60,0,0);
part_type_scale(explodePart1,1,1);
part_type_color1(explodePart1,8421504);
part_type_alpha1(explodePart1,1);
part_type_speed(explodePart1,3,5,-0.03,0);
part_type_direction(explodePart1,0,359,0,0);
part_type_gravity(explodePart1,0,270);
part_type_orientation(explodePart1,0,0,0,0,1);
part_type_blend(explodePart1,0);
part_type_life(explodePart1,30,30);

explodeEmit = part_emitter_create(explodeSys);

explodePart2 = part_type_create();
part_type_shape(explodePart2,pt_shape_explosion);
part_type_size(explodePart2,0.10,0.50,0.00,0);
part_type_scale(explodePart2,1,1);
part_type_color3(explodePart2,16777215,33023,255);
part_type_alpha2(explodePart2,1,0);
part_type_speed(explodePart2,0,1,0,0);
part_type_direction(explodePart2,0,359,0,0);
part_type_gravity(explodePart2,0,270);
part_type_orientation(explodePart2,0,0,0,0,1);
part_type_blend(explodePart2,1);
part_type_life(explodePart2,60,60);

part_type_step(explodePart1,1,explodePart2);
part_type_death(explodePart1,20,explodePart2);

surface_free(shadow);
shadow = surface_create(__view_get( e__VW.WView, 0 ),__view_get( e__VW.HView, 0 ));

surface_set_target(shadow);
draw_clear_alpha(c_white, 0);


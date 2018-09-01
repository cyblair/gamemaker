/// @description optimization
ox = __view_get( e__VW.XView, 0 );
oy = __view_get( e__VW.YView, 0 );
ow = __view_get( e__VW.WView, 0 );
oh = __view_get( e__VW.HView, 0 );
instance_activate_region(ox,oy,ow,oh,true);
instance_deactivate_region(ox,oy,ow,oh,false,true);
with (all)  {
    if (other.renderBlocksOn) {
        if (collision_line(x,y,obj_player.x,obj_player.y,obj_renderBlock,true,true))   {
            instance_deactivate_object(self);
            image_alpha = 0;
        }
        else    {
            image_alpha = 1;
        }
    }
}
instance_activate_object(obj_player);
instance_activate_object(obj_enemy);
instance_activate_object(obj_navnode);
instance_activate_object(obj_cursor);
instance_activate_object(obj_light);


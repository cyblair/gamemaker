// Initialise the global array that allows the lookup of the depth of a given object
// GM2.0 does not have a depth on objects so on import from 1.x a global array is created
// NOTE: MacroExpansion is used to insert the array initialisation at import time
gml_pragma( "global", "__global_object_depths()");

// insert the generated arrays here
global.__objectDepths[0] = 0; // obj_player
global.__objectDepths[1] = 0; // obj_mannequin
global.__objectDepths[2] = -2; // obj_wall
global.__objectDepths[3] = 0; // obj_glass
global.__objectDepths[4] = 0; // obj_bouncesurface
global.__objectDepths[5] = 1; // detobj_collide
global.__objectDepths[6] = 0; // obj_door
global.__objectDepths[7] = 0; // obj_event_teleport
global.__objectDepths[8] = 0; // obj_renderBlock
global.__objectDepths[9] = 0; // obj_event_move
global.__objectDepths[10] = 0; // obj_event_text
global.__objectDepths[11] = 0; // obj_event_script
global.__objectDepths[12] = 0; // obj_navnode
global.__objectDepths[13] = 0; // obj_enemy
global.__objectDepths[14] = 0; // lastSeen
global.__objectDepths[15] = 0; // lastHeard
global.__objectDepths[16] = 0; // obj_bullet
global.__objectDepths[17] = 1; // obj_water
global.__objectDepths[18] = 0; // obj_barrel_explosive
global.__objectDepths[19] = 0; // obj_barrel_water
global.__objectDepths[20] = 0; // obj_damageable
global.__objectDepths[21] = -2; // obj_vent
global.__objectDepths[22] = 2; // detobj_tile
global.__objectDepths[23] = 2; // detobj_floor
global.__objectDepths[24] = -1; // detobj_misc
global.__objectDepths[25] = 2; // detobj_ground
global.__objectDepths[26] = 0; // obj_cursor
global.__objectDepths[27] = -1; // obj_light
global.__objectDepths[28] = 0; // obj_mainMenu
global.__objectDepths[29] = 0; // obj_playerSpwn
global.__objectDepths[30] = 0; // obj_enemySpwn
global.__objectDepths[31] = 0; // lvl_mannequin
global.__objectDepths[32] = 0; // lvl_wall
global.__objectDepths[33] = 1; // detlvl_tile
global.__objectDepths[34] = 1; // detlvl_floor
global.__objectDepths[35] = 1; // detlvl_misc
global.__objectDepths[36] = 1; // detlvl_ground
global.__objectDepths[37] = 0; // lvl_door
global.__objectDepths[38] = 0; // lvl_vent
global.__objectDepths[39] = 0; // lvl_barrel_water
global.__objectDepths[40] = 0; // lvl_barrel_explosive
global.__objectDepths[41] = 0; // detlvl_collide
global.__objectDepths[42] = 0; // lvl_glass
global.__objectDepths[43] = 0; // lvl_event_text
global.__objectDepths[44] = 0; // lvl_event_script
global.__objectDepths[45] = 0; // lvl_event_move
global.__objectDepths[46] = 0; // lvl_renderBlock
global.__objectDepths[47] = 0; // lvl_navnode
global.__objectDepths[48] = 0; // levelObj
global.__objectDepths[49] = -10; // obj_levelEdit


global.__objectNames[0] = "obj_player";
global.__objectNames[1] = "obj_mannequin";
global.__objectNames[2] = "obj_wall";
global.__objectNames[3] = "obj_glass";
global.__objectNames[4] = "obj_bouncesurface";
global.__objectNames[5] = "detobj_collide";
global.__objectNames[6] = "obj_door";
global.__objectNames[7] = "obj_event_teleport";
global.__objectNames[8] = "obj_renderBlock";
global.__objectNames[9] = "obj_event_move";
global.__objectNames[10] = "obj_event_text";
global.__objectNames[11] = "obj_event_script";
global.__objectNames[12] = "obj_navnode";
global.__objectNames[13] = "obj_enemy";
global.__objectNames[14] = "lastSeen";
global.__objectNames[15] = "lastHeard";
global.__objectNames[16] = "obj_bullet";
global.__objectNames[17] = "obj_water";
global.__objectNames[18] = "obj_barrel_explosive";
global.__objectNames[19] = "obj_barrel_water";
global.__objectNames[20] = "obj_damageable";
global.__objectNames[21] = "obj_vent";
global.__objectNames[22] = "detobj_tile";
global.__objectNames[23] = "detobj_floor";
global.__objectNames[24] = "detobj_misc";
global.__objectNames[25] = "detobj_ground";
global.__objectNames[26] = "obj_cursor";
global.__objectNames[27] = "obj_light";
global.__objectNames[28] = "obj_mainMenu";
global.__objectNames[29] = "obj_playerSpwn";
global.__objectNames[30] = "obj_enemySpwn";
global.__objectNames[31] = "lvl_mannequin";
global.__objectNames[32] = "lvl_wall";
global.__objectNames[33] = "detlvl_tile";
global.__objectNames[34] = "detlvl_floor";
global.__objectNames[35] = "detlvl_misc";
global.__objectNames[36] = "detlvl_ground";
global.__objectNames[37] = "lvl_door";
global.__objectNames[38] = "lvl_vent";
global.__objectNames[39] = "lvl_barrel_water";
global.__objectNames[40] = "lvl_barrel_explosive";
global.__objectNames[41] = "detlvl_collide";
global.__objectNames[42] = "lvl_glass";
global.__objectNames[43] = "lvl_event_text";
global.__objectNames[44] = "lvl_event_script";
global.__objectNames[45] = "lvl_event_move";
global.__objectNames[46] = "lvl_renderBlock";
global.__objectNames[47] = "lvl_navnode";
global.__objectNames[48] = "levelObj";
global.__objectNames[49] = "obj_levelEdit";


// create another array that has the correct entries
var len = array_length_1d(global.__objectDepths);
global.__objectID2Depth = [];
for( var i=0; i<len; ++i ) {
	var objID = asset_get_index( global.__objectNames[i] );
	if (objID >= 0) {
		global.__objectID2Depth[ objID ] = global.__objectDepths[i];
	} // end if
} // end for
/// @description  init vars
currentFile = "";

selectedNum = 0;

selectedObj = lvl_wall;
selectedObj_variant = 0;
moveView = false;
dropdown = 0;

mode = "blocks";

moveSelection = false;
textureValue = 0;
rotation = 0;
special = "";

tileLeft = 0;
tileTop = 0;
tileDepth = 1000;
WIDTH = 32;
HEIGHT = 32;
BACKGROUND = tile_tiles;

boxSelect = false;

///grid
gridSnap = 32;
GRIDCOLOR = c_black;
offset = 16;

// lvl objects
lvlObjects[0, 0] = lvl_wall;
lvlObjects[0, 1] = spr_wall;
lvlObjects[1, 0] = lvl_door;
lvlObjects[1, 1] = spr_door;
lvlObjects[2, 0] = detlvl_collide;
lvlObjects[2, 1] = det_collide;
lvlObjects[3, 0] = lvl_vent;
lvlObjects[3, 1] = spr_vent;
lvlObjects[4, 0] = lvl_barrel_explosive;
lvlObjects[4, 1] = spr_barrel_explosive;
lvlObjects[5, 0] = lvl_barrel_water;
lvlObjects[5, 1] = spr_barrel_water;
lvlObjects[6, 0] = obj_playerSpwn;
lvlObjects[6, 1] = spr_playerSpwn;
lvlObjects[7, 0] = obj_enemySpwn;
lvlObjects[7, 1] = spr_enemySpwn;
lvlObjects[8, 0] = lvl_glass;
lvlObjects[8, 1] = spr_glass;
lvlObjects[9, 0] = lvl_event_text;
lvlObjects[9, 1] = spr_event_text;
lvlObjects[10, 0] = lvl_event_script;
lvlObjects[10, 1] = spr_event_script;
lvlObjects[11, 0] = lvl_event_move;
lvlObjects[11, 1] = spr_event_move;
lvlObjects[12, 0] = lvl_mannequin;
lvlObjects[12, 1] = spr_player;
lvlObjects[13, 0] = detlvl_misc;
lvlObjects[13, 1] = det_misc;
lvlObjects[14, 0] = lvl_renderBlock;
lvlObjects[14, 1] = spr_renderBlock;
lvlObjects[15, 0] = lvl_navnode;
lvlObjects[15, 1] = spr_navnode;

objSurf = surface_create(800,180);

pageNumber = 0;
maxPage = ceil(array_height_2d(lvlObjects)/6)-1;


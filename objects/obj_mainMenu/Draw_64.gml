button(c_black,c_dkgray,"rectangle",800,400,1000,500,map_test);
button(c_black,c_dkgray,"rectangle",800,500,1000,600,map_edit);
draw_set_font(fnt_main);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_colour(c_white);
draw_text(900,450,string_hash_to_newline("Run Map"));
draw_text(900,550,string_hash_to_newline("Editor"));


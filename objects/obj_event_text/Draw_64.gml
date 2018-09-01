draw_set_alpha(alpha);
draw_set_colour(c_white);
draw_set_font(fnt_main);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text(960,650,string_hash_to_newline(special));
draw_set_colour(c_black);
draw_text(961,651,string_hash_to_newline(special));
draw_set_alpha(1);


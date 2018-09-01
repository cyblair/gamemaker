/// @description  button(defaultColor, hoverColor, shape, x1, y1, x2, y2, script, [text]);
/// @param defaultColor
/// @param  hoverColor
/// @param  shape
/// @param  x1
/// @param  y1
/// @param  x2
/// @param  y2
/// @param  script
/// @param  [text]

defaultColor = argument[0];
hoverColor = argument[1];
shape = argument[2];

x1 = argument[3];
y1 = argument[4];
x2 = argument[5];
y2 = argument[6];

script = argument[7];

if (argument_count > 8) {
    text = argument[8];
}


draw_set_colour(defaultColor);
if (mouse_in_rect(x1,y1,x2,y2)) {
    draw_set_colour(hoverColor);
    
    if (mouse_check_button_released(mb_left))    {
        script_execute(script);
    }
}

switch (shape)  {
    case "rectangle":
        draw_rectangle(x1,y1,x2,y2,false);
        break;
        
    case "text":
        draw_text((x1+x2)/2,(y1+y2)/2, string_hash_to_newline(text));
        break;
}

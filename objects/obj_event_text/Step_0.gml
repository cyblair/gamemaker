if (place_meeting(x,y,obj_player) and alpha < 1)  {
    alpha += .01;
}
else if (alpha > 0) {
    alpha -= .01;
}


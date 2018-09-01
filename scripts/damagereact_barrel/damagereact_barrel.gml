if (obj_player.holding == self) {
    obj_player.holding = "";
}

direction = other.direction;
image_angle += irandom(90)-45;

speed = 2;

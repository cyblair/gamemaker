/// @description  is_adjacent(block1, block2);
/// @param block1
/// @param  block2

block1 = argument0;
block2 = argument1;

if (block1.x == block2.x+32 or block1.x == block2.x-32 or block1.x == block2.x) {
    if (block1.y == block2.y+32 or block1.y == block2.y-32 or block1.y == block2.y) {
        return true;
    }
}

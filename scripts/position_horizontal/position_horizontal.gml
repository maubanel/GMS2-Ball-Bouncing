/// @description position_horizontal() Moves up to x position based on distance between source and collision
/// @param x position to move towards

var intersection_point = 0;
// Force ball to point of collision 
intersection_point = abs((argument0) / hspeed);
x += (hspeed * intersection_point);
y += (vspeed * intersection_point);

// Invert horizontal speed as touching top of room
hspeed = -hspeed;
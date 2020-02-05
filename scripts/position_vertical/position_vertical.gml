/// @description position_vertical() Moves up to y position based on distance between source and collision
/// @param y position to move towards

var intersection_point = 0;
// Force ball to point of collision 
intersection_point = abs((argument0) / vspeed);
x += (hspeed * intersection_point);
y += (vspeed * intersection_point);

// Invert vertical speed as touching top of room
vspeed = -vspeed;
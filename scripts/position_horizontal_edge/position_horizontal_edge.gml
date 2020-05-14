/// @description position_horizontal() Moves up to x position based on distance between source and collision
/// @param x position to move towards

if (debug_lines) original_angle = direction;


// Force ball to point of collision 
intersection_point = abs((argument0) / hspeed);
//if (intersection_point < 1) { hspeed -= 1
x -= (hspeed * intersection_point);
y -= (vspeed * intersection_point);

// Invert horizontal speed as touching top of room
hspeed = -hspeed;

if (debug_lines)  reflection_angle = direction;


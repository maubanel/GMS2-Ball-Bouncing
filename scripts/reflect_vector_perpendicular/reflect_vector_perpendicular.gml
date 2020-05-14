/// @description Reflects a vector along plane
/// @param x_speed x portion of vector
/// @param y_speed y  portion of vector
/// @param surface_vector_x vector representing normal of reflection
/// @param surface_vector_y vector representing normal of 

var x_speed = argument0;
var y_speed = argument1;
var perp_x = argument2;
var perp_y = argument3;


// Reflection angle and normalized vecctor
//R=E−2(E⋅n̂ )n̂ 


// Normalize perpendiculate
var distance = point_distance(0, 0, perp_x, perp_y);
perp_x /= distance;
perp_y /= distance;

// Normalize hspeed & vspeed

var edotn = x_speed * perp_x + y_speed * perp_y;

var edot2n = (x_speed/speed) * perp_x + (y_speed / speed) * perp_y;

if (edot2n < 0) { dot_neg++; }
//show_debug_message("eDot2N Perp: " + string(edot2n) + " | dot_net: " + string(dot_neg));

if (debug_lines) original_angle = direction;

hspeed = hspeed - 2 * edotn * perp_x;

vspeed = vspeed - 2 * edotn * perp_y;

if (debug_lines)  reflection_angle = direction;
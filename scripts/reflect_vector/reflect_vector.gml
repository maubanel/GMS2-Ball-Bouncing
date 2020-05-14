/// @description Reflects a vector along plane
/// @param x_speed x portion of vector
/// @param y_speed y  portion of vector
/// @param surface_vector_x vector representing angle of surface for reflection
/// @param surface_vector_y vector representing angle of surface for reflection

var x_speed = argument0;
var y_speed = argument1;
var plane_x = argument2;
var plane_y = argument3;
var angle = argument4;


// Reflection angle and normalized vecctor
//R=E−2(E⋅n̂ )n̂ 

// Get perpendicular of plane
var norm_plane_x = -plane_y;
var norm_plane_y = plane_x;

// Normalize perpendiculate
var distance = point_distance(0, 0, norm_plane_x, norm_plane_y);
norm_plane_x /= distance;
norm_plane_y /= distance;

show_debug_message("Perp angle: " + string(point_direction(0, 0, norm_plane_x, norm_plane_y)));


var edotn = x_speed * norm_plane_x + y_speed * norm_plane_y;

// Some collisions reflect into the object, so make sure collision is less than 90 degrees
// and need to normalize both vectors
var edot2n = ((x_speed/speed) * norm_plane_x) + (y_speed/speed * norm_plane_y);


// If greater than 90 then make angle positive
if (edot2n < 0) { dot_neg++; edotn = abs(edotn); edot2n = abs(edot2n); angle = -angle; show_debug_message("Edot2n before adjust: " + string(edot2n));}

// Stops angle from being too perpendicular as circle can not get enough exit velocithy to avoid colliding with edge
if (edot2n < .02) { edotn = .02 * speed; show_debug_message("Adjusted angle a bit to deflect enough off surface");}
show_debug_message("Edotn after adjust: " + string(edot2n));

if (debug_lines) original_angle = direction;

hspeed = hspeed - 2 * edotn * norm_plane_x;

vspeed = vspeed - 2 * edotn * norm_plane_y;

if (debug_lines)  reflection_angle = direction;

return angle;
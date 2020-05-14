// For a circle pass it begiing and end of a line and it will return false for 

// Find line intersection on circle from top left edge
// http://csharphelper.com/blog/2014/09/determine-where-a-line-intersects-a-circle-in-c/
				
// Get Distance From Collision
			
//var x_on_circ = 0;
//var y_on_circ = 0;
var x_on_circ_2 = 0;
var y_on_circ_2 = 0;
var x1 = argument0;
var x2 = argument0 + lengthdir_x(radius, direction-180);
var y1 = argument1;
var y2 = argument1 + lengthdir_y(radius, direction-180);
			
// dx = x2 - x1 of line
// dy = y2 - y1 of line
var dx = x2 - x1;
var dy = y2 - y1;
			
var A = sqr(dx) + sqr(dy);
			
var B = 2 * (dx * (x1 - x) + dy * (y1 - y));
			
var C = sqr(x1 - x) + sqr(y1 - y) - sqr(radius);
			
var DET = sqr(B) - 4 * A * C;
			
if (A <= .0000001 || DET < 0) 
{
	// No collision so use the corner we are on instead
	return false;
}
			
if (DET == 0) // only one solution line is tangent to circle
{
	var t = -B / (2 * A);
	x_on_circ_2 = x1 + t * dx;
	x_on_circ_2 = y1 + t * dy;
}
else // two solutions line could go through circle
{
	var t = 0;
	// First Point is Furthest from corner and not required
	/*t = (-B + sqrt(DET)) / (2 * A);
	x_on_circ = x1 + t * dx;
	y_on_circ = y1 + t * dy;*/
	t = (-B - sqrt(DET)) / (2 * A);
	x_on_circ_2 = x1 + t * dx;
	y_on_circ_2 = y1 + t * dy;
				
				// When ball is off the edge we cast the radius in the opposite direction that the ball is moving in
			
	var new_x = argument0 - x_on_circ_2;
	var new_y = argument1 - y_on_circ_2;
			
	x += new_x;
	y += new_y;
			
			 
	// Cast a perpendicular plane to calculate the angle of deflection
	var r_angle_x = cos(degtorad(new_dir - 180));
	var r_angle_y = -sin(degtorad(new_dir - 180));	
	// Reflection angle and normalized vecctor
	//R=E−2(E⋅n̂ )n̂ 
	var edotn = hspeed * r_angle_x + vspeed * r_angle_y;
	hspeed = hspeed - 2 * edotn * r_angle_x;
	vspeed = vspeed - 2 * edotn * r_angle_y;
					
}

return true;
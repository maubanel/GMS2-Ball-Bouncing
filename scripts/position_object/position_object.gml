
var side_of_triangle = argument0;

var diff = 0;

var diff = radius - (point_distance(x, y, x_closest, y_closest));

//|h| = |o| / sin(hypotenuse<adjacent)

var ang_hyp_adj = 0;

switch(side_of_triangle)
{
	case side.top:
	//diff++;
	ang_hyp_adj = point_direction(col.top_left_x, col.top_left_y, col.top_right_x, col.top_right_y) - direction;
	break;
	
	case side.bottom:
	diff++;
	ang_hyp_adj = direction - point_direction(col.bottom_left_x, col.bottom_left_y, col.bottom_right_x, col.bottom_right_y);
	break;
	
	case side.left:
	ang_hyp_adj = point_direction(col.top_left_x, col.top_left_y, col.bottom_left_x, col.bottom_left_y) - direction;
	break;
	
	case side.right:
	ang_hyp_adj = direction - point_direction(col.top_right_x, col.top_right_y, col.bottom_right_x, col.bottom_right_y);
	break;
}
				

var new_angle = sin(degtorad(ang_hyp_adj));


var hyp_mag = abs(diff / new_angle);

// Adjust angle when ball penetrates further than reflection will move it
var adjust_for_penetration = false;

if (hyp_mag > max_speed)
{
	show_debug_message("ERROR POSITION_OBJECT() MOVED TOO FAR hyp_mag: " + string(hyp_mag));
	adjust_for_penetration = true;
}

hyp_mag = clamp(hyp_mag, 0, max_speed);

// Make sure noise is < .1 * rcos or 84.26 degrees
if (new_angle > -.1 && new_angle < .1)
{
	collision = false;
}
else collision = true;


// In case we move player outside edge of level
correct_for_edge_of_level();

// Check to see if angle is less than 90 degrees from normal meaning that circle is moving in wrong direction
var prior_angle = direction;
	
var perp_x = 0;
var perp_y = 0;

switch(side_of_triangle)
{
	case side.top:
	prior_angle = reflect_vector(hspeed, vspeed, col.top_right_x - col.top_left_x, col.top_right_y - col.top_left_y, prior_angle);
	// Get perpendicular of plane
	perp_x =  (col.top_right_y - col.top_left_y);
	perp_y = -(col.top_right_x - col.top_left_x);
	break;
	
	case side.bottom:
	prior_angle =reflect_vector(hspeed, vspeed,  col.bottom_left_x - col.bottom_right_x, col.bottom_left_y- col.bottom_right_y, prior_angle );
	perp_x =  (col.bottom_left_y - col.bottom_right_y);
	perp_y = -(col.bottom_left_x - col.bottom_right_x);
	break;
	
	case side.left:
	prior_angle = reflect_vector(hspeed, vspeed, col.top_left_x - col.bottom_left_x , col.top_left_y - col.bottom_left_y, prior_angle);
	perp_x =  (col.top_left_y - col.bottom_left_y);
	perp_y = -(col.top_left_x - col.bottom_left_x);
	break;
	
	case side.right:
	prior_angle = reflect_vector(hspeed, vspeed, col.bottom_right_x - col.top_right_x, col.bottom_right_y - col.top_right_y, prior_angle);
	perp_x =  (col.bottom_right_y - col.top_right_y);
	perp_y = -(col.bottom_right_x - col.top_right_x);
	break;
}

if (!adjust_for_penetration)
{
	x += lengthdir_x(hyp_mag, prior_angle - 180);
	y += lengthdir_y(hyp_mag, prior_angle - 180);	
}

// Move ball out of collision plane
if (adjust_for_penetration)
{
	diff = radius - (point_distance(x, y, x_closest, y_closest));
	var new_dir = point_direction(0, 0, perp_x, perp_y);
	x += lengthdir_x (diff, new_dir);
	y += lengthdir_y (diff, new_dir);
	show_debug_message("Perp of line: " + string(new_dir) + " | diff: " + string(diff));
}

show_debug_message("a_h_a: " + string(ang_hyp_adj) + " - h_m: " + string(hyp_mag) + " | diff: " + string(diff) + " | hew_angle: " + string(new_angle));


			
/// @description Check if line collides with circle
/// @param line_start_x begining x point of line
/// @param line_start_y begining y point of line
/// @param line_end_x end x point of line
/// @param line_end_y end y point of line
/// @param radius of circle, xy must be centered on sprite
/// @param side enum for top, bottom left or right side of rectangle

//Assumption that x,y are in the middle of the circle

// returns length of perpendicular projectoni from ine to center of circle

// https://code.tutsplus.com/tutorials/quick-tip-collision-detection-between-a-circle-and-a-line--active-10546

var line_start_x = argument0;
var line_start_y = argument1;
var line_end_x = argument2;
var line_end_y = argument3;
var radius = argument4;
var side = argument5;

// clear corners
top_left_corner = false;
top_right_corner = false;
bottom_left_corner = false;
bottom_right_corner = false;

// Gets vector for line
var line_to_end_x = line_end_x - line_start_x;
var line_to_end_y =  line_end_y - line_start_y;
	
// Create new vector from beginning of line passed to center of circle
var line_to_center_x = x - line_start_x;
var line_to_center_y = y - line_start_y;

// Calculate corner based on previous y position to calculate best corner before collision
// var p_line_to_center_x = xprevious - line_start_x;
// var p_line_to_center_y = yprevious - line_start_y;

if (debug_lines) { dot_penetration_x = 1; dot_penetration_y = 1; }
	
var distance = global.max_val;


// Get unit distance along line closest to circle center
var dot = (line_to_center_x * line_to_end_x + line_to_center_y * line_to_end_y) / (sqr(line_to_end_y) + sqr(line_to_end_x));
//var p_dot = (p_line_to_center_x * line_to_end_x + p_line_to_center_y * line_to_end_y) / (sqr(line_to_end_y) + sqr(line_to_end_x));

// Previous unit distance along line closest to circle center
	
// Closest point on line
x_closest = line_start_x + line_to_end_x * dot;
y_closest = line_start_y + line_to_end_y * dot;

// If it is on line then get the squared distance from closest point on line to center of circle
if (dot >= -.02 && dot <= 1.02)
{
	distance = sqr(x_closest - x) + sqr(y_closest - y);
}
	
// If closest point not on line segment determine which end is slosest
else
{ 
	if (dot < -.02)
	{
		distance = sqr(line_start_x - x) + sqr(line_start_y - y);
	}
	else
	{
		distance = sqr(line_end_x - x) + sqr(line_end_y - y);
	}
}


// If it is less than the square of radius there is a colision	
if (distance < sqr(radius))
{
	//show_debug_message("dot bc: " + string(dot));
	// Check if current position is NOT on line
	if (dot < -.02 || dot > 1.02)
	{
	//	show_debug_message("dot ac: " + string(dot));
		// Then check last frame's position to find best corner
		if (dot < -.02)
		{
			switch(side)
			{
				case side.top:
				case side.left:
				top_left_corner = true;
				break;
			
				case side.bottom:
				bottom_left_corner = true;
				break;
			
				case side.right:
				top_right_corner = true;
				break;
			}
		
		}
		else if (dot > 1.02)
		{
				switch(side)
			{
				case side.top:
				top_right_corner = true;
				break;
			
				case side.left:
				bottom_left_corner = true;
			
				case side.bottom:
				case side.right:
				bottom_right_corner = true;
				break;
			}	
		}
	}
	return true;
}

else
{
	
	return false;
}



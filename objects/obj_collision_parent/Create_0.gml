/// @description Insert description here
// You can write your code in this editor
center_x = x + sprite_width/2;
center_y = y + sprite_height/2;

// Check off set clockwise from top left to bottom right
// top_left_xy, top_right_xy, bottom_left_xy , bottom_right_xyin variable definitions



top_left_angle = point_direction(center_x, center_y, top_left_x, top_left_y);
top_right_angle = point_direction(center_x, center_y, top_right_x, top_right_y);
bottom_left_angle = point_direction(center_x, center_y, bottom_left_x, bottom_left_y);
bottom_right_angle = point_direction(center_x, center_y, bottom_right_x, bottom_right_y);

if (top_left_angle < 0) top_left_angle += 360;
if (top_right_angle < 0) top_left_angle += 360;
if (bottom_left_angle < 0) bottom_left_angle += 360;
if (bottom_right_angle < 0) bottom_right_angle += 360;


top_slope = 0;
if ( top_right_x - top_left_x != 0)
{
	// Slope is rise over run
	top_slope = (top_right_y - top_left_y) / (top_right_x - top_left_x);
	if (top_left_y < top_right_y) top_slope = -top_slope;
}

bottom_slope = 0;
if ((bottom_right_x - bottom_left_x) != 0)
{
	bottom_slope = (bottom_right_y - bottom_left_y) / (bottom_right_x - bottom_left_x);
}

left_slope = 0;
if (bottom_left_x - top_left_x != 0)
{
	left_slope = (bottom_left_y - top_left_y) / (bottom_left_x - top_left_x);
}

right_slope = 0;
if (bottom_right_x - top_right_x != 0)
{
	right_slope = (bottom_right_y - top_right_y) / (bottom_right_x - top_right_x);
}

if (sprite_index = spr_slope_6) show_debug_message("top_left_angle: " + string(top_left_angle)
	+ " - top_right_angle: " + string(top_right_angle) + " - bottom_left_angle: " 
	+ string(bottom_left_angle) + " = bottom_right_angle: " + string(bottom_right_angle));

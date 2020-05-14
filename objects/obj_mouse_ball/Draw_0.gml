/// @description Insert description here
// You can write your code in this editor

if (col != noone)
{
	with (col)
	{
		draw_self();
		draw_set_color(c_red);
		draw_line_width(top_left_x, top_left_y, top_right_x, top_right_y, 2 );
		draw_line_width(top_right_x, top_right_y, bottom_right_x, bottom_right_y, 2 );
		draw_line_width(bottom_right_x, bottom_right_y, bottom_left_x, bottom_left_y, 2 );
		draw_line_width(bottom_left_x, bottom_left_y, top_left_x, top_left_y, 2 );
		draw_set_color(c_white);
		
	}
	
}	

draw_self();
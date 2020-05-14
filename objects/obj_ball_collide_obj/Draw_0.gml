/// @description Insert description here
// You can write your code in this editor
draw_self();

if (debug_lines)
{
	if (col != noone)
	{
		draw_set_color(c_red);
		draw_set_alpha(1);
	
		draw_line_width(col.top_left_x, col.top_left_y, col.top_right_x, col.top_right_y, 3);
		draw_line_width(col.top_right_x, col.top_right_y, col.bottom_right_x, col.bottom_right_y, 3);
		draw_line_width(col.bottom_right_x, col.bottom_right_y, col.bottom_left_x, col.bottom_left_y, 3);
		draw_line_width(col.bottom_left_x, col.bottom_left_y, col.top_left_x, col.top_left_y, 3);
	
		draw_set_color(c_white);
	
	}
	
	if (original_angle < global.max_val && reflection_angle < global.max_val)
	{
		var reflection_x =  x + lengthdir_x(radius, original_angle);
		var reflection_y = y + lengthdir_y(radius, original_angle);
		draw_set_color(c_green);
		draw_line_width(x, y, reflection_x, reflection_y, 3);
		
		draw_set_color(c_red);
		draw_line_width(reflection_x, reflection_y, reflection_x + lengthdir_x(radius, reflection_angle), reflection_y + lengthdir_y(radius, reflection_angle), 3);
		
		draw_set_color(c_white);
				
		original_angle = global.max_val;
		reflection_angle = global.max_val;			
		
	}
	
	if (dot_penetration_x < global.max_val && dot_penetration_y < global.max_val)
	{
	
	//	draw_set_color(c_green);
	//	draw_circle(x_closest, y_closest, 10, false);
		
		draw_set_color(c_green);
		draw_circle(x_closest, y_closest, 4, false);
		
		draw_set_color(c_fuchsia);

		dot_penetration_x = global.max_val;
		dot_penetration_y = global.max_val;
	}


}

draw_set_color(c_white);
draw_text(40, 30, floor(current_time/1000));
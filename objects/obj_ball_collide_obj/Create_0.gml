/// @description Insert description here
// You can write your code in this editor
radius = 24;

border = 32;

max_speed = 20;
speed = max_speed;

randomize();
direction = irandom(359);
direction = 22;
room_speed = 30;

show_debug_message("Starting direction: " + (string(direction)));

freeze_on_bounce = false;

is_frozen = false;

am = 0;

norm_hspeed = 0;

norm_vspeed = 0;

// collision with object's corners for angled bounce
top_left_corner = false;
top_right_corner = false;
bottom_left_corner = false;
bottom_right_corner = false;

// Closest point on line from circle to line
x_closest = 0;
y_closest = 9;

// Draw debug lines
debug_lines = true;


global.max_val = 2147483647;

enum side
{
	top,
	left, 
	right,
	bottom
}


if (debug_lines)
{
	
		original_angle = global.max_val;
		reflection_angle = global.max_val;
		
		dot_penetration_x = global.max_val;
		
		dot_neg = 0;
}

show_debug_message("direction: " + string(direction) + " | max_speed: " + string(max_speed) + " | x: " +string(x) + " | y: " + string(y));
/// @description Insert description here
// You can write your code in this editor
if (y + vspeed <  border + radius)
{
	vspeed = -vspeed * bounce_fric_y;
	y = border + radius - vspeed;
	//hspeed = (((1 - (inertia * bounce_fric_x)) * hspeed) + (inertia * (1 + bounce_fric_x) * angular_momentum)) / (1 + inertia);
	angular_momentum = ((1 + bounce_fric_x) * hspeed + inertia * (1 + bounce_fric_x) * angular_momentum ) / (radius * (1 + inertia));
}
	
else if (y + vspeed  > room_height - border - radius)
{
	vspeed = -vspeed * bounce_fric_y;
	y = room_height - border - radius - vspeed;
	//hspeed = (((1 - (inertia * bounce_fric_x)) * hspeed) + (inertia * (1 + bounce_fric_x) * angular_momentum)) / (1 + inertia);
	angular_momentum = ((1 + bounce_fric_x) * hspeed + inertia * (1 + bounce_fric_x) * angular_momentum ) / (radius * (1 + inertia));
}

if (x + hspeed  <  border + radius)
{
	hspeed = -hspeed * bounce_fric_y;	
	x = border + radius -hspeed;
	//vspeed = (((1 - (inertia * bounce_fric_x)) * vspeed) + (inertia * (1 + bounce_fric_x) * angular_momentum)) / (1 + inertia);
	angular_momentum = ((1 + bounce_fric_x) * vspeed + inertia * (1 + bounce_fric_x) * angular_momentum ) / (radius * (1 + inertia));
	
}

else if (x + hspeed  > room_width - border - radius)
{
	hspeed = -hspeed * bounce_fric_y;	
	x = room_width - border - radius -hspeed;
	//vspeed = (((1 - (inertia * bounce_fric_x)) * vspeed) + (inertia * (1 + bounce_fric_x) * angular_momentum)) / (1 + inertia);
	angular_momentum = ((1 + bounce_fric_x) * vspeed + inertia * (1 + bounce_fric_x) * angular_momentum ) / (radius * (1 + inertia));
}

if (keyboard_check_pressed(ord("S")))
{
	room_speed = (room_speed == 5) ? 30 : 5;
}

show_debug_message(radtodeg(angular_momentum));
show_debug_message(angular_momentum);
image_angle += radtodeg(angular_momentum);
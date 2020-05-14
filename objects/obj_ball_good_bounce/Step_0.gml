/// @description Insert description here
// You can write your code in this editor
if (is_frozen)
{
	room_speed = 269;
	is_frozen = false;
}

if (edge_of_level())
{
	// Get Distance From Collision
	var intersection_point = 0;
	if (y + vspeed <  border + radius) 
	{
		intersection_point = abs((y - (border + radius)) / vspeed) ;
		// Invert verstical speed as touching top of room
			// Force ball to point of collision then add an extray hspeed & vspeed to compensate for next inverted motion
		x += (hspeed * intersection_point) - hspeed;
		y += (vspeed * intersection_point) + vspeed;
		vspeed = -vspeed;
	}
	
	else if (y + vspeed  > room_height - border - radius ) 
	{
		intersection_point = abs(((room_height - border - radius) - y) / vspeed);
		x += (hspeed * intersection_point) - hspeed;
		y += (vspeed * intersection_point) + vspeed;
		// Invert verstical speed as touching top of room
		vspeed = -vspeed;
	}
	
	if (x + hspeed  <  border + radius) 
	{
		intersection_point = abs((x - (border + radius)) / hspeed);
		x += (hspeed * intersection_point) + hspeed;
		y += (vspeed * intersection_point) - vspeed;
		hspeed = -hspeed;
	}
	else if (x + hspeed  > room_width - border - radius)
	{
		intersection_point = ((room_width - border - radius) - x) / hspeed;
		x += (hspeed * intersection_point) + hspeed;
		y += (vspeed * intersection_point) - vspeed;
		hspeed = -hspeed;
	}

	
	if (freeze_on_bounce) room_speed = 1;
	is_frozen = true;
}




if (keyboard_check_pressed(ord("F")))
{
	freeze_on_bounce = !freeze_on_bounce;
}


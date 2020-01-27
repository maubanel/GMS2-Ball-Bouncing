/// @description Insert description here
// You can write your code in this editor
if (is_frozen)
{
	room_speed = 30;
	is_frozen = false;
}

if (edge_of_level()) // check for edge of world collision
{
	// Get Distance From Collision
	var intersection_point = 0;
	
	// How much velocity gransfers from linear to angular based on angle
	// using dot product of normalized velocity vector
	norm_hspeed = hspeed/speed;
	norm_vspeed = vspeed/speed;
	
	// scale from 0 to 1 to 0 to .4
	norm_hspeed = (norm_hspeed * .4);
	norm_vspeed = (norm_vspeed * .4);	
	
	// Deflect ball at angle based on angular momentum
	direction -= radtodeg(am * .5);
	am *= .5;
	
	// Collides with top of level
	if (y + vspeed <  border + radius) 
	{
		intersection_point = abs((y - (border + radius)) / vspeed) ;
		// Invert verstical speed as touching top of room
			// Force ball to point of collision then add an extray hspeed & vspeed to compensate for next inverted motion
		x += (hspeed * intersection_point) - hspeed;
		y += (vspeed * intersection_point) + vspeed;
		vspeed = -vspeed;
		
		// Translate portion of hspeed to angular momentum (am = hspeed/radius)
		am += (norm_hspeed) * abs(hspeed) /radius;
	}
	
	//Collides with bottom of level
	else if (y + vspeed  > room_height - border - radius ) 
	{
		intersection_point = abs(((room_height - border - radius) - y) / vspeed);
		x += (hspeed * intersection_point) - hspeed;
		y += (vspeed * intersection_point) + vspeed;
		// Invert verstical speed as touching top of room
		vspeed = -vspeed;
		// Translate portion of hspeed to angular momentum (am = hspeed/radius)
		am += (norm_hspeed) * abs(hspeed) /radius;

	}
	
	// Collides with left side of level
	if (x + hspeed  <  border + radius) 
	{
		intersection_point = abs((x - (border + radius)) / hspeed);
		x += (hspeed * intersection_point) + hspeed;
		y += (vspeed * intersection_point) - vspeed;
		hspeed = -hspeed;
		// Translate portion of hspeed to angular momentum (am = hspeed/radius)
		am += (norm_vspeed) * abs(vspeed) /radius;
	}
	
	// Collides with right side of level
	else if (x + hspeed  > room_width - border - radius)
	{
		intersection_point = ((room_width - border - radius) - x) / hspeed;
		x += (hspeed * intersection_point) + hspeed;
		y += (vspeed * intersection_point) - vspeed;
		hspeed = -hspeed;
		// Translate portion of hspeed to angular momentum (am = hspeed/radius)
		am += (norm_vspeed) * abs(vspeed) /radius;
	}

	// Remove angular velocity from total speed
	speed = max_speed - (abs(am * radius));
	
	if (freeze_on_bounce) room_speed = 1;
	is_frozen = true;
	
	show_debug_message("norm_hspeed: " + string(norm_hspeed) + " - speed: " + string(speed));
}


// Animate angular momentum
image_angle += radtodeg(am);



if (keyboard_check_pressed(ord("F")))
{
	freeze_on_bounce = !freeze_on_bounce;
}


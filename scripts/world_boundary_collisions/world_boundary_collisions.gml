
/*******************************************************************
*
*				NOT A FUNCTION
*		COLLISION WITH WORLD BOUNDARIES OF LEVEL
*
*
********************************************************************/

if (edge_of_level()) 
{
	add_noise();
	
	// How much velocity gransfers from linear to angular based on angle
	// using dot product of normalized velocity vector
	var norm_hspeed = hspeed/speed;
	var norm_vspeed = vspeed/speed;
	
	// scale from 0 to 1 to 0 to .2
	var norm_hspeed = (norm_hspeed * .2);
	var norm_vspeed = (norm_vspeed * .2);	
	
	
	// Collides with top of level
	if (y  <  border + radius) 
	{
		// Get ratio versus vspeed portion of vector versus distance from y at top of level
		show_debug_message("Hits top end of level");
		
		position_vertical_edge((border + radius) - y);
		
		// Translate portion of hspeed to angular momentum (am = hspeed/radius)
		am += -norm_hspeed * abs(hspeed) /radius;
	}
	
	//Collides with bottom of level
	else if (y > room_height - border - radius) 
	{
		show_debug_message("Hits bottom end of level");
		
		position_vertical_edge((room_height - border - radius) - y);

		// Translate portion of hspeed to angular momentum (am = hspeed/radius)
		am += norm_hspeed * abs(hspeed) /radius;

	}
	
	// Collides with left side of level
	if (x  <  border + radius) 
	{
		show_debug_message("Hits left end of level");
		
		position_horizontal_edge(x - (border + radius) );
		
		// Translate portion of hspeed to angular momentum (am = hspeed/radius)
		am += norm_vspeed * abs(vspeed) /radius;
	}
	
	// Collides with right side of level
	else if (x  > room_width - border - radius)
	{
		show_debug_message("Hits right end of level");
		
		position_horizontal_edge((room_width - border - radius) - x);

		// Translate portion of hspeed to angular momentum (am = hspeed/radius)
		am += -norm_vspeed * abs(vspeed) /radius;
	}
	
	// Deflect ball at angle based on angular momentum
	direction += radtodeg(am * .1);
	am *= .9;

	// Remove angular velocity from total speed
	speed = max_speed - (abs(am * radius));

	
	
	if (freeze_on_bounce) room_speed = 1;
	is_frozen = true;

}

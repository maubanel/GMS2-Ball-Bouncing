if (edge_of_level())
{
	if (y  <  border + radius) y = border+radius;
	else if (y > room_height - border - radius)  y = room_height - border - radius;
	
	if (x  <  border + radius) x = border + radius;
	else if (x  > room_width - border - radius) x = room_width - border - radius;
}
/// @description Returns Boolean if outside world boundaries


return (y + vspeed <  border + radius) || (y + vspeed  > room_height - border - radius ) ||
	(x + hspeed  <  border + radius) || (x + hspeed  > room_width - border - radius);
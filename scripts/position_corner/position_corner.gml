
var distance = point_distance(x, y, argument0,argument1);
var penetration = radius - distance;
x += lengthdir_x(penetration, direction - 180);
y += lengthdir_y(penetration, direction - 180);			

// In case we move actor past edge of level
correct_for_edge_of_level();

collision = true;

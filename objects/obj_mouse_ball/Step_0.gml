/// @description Insert description here
// You can write your code in this editor
x = mouse_x;
y = mouse_y;

col = noone;

nearest = instance_nearest(x-32, y-32, obj_collision_parent);

col = instance_place(x, y, nearest);

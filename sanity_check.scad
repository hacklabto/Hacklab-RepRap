include <configuration.scad>


if (vert_angle < 10 || vert_angle > 80) echo("Your vertex angle value, ", vert_angle, ", seems insane. This probably indicates that your configurations are problematic.")


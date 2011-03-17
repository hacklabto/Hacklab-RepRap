// Hacklab Reprap  
// Vertical Bar clamp
// Used for joining 8mm rods
// GNU GPL v2
// (C) Christopher Olah, 2011

include <configuration.scad>

outer_diameter = m8_diameter/2+3.3;

difference(){
	union(){
		
		translate([outer_diameter, outer_diameter, 0]) cylinder(h =outer_diameter*2, r = outer_diameter, $fn = 20);
		translate([outer_diameter, 0, 0])cube([17.5,outer_diameter*2,outer_diameter*2]);
		difference(){
			translate([outer_diameter*2-3, -6, 0])cube([10,outer_diameter*2+12,outer_diameter]);
			translate([outer_diameter*2-1, -4, 0])cube([6,outer_diameter*2+8,outer_diameter]);
		}
	}


	translate([9, outer_diameter/2+2.5, 0])cube([18,3,20]);
	translate([outer_diameter, outer_diameter, 0]) cylinder(h =20, r = m8_diameter/2, $fn = 18);
	#translate([23, outer_diameter, 7.5]) rotate([0,90, 0]) cylinder(h =20, r = m8_diameter/2, center=true,$fn = 10);
}
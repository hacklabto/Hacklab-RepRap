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
		intersection(){
			translate([outer_diameter+10, 4, outer_diameter]) cube([17.5,outer_diameter,outer_diameter*2],center=true);
			 translate([outer_diameter+10, 2+outer_diameter*2/6+5, outer_diameter]) rotate([45,0,0]) cube([17.5,outer_diameter*2,outer_diameter*2],center=true);
		}

	}
	translate([17, outer_diameter+1, 7.5]) difference(){
		rotate([0,90,0]) cylinder(r=9,h=7);
		rotate([0,90,0]) cylinder(r=6.5,h=15,center=true);
	}

	#translate([outer_diameter, outer_diameter, 0]) cylinder(h =20, r = m8_diameter/2, $fn = 18);
	#translate([23, outer_diameter, 7.5]) rotate([0,90, 0]) cylinder(h =20, r = m8_diameter/2, center=true,$fn = 10);
}
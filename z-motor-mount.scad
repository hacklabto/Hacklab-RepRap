// PRUSA Mendel  
// Z motor mount -- Used for mounting Z motors
// GNU GPL v2
// Josef Průša
// josefprusa@me.com
// prusadjs.cz
// Clean up by Christopher Olah <christopherolah.co@gmail.com>
// http://www.reprap.org/wiki/Prusa_Mendel
// http://github.com/prusajr/PrusaMendel

include <configuration.scad>
include <common.scad>

difference(){
	// Main body:
	union(){
		if (two_top_rods) {
			translate([0,0,0]) cube(size = [58,60,16], center = true);
			translate([0,0,-4]) cube(size = [58,76,8], center = true);
			for (y=[-1,1])  translate ([-29,30*y,0]) rotate([0,90,0]) cylinder(h =58, r=8, $fn=30);
		}else {
			translate([-5,0,-0.5]) cube(size = [70,60,15], center = true);
		}		 
		translate ([26.5,0,-8]) cylinder(h=15,r=8);
		intersection() { 	translate([0,0,92]) cube(size=[200,200,200], center = true); // cleanup the base
			union() {
				for (y=[-1,1]) translate([0,38*y,0]) rotate([(90-vert_angle)*y,0,0]) translate([0,0,3]) cylinder(r=10,h=18,center=true);
			}
		}
	}
	// Motor sits in this
	translate([-2.1,0,3.1]) motor();
	//The vertical rod goes through here
	translate ([-2,0,-50]) vertical_rods();
	//Diagonal rod and nut space
	translate ([0,0,0]) diagonal_rod();
	//top rod(s):
	if (two_top_rods) {
		for (y=[-1,1]) translate([-50,30*y,0]) rotate([0,90,0]) cylinder(h = 100, r=4.5);
		
	}else {
		translate([-50,0,0]) rotate([0,90,0]) cylinder(h = 22.5, r=4.0);
	}

	// create even rest for nuts of diagonal rods
	for (y=[-1,1]) translate([0,38*y,0]) rotate([(90-vert_angle)*y,0,0]) translate([0,0,-11]) cylinder(r=10,h=10,center=true);
}








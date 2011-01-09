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
			translate([-5,0,0]) cube(size = [70,60,16], center = true);
			translate([-5,0,-4]) cube(size = [70,76,8], center = true);
			for (y=[-1,1])  translate ([-40,30*y,0]) rotate([0,90,0]) cylinder(h = 70, r=8, $fn=30);
		}else {
			translate([-5,0,-0.5]) cube(size = [70,60,15], center = true);
			translate ([-32,0,0]) diagonal_rod_cube(slide=9);
		}		 
		translate ([26.5,0,-8]) cylinder(h=15,r=8);
	}
	// Motor sits in this
	translate([-2.1,0,3.1]) motor();
	//The vertical rod goes through here
	translate ([-2,0,-50]) vertical_rods();

	//Diagonal rod and nut space
	translate ([-32,0,0]) diagonal_rod();
	//top rod(s):
	if (two_top_rods) {
		for (y=[-1,1]) translate([-50,30*y,0]) rotate([0,90,0]) cylinder(h = 100, r=4.5);
		translate ([-32,0,0]) diagonal_rod_cube(slide=11);
	}else {
		translate([-50,0,0]) rotate([0,90,0]) cylinder(h = 22.5, r=4.0);
	}
	translate ([-32,0,0]) diagonal_rod_cube(slide=-11);
}








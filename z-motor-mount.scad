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

module diagonal_rod() {
	for (y=[-1,1]) translate([0,38*y,-40]) rotate([30*y,0,0]) cylinder (h=100,r=4.2);
}

module diagonal_rod_cube (slide = 0, size = [16,16,10]) {
	for (y=[-1,1]) translate([0,37*y,-40]) rotate([30*y,0,0])
			translate([0,0,50+slide]) cube(size=size,center=true);
}

module vertical_rods() {
	translate([30,0,-25]) cylinder(h = 80, r=4.6);
	translate([0,0,-25]) cylinder(h = 80, r=4.6);
}


difference(){
	// Main body:
	union(){
		translate([-20,0,0]) cube(size = [40,60,16], center = true);
		translate([-20,0,-4]) cube(size = [40,76,8], center = true);
		translate([-10,0,-4.5]) cube(size = [60,43,7], center = true);
		for (y=[-1,1])  translate ([-40,30*y,0]) rotate([0,90,0])
			cylinder(h = 40, r=8, $fn=30);
		translate ([-32.25,0,0]) diagonal_rod_cube(size = [15.5,16,10],slide=1);
	}
	// Motor sits in this
	translate([-2.1,0,3.1]) motor();
	//The vertical rod goes through here
	translate ([-32,0,-55]) vertical_rods();

	//Diagonal rod and nut space
	translate ([-32,0,0]) diagonal_rod();
	translate ([-32,0,0]) diagonal_rod_cube(size=[17,16,10],slide=-15);
	translate ([-32,0,0]) diagonal_rod_cube(size=[17,16.1,10],slide=10);
	translate ([-33,0,6]) cube([17,5,5],center=true);
	//top rod(s):
	for (y=[-1,1]) translate([-50,30*y,0]) rotate([0,90,0]) cylinder(h = 100, r=4.5);

	translate([17,0,0]) cube([20,15,20],center=true);

}








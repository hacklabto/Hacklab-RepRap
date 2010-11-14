// PRUSA Mendel  
// Z motor mount -- Used for mounting Z motors
// GNU GPL v2
// Josef Průša
// josefprusa@me.com
// prusadjs.cz
// Clean up by Christopher Olah <christopherolah.co@gmail.com>
// http://www.reprap.org/wiki/Prusa_Mendel
// http://github.com/prusajr/PrusaMendel

difference(){
	// Main body:
	union(){
		translate([-5,0,0]) cube(size = [70,60,16], center = true);
		translate([-5,0,-4]) cube(size = [70,76,8], center = true);
		translate ([30,0,-8]) cylinder(h=16,r=10);
		for (y=[-1,1])  translate ([-40,30*y,0]) rotate([0,90,0]) cylinder(h = 70, r=8, $fn=30);
		for (y=[-1,1]) translate ([-32.5,13*y,5]) rotate([30*y,0,0]) cube(size=[15.,16,16],center=true);
	}
	// Motor sits in this
	translate([-2.1,0,3.1]) cube(size = [46,43,10], center = true);
	// And goes through this
	translate([0,0,-20]) cylinder(h = 40, r=15);
	//The vertical rod goes through here
	translate([30,0,-45]) cylinder(h = 50, r=4.1);
	for (y=[-1,1]) {
		//top rods:
		translate([-50,30*y,0]) rotate([0,90,0]) cylinder(h = 100, r=4.5);
		//motor screw holes
		for (x=[-1,1]) translate([15*x,15*y,0]) cube(size = [9,3.2,25], center = true);
		//diagonal rods
		translate([-32,39*y,-40]) rotate([30*y,0,0]) cylinder (h=100,r=4.5);
	}

}






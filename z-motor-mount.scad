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
		translate([-5,0,0]) cube(size = [70,60,14], center = true);
		translate([-5,0,-4]) cube(size = [70,74,8], center = true);
		translate ([28,0,-8]) cylinder(h=15,r=8);
		for (y=[-1,1])  translate ([-40,30*y,0]) rotate([0,90,0]) cylinder(h = 70, r=7, $fn=30);
	}
	// Motor sits in this
	translate([-2.1,0,2.6]) cube(size = [46,43,9], center = true);
	// And goes through this
	translate([0,0,-20]) cylinder(h = 20, r=15);
	//The vertical rod goes through here
	translate([28,0,-45]) cylinder(h = 50, r=4.0);
	for (y=[-1,1]) {
		//top rods:
		translate([-65,30*y,0]) rotate([0,90,0]) cylinder(h = 100, r=4.3);
		//motor screw holes
		for (x=[-1,1]) translate([15*x,15*y,-5]) cube(size = [9,3.2,15], center = true);
		//diagonal rods
		translate([-32,39*y,-40]) rotate([30*y,0,0]) cylinder (h=100,r=4.3);
		//diagonal rods bottom Knut trapss:
		//translate([-32,39*y,-40]) rotate([30*y,0,0]) cylinder(h=40, r=6.5,$fn =6);
		//diagonal rod knut space
		translate ([-32.5,13*y,5]) rotate([30*y,0,0]) translate([0,0,3]) cube(size=[15.,16,10],center=true);
	}
	//Antiwarping grooves
	for (n=[-1:1]) translate([20*n-4,0,-8]) rotate([0,45,0]) cube (size=[2,74,2], center=true);
	for (n=[-1:1]) translate([-5,20*n,-8]) rotate([45,0,0]) cube (size=[70,2,2], center=true);

}







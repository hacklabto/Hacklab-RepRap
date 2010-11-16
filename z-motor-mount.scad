// PRUSA Mendel  
// Z motor mount -- Used for mounting Z motors
// GNU GPL v2
// Josef Průša
// josefprusa@me.com
// prusadjs.cz
// Clean up by Christopher Olah <christopherolah.co@gmail.com>
// http://www.reprap.org/wiki/Prusa_Mendel
// http://github.com/prusajr/PrusaMendel

two_top_rods = false; //Use two top rods or one?

difference(){
	// Main body:
	union(){
		if (two_top_rods) {
			translate([-5,0,0]) cube(size = [70,60,16], center = true);
			translate([-5,0,-4]) cube(size = [70,76,8], center = true);
			for (y=[-1,1])  translate ([-40,30*y,0]) rotate([0,90,0]) cylinder(h = 70, r=8, $fn=30);
		}else {
			translate([-5,0,-0.5]) cube(size = [70,60,15], center = true);
		}		 
		translate ([26.5,0,-8]) cylinder(h=15,r=8);
	}
	// Motor sits in this
	translate([-2.1,0,3.1]) cube(size = [46,43,10], center = true);
	// And goes through this
	translate([0,0,-20]) cylinder(h = 20, r=15);
	//The vertical rod goes through here
	translate([26.5,0,-45]) cylinder(h = 50, r=4.0);
	//top rod (if not tworods):
	if (!two_top_rods) translate([-50,0,0]) rotate([0,90,0]) cylinder(h = 22.5, r=4.0);
	//y symetry
	for (y=[-1,1]) {
		//motor screw holes
		for (x=[-1,1]) translate([15*x,15*y,-5]) cube(size = [9,3.2,15], center = true);
		//diagonal rods
		translate([-32,39*y,-40]) rotate([30*y,0,0]) cylinder (h=100,r=4.0);
		//diagonal rod nut space 
		translate ([-32.5,13*y,5]) rotate([30*y,0,0]) translate([0,0,3]) cube(size=[15.,16,10],center=true);
		//Top rods (if tworods):
		if (two_top_rods) translate([-50,30*y,0]) rotate([0,90,0]) cylinder(h = 100, r=4.5);
	}
}








// PRUSA Mendel  
// Configuration file
// GNU GPL v2
// Josef Průša
// josefprusa@me.com
// prusadjs.cz
// http://www.reprap.org/wiki/Prusa_Mendel
// http://github.com/prusajr/PrusaMendel

include <lib/mcad/motors.scad>

// M8 rod diameter
m8_diameter = 8.4;

// M8 nut diameter diameter
// Used for $fn nut trick -> cylinder(h = 5, r=4.5, $fn=6, center=true);
m8_nut_diameter = 16.4;

// M4 rod/screw diameter
m4_diameter = 5;

// M4 nut diameter diameter
// Used for $fn nut trick -> cylinder(h = 5, r=4.5, $fn=6, center=true);
m4_nut_diameter = 9;

// M3 rod/screw diameter
m3_diameter = 4.4;

// M3 nut diameter diameter
// Used for $fn nut trick -> cylinder(h = 5, r=4.5, $fn=6, center=true);
m3_nut_diameter = 7;

// Bushing holders diameter
bushing_diameter = 11;

x_belt = false; //use belt or threaded rod for x-axis movement
               //threaded rod is currently broken. Do not use it.
               //Leave this false or be prepared to do lots of drilling!
               //Also, x-carriage doesn't support this option so you'll
               //have come up with a hack to make it work if you use this
               //option.

two_top_rods = false; //Use two top rods or one?
                      //No repraps have been built with one top, so use
                      //this design at your own risk!

//The motor design used by your printer
module motor() {
	//This is (essentially) what ever was being used in z-motor-mount orriginaly. 
	// Motor sits in this
	cube(size = [45,43,10], center = true);
	// And goes through this
	translate([0,0,-15]) cylinder(h = 20, r=15);
	//And the screws go through here
	for (y=[-1,1]) for (x=[-1,1]) translate([15*x,15*y,-5]) cube(size = [8,3.2,15], center = true);
}


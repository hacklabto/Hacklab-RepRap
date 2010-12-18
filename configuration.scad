// PRUSA Mendel  
// Configuration file
// GNU GPL v2
// Josef Průša
// josefprusa@me.com
// prusadjs.cz
// http://www.reprap.org/wiki/Prusa_Mendel
// http://github.com/prusajr/PrusaMendel

//include <lib/mcad/motors.scad>

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

x_belt = true; //use belt or threaded rod for x-axis movement
               //threaded rod is currently broken. Do not use it.
               //Leave this true or be prepared to do lots of drilling!
               //Also, x-carriage doesn't support this option so you'll
               //have come up with a hack to make it work if you use this
               //option.

two_top_rods = true; //Use two top rods or one?
                      //No repraps have been built with one top, so use
                      //this design at your own risk!


tear_shape = false; //Use tear shaped holes for rods? not compatable with tight_grip = true

tight_grip = true; // Use tight holes where possible so that parts will self tap when 
                   // threaded rod is drilled in. Reduces need for nuts.
                   // tight_grip = false not compatable with two_top_rods = false

//NEMA_version //Variable not yet implemented.

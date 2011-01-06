// PRUSA Mendel  
// Configuration file
// GNU GPL v2
// Josef Průša
// josefprusa@me.com
// prusadjs.cz
// http://www.reprap.org/wiki/Prusa_Mendel
// http://github.com/prusajr/PrusaMendel

//include <lib/mcad/motors.scad>
include <constants.scad>

$fs= 0.3;

// Frame Design Settings
//=================

x_belt = true; //use belt or threaded rod for x-axis movement
               //threaded rod is currently broken. Do not use it.
               //Leave this true or be prepared to do lots of drilling!
               //Also, x-carriage doesn't support this option so you'll
               //have come up with a hack to make it work if you use this
               //option.

two_top_rods = true; //Use two top rods or one?
                      //No repraps have been built with one top, so use
                      //this design at your own risk!



// Build Volume Settings
//=================

//The x,y and z printable dimensions in that order
build_volume = [100,100,80];



// Threaded Rod Settings
//=================

//the diameter of the threaded rods
threaded_rod_diameter = 8.4;

//the radius of plastic needed around each threaded rod hole
//to hold it in place
threaded_rod_horizontal_clearance = 4;

//the plastic needed above and under each threaded rod hole
threaded_rod_vertical_clearance = 2;

nut_diameter=14.3;
nut_thickness = 6.9;


tear_shape = false; //Use tear shaped holes for rods? not compatable with tight_grip = true

tight_grip = false; // Use tight holes where possible so that parts will self tap when 
                   // threaded rod is drilled in. Reduces need for nuts.
                   // tight_grip = false not compatable with two_top_rods = false



// Motor Settings
//=================

//NEMA_version //Variable not yet implemented.



//BS That Works
//=================

// unprintable height under the y carriage for motors + electronics.
// (rough estimate for vert angle calculations)
basement_height = 90;

// unprintable height from the bottom of the top frame vertex to 
// the point where the frame verticies meet.
// (rough estimate for vert angle calculations)
attic_height = 5;

//unprintable area due to the x ends/z-sliders
z_slider_unprintable_height = 70;

// extra length needed on the y axis to compensate for the 
// y-carriage's length. This is setup for the ABP carriage mount.
y_carriage_unprintable_length = 4;

//length from the middle of the bottom frame vertex to where the 
//frame triangle's threaded rods would meet if they were 
//extended to that point.
y_vert_triangle_offset = 2;

total_unprintable_area = [0,
	y_carriage_unprintable_length + y_vert_triangle_offset,
	basement_height+attic_height+z_slider_unprintable_height];


// Driven Dimensions [NO USER-CONFIGURABLE OPTIONS]
//=================

vert_angle = atan( 2*(build_volume[Z]+total_unprintable_area[Z])/(build_volume[Y]+total_unprintable_area[Y]));

echo("Frame Vertex Angle: ",vert_angle);

hor_hole_seperation = threaded_rod_diameter*2+threaded_rod_horizontal_clearance*2;



// Legacy
//=================

// DEPRECATED! M8 rod diameter. use threaded_rod_diameter
m8_diameter = threaded_rod_diameter;

// Used for $fn nut trick -> cylinder(h = 5, r=4.5, $fn=6, center=true);

//Diameter of the nuts used on the the threaded rod
nut_diameter = 16.4;
//Clearance for accessible nuts such as on frame verticies
nut_clearance = 4;

//DEPRECATED! use nut_diameter
// M8 nut diameter diameter.
m8_nut_diameter = nut_diameter;

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



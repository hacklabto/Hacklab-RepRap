// This file contains common components shared between parts.
// Not only does abstracting like this simplify the parts,
// But it ensures the inter-part rods line up.
// (C) Christopher Olah, 2010. Released under the GPL.
// Many of the components based off of the original designs.

module motor() {
	//This is (essentially) what ever was being used in z-motor-mount orriginaly. 
	// Should be rewriten for NEMA compliance, to match the NEMA_version var.
	// Motor sits in this
	cube(size = [45,43,10], center = true);
	// And goes through this
	translate([0,0,-15]) cylinder(h = 20, r=12);
	//And the screws go through here
	for (y=[-1,1]) for (x=[-1,1]) translate([15*x,15*y,-5]) cube(size = [8,3.2,15], center = true);
}


module diagonal_rod(grip = true) {
	if (grip) for (y=[-1,1]) translate([0,15*y,0]) rotate([(90-vert_angle)*y,0,0]) translate([0,0,-50]) cylinder (h=100,r=4.0);
	if (!grip) for (y=[-1,1]) translate([0,15*y,0]) rotate([(90-vert_angle)*y,0,0]) translate([0,0,-50]) cylinder (h=100,r=4.2);
}

module diagonal_rod_cube (slide = 0, size = [16,16,10]) {
	for (y=[-1,1]) translate([0,15*y,0]) rotate([(90-vert_angle)*y,0,0]) translate([0,0,slide]) cube(size=size,center=true);
}

module vertical_rods() {
	translate([30,0,-25]) cylinder(h = 80, r=4.0);
	translate([0,0,-25]) cylinder(h = 80, r=4.3);
}


module x_axis_rods() {
	translate([-25, 0, 0]) rotate([90,0,0]) {
		cylinder(h = 120, r=4.5, $fn=20, center=true);
		if (tear_shape) translate([0, 2.60, 0]) cylinder(h = 120, r=3.65, $fn=6, center=true);
	}
	translate([25, 0, 0]) rotate([90,0,0]) {
		cylinder(h = 120, r=4.5, $fn=20, center=true);
		if (tear_shape) translate([0, 2.60, 0]) cylinder(h = 120, r=3.65, $fn=6, center=true);
	}
	if (!x_belt) translate([35, 0, 30]) rotate([90,0,0]) {
		cylinder(h = 120, r=4.5, $fn=20, center=true);
		if (tear_shape) translate([0, 2.60, 0]) cylinder(h = 120, r=3.65, $fn=6, center=true);
	}
}

// horizontal frame hole
module frame_hor_hole(threaded=false)
{
	cylinder(h=200, r=threaded_rod_diameter/2-(threaded?1:0), center=true);
}

module frame_vert_hole(threaded=false)
{
	cylinder(h=200, r=threaded_rod_diameter/2-(threaded?1:0), center=true);
}

//Holes for the threaded rods at either end of the y stage
module frame_horizontal_struts(center=false, threaded=false)
{
	offset = (center==true)?-hor_hole_seperation/2:0;

	translate([0, offset])
	{
		frame_hor_hole(threaded);
		translate([0, hor_hole_seperation]) frame_hor_hole(threaded);
	}
}

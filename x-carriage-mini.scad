// PRUSA Mendel  
// Mini X-carriage for Ultimaker Bowden Extruders
// Used for sliding on X axis
// GNU GPL v2
// Rob Gilson, Josef Průša

include <configuration.scad>
include <common.scad>

height = 17;
length = 20 + x_rod_spacing; // (+ belt clamp)

zip_tie_hole = [4,7, height];
zip_tie_spacing = 5;

belt_width = 5+2;
clamp_length = belt_width+zip_tie_hole[1];
width = zip_tie_spacing*3+zip_tie_hole[1]*2;

ptfe_slider_outer_diameter = 7/16 * 25.4+1;

difference()
{
	union()
	{
		cube([length,width,height], center = true);
		belt_clamps();
	}
	extruder_mount();
	ptfe_sliders();
}
%x_axis_rods();


module extruder_mount()
{
	union()
	{
		translate([0,0,height/2-4/2]) cylinder(r=(16+1)/2, h=4+1, center = true);
		cylinder(r=(14+0.5)/2, h=height, center = true);
	}
}

module belt_clamps()
{
	//belt clamps using zip ties to tie down the belt
	translate([length/2+ clamp_length/2,0]) difference()
	{
		cube([clamp_length,width,height], center=true);
		for (i=[-1,1]) translate([-clamp_length/2,i*(zip_tie_hole[1]+zip_tie_spacing)/2])
			cube(zip_tie_hole, center = true);
	}
}


//This should fit mcmaster part #2706T15
module ptfe_sliders()
{
	for (i=[-1,1]) translate([i*x_rod_spacing/2,0,0])
	{
		rotate([90]) cylinder(r=ptfe_slider_outer_diameter/2, h=width+1, center=true);
	}
}
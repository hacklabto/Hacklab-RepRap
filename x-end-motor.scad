// PRUSA Mendel  
// X-end with idler mount
// GNU GPL v2
// Rob Gilson, Christopher Olah
// http://reprap.org/wiki/Hacklab_RepRap
// https://github.com/hacklabto/Hacklab-RepRap

include <configuration.scad>
include <common.scad>
include <lib/mcad/nuts_and_bolts.scad>

thickness = 15;
length = 50;
width = 47.5;

bearing_inner_diameter = 7.5;

difference()
{
	union()
	{
		cube([width, length, thickness], center=true);
		//idler mount
		translate([width/2-2.5,width-4,-1])
			cube([5,47,45],center=true);
	}

	//holes for axis
	translate([0,-39,0]) x_axis_rods();
	for (x=[-1,1]) for(y=[-1,1]) translate([x*15,y*15,0]) ziptie_hole(thickness+1);
	translate([0,0,2]) z_nut_and_bushing_hole(thickness+1);
	#translate([width/2-11,width-1,-1]) rotate([0,-90,0]) motor();

}

module ziptie_hole(height)
{
	cube([5,10,height], center=true);
}

nut_and_bushing_seperation = 20;

module z_nut_and_bushing_hole(height=100)
{
	nut_radius = METRIC_NUT_AC_WIDTHS[8]/2+0.1;

	translate([0,-1.5*nut_radius-2]){
		cylinder(r=10, h=height, center=true);
		cylinder(r=4.3, h=1.5*height, center=true);
	}
	for (i=[1.4,1.5,1.6,1.75,1.9,2.0,2.1]) translate([0,i*nut_radius]){
		cylinder(r=4.3, h=1.5*height, center=true);
		linear_extrude(height = height, center = true)
			rotate(90) nutHole(size = 8, tolerance = +0.1, proj=1);
	}
	
}
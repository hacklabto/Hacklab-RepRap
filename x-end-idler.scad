// PRUSA Mendel  
// X-end with idler mount
// GNU GPL v2
// Josef Průša
// josefprusa@me.com
// prusadjs.cz
// http://www.reprap.org/wiki/Prusa_Mendel
// http://github.com/prusajr/PrusaMendel

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
		translate([width/2,0])
		{
			cube([20, 12.5, thickness], center=true);

			translate([20/2+10/2-1,0,-thickness/2+bearing_inner_diameter/2]) rotate([0,90])
				cylinder(r=bearing_inner_diameter/2,h=10, center=true);
		}
	}

	//holes for axis
	x_axis_rods();
	for (x=[-1,1]) for(y=[-1,1]) translate([x*15,y*15,0]) ziptie_hole(thickness+1);
	translate([0,0]) z_nut_and_bushing_hole(thickness+1);

}

module ziptie_hole(height)
{
	cube([5,10,height], center=true);
}

nut_and_bushing_seperation = 20;

module z_nut_and_bushing_hole(height=100)
{
	nut_radius = METRIC_NUT_AC_WIDTHS[8]/2+0.1;

	translate([0,-nut_radius])
		cylinder(r=10, h=height, center=true);
	for (i=[0,1,1.5]) translate([0,i*nut_radius])
		linear_extrude(height = height, center = true)
			rotate(90) nutHole(size = 8, tolerance = +0.1, proj=1);
	
}
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
		translate([-width/2,0])
		{
			cube([20, 12.5, thickness], center=true);

			translate([-(20/2+20/2-1),0,-thickness/2+bearing_inner_diameter/2]) rotate([0,90]){
				difference(){
					union(){
						cylinder(r=bearing_inner_diameter/2,h=20, center=true);
						translate([0,0,-10.5]) intersection(){
							cylinder(r1=bearing_inner_diameter/2-1,r2=bearing_inner_diameter/2+1.2,h=5, center=true);
							scale([1,1.5,1]) cylinder(r=bearing_inner_diameter/2,h=10, center=true);
					}
					}
					translate([0,0,-9.5]) cube([12,3.0,13],center=true);
				}
			}
		}
	}

	//holes for axis
	x_axis_rods();
	for (x=[-1,1]) for(y=[-1,1]) translate([x*15,y*15,0]) ziptie_hole(thickness+1);
	translate([0,0,2]) z_nut_and_bushing_hole(thickness+1);

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
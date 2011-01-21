// X-carriage for Bowden Extruders
// Used for sliding on X axis
// GNU GPL v2
// Henning Meyer, Rob Gilson, Josef Průša

include <configuration.scad>
include <common.scad>
include <lib/mcad/nuts_and_bolts.scad>

height = 17;
length = 20 + x_rod_spacing; // (+ belt clamp)

zip_tie_hole = [4,7, height];
zip_tie_spacing = 5;

extruder_mount_distance = 30;

pfte_insulator_diameter = 16;
pfte_insulator_dimple = 10;

belt_width = 5+2;
clamp_length = belt_width+zip_tie_hole[1];
width = zip_tie_spacing*3+zip_tie_hole[1]*2;

ptfe_slider_outer_diameter = 7/16 * 25.4+1;

box_length = bowden_tube_diameter + 4 * bowden_tube_screw_space;

difference() {
	carriage();
	translate([0,width/4,pfte_insulator_dimple-height/2+bowden_cover_length/2]) cube([box_length,width/2,bowden_cover_length], center = true);
}

translate([0,width/2+3,-pfte_insulator_dimple-bowden_mount_tolerance]) 
intersection() {
	carriage(); // bowden_mount_tolerance
	translate([0,width/4,pfte_insulator_dimple-height/2+bowden_cover_length/2+bowden_mount_tolerance/2]) cube([box_length-bowden_mount_tolerance*2,width/2,bowden_cover_length-bowden_mount_tolerance], center = true);
}

module carriage() {
difference()
{
	union()
	{
		cube([length,width,height], center = true);
		translate([0,0,pfte_insulator_dimple-height/2+bowden_cover_length/2]) cube([bowden_tube_diameter + 4 * bowden_tube_screw_space,width,bowden_cover_length], center = true);
		belt_clamps();
	}
	bowden_mount();
	extruder_mount();
	ptfe_sliders();
//	translate([0,width/2,0]) cube([bowden_tube_diameter + 4 * bowden_tube_screw_space,width,200], center = true);
	translate([0,0,pfte_insulator_dimple-height/2+bowden_cover_length/2]) cube([bowden_tube_diameter + 4 * bowden_tube_screw_space,bowden_squeeze_space,bowden_cover_length], center = true);
}
%x_axis_rods();
}

module extruder_mount()
{
	union() {
		translate([0,0,-height/2]) cylinder(r=pfte_insulator_diameter/2, h=pfte_insulator_dimple*2, center = true);	// PTFE Insulation Space
		translate([0,0,0]) cylinder(r=filament_diameter/2, h=height+40, center = true); // Filament space
		for(x=[-1,1])
			translate([x*extruder_mount_distance/2,0,0]) {
				translate([0,0,-100]) boltHole(size=4,length=200);
				rotate([0,0,30]) translate([0,0,height/2-3]) scale([1,1,100]) nutHole(size=4);
			}
	}
}



module bowden_mount()
{
	union()
	{
		translate([0,0,0]) cylinder(r=bowden_tube_diameter/2, h=(height+bowden_cover_length)*2, center = true); // Bowden tube space


		for(x=[-1,1]) {
			for(y=[-1,1]) {
				translate([x*(bowden_tube_diameter/2+bowden_tube_screw_space),0,pfte_insulator_dimple-height/2+y* bowden_tube_screw_space+((y-1)/-2)*bowden_cover_length]) rotate([90]) union() {
					translate([0,0,-100]) boltHole(size=4,length=200);
					rotate([0,0,30]) translate([0,0,width/2-3.1]) nutHole(size=4);
				}
			}
		}
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

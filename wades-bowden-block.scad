// Modified Wades Extruder Block
// it now accepts bowden cables
// GNU GPL v2 -- is this correct?
// Henning Meyer, Wade !!!

include <configuration.scad>
include <common.scad>
include <lib/mcad/nuts_and_bolts.scad>


width1 = 15;
width2 = 13;
width = width1 + width2;

boxlength = bowden_tube_diameter + 4 * bowden_tube_screw_space;

difference() {
	extruder_block();
	translate([0,0,width2/2]) cube([boxlength,bowden_cover_length,width2],center=true);
}


translate([0,-bowden_cover_length-3,-width1-bowden_squeeze_space/2]) 
intersection() {
	extruder_block();
	translate([0,0,width2/2]) cube([boxlength-bowden_mount_tolerance*2,bowden_cover_length-bowden_mount_tolerance,width2],center=true);
}


module extruder_block() {
	difference() {
		union() {
			translate([-75,bowden_cover_length/2-10,-width1]) import_stl("build/M8_Extruder_Block_3.stl", convexity = 5);
			translate([0,0,(width2-width1)/2]) cube([boxlength,bowden_cover_length,width],center=true);
		}
	translate([0,0,0]) rotate([90,0,0]) cylinder(r=2,h=100,center=true);
	translate([0,-bowden_cover_length/2,0]) rotate([90,180,0])	bowden_mount();
	cube([boxlength,bowden_cover_length,bowden_squeeze_space],center=true);
	}
}


module bowden_mount()
{
	union()
	{
		translate([0,0,0]) cylinder(r=bowden_tube_diameter/2, h=(bowden_cover_length)*2, center = true); // Bowden tube space


		for(x=[-1,1]) {
			for(y=[-1,1]) {
				translate([x*(bowden_tube_diameter/2+bowden_tube_screw_space),0,-y* bowden_tube_screw_space+((y-1)/2)*bowden_cover_length]) rotate([90]) union() {
					translate([0,0,-width1+3]) boltHole(size=4,length=width);
					rotate([0,0,30]) translate([0,0,width/2-3.01]) nutHole(size=4);
				}
			}
		}
	}
}


// PRUSA Mendel  
// X-end with NEMA 17 motor mount
// GNU GPL v2
// Josef Průša
// josefprusa@me.com
// prusadjs.cz
// http://www.reprap.org/wiki/Prusa_Mendel
// http://github.com/prusajr/PrusaMendel

include <configuration.scad>
include <common.scad>
include <lib/mcad/motors.scad>

wall_thickness = 3;
stepper_width = 43;
stepper_offset = 35;


difference() {
	union() {
		translate([-wall_thickness/2,0,0]) 
			cube([stepper_width+wall_thickness,stepper_width+wall_thickness*2,wall_thickness], center=true);
		translate([-(stepper_width/2+threaded_rod_diameter/2 + wall_thickness),0,-stepper_offset]) rotate([90,0,0]) cylinder(h = stepper_width + wall_thickness*2,  r = threaded_rod_diameter/2 + wall_thickness, center = true);
	translate([0,-(stepper_width+wall_thickness)/2,0]) beam(beamtype=1);
	translate([0,(stepper_width+wall_thickness)/2,0]) beam(beamtype=1);
	beam(beamtype=0);
	}
	linear_extrude(height=wall_thickness*2,center=true)
		stepper_motor_mount(nema_standard=17,mochup=true,tolerance=0.1);
	translate([-(stepper_width/2+threaded_rod_diameter/2 + wall_thickness),0,-stepper_offset]) rotate([90,0,0]) cylinder(h = stepper_width *2,  r = threaded_rod_diameter/2, center = true);
}

module beam(beamtype=0) {
		translate([-stepper_width/2,0,0]) rotate([-90,0,180]) linear_extrude(height=(beamtype*wall_thickness) + (1-beamtype)*(wall_thickness*2+stepper_width),center=true) {
                        polygon(
                                points=[
				 [beamtype*-stepper_width,beamtype*wall_thickness/2], [0,stepper_offset],
				[threaded_rod_diameter + wall_thickness*2,stepper_offset],
				[wall_thickness,0]
                                        ],

                                paths=[[0,1,2,3]]);

                }
}
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

wall_thickness = 4.5;

translate(v = [0,35,24.5]) {
	union() {
		difference() {
			union() {
				translate(v = [-25, -40, -16.6])
					cube(size = [20,40,15.8], center = true);
				translate(v = [25, -40, -16.6])
					cube(size = [20,40,15.8], center = true);
			}

			//nut traps
			translate(v = [-25, -29, -19.7])
				cylinder(h = 7, r=m3_nut_diameter/2, $fn=6, center=true);
			translate(v = [-25, -29, -20])
				cylinder(h = 10, r=m3_diameter/2, $fn=9, center=true);
			translate(v = [25, -29, -19.7])
				cylinder(h = 7, r=m3_nut_diameter/2, $fn=6, center=true);
			translate(v = [25, -29, -20])
				cylinder(h = 10, r=m3_diameter/2, $fn=9, center=true);

			translate(v = [-25, -50, -19.7])
				cylinder(h = 7, r=m3_nut_diameter/2, $fn=6, center=true);
			translate(v = [-25, -50, -20])
				cylinder(h = 10, r=m3_diameter/2, $fn=9, center=true);
			translate(v = [25, -50, -19.7])
				cylinder(h = 7, r=m3_nut_diameter/2, $fn=6, center=true);
			translate(v = [25, -50, -20])
				cylinder(h = 10, r=m3_diameter/2, $fn=9, center=true);

			//holes for axis
			translate ([0,-75,-17]) rotate ([0,0,180]) x_axis_rods();

		}

		//slider
		translate(v = [0, -25, 15])
			difference() {
				union() {
					translate(v = [0, -1.75-wall_thickness/2, -19.5])
						cube(size = [17+wall_thickness*2,13.5+wall_thickness,40], center = true);
					translate(v = [0, -3.5, -31.65])
						cube(size = [35,17,15.8], center = true);
				}
				translate(v = [0, -0, -17])
					cube(size = [17,17,60], center = true);
			}

		//nut trap
		translate(v = [0, -55, 15]) {
			difference() {
				union() {
					translate(v = [0, -0, -19.5])
						cylinder(h = 40, r=(m8_nut_diameter/2+wall_thickness), $fn=6, center=true);
					translate(v = [0, 0, -31.65])
						cube(size = [35,10,15.8], center = true);
				}
				translate(v = [0, 0, 16])
					cylinder(h = 90, r=m8_nut_diameter/2, $fn=6, center=true);
				translate(v = [0, 0, -78])
					cylinder(h = 90, r=m8_nut_diameter/2, $fn=6, center=true);
				translate(v = [0, 0, 0])
					cylinder(h = 100, r=m8_diameter/2, $fn=9, center=true);
			}
		}

		//idler wheel connector
		if (x_belt) {
			mirror() {
				translate(v = [0, -35, -12]) {
					difference() {
						translate(v = [35-wall_thickness/2, -5, 6])
							cube(size = [wall_thickness,10,10], center = true);
						translate(v = [32.5, -6, 6.5])
							rotate(a=[0,90,0])
								cylinder(h = 90, r=m4_diameter/2, $fn=9, center=true);
					}
				}
			}
		}else {
			translate([-65,0,-12]) {
				difference(){
					union(){
						translate([34, -29, 20]) cube([39,13,41], center = true);
						translate([23, -29, -2.5]) cube([17,13,20], center = true);
					}
					translate([30,-24,25]) rotate([90,0,0]) cylinder(h = 20, r=12);
					translate([30,-15,25]) rotate([90,0,0]) cylinder(h = 10, r=8);
				}
			}
		}
	}
}

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

wall_thickness = 4.5;

translate(v = [0,17,24.5]) {
	union() {
		difference(){
			union(){
				translate(v = [-25, -40, -16.6])
					cube(size = [20,40,15.8], center = true);
				translate(v = [25, -40, -16.6])
					cube(size = [20,40,15.8], center = true);
			}

			//nut traps
			translate(v = [-25, -29, -19.7]) cylinder(h = 7, r=m3_nut_diameter/2, $fn=6, center=true);
			translate(v = [-25, -29, -20]) cylinder(h = 10, r=m3_diameter/2, $fn=9, center=true);
			translate(v = [25, -29, -19.7]) cylinder(h = 7, r=m3_nut_diameter/2, $fn=6, center=true);
			translate(v = [25, -29, -20]) cylinder(h = 10, r=m3_diameter/2, $fn=9, center=true);

			translate(v = [-25, -50, -19.7]) cylinder(h = 7, r=m3_nut_diameter/2, $fn=6, center=true);
			translate(v = [-25, -50, -20]) cylinder(h = 10, r=m3_diameter/2, $fn=9, center=true);
			translate(v = [25, -50, -19.7]) cylinder(h = 7, r=m3_nut_diameter/2, $fn=6, center=true);
			translate(v = [25, -50, -20]) cylinder(h = 10, r=m3_diameter/2, $fn=9, center=true);

			//holes for axis
			translate(v = [0, -79, -16.7])  x_axis_rods();
		}

		//slider
		translate(v = [0, -25, 15]) {
			difference(){
				union(){
					translate(v = [0, -1.75-wall_thickness/2, -7])
						cube(size = [17+wall_thickness*2,13.5+wall_thickness,65], center = true);
					translate(v = [0, -3.5, -31.65]) cube(size = [35,17,15.8], center = true);
				}
				translate(v = [0, -0, -7])cube(size = [17,17,70], center = true);
			}
		}

		//nut trap
		translate(v = [0, -55, 15]) {
			difference() {
				union() {
					translate(v = [0, -0, -19.5])
						cylinder(h = 40, r=m8_nut_diameter/2+wall_thickness, $fn=6, center=true);
					translate(v = [0, 0, -31.65])
						cube(size = [35,10,15.8], center = true);
				}
				translate(v = [0, 0, 16-20])
					cylinder(h = 50, r=m8_nut_diameter/2, $fn=6, center=true);
				translate(v = [0, 0, -43])
					cylinder(h = 20, r=m8_nut_diameter/2, $fn=6, center=true);
				translate(v = [0, 0, -20])
					rotate([0,0,90]) vertical_rods();
			}
		}

		//nema17 connector
		if (x_belt){// use belt or threaded rod?
			translate(v = [0, 0, -12]) {
				difference(){
					union(){
						translate(v = [22, -20 - wall_thickness/2, 32-wall_thickness/2]) cube(size = [26,wall_thickness,wall_thickness+1], center = true);
						translate(v = [35 -wall_thickness/2, 9.5-wall_thickness/2, 10]) cube(size = [wall_thickness,59+wall_thickness,45], center = true);
					}
					translate([25, 10, 5]) rotate([45,0,0]) rotate([0,-90,0]) rotate([0,0,90]) motor();
				}
			}
		}else {
			translate(v = [0, 0, -12]) {
				difference(){
					union(){
						translate(v = [35, -34.5, 25]) cube(size = [46,5,51], center = true);
						translate(v = [46, -34.5, -6.5]) cube(size = [24,5,12], center = true);
					}	
					translate([35,-25,25]) rotate([-90,90,0]) motor();
				}
			}
		}
	}
}
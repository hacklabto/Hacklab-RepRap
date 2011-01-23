include <configuration.scad>
include <common.scad>

module motor() {
	//This is (essentially) what ever was being used in z-motor-mount orriginaly. 
	// Should be rewriten for NEMA compliance, to match the NEMA_version var.
	// Motor sits in this
	cube(size = [43,43,10], center = true);
	// And goes through this
	translate([0,0,-8]) cylinder(h = 10, r=12);
	translate([0,0,-25]) cylinder(h = 30, r=5);
	translate([0,0,-25]) cylinder(h = 10, r=14.5);
	//And the screws go through here
	for (y=[-1,1],x=[-1,1]) translate([15*x,15*y,-5]){
		cylinder(r=1.7,h=10,center=true);
		translate([0,0,-8.2])cylinder(r=2.6,h=12,center=true);
	}
}

module diagonal_rod(grip = true) {
	 for (y=[-1,1]) translate([0,28*y,0]) rotate([(90-vert_angle)*y,0,0]) translate([0,0,-50]) cylinder (h=100,r=4.2);
}

module diagonal_rod_cyl (r=8,slide = 0, h=10) {
	for (y=[-1,1]) translate([0,28*y,0]) rotate([(90-vert_angle)*y,0,0]) translate([0,0,slide]) cylinder(r=r,h=h,center=true);
}


vert_angle=60;

difference() {
	union(){
		for (y=[-1,1]) translate ([0,17.5*y,-6.2]) rotate([0,90,0]) {
			   cylinder(h =43, r=7,center=true);
			   translate([-5,0,0]) cube([5,11,43],center=true);

		}
		translate([-15.5,0,0]) cube([12,40,3],center=true);
		translate([-18.6,0,-10]) cylinder(r=7,h=10);
		translate ([-17.5,0,0])  diagonal_rod_cyl(slide=-5.5);
		translate ([-17.5,0,0]) for (y=[-1,1]) translate([0,24*y,-8]) cube([9,3,8],center=true);
	}
	translate([0,0,6]) motor();
	for (y=[-1,1])  translate ([0,17.5*y,-6.2]) rotate([0,90,0]) cylinder(h =60, r=4.7,center=true);
	translate([-18.6,0,-21]) cylinder(r=4.5,h=20);
	translate ([-17.5,0,0]) diagonal_rod();
	translate([0,0,3.5]) cube([100,100,5],center=true);
	translate ([-17.5,0,0])  diagonal_rod_cyl(slide=0,h=5);
}
include <configuration.scad>
include <common.scad>


//Slow code is slow!


module roundedBox(size, radius, center=false, sidesonly=false)
{
  //By Marius Kintel, BSD licensed; some minor mods by colah
  rot = [ [0,0,0], [90,0,90], [90,90,0] ];
  if (sidesonly) {
    cube(size - [2*radius,0,0], true);
    cube(size - [0,2*radius,0], true);
    for (x = [radius-size[0]/2, -radius+size[0]/2],
           y = [radius-size[1]/2, -radius+size[1]/2]) {
      translate([x,y,0]) cylinder(r=radius, h=size[2], center=true);
    }
  }
  else {
    cube([size[0], size[1]-radius*2, size[2]-radius*2], center=true);
    cube([size[0]-radius*2, size[1], size[2]-radius*2], center=true);
    cube([size[0]-radius*2, size[1]-radius*2, size[2]], center=true);

    for (axis = [0:2]) {
      for (x = [radius-size[axis]/2, -radius+size[axis]/2],
             y = [radius-size[(axis+1)%3]/2, -radius+size[(axis+1)%3]/2]) {
        rotate(rot[axis])
          translate([x,y,0])
          cylinder(h=size[(axis+2)%3]-2*radius, r=radius, center=true);
      }
    }
    for (x = [radius-size[0]/2, -radius+size[0]/2],
           y = [radius-size[1]/2, -radius+size[1]/2],
           z = [radius-size[2]/2, -radius+size[2]/2]) {
      translate([x,y,z]) sphere(radius);
    }
  }
}

module torus(r1,r2,strech=[1,1,1]){
	//By Christopher Olah, based on example from wikibooks. BSD.
	rotate_extrude()
	translate([r1, 0, 0])
	scale(strech)
	circle(r2);
}
module roundedCylinder(h,r,r2){
	//By Christopher Olah. BSD.
	cylinder(r=r-r2,h=h);
	translate([0,0,r2]){
		cylinder(r=r,h=h-r2*2);
		for (z=[0,2]) translate([0,0,z*(h/2-r2)])
			rotate_extrude() translate([r-r2,0,0]) circle(r2);
	}
}


module diagonal_rod(grip = true) {
	if (grip) for (y=[-1,1]) translate([0,15*y,0]) rotate([(90-vert_angle)*y,0,0]) translate([0,0,-50]) cylinder (h=100,r=4.0);
	if (!grip) for (y=[-1,1]) translate([0,15*y,0]) rotate([(90-vert_angle)*y,0,0]) translate([0,0,-50]) cylinder (h=100,r=4.2);
}

module diagonal_rod_cube (slide = 0, size = [16,16,10]) {
	for (y=[-1,1]) translate([0,15*y,0]) rotate([(90-vert_angle)*y,0,0]) translate([0,0,slide]) cube(size=size,center=true);
}

module diagonal_rod_round_cube (slide = 0, size = [16,16,10]) {
	for (y=[-1,1]) translate([0,15*y,0]) rotate([(90-vert_angle)*y,0,0]) translate([0,0,slide]) roundedBox(size=size,radius=2,center=true);
}

vert_angle=60;

difference(){
	union(){
		translate([-20,0,0]) roundedBox(size = [40,64,16], radius=2, center = true);
		translate([-20,0,-3]) roundedBox(size = [40,76,10], radius=2, center = true);
		translate([-9,0,-4.5]) roundedBox(size = [62,43,7], radius=2, center = true);
		for (y=[-1,1])  translate ([-40,30*y,0]) rotate([0,90,0]) roundedCylinder(h =40, r=8, r2=2);
		//translate ([26.5,0,-8]) roundedCylinder(h=16,r=8,r2=2);
		translate ([-32,0,0]) diagonal_rod_round_cube(slide=7);
	}
	// Motor sits in this
	translate([-2.1,0,3.1]) motor();
	//The vertical rod goes through here
	translate([-2,0,0]) rotate([0,0,-180]) translate ([0,0,-50]) vertical_rods();

	//Diagonal rod and nut space
	translate ([-32,0,0]) diagonal_rod();
	for (y=[-1,1]) translate([-50,30*y,0]) rotate([0,90,0]) cylinder(h = 100, r=4.5);

}
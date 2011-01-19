include <configuration.scad>
include <common.scad>
include <lib/mcad/motors.scad>

motor_mount_depth = 6;
length =57.5;
height = 42.5;

difference()
{
	//Motor mount body
	translate([21.5,0,0]) union()
	{
		rounded_cube([length,height,motor_mount_depth], rounding=10, center = true);
//		translate([-length/2+8,height/2-4]) cylinder(r=8, h=motor_mount_depth, center = true);
	}

	// Horizontal holes
//	translate([0,threaded_rod_diameter /2])
	frame_horizontal_struts(center=true, threaded=false);
	
	// Motor mounts
	translate([27.5,0,0])
		linear_extrude(height=motor_mount_depth+1, center=true)
			stepper_motor_mount(17, mochup=false, tolerance = 0.5);
}
translate([27.5,0,0])
	stepper_motor_mount(17, mochup=true);


corner_pos = [[-1,-1], [1,-1], [1,1], [-1,1]];

module round(radius, corner)
{
	intersection()
	{
		difference()
		{
			square([radius*2, radius*2], center=true);
			circle(r=radius, center=true);
		}

		for(i=[0:3]) if (corner==i)
		{
			translate(corner_pos[i]*radius/2)
				square([radius,radius], center=true);
		}
	}
}

module rounded_cube(dimensions, rounding, center=false)
{
	offsets = dimensions-[rounding*2,rounding*2];
	difference()
	{
		cube(dimensions, center = true);

		//Rounded corners
		linear_extrude(height=motor_mount_depth+1, center=true)
			for(i=[0:3])
				translate([ 
					offsets[0]/2*corner_pos[i][0],
					 offsets[1]/2*corner_pos[i][1] ])
						round(rounding,i);
	}
}
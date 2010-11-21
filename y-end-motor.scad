include <lib/mcad/motors.scad>

mount_thickness = 15;
//angle of the frame attaching arm
arm_angle = 25;
arm_thickness = 10;
arm_length = 30;

union()
{
	//Frame Attachment
	for (arm = [-1,1])
		translate([0,arm*(20+2),-1])
			rotate([(arm - 1)*180 + arm_angle])
				translate([0, arm*arm_length/2, 0]) difference()
	{
		union()
		{
			cube([40,arm_length,arm_thickness], center=true);
			translate([0,arm*arm_length/2,0]) rotate([0,90,0])
				cylinder(h=40, r=10, center=true);
		}
		translate([0,arm*arm_length/2,0]) rotate([0,90,0])
			cylinder(h=40+1, r=5, center=true);
	}
	
	// Motor Mount
	stepper_motor_mount(17,mochup=true);
	difference() 
	{
		cube([40,50,mount_thickness], center = true);
		linear_extrude(height = mount_thickness+1, center = true) 
			stepper_motor_mount(17,mochup=true);
	}
}
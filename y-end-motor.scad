include <lib/mcad/motors.scad>
include <lib/mcad/servos.scad>
include <configuration.scad>

use_servos = false;

mount_thickness = 15;
frame_attachement_thickness = 3;

frame_attachement_radius = frame_attachement_thickness+m8_diameter;
mount_width = 40;
mount_length = 40+frame_attachement_radius;


difference()
{
	union()
	{
		// Frame Attachement
		frame_attachement_cylinder(frame_attachement_radius);

		// Motor Mount Block and Mochup
		cube([mount_width,mount_length,mount_thickness], center = true);
		if (!use_servos)
			translate([0,-frame_attachement_radius/2,-mount_thickness/2])
				stepper_motor_mount(17,mochup=true);
	}
	frame_attachement_cylinder(m8_diameter,10);
	translate([0,-frame_attachement_radius/2,0])
		y_motor_mount();
}

module frame_attachement_cylinder(radius, extra_cut_length=0)
{
	//Frame Attachment
	translate([0,mount_length/2,frame_attachement_radius-mount_thickness/2])
		rotate([0,90,0]) difference()
	{
		cylinder(h=mount_width+extra_cut_length, r=radius, center=true);
	}
}

module y_motor_mount()
{
	if (use_servos)
	{
		alignds420([0,0,9], [0,180,0], screws = 1000, axle_lenght = 0);
	}
	else
	{ // (use steppers)
		linear_extrude(height = mount_thickness
			+frame_attachement_radius*2,  center = true)
		{
			stepper_motor_mount(17,mochup=false);
		}
	}
}
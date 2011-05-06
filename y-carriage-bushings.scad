include <configuration.scad>

//Makerbot platform interface variables

makerbot_slot_size = 5;
makerbot_slot_tolerance = 1;
makerbot_slot = [makerbot_slot_size+makerbot_slot_tolerance,
		makerbot_slot_size+makerbot_slot_tolerance, makerbot_slot_size+makerbot_slot_tolerance];

// The distance between the inside edge of each of the slots + the slot length
makerbot_slot_seperation = 14 + makerbot_slot_size;

//The small smooth rod connecting the 2 y-carriage-bushing peices and the belt under the build platform
connecting_rod_diameter = 5;

// Bushing variables

bushing_outer_diameter = 8.07;
bushing_mount_thickness = 4;
bushing_length = 0.5 * 25.4;

// Carriage

carriage_size = [25, makerbot_slot[1]+makerbot_slot_seperation, 10];

difference()
{
	union()
	{
		cube(carriage_size, center=true);


		translate([carriage_size[0]/2+bushing_outer_diameter/2,0,-carriage_size[2]/2+bushing_outer_diameter/2+bushing_mount_thickness])
		{
			bushing_shell();

			//Exterior shell to hold the PTFE bushing
			translate([0, 0, -(bushing_outer_diameter/2+bushing_mount_thickness)/2])
				cube([bushing_outer_diameter+bushing_mount_thickness*2, bushing_length, bushing_outer_diameter/2+bushing_mount_thickness], center = true);
		}

	}


		// Hole for the PTFE bushing
		translate([carriage_size[0]/2+bushing_outer_diameter/2,0,-carriage_size[2]/2+bushing_outer_diameter/2+bushing_mount_thickness])
			bushing_hole();

		// Makerbot build platform mount holes
		union()
		{
			translate([carriage_size[0]/2-5,0,carriage_size[2]/2])
				makerbot_platform_interface();
			for(i=[-1,1]) translate([carriage_size[0]/2 - 2.5, i*(carriage_size[1] - (carriage_size[1] - bushing_length)/2)/2,0])
				cube([6,(carriage_size[1]-bushing_length)/2,10], center = true);
		}

		//Holes for the connecting rods that hold the 2 y-carriage-bushin pieces together	
		for(i=[-1,1]) translate([-carriage_size[0]/2+5-1, 6*i,0]) rotate([0,90,0]) cylinder(r=connecting_rod_diameter/2,h=10+1,center=true);
}

module bushing_shell()
{
	rotate([90,0])
	{
		cylinder(r=bushing_outer_diameter/2+bushing_mount_thickness, h=bushing_length, center=true);
	}
}

module bushing_hole()
{
	rotate([90,0])
	{
		cylinder(r=bushing_outer_diameter/2, h=bushing_length+1, center=true);
	}
}




module makerbot_platform_interface()
{
	union()
	{
		for (i = [-1,1]) translate([-makerbot_slot[2]/2,makerbot_slot_seperation/2*i, -makerbot_slot[2]/2])
			cube(makerbot_slot, center=true);
	}
}
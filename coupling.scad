// Released under GPL 2.0 and later.
// Copyright Rob Gilson 2010

// This is a printable threaded rod / motor shaft coupling.
// You use zip ties through the holes of 2 of these to secure the rod/shaft.


threaded_rod = 8; //mm (diameter)
motor_shaft = 5; //mm (diameter)
coupling_length = 33;//mm
coupling_radius = 10;//mm
coupling_skewing=0.7;
//The coupling length per clamp including spacing and seperators
clamp_seperator_spacing = 12;

$fs = 0.01;


difference()
{
	coupling_exterior();
	// motor shaft holder
	translate([0,coupling_length/4, 0]) rotate([90,90,0])
		cylinder (h = coupling_length/2+0.1+clamp_seperator_spacing,  r=motor_shaft/2, center=true, $fn=6);
	//threaded rod holder
	translate([0,-coupling_length/4-clamp_seperator_spacing/2, 0]) rotate([90,90,0])
		cylinder (h = coupling_length/2+0.1,  r=threaded_rod/2, center=true, $fn=6);

	//removing the bottom so there is some room to flex and tighten the coupling
	translate([0,0,-coupling_radius/2]) cube([100,100,coupling_radius+motor_shaft*0.35], center=true);
}

//Uses the coupling_2d_outline to generate a shell for the coupling
module coupling_exterior() intersection()
{
	translate([0,0, coupling_radius]) linear_extrude(height = 100, center = true)
		coupling_2d_outline();
	union()
	{
		//exterior cyliderical shape
		rotate([90,0,0]) scale([1,coupling_skewing,1])
			cylinder(h = 100, r =coupling_radius, center = true);
		//square extrusion for zip tie hole thickness
		cube([coupling_radius*2,coupling_length,12], center = true);
	}
}

//Generates the zip tie holes and main block in 2d for extruding
module coupling_2d_outline() difference()
{
	//Main block outline
	square(size= [100, coupling_length], center = true);

	// Zip tie holes + clamp seperators
	for (i = [-1, 1]) for (j = [0, 1])
		for (pos = [
			[i*( (coupling_radius - threaded_rod/2)/2 + threaded_rod/2 ),  -clamp_seperator_spacing, 0],
			[i*( (coupling_radius - motor_shaft/2)/2 + motor_shaft/2),  j*clamp_seperator_spacing, 0],
		]) translate(pos)
		{
			//Zip tie hole
			square(size= [3, clamp_seperator_spacing/2], center = true);
			//Clamp seperator
			translate([0,clamp_seperator_spacing/2-0.5,0])
				square(size= [(coupling_radius-motor_shaft/2)*1.2, 1], center = true);
		}
}
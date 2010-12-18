carriage_size = [157.5, 70];
y_bar_spacing = 136;

pla_slider_size = [15.5, 11+2];
pla_spacing = 20;

difference()
{
	square(carriage_size, center=true);
	union()
	{
		// PLA Slider holes
		for (i = [-1,1])
			for (j = [-1,1])
				translate([y_bar_spacing*i/2,pla_spacing*j])
					square(pla_slider_size, center=true);

		// Makerbot build platform mount holes
		makerbot_platform_interface();
	}
}


//Makerbot platform interface variables

makerbot_pf_hole_radius = (45.6 - 34.7)/4;
makerbot_pf_hole_y_offset = (34.7-makerbot_pf_hole_radius)/2;

makerbot_pf_hole_x_offset = (10.4 + makerbot_pf_hole_radius)/2;

makerbot_abp_screw_cap_radius = 5.5/2;
makerbot_abp_screw_x_offset = (85.5+96.4)/4;
makerbot_abp_screw_y_offset = (39.35+28.55)/4;

module makerbot_platform_interface()
{
	union()
	{
		//interface screw holes
		circle(r=makerbot_pf_hole_radius, center=true);
		for (i = [-1,1])
			translate([makerbot_pf_hole_x_offset ,
			i*makerbot_pf_hole_y_offset ])
				circle(r=makerbot_pf_hole_radius , center=true);

		//TODO: interface magnets

		//ABP screw cap holes
		for (i = [-1,1]) for (j=[-1,1])
			translate([i*makerbot_abp_screw_x_offset,
			j*makerbot_abp_screw_y_offset])
				circle(r=makerbot_abp_screw_cap_radius , center=true);
	}
}
difference(){
	union(){
		cylinder(r=27/2,h=10);
		cylinder(r1=31/2,r2=26/2,h=3.5);
		translate([0,0,8.5])
			cylinder(r2=31/2,r1=26/2,h=3.5);

	}
	union(){
		translate([0,0,4])cylinder(r=24.3/2,h=8);
		cylinder(r=20/2,h=17);
	}
}
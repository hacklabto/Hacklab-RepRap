
left = true;

difference(){
	union(){
		translate ([6+3,0,3]) cube([6,44,6], center=true);
		translate ([0+3,0,3]) cube([6,13.5,6], center=true);
		for (y=[-1,1]) translate ([0+3,(5+12)*y,3])
			cube([6,10,6], center=true);
		for (y=[-1,1]) for (x=[0,1]) difference(){
			union(){
				translate([6,9.5*y,10])
					cube([6,11,8], center=true);
				if (left){
					translate([6+1.5+x*(16+3),16.5*y,7])
						cube([3,11,14], center=true);
					translate ([6+8+6,16.5*y,3]) 
						cube([16,11,6], center=true);
				}
			}
			translate([2.9,9.5*y,9.5])
				rotate([0,90,0]) cylinder(r=2.4,5,$fn=16);
		}
		if (!left) for(x=[0,1]){
				translate([6+1.5+x*(16+3),0,7])
					cube([3,11,14], center=true);
				translate ([6+8+6,0,3]) 
					cube([16,11,6], center=true);	
		}
	}
	for (y=[-1,1]) translate ([0+3,(5+12)*y,3])
		cylinder(r=2,h=10,center=true,$fn=12);
	for (y=[-1,1]) translate ([0+3,(5+12)*y,12])
		cylinder(r=3.1,h=14,center=true,$fn=12);
}

x_rod_spacing = 50;
difference(){

union(){
translate([0,0,1])
	cube([x_rod_spacing+22, 35,5],center=true);
for (x=[-1,1]) for (y=[-1,1])
	translate([x_rod_spacing/2*x,12*y,0]) grip();
translate([(x_rod_spacing+22)/2,0,1]) difference(){
	cube([18,11,5],center=true);	
	cube([14,6,6],center=true);
}
}

for (x=[-1,1]) union(){
	translate([50/2*x,0,0]) cylinder(r=5/2,h=20,center=true);
	translate([50/2*x,0,2]) cylinder(r=8.3/2,h=3,center=true,$fn=6);
}

cube([27,20,10],center=true);


}

module grip(){
	render() {
		translate([0,0,1]) 
			cube([20,11,2],center=true);
		for (x=[-1,1]) translate([10*x,0,5]) {
			cube([2,11,10], center=true);
		}
	}	
}
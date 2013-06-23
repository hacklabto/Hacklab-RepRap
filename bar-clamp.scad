// Rewritten for better scalability
//Pablo2m
//Based on
// PRUSA Mendel  
// Bar clamp
// Used for joining 8mm rods
// GNU GPL v2
// Josef Průša
// josefprusa@me.com
// prusadjs.cz
// http://www.reprap.org/wiki/Prusa_Mendel
// http://github.com/prusajr/PrusaMendel

include <configuration.scad>

height= m8_diameter*2; diameter=  m8_diameter; radius= diameter/2; 
wide=m8_diameter+6.6; dist_bars= 10;

difference(){
	 union(){		
		cylinder(h =height, r = wide/2, center=true);
		translate([wide/2, 0, 0])cube([dist_bars+radius+3,wide,height],center= true);
	           }

	translate([10, 0, 0])cube([18,05,height*1.2],center=true);
	translate([dist_bars, 0, 0]) rotate([90, 0, 0]) #cylinder(h =height*1.2, r = radius, center=true);
	#cylinder(h =height*1.2, r = radius, center= true);
}
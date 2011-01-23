//Concept Bar clamp for z axis  by Pablo2m (not tested yet )
//Based on work of  Josef Průša

include <configuration.scad> 

dist_between_bars=20;  // adaptative
outer_diameter = m8_diameter/2+3.3;

if (dist_between_bars>=20) {


difference(){

	union(){
       translate([outer_diameter, 0, 0])cube([dist_between_bars+5,outer_diameter*2,outer_diameter*2]); 
       translate([outer_diameter, outer_diameter, 0]) cylinder(h = outer_diameter*2, r=outer_diameter);
       translate([dist_between_bars+10, -outer_diameter/2, 0])cube([nut_thickness*3,outer_diameter*3,outer_diameter*2]); 
	}

translate([9 , outer_diameter/2+1, -2])cube([dist_between_bars,6,20]);
translate([outer_diameter, outer_diameter, -2]) cylinder(h =20, r = m8_diameter/2, $fn = 18);
translate([dist_between_bars, 17, outer_diameter]) rotate([90, 0, 0]) cylinder(h =20, r = m8_diameter/2, $fn = 10);
translate([dist_between_bars+14, 8, outer_diameter]) rotate([0,90, 0]) cylinder(h =30, r = m8_diameter/2, $fn = 18);  
translate([dist_between_bars+nut_thickness+9, 1, -1])cube([nut_thickness,nut_diameter,outer_diameter*3]);
translate([dist_between_bars+12.9,-8.3,-outer_diameter/2]) rotate(45,0,0)cube(size = [outer_diameter/2,outer_diameter,outer_diameter*3]);
translate([dist_between_bars+7.1 ,18.2,-outer_diameter/2]) rotate(-45,0,0)cube(size = [outer_diameter/2,outer_diameter,outer_diameter*3]);
}

 }

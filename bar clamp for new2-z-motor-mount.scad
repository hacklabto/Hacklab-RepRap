//Concept Bar clamp for z axis by Pablo2m (not tested yet ) 
//Based on work of Josef Průša

include <configuration.scad> 
include <nuts_and_bolts.scad>

dist_between_bars=15; dist_until_nut =nut_diameter*0.5; height=  nut_diameter ; wide= m8_diameter; wall= 0.1 ; 

if (dist_between_bars>=nut_diameter) {

difference(){

union(){
translate([(dist_between_bars+dist_until_nut)/2, 0, 0])cube([dist_between_bars+dist_until_nut ,wide*(1+4*wall),height],center= true); 
cylinder(h = height, r=wide*7*wall,center= true);
translate([dist_between_bars+dist_until_nut+5,0, 0]) nut_clamp ();
}

translate([(dist_between_bars+dist_until_nut+1)/2, 0, 0])cube([dist_between_bars+dist_until_nut,7,height*2],center= true);
cylinder(h =height*2, r = m8_diameter/2, center= true);
translate([dist_between_bars, 0,0]) rotate([90, 0, 0]) cylinder(h = height*2, r = m8_diameter/2, center = true);
}
}


module nut_clamp ( ){

difference(){
intersection() {

cube([ nut_thickness*1.6,wide*(1+4*wall),height],center= true); 


}
translate([-2, 0, 4]) cube ([nut_thickness+2,7,nut_diameter+20],center= true);
rotate([0,90, 0]) cylinder(h =30, r =m8_diameter/2);
translate([5, 0 , height/4])cube([6,3,height*2],center=true); 
translate([-(nut_thickness/2+1), 0 , 0])rotate([0,90, 0])rotate([0,0, 30])#nutHole(8, units=MM, tolerance = +0.2, proj = -1 );
}
}
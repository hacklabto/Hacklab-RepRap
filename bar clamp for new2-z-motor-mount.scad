//Concept Bar clamp for z axis by Pablo2m (not tested yet ) 
//Based on work of Josef Průša

include <configuration.scad> 

dist_between_bars=15; dist_until_nut =nut_diameter/2; height=  m8_diameter*2; wide= m8_diameter; wall= 0.1 ; 

if (dist_between_bars>=nut_diameter) {

difference(){

union(){
translate([(dist_between_bars+dist_until_nut)/2, 0, 0])cube([dist_between_bars+dist_until_nut ,wide*(1+2*wall),height],center= true); 
cylinder(h = height, r=wide*8*wall,center= true);
translate([dist_between_bars+dist_until_nut+5,0, 0]) nut_clamp ();
}

translate([(dist_between_bars+dist_until_nut+1)/2, 0, 0])cube([dist_between_bars+dist_until_nut,6,height*2],center= true);
cylinder(h =height*2, r = m8_diameter/2, center= true);
translate([dist_between_bars, 0,0]) rotate([90, 0, 0]) cylinder(h = height*2, r = m8_diameter/2, center = true);
}
}


module nut_clamp ( ){

difference(){
intersection() {
cylinder(h = height, r=nut_diameter*0.75, center = true);
cube([nut_thickness*1.8, nut_diameter*1.5,height], center = true);

}
translate([0, 0, 4]) cube ([nut_thickness,nut_diameter,nut_diameter+20],center= true);
rotate([0,90, 0]) cylinder(h =30, r =m8_diameter/2);
translate([5, 0 , height/4])cube([6,wide,wide+1],center=true); 
translate([-5, 0 , 0])cube([6,6,height*2],center= true);
}
}
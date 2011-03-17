// Frame vertex
// GNU GPL v2
// Rob Gilson, Chris Olah, Josef Průša, Vik, Tonokps

include <configuration.scad>
include <common.scad>

//Vertex Options
//==================

vertex_height=threaded_rod_diameter+threaded_rod_vertical_clearance*2;
FN=32;


//Polygon verticies
//==================
mid_l = 32;
mid_w = 20;

bot_l = 10;
bot_w = 10;

top_l = nut_thickness+5;
top_w=nut_diameter+8;

translate ([0,0,vertex_height/2])difference() 
{
	linear_extrude(height=vertex_height, center=true) {
		/* 7----------  6
		    |     ==      |
                        |                5
		    8           4
                        |      @   |		    
		    |             |
		    |             |
		    0     @  3
		      \ 1 _ 2 /	     */
		polygon(
			points=[
				//At the bottom of the vertex, a half hexagon.
				[-mid_w/2, 0],
				[-bot_w/2,-bot_l],
				[bot_w/2,-bot_l],
				[mid_w/2,0],
				[mid_w/2,mid_l*(7+2*cos(vert_angle))/8],
				[-mid_w/2,mid_l] + top_w*[sin(vert_angle), cos(vert_angle)],
				[-mid_w/2,mid_l] + top_w*[sin(vert_angle), cos(vert_angle)] 
				                              + top_l*[-cos(vert_angle), sin(vert_angle)],
				[-mid_w/2, mid_l] +top_l*[-cos(vert_angle), sin(vert_angle)],
				[-mid_w/2, mid_l]
				],
			paths=[[0,1,2,3,4,5,6,7,8]]);
	}

	
	// Horizontal holes
	frame_horizontal_struts();

	// Frame triangle horizontal hole
	translate([0,hor_hole_seperation/2]) xteardrop(threaded_rod_diameter, 200);

	// Frame triangle angled hole

	translate([-mid_w/2,mid_l]
			 + top_w/2*[sin(vert_angle), cos(vert_angle)]
			 + top_l*[-cos(vert_angle), sin(vert_angle)])  
		rotate(180-vert_angle) union(){
			translate([50-top_l*(1+cos(vert_angle)/4)-2,0,0]) 
				xteardrop(threaded_rod_diameter,100);
			translate([-top_l*3/4+2,0,0]) 
				cube([nut_thickness,nut_diameter,vertex_height+1],center=true);
		}
}


module zhole(diameter) cylinder(h=100,r=(diameter/2),center=true,$fn=FN); 

module xteardrop(diameter,length) rotate(a=-90,v=[0,1,0]) rotate(a=-90,v=[0,0,1]) zteardrop(diameter,length);

module yteardrop(diameter,length) rotate(a=90,v=[1,0,0]) zteardrop(diameter,length);

module zteardrop(diameter,height)
{
	rotate(a=0, v=[0,0,1]) union()
	{
		//translate([0,0,-height/2]) cube(size=[diameter/2,diameter/2,height],center=false);
		rotate(a=22.5, v=[0,0,1])cylinder(r=diameter/2, h = height,center=true,$fn=FN);
	}
}

module vertex_foot() {
	difference () {
		union () {
			cube([18,4,vertex_height],center=true);
			translate ([-5,8,0]) cube([5,18,vertex_height],center=true);
			translate ([5,9,0]) cube([5,18,vertex_height],center=true);
		}
		//translate ([0,8,0]) xteardrop(7,200);
	}
}

use <gears/ParametricHerringboneGears.scad>
THROTTLE_LENGTH=200;

Main_Throttle();

module Main_Throttle(){
translate([+39,0,-30]) Throttle_Handle(+40);
translate([+13,0,-30]) Throttle_Handle(+40);
translate([-13,0,-30]) Throttle_Handle(-20);
translate([-39,0,-30]) Throttle_Handle(-20);
}

module Throttle_Handle(Angle){
	rotate([-Angle,0,0]) {
		translate([0,0,0]) rotate([0,90,0]) cylinder(r=10,h=20,center=true);
		translate([0,0,THROTTLE_LENGTH]) rotate([0,90,0]) cylinder(r=20,h=25,center=true);
		translate([(7.5),0,0]) hull(){
	    	translate([0,0,0]) rotate([0,90,0]) cylinder(r=10,h=5,center=true);
	    	translate([0,0,THROTTLE_LENGTH]) rotate([0,90,0]) cylinder(r=10,h=5,center=true);
		}
		translate([-(7.5),0,0]) hull(){
		    translate([0,0,0]) rotate([0,90,0]) cylinder(r=10,h=5,center=true);
	    	translate([0,0,THROTTLE_LENGTH]) rotate([0,90,0]) cylinder(r=10,h=5,center=true);
		}
	}
}





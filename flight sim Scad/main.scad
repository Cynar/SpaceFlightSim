use <navpanel.scad>
use <pilotpanel.scad>
use <middlepanel.scad>
use <throttle.scad>

translate([0,500,1000]) monitorbank();
translate([+370,-200,0]) seat();
translate([-370,-200,0]) seat();

translate([370,100,400]) {
rotate([65,0,0]) translate([0,5,0]) nav_top_sheet(1);
rotate([5,0,0]) translate([0,-5,0]) nav_bottom_sheet();
}

translate([-370,100,400]) {
rotate([65,0,0]) translate([0,5,0]) pilot_top_sheet(1);
rotate([5,0,0]) translate([0,-5,0]) pilot_bottom_sheet();
}

translate([0,100,400]) {
rotate([65,0,0]) translate([0,5,0]) middle_top_sheet(1);
rotate([5,0,0]) translate([0,-5,0]) middle_bottom_sheet();
}



module seat()
{
render() rotate([100,0,180]) scale(9.5)import("seat2.stl");
}

module monitorbank(){
MonAngle=60;
MonWidth=450*cos(MonAngle/4);
SHIFT=-tan((MonAngle/8))*MonWidth;

	translate([0,95,0]) {
		translate([0,0,0]) rotate([0,0,+00.0]) monitor();
		translate([-MonWidth-10,SHIFT,0]) rotate([0,0,+MonAngle/4]) monitor();
		translate([+MonWidth+10,SHIFT,0]) rotate([0,0,-MonAngle/4]) monitor();
		translate([-(MonWidth*2)-0,SHIFT*4,0]) rotate([0,0,+MonAngle/2]) monitor();
		translate([+(MonWidth*2)+0,SHIFT*4,0]) rotate([0,0,-MonAngle/2]) monitor();
	}
}



module monitor(){
	/*	S=9.5;
	color("grey") rotate([0,0,180]) render() intersection(){ 

		translate([-45,0,-205])scale([S,S,S]) import("monitor.stl");
		translate([0,105,9]) cube([430,200,330],center=true);
	}*/
    S=1;
    		color("grey")translate([-0,0,0]) import("monitor2.stl");
}
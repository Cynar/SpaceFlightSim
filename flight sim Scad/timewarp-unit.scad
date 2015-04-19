KNOB_COLOUR=[0.1,0.1,0.1];
DIAL_BODY_COLOUR=[0.15,0.15,0.15];

Timewarp_Controller();

module Timewarp_Controller(){
    Timewarp_Knob();
    Timewarp_Body();
    Timewarp_Text();
    Timewarp_Jacob();
    Timewarp_LEDS();
}


module Timewarp_Jacob() {
translate([0,195,90])
	{
	color("grey") union(){
		translate([0,0,105]) rotate(0) linear_extrude(height = 200, center = true, convexity = 10, twist = -500,scale=1.1,$fn=15) translate([25, 0, 0]) circle(r = 3,$fn=15);
		translate([0,0,105]) rotate(180) linear_extrude(height = 200, center = true, convexity = 10, twist = -500,scale=1.1,$fn=30) translate([25, 0, 0]) circle(r = 3,$fn=15);

		translate([0,0,20]) sphere(r=3,center=true,$fn=15);
		translate([0,0,15]) cylinder(r=1.5,h=16,center=true,$fn=15);
	}


	color([0.5,0.5,0.5]) union(){
		cylinder(r=37,h=10);
		cylinder(r=40,h=5);		
	}

	translate([0,0,120]) color([0.5,0.5,1],0.25) difference()
	{
		cylinder(r=40,h=230,center=true,$fn=30);
		cylinder(r=37,h=250,center=true,$fn=30);
	}


}
}

module LED(COLOUR) {
    $fn=10;
	color(COLOUR) cylinder(r=2.5,h=4);
	color(COLOUR) translate([0,0,4]) sphere(r=2.5);
	color(COLOUR) cylinder(r=2.5,h=4);
	color("Black") translate([0,0,-1]) cylinder(r=3,h=4);	
	color("Black") translate([0,0,2]) cylinder(r=3.5,h=1);
}

module Timewarp_LEDS() {
	translate([0,55,62]) rotate([-60,0,0])translate([0,-1.5,0]) {
		rotate([0,+00,0]) translate([0,4,68]) rotate([90,0,0])LED("BLUE");

		rotate([0,+1*120/7,0]) translate([0,4,68]) rotate([90,0,0])LED("GREEN");
		rotate([0,+2*120/7,0]) translate([0,4,68]) rotate([90,0,0])LED("GREEN");
		rotate([0,+3*120/7,0]) translate([0,4,68]) rotate([90,0,0])LED("GREEN");
		rotate([0,+4*120/7,0]) translate([0,4,68]) rotate([90,0,0])LED("RED");
		rotate([0,+5*120/7,0]) translate([0,4,68]) rotate([90,0,0])LED("RED");
		rotate([0,+6*120/7,0]) translate([0,4,68]) rotate([90,0,0])LED("RED");
		rotate([0,+7*120/7,0]) translate([0,4,68]) rotate([90,0,0])LED("RED");

		rotate([0,-1*90/3,0]) translate([0,4,68]) rotate([90,0,0])LED("YELLOW");
		rotate([0,-2*90/3,0]) translate([0,4,68]) rotate([90,0,0])LED("YELLOW");
		rotate([0,-3*90/3,0]) translate([0,4,68]) rotate([90,0,0])LED("YELLOW");
        
        

	}


}

module Timewarp_Knob(){ 
	translate([0,55,62]) rotate([90-60,0,0]) rotate(0) color(KNOB_COLOUR) scale(0.5) import("timewarp-knob2.stl");
}


module Timewarp_Body() {
	color(DIAL_BODY_COLOUR) render() translate([-90,0,0]) {
       difference(){
           cube([180,250,110]);
           translate([-25,0,30]) rotate([90-60,0,0]) cube([250,250,250]);
           translate([90,195,110]) cylinder(r=41,h=80,center=true,$fn=30);
           translate([90,55,62]) rotate([30,0,0]) linear_extrude(height = 6, center = true, convexity = 10){
                rotate([0,0,+0]) translate([0,80]) rotate([0,0,0]) number(1);
        
                rotate([0,0,-1*120/7]) translate([0,80]) rotate([0,0,0]) number(5,     +1*120/7);
                rotate([0,0,-2*120/7]) translate([0,80]) rotate([0,0,0]) number(10,    +2*120/7);
                rotate([0,0,-3*120/7]) translate([0,80]) rotate([0,0,0]) number(50,    +3*120/7);
                rotate([0,0,-4*120/7]) translate([0,80]) rotate([0,0,0]) number(100,   +4*120/7);
                rotate([0,0,-5*120/7]) translate([0,80]) rotate([0,0,0]) number(1000,  +5*120/7);
                rotate([0,0,-6*120/7]) translate([0,80]) rotate([0,0,0]) number(10000, +6*120/7);
                rotate([0,0,-7*120/7]) translate([0,80]) rotate([0,0,0]) number(100000,+7*120/7);

                rotate([0,0,+1*90/3]) translate([0,80]) rotate([0,0,0]) number(2,     -1*90/3);
                rotate([0,0,+2*90/3]) translate([0,80]) rotate([0,0,0]) number(3,     -2*90/3);
                rotate([0,0,+3*90/3]) translate([0,80]) rotate([0,0,0]) number(4,     -3*90/3);
           }
        }
    }
}

module Timewarp_Text() {
    color("White") render() translate([0,55,62]) rotate([30,0,0]) translate([0,0,-1]) linear_extrude(height = 3, center = true, convexity = 10){
                rotate([0,0,+0]) translate([0,80]) rotate([0,0,0]) number(1);
        
                rotate([0,0,-1*120/7]) translate([0,80]) rotate([0,0,0]) number(5,     +1*120/7);
                rotate([0,0,-2*120/7]) translate([0,80]) rotate([0,0,0]) number(10,    +2*120/7);
                rotate([0,0,-3*120/7]) translate([0,80]) rotate([0,0,0]) number(50,    +3*120/7);
                rotate([0,0,-4*120/7]) translate([0,80]) rotate([0,0,0]) number(100,   +4*120/7);
                rotate([0,0,-5*120/7]) translate([0,80]) rotate([0,0,0]) number(1000,  +5*120/7);
                rotate([0,0,-6*120/7]) translate([0,80]) rotate([0,0,0]) number(10000, +6*120/7);
                rotate([0,0,-7*120/7]) translate([0,80]) rotate([0,0,0]) number(100000,+7*120/7);

                rotate([0,0,+1*90/3]) translate([0,80]) rotate([0,0,0]) number(2,     -1*90/3);
                rotate([0,0,+2*90/3]) translate([0,80]) rotate([0,0,0]) number(3,     -2*90/3);
                rotate([0,0,+3*90/3]) translate([0,80]) rotate([0,0,0]) number(4,     -3*90/3);
    }
}

module number(NUMBER,ANGLE) {
     Scale=0.8;   
    scale(Scale) rotate(ANGLE) {
        if (NUMBER==1)		{	numbertext("1x"  	,""  	,-5,-5);	}
        if (NUMBER==5)		{	numbertext("5x"  	,""  	,-5,-5);	}
        if (NUMBER==10)		{	numbertext("10" 	,""  	,-7.5,-4.5);	}
        if (NUMBER==50)		{	numbertext("50" 	,""  	,-7.5,-4.5);	}        
        if (NUMBER==100)		{	numbertext("10" 	,"2" 	,-7.5,-4.5);	}
        if (NUMBER==1000)	{	numbertext("10" 	,"3" 	,-7.5,-4.5);	}
        if (NUMBER==10000)	{	numbertext("10" 	,"4" 	,-7.5,-4.5);	}
        if (NUMBER==100000)	{	numbertext("10" 	,"5" 	,-7.5,-4.5);	}
        
        if (NUMBER==2)		{	numbertext("2x"  	,""  	,-5,-5);	}
        if (NUMBER==3)		{	numbertext("3x"  	,""  	,-5,-5);	}
        if (NUMBER==4)		{	numbertext("4x"  	,""  	,-5,-5);	}
    }
}

module numbertext(Ta,Tb,dX,dY) {
     Scale=0.8;   
    translate([dX,dY]) scale(Scale) {
        text(Ta);
        translate([16,7]) scale(0.5) text(Tb);
    }
}
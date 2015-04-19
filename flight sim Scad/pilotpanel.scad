use <throttle.scad>
use <navball.scad>
use <7seg.scad>

$fn=25;
HEIGHT=10;

_HEIGHT=HEIGHT*1.75*25.4;


spacing=45;
	offset=(480-(spacing*7))/2;
heightstep=70;
heightoffset=20;

spacingb=100;
	offsetb=(480-(spacingb*3))/2;
heightstepb=90;
heightoffsetb=300;

rotate([65,0,0]) translate([0,5,0]) pilot_top_sheet(1);
rotate([5,0,0]) translate([0,-5,0]) pilot_bottom_sheet();






module pilot_bottom_sheet() {
    translate([-240,0,0]){
        translate([0,-400,0]) render() linear_extrude (height=5,convexivity=10) difference(){
            //square(size=[480,400]);
            polygon([[0,400],[480,400],[480,0],[-120,0],[-120,290]]);
            for (i=[0:1:10]) {
                translate([7.5,31.8/2+(i*31.8*2)]) hull() {translate([2,0]) circle(r=8/2,$fn=10);translate([-2,0]) circle(r=8/2,$fn=10);}
				translate([465+7.5,31.8/2+(i*31.8*2)]) hull() {translate([2,0]) circle(r=8/2,$fn=10);translate([-2,0]) circle(r=8/2,$fn=10);}
			}
		}
		translate([240,-250,25]) mainjoystick();
		translate([60,-300,35]) sidejoystick();
		translate([420,-300,35]) sidejoystick();
        rotate([0,0,0]) translate([-60,-250,0]) color("lightblue") Main_Throttle();
	}
}
module pilot_top_sheet(populated) {	
    translate([-240,0,0]) {
        translate([0,0,-5]) render() linear_extrude (height=5,convexivity=10) difference(){
            square(size=[480,_HEIGHT]);
            for (i=[0:1:10]) {
                translate([7.5,31.8/2+(i*31.8*2)]) hull() {translate([2,0]) circle(r=8/2,$fn=10);translate([-2,0]) circle(r=8/2,$fn=10);}
                translate([465+7.5,31.8/2+(i*31.8*2)]) hull() {translate([2,0]) circle(r=8/2,$fn=10);translate([-2,0]) circle(r=8/2,$fn=10);}
            }
        }

        translate([240,100,10]) rotate([-90,0,0]) navball();
        translate([170,50,0]) LEDStrip(70);
        translate([310,50,0]) LEDStrip(70);
        translate([200,200,5]) rotate([0,0,0]) color("grey") scale([1.5,2,1]) import("minimonitor.stl");
        translate([280,200,5]) rotate([0,0,0]) color("grey") scale([1.5,2,1]) import("minimonitor.stl");
        translate([140,350,35]) rotate([30,0,0]) color("grey") scale([4,4.5,1]) import("minimonitor.stl");
        translate([340,350,35]) rotate([30,0,0]) color("grey") scale([4,4.5,1]) import("minimonitor.stl");
        
        translate([157,160,0]) rotate([0,0,-90]) sevensegarray([1,0,0],0.517);
        translate([290,160,0]) rotate([0,0,-90]) sevensegarray([0,0,5,9],0.517);
        
        translate([50,200,0]) {
            translate([ 0,60,0]) rotate([0,0,-90]) sevensegarray([3,5,0,0,0,0],0.517);
            translate([ 0,30,0]) rotate([0,0,-90]) sevensegarray([2,5,0,0,5,4],0.517);
            translate([ 0, 0,0]) rotate([0,0,-90]) sevensegarray([1,0,0,0,0,0],0.517);
            translate([80, 0,0]) LED();
            translate([80,30,0]) LED();
            translate([80,60,0]) LED();
        }
        
        translate([350,200,0]) {
            translate([ 0,60,0]) rotate([0,0,-90]) sevensegarray([1,0,0,0,0,0],0.517);
            translate([ 0,30,0]) rotate([0,0,-90]) sevensegarray([0,0,0,0,0,0],0.517);
            translate([ 0, 0,0]) rotate([0,0,-90]) sevensegarray([0,0,0,0,0,0],0.517);
            translate([80, 0,0]) LED();
            translate([80,30,0]) LED();
            translate([80,60,0]) LED();
        }
    }
}

module LEDStrip(percent){
    translate([0,00]) LED(size=5,colour="green");
    translate([0,10]) LED(size=5,colour="green");
    translate([0,20]) LED(size=5,colour="green");
    translate([0,30]) LED(size=5,colour="green");
    translate([0,40]) LED(size=5,colour="green");
    translate([0,50]) LED(size=5,colour="green");
    translate([0,60]) LED(size=5,colour="green");
    translate([0,70]) LED(size=5,colour="red");
    translate([0,80]) LED(size=5,colour="red");
    translate([0,90]) LED(size=5,colour="red");
}
    
module LED(size=5,colour="red") {
    $fn=25;
    color(colour) render(){
        hull(){
            translate([0,0,size/4]) sphere(r=size/2,center=true);
            translate([0,0,-size/2]) cylinder(r=size/2,center=true);
        }
    }
	color("silver") render(){
        difference(){
            union(){
                cylinder(h=size/4,r1=(size/2+size/4),r2=(size/2));
                translate([0,0,-size]) cylinder(h=size,r1=(size/2)+0.5,r2=(size/2)+0.5);
            }
            cylinder(h=size*4,r1=(size/2)+0.1,r2=(size/2)+0.1,center=true);
        }
    }
    color("grey") translate([0,size/5,-10]) cylinder(r=0.3,h=20,center=true);
    color("grey") translate([0,-size/5,-10]) cylinder(r=0.3,h=20,center=true);
}

module switch(state=0){	
    $fn=25;
    render(){
        color("grey")rotate([0,-state*15,0]) hull(){
            translate([0,0,15]) sphere(r=2,center=true);
            cylinder(r=1,h=1);
        }
        color("grey")translate([0,0,-10]) cylinder(r=5,h=10+2);
        color("grey")translate([0,0,-15]) cube(size=[25,10,20],center=true);
    }
}

module button() {	
    $fn=25;
    color("darkgrey") render(){
        difference(){
            translate([0,0,1]) cube(size=[32,32,2],center=true);
            translate([0,0,1.5]) cube(size=[25,25,3],center=true);
        }
        color("red") render(){
            hull(){
                translate([0,0,5]) cube(size=[22,22,1],center=true);
		        translate([0,0,1.5]) cube(size=[24,24,3],center=true);
	        }
	        color("darkgrey") translate([0,0,-23]) cylinder(r=10.5/2,h=24);
        }
    }
}
module mainjoystick(){
	color("darkgreen") scale(9.5) import("joystick2.stl");
}

module sidejoystick(){
	color("darkred") {
		rotate([90,0,0]) scale(9.5) import("sidejoystick2.stl");
		translate([0,0,80]) minkowski() {cylinder(r=20,h=40);sphere(r=5);}
		translate([0,0,0]) cylinder(r=6,h=80);
	}
}
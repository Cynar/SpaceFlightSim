use <timewarp-unit.scad>
use <navball.scad>

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

rotate([65,0,0]) translate([0,5,0]) middle_top_sheet(1);
rotate([5,0,0]) translate([0,-5,0]) middle_bottom_sheet();







module middle_bottom_sheet() {
    translate([-120,0,0]){
        translate([0,-400,0]) render() linear_extrude (height=5,convexivity=10) difference(){
            square(size=[240,400]);
            for (i=[0:1:10]) {
                translate([7.5,31.8/2+(i*31.8*2)]) hull() {translate([2,0]) circle(r=8/2,$fn=10);translate([-2,0]) circle(r=8/2,$fn=10);}
				translate([240-15+7.5,31.8/2+(i*31.8*2)]) hull() {translate([2,0]) circle(r=8/2,$fn=10);translate([-2,0]) circle(r=8/2,$fn=10);}
			}
		}
	}
    translate([-00,80,250]) rotate([90,0,0]) color("Grey") scale(4) import("minimonitor.stl");
    translate([0,-250,5]) Timewarp_Controller();
    translate([0,-320,25]) big_button();

}
module middle_top_sheet(populated) {	
    translate([-120,0,0]) {
        translate([0,0,-5]) render() linear_extrude (height=5,convexivity=10) difference(){
            square(size=[240,_HEIGHT]);
            for (i=[0:1:10]) {
                translate([7.5,31.8/2+(i*31.8*2)]) hull() {translate([2,0]) circle(r=8/2,$fn=10);translate([-2,0]) circle(r=8/2,$fn=10);}
                translate([240-15+7.5,31.8/2+(i*31.8*2)]) hull() {translate([2,0]) circle(r=8/2,$fn=10);translate([-2,0]) circle(r=8/2,$fn=10);}
            }
        }
    }
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
	color("darkgreen") render() scale(9.5) import("joystick2.stl");
}

module sidejoystick(){
	color("darkred") render(){
		rotate([90,0,0]) scale(9.5) import("sidejoystick2.stl");
		translate([0,0,80]) minkowski() {cylinder(r=20,h=40);sphere(r=5);}
		translate([0,0,0]) cylinder(r=6,h=80);
	}
}

module big_button() {
    rotate([-90,0,0]){ 
        translate([0,0,0])  color("red") navball_screen();
        translate([0,0,0])  navball_mask();
    }
}

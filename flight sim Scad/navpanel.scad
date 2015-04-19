use <7seg.scad>
use <trackball.scad>

//LED(11,"red");
//switch(-1);
//button(12);

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

rotate([65,0,0]) translate([0,5,0]) nav_top_sheet(1);
rotate([5,0,0]) translate([0,-5,0]) nav_bottom_sheet();
//meter();

//top_sheet(0);




module nav_bottom_sheet() {
    translate([-240,0,0]){
        translate([0,-400,0]) render() linear_extrude (height=5,convexivity=10) difference(){
            //square(size=[480,400]);
            polygon([[0,0],[0,400],[480,400],[600,290],[600,0]]);
            for (i=[0:1:7]) {
                translate([offset+30+(spacing*i),370,0]) circle(r=11/2);
                translate([offset+30+(spacing*i),350,0]) circle(r=12/2);
            }
        }
        translate([180,-240,-30])     rotate([0,0,0]) scale ([0.75,0.75,0.45]) rotate([-90,0,0]) color("grey") import("monitor2.stl");
        
        translate([350,-130,10]) {
            translate([0,  0,0]) rotate([0,0,-90]) sevensegarray([1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],0.53);
            translate([0,-30,0]) rotate([0,0,-90]) sevensegarray([1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],0.53);
            translate([0,-60,0]) rotate([0,0,-90]) sevensegarray([1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],0.53);
            translate([0,-90,0]) rotate([0,0,-90]) sevensegarray([1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],0.53);
            translate([235,  -32,0]) knob();
            translate([215,  -32,0]) knob();
            translate([235,  -62,0]) knob();
            translate([215,  -62,0]) knob();
            translate([235,  -92,0]) knob();
            translate([215,  -92,0]) knob();
            translate([235,  -122,0]) knob();
            translate([215,  -122,0]) knob();
        }
        for (i=[0:1:7]) {
            translate([offset+30+(spacing*i),-30,5]) LED(11,"Lime");
            translate([offset+30+(spacing*i),-60,5]) button(15);
        }
        translate([380,-300,5]) trackball();
        
    }
}
module nav_top_sheet(populated) {	
    translate([-240,0,0]){
        translate([0,0,-5]) render() linear_extrude (height=5,convexivity=10)
        difference(){
            square(size=[480,_HEIGHT]);
            for (i=[0:1:7]) {
                translate([offset+(spacing*i),heightoffset+(heightstep*0)+30,0]) circle(r=11/2);
                translate([offset+(spacing*i),heightoffset+(heightstep*0),0]) circle(r=12/2);
                translate([offset+(spacing*i),heightoffset+(heightstep*1)+30,0]) circle(r=11/2);
                translate([offset+(spacing*i),heightoffset+(heightstep*1),0]) circle(r=12/2);
                translate([offset+(spacing*i),heightoffset+(heightstep*2)+30,0]) circle(r=11/2);
                translate([offset+(spacing*i),heightoffset+(heightstep*2),0]) circle(r=12/2);
            }
            for (i=[0:1:3]) {
                //translate([offsetb+(spacingb*i),heightoffsetb,0]) meter_holes();
                translate([offsetb+(spacingb*i),heightoffsetb+heightstepb,0]) meter_holes();
            }
            translate([offsetb+(spacingb*0),heightoffsetb,0]) meter_holes();
            translate([offsetb+(spacingb*3),heightoffsetb,0]) meter_holes();
	for (i=[0:1:10]) 
	{
		translate([7.5,31.8/2+(i*31.8*2)]) hull() {translate([2,0]) circle(r=8/2,$fn=10);translate([-2,0]) circle(r=8/2,$fn=10);}
		translate([465+7.5,31.8/2+(i*31.8*2)]) hull() {translate([2,0]) circle(r=8/2,$fn=10);translate([-2,0]) circle(r=8/2,$fn=10);}

	translate([240,280]) monitor_holes();

	}


	}
	if (populated){
		for (i=[0:1:7]) 
		{
			translate([offset+(spacing*i),heightoffset+(heightstep*0)+30,0]) LED(11,"Lime");
			translate([offset+(spacing*i),heightoffset+(heightstep*0),0]) button(15);

			translate([offset+(spacing*i),heightoffset+(heightstep*1)+30,0]) LED(11,"Lime");
			translate([offset+(spacing*i),heightoffset+(heightstep*1),0]) button(15);

			translate([offset+(spacing*i),heightoffset+(heightstep*2)+30,0]) LED(11,"Lime");
			translate([offset+(spacing*i),heightoffset+(heightstep*2),0]) button(15);
		}
		for (i=[0:1:3]) 
		{
			//translate([offsetb+(spacingb*i),heightoffsetb,0]) meter();
			translate([offsetb+(spacingb*i),heightoffsetb+heightstepb,0]) meter();
		}
		translate([offsetb+(spacingb*0),heightoffsetb,0]) meter();
		translate([offsetb+(spacingb*3),heightoffsetb,0]) meter();

	translate([240,280,10]) color("grey") monitor();
	}
}}
module meter_holes(){
    circle(r=53/2,center=true);
    translate([+24,+25])circle(r=2,center=true,$fn=20);
    translate([+24,-25])circle(r=2,center=true,$fn=20);
    translate([-24,+25])circle(r=2,center=true,$fn=20);
    translate([-24,-25])circle(r=2,center=true,$fn=20);
}




module LED(size=5,colour="red"){
    $fn=20;
    color(colour) render(){
        hull(){
            translate([0,0,size/4]) sphere(r=size/2,center=true);
            translate([0,0,-size/2]) cylinder(r=size/2,center=true);
        }
    }
	color("silver") render() union(){
		cylinder(h=size/4,r1=(size/2+size/4),r2=(size/2));
		translate([0,0,-size]) cylinder(h=size,r1=(size/2)+0.5,r2=(size/2)+0.5);
    }
}

module switch(state=0) {
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
    color("darkgrey") render() difference(){
		translate([0,0,1]) cube(size=[32,32,2],center=true);
		translate([0,0,1.5]) cube(size=[25,25,3],center=true);
    }
	color("red") render()hull(){
		translate([0,0,5]) cube(size=[22,22,1],center=true);
		translate([0,0,1.5]) cube(size=[24,24,3],center=true);
	}
	color("darkgrey") translate([0,0,-23]) cylinder(r=10.5/2,h=24);
}

module meter(){
	color([0.1,0.1,0.1]) render(){
		difference(){
			hull(){
				translate([-30,-25,6.3/2]) cylinder(r=2.5,h=6.3,center=true);
				translate([+30,-25,6.3/2]) cylinder(r=2.5,h=6.3,center=true);
				translate([-30,+25,6.3/2]) cylinder(r=2.5,h=6.3,center=true);
				translate([+30,+25,6.3/2]) cylinder(r=2.5,h=6.3,center=true);
			}
			translate([0,25.5,(6.3/2)+5]) cube(size=[75,65,8],center=true);
			hull(){
				translate([-30,+25,6.3-1]) cylinder(r=1.5,h=6.3,center=true);
				translate([+30,+25,6.3-1]) cylinder(r=1.5,h=6.3,center=true);
				translate([-30,-5,6.3-1]) cube(size=[3,3,6.3],center=true);
				translate([+30,-5,6.3-1]) cube(size=[3,3,6.3],center=true);
			}
		}
	}
	
	color([0.1,0.1,0.1]) render(){
		translate([0,0,-24]) cylinder(r=51.7/2,h=24);
	}
	color("grey") render(){
		translate([+24,+25,-10]) cylinder(r=3/2,h=10);
		translate([+24,-25,-10]) cylinder(r=3/2,h=10);
		translate([-24,+25,-10]) cylinder(r=3/2,h=10);
		translate([-24,-25,-10]) cylinder(r=3/2,h=10);
	}






			color([0.9,0.9,0.9]) render(){hull(){
				translate([-30,+25,6.3-2.5]) cylinder(r=1.5,h=1,center=true);
				translate([+30,+25,6.3-2.5]) cylinder(r=1.5,h=1,center=true);
				translate([-30,-5,6.3-2.5]) cube(size=[3,3,1],center=true);
				translate([+30,-5,6.3-2.5]) cube(size=[3,3,1],center=true);
			}}
}

module monitor(){
translate([0,0,-0])     rotate([30,0,0]) scale ([0.45,0.45,0.45]) rotate([-90,0,0]) import("monitor2.stl");
}

module monitor_holes(){
    $fn=10;
    translate([+75/2,-75/2]) circle(r=2,center=true);
    translate([-75/2,-75/2]) circle(r=2,center=true);
    translate([+75/2,+75/2]) circle(r=2,center=true);
    translate([-75/2,+75/2]) circle(r=2,center=true);
    translate([0,-25]) circle(r=20,center=true);
}

module knob(){
    color("blue") union() {
        translate([0,32,2]) cylinder(r1=6,r2=4,h=10);
        translate([0,32,0]) cylinder(r1=2,r2=2,h=5);
    }
}

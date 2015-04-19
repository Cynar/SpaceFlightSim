$fa=1;
$fs=1;

NODES=8;
NODE_RAD=45;
NODE_DEPTH=20;
DIA=100;
TAPER=0.8;
RSTEP=360/NODES;
HEIGHT=50;


	dial_body();
//	dial_stalk();

module dial_stalk()
{
	translate([0,0,-130]) cylinder(h=100,r=30);
	translate([0,0,-20]) cylinder(h=20,r=25,center=true,$fn=6);
}

module dial_body(){
	difference(){
		union(){
			difference() {
				union(){
					rotate(RSTEP/2) for (i=[0:RSTEP:360]) {rotate(i) section();}
					pointer();
				}
				translate([0,0,-20]) cylinder(r=DIA+20,h=20);	
			}
			cylinder(r=DIA+20,h=4);
		}
	translate([0,0,0]) cylinder(r=25,h=40,center=true,$fn=6);	
	}
}







module section() {
render() minkowski(){
linear_extrude(height = HEIGHT, center = false, convexity = 10, scale=TAPER){
	difference() {
		circle(r=DIA);
		rotate(0) translate([DIA+NODE_RAD-NODE_DEPTH,0,0]) circle(r=NODE_RAD);
		polygon([
			[+DIA*2,+DIA*2],
			[-DIA*2,+DIA*2],
			[-DIA*2,-DIA*2],
			[+DIA*2,-DIA*2],
			[+DIA*2,-(tan(RSTEP/2)*DIA*2)],
			[0,0],
			[DIA*2,0],

			]);
	}
}
sphere(r=5);
}

mirror([0,1,0]) render() minkowski(){
linear_extrude(height = HEIGHT, center = false, convexity = 10, scale=TAPER){
	difference() {
		circle(r=DIA);
		rotate(0) translate([DIA+NODE_RAD-NODE_DEPTH,0,0]) circle(r=NODE_RAD);
		polygon([
			[+DIA*2,+DIA*2],
			[-DIA*2,+DIA*2],
			[-DIA*2,-DIA*2],
			[+DIA*2,-DIA*2],
			[+DIA*2,-(tan(RSTEP/2)*DIA*2)],
			[0,0],
			[DIA*2,0],

			]);
	}
}
sphere(r=5);
}

}

module pointer()
{
render() minkowski(){
		linear_extrude(height = HEIGHT+5, center = false, convexity = 10, scale=TAPER){
			square([1,100+5]);
		}
	sphere(r=5);
	}
}

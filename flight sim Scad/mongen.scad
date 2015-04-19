module monitor(){
		S=9.5;
	color("grey") rotate([0,0,180]) render() intersection(){ 

		translate([-45,0,-205])scale([S,S,S]) import("monitor.stl");
		translate([0,105,9]) cube([430,200,330],center=true);
	}
}
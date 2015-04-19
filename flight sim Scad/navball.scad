navball();

module navball_mask(){
    color([0.1,0.1,0.1]) translate([0,33,0]) rotate([90,0,0]) render() difference(){
        minkowski(){
            cylinder(r=50,h=50,center=true);
            sphere(r=10);
        }
        cylinder(r=50,h=100,center=true);  
        translate([0,0,-50]) cube([150,150,100],center=true);
    }
}


module navball_screen(){
    rotate([90,0,0]) color("lightgrey") render() rotate_extrude() rotate([180,0,90]) translate([0,0]) intersection(){ 
        translate([-86,0]) circle(r=100,$fn=200);
        square([50,50]);
    }
}


module navball(){
    translate([0,0,0])  navball_screen();
    translate([0,0,0])  navball_mask();
}


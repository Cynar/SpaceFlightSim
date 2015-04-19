trackball();

module trackball() {
    color([0.2,0.2,0.2]) difference() {
        union(){
            translate([0,0,0]) cube([50,80,2],center=true);
            translate([0,-10,-30]) cylinder(r=22,h=30);
        }
        translate([0,-10,-25]) cylinder(r1=21,r2=16,h=30);
    }
    color("green") translate([0,-10,-10]) sphere(r=20);
    color("green") translate([+10,16,3]) cube([15,15,3],center=true);
    color("green") translate([-10,16,3]) cube([15,15,3],center=true);
    
    color("blue") union() {
        translate([0,32,2]) cylinder(r1=6,r2=4,h=10);
        translate([0,32,0]) cylinder(r1=2,r2=2,h=5);
    }
    
}
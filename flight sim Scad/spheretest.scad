 module halfcircle(r) {
     difference() {
       circle(r);
       translate([-r,0])square([r*2,r]);
     }
   }

   module sphere_alternate(r) {
     rotate_extrude()
       rotate([0,0,90])halfcircle(r);
   } 

$fn=20;
   minkowski() {
      cube([20,20,30]);
      sphere_alternate(5);
   } 

module sevenseg(number,dot=0) {
    
    if (number==1) {encode=[0,1,1,0,0,0,0,dot]; sevensegnumber(encode);}
    if (number==2) {encode=[1,1,0,1,1,0,1,dot]; sevensegnumber(encode);}
    if (number==3) {encode=[1,1,1,1,0,0,1,dot]; sevensegnumber(encode);}
    if (number==4) {encode=[0,1,1,0,0,1,1,dot]; sevensegnumber(encode);}
    if (number==5) {encode=[1,0,1,1,0,1,1,dot]; sevensegnumber(encode);}
    if (number==6) {encode=[1,0,1,1,1,1,1,dot]; sevensegnumber(encode);}
    if (number==7) {encode=[1,1,1,0,0,0,0,dot]; sevensegnumber(encode);}
    if (number==8) {encode=[1,1,1,1,1,1,1,dot]; sevensegnumber(encode);}
    if (number==9) {encode=[1,1,1,1,0,1,1,dot]; sevensegnumber(encode);}
    if (number==0) {encode=[1,1,1,1,1,1,0,dot]; sevensegnumber(encode);}
}
sevensegarray([1,2,3,4,5]);
//sevenseg(8);


module sevensegnumber(encode) {
    color("black") translate([0,0,0]) cube([34,24,10],center=true);
    
    if (encode[0]==1) { translate([-14,+0,5]) color("red") cube([ 1,12,1],center=true);}
    if (encode[1]==1) { translate([- 7,+7,5]) color("red") cube([12, 1,1],center=true);}
    if (encode[2]==1) { translate([  7,+7,5]) color("red") cube([12, 1,1],center=true);}
    if (encode[3]==1) { translate([+14,+0,5]) color("red") cube([ 1,12,1],center=true);}
    if (encode[4]==1) { translate([+ 7,-7,5]) color("red") cube([12, 1,1],center=true);}
    if (encode[5]==1) { translate([- 7,-7,5]) color("red") cube([12, 1,1],center=true);}
    if (encode[6]==1) { translate([+ 0,+0,5]) color("red") cube([ 1,12,1],center=true);}
    if (encode[7]==1) { translate([ 15,+9,5]) color("red") cube([ 1.25, 1.25,1],center=true);}
}

module sevensegarray(content,Scale=1) {

    scale(Scale) for (i=[0:1:len(content)-1]) {
        translate([0,i*25,0]) sevenseg(content[i]);
    }
}
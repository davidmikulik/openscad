include <BOSL/constants.scad>
use <BOSL/metric_screws.scad>
SUPPORT_SIZE=60;
SUPPORT_HOLDER_HEIGHT=30;
SUPPORT_HOLDER_RADIUS=15;
HOLDER_SIZE=40;
HOLDER_HEIGHT=25;
HOLDER_CAP = 4;
THIKNES=2;
SCREW=4;
module support(){

        cylinder(h=SUPPORT_HOLDER_HEIGHT, d=SUPPORT_HOLDER_RADIUS);
        translate([0,0,SUPPORT_HOLDER_HEIGHT]){
            rotate(a=[0,180,0]) {
           metric_bolt(headtype="null", size=SUPPORT_HOLDER_RADIUS, l=15); //screw(screwsize=SUPPORT_HOLDER_RADIUS,screwlen=15,headsize=SUPPORT_HOLDER_RADIUS,headlen=3,countersunk=true); 
                }
        }
    difference(){
        box=[SUPPORT_SIZE,SUPPORT_SIZE,THIKNES];
        cube(box,true);

        translate([HOLDER_SIZE/2,0,-THIKNES/2]){
            cylinder(h=THIKNES, d=SCREW);
        }
        translate([-HOLDER_SIZE/2,0,-THIKNES/2]){
            cylinder(h=THIKNES, d=SCREW);
        }       
        translate([-HOLDER_SIZE/2-5,HOLDER_SIZE/2,-THIKNES/2]){
            cylinder(h=THIKNES, d=SCREW);
        }
        translate([-HOLDER_SIZE/2-5,-HOLDER_SIZE/2,-THIKNES/2]){
            cylinder(h=THIKNES, d=SCREW);
        }
        translate([HOLDER_SIZE/2+5,HOLDER_SIZE/2,-THIKNES/2]){
            cylinder(h=THIKNES, d=SCREW);
        }         
        translate([HOLDER_SIZE/2+5,-HOLDER_SIZE/2,-THIKNES/2]){
            cylinder(h=THIKNES, d=SCREW);
        }
    }
    
}
module holderSupport() {
    translate([0,100,0]) {
        difference(){
            box=[HOLDER_SIZE,SUPPORT_SIZE,THIKNES];
            cube(box,true);
            translate([0,0,-THIKNES/2]){
            cylinder(h=THIKNES, d=SUPPORT_HOLDER_RADIUS-2);
            }
        }
            metric_nut(size=SUPPORT_HOLDER_RADIUS, hole=true, pitch=1.5, flange=3, details=true);

    }    
}
module holder(left){
        move = left ? SUPPORT_SIZE/2-THIKNES/2-7:-SUPPORT_SIZE/2+THIKNES/2+7;
        translate([0,100+move,HOLDER_HEIGHT/2]){
        box=[HOLDER_SIZE,THIKNES,HOLDER_HEIGHT];
        cube(box,true);
        move = left ? THIKNES:-THIKNES;

        translate([0,move,HOLDER_HEIGHT/2]){
            rotate(90, v=[0,1,0]) {
                move = left ? -THIKNES:THIKNES;
                translate([0,move,-HOLDER_SIZE/2]){
                    cylinder(h=HOLDER_SIZE, d=THIKNES);
                }
            }
            rotate(a=left ? 10:-10, v=[1,0,0]) {
                box=[HOLDER_SIZE,HOLDER_CAP,THIKNES];
                cube(box,true);
            }
        }
    }
}
 
support();
holderSupport();
holder(true);
holder(false);
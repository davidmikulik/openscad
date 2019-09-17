include <BOSL/constants.scad>
use <BOSL/metric_screws.scad>
CAM_WIDTH=60;
CAM_HEIGHT=40;
CAM_DEPTH = 20;
CAM_SCREW_SIZE=8;
CAM_SCREW_LENGHT=15;
THIKNES=4;

CAM_BOX = true;
CAM_HOLDER=true;

if (CAM_BOX)
{
    camBox();
}
if (CAM_HOLDER) {
    camHolder();
}

module camBox() {
    difference(){
        cube([CAM_WIDTH+THIKNES*2,CAM_HEIGHT+THIKNES*2, CAM_DEPTH+THIKNES]);
        translate([THIKNES,THIKNES,-THIKNES]) {
            cube([CAM_WIDTH,CAM_HEIGHT, CAM_DEPTH]);
        }
    }
    translate([CAM_WIDTH/2+THIKNES,CAM_HEIGHT+THIKNES,CAM_DEPTH/2]){
    rotate(a=[90,0,0]) {
       metric_bolt(headtype="null", size=CAM_SCREW_SIZE, l=CAM_SCREW_LENGHT,pitch=2); 
    }
}
  
}
module camHolder() {
}



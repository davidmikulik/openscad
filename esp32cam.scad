/*
 * ESP32 CAM 
 * - CASE
 * - LID
 * - HOLDER SCREW
 * (c) 2019 David Mikulik
 * Licensed under MIT license
*/
include <BOSL/constants.scad>
use <BOSL/metric_screws.scad>
use <BOSL/shapes.scad>

CAM_WIDTH=43;
CAM_HEIGHT=30;
CAM_DEPTH = 27;
CAM_SCREW_SIZE=6;
CAM_SCREW_LENGHT=20;
THIKNES=2;

LENS_HOLE_DIAMETER=8;
LENS_HOLE_X=15;
LENS_HOLE_Y=13;

LIGHT_HOLE_DIAMETER=3;
LIGHT_HOLE_X=3.7;
LIGHT_HOLE_Y=31;

ANTENA_HOLE_DIAMETER=6.7;
ANTENA_HOLE_X=10;
ANTENA_HOLE_Y=10;

POWER_HOLE_DIAMETER=5;
POWER_HOLE_X=25;
POWER_HOLE_Y=17;

CAM_BOX = false;
CAM_LID=true;
CAM_HOLDER_SCREW=false;
CAM_HOLDER=false;

if (CAM_BOX)
{
    camBox();
}
if (CAM_LID)
{
    camLid();
}
if (CAM_HOLDER_SCREW) {
    camHolderScrew();
}
if (CAM_HOLDER) {
    camHolder();
}

module camBox() {
    
    difference(){
        cube([CAM_WIDTH+THIKNES*2,CAM_HEIGHT+THIKNES*2, CAM_DEPTH+THIKNES]);
        translate([THIKNES,THIKNES,THIKNES]) {
            cube([CAM_WIDTH,CAM_HEIGHT, CAM_DEPTH]);
        }
        //Lens
        translate([LENS_HOLE_Y+THIKNES,LENS_HOLE_X+THIKNES,-THIKNES]){

            cylinder(d=LENS_HOLE_DIAMETER, h=THIKNES*2, $fn=100);
        }
        //light
        translate([LIGHT_HOLE_Y+THIKNES,LIGHT_HOLE_X+THIKNES,THIKNES]){

//            //cylinder(d=LIGHT_HOLE_DIAMETER, h=THIKNES*2, $fn=100);
            downcyl(r1=LIGHT_HOLE_DIAMETER+3, r2=LIGHT_HOLE_DIAMETER, h=THIKNES);

        }
        //antena hole
        translate([CAM_WIDTH,ANTENA_HOLE_X,ANTENA_HOLE_Y]){
            rotate ([0,90,0]) {
            cylinder(d=ANTENA_HOLE_DIAMETER, h=THIKNES*2, $fn=100);
            }
        }
        //power hole
        translate([CAM_WIDTH,POWER_HOLE_X,POWER_HOLE_Y]){
            rotate ([0,90,0]) {
            cylinder(d=POWER_HOLE_DIAMETER, h=THIKNES*2, $fn=100);
            }
        }
            
        
            
        
            ventilator(true);
            ventilator(false);

    
      
    }
    //Nut
    translate([CAM_WIDTH/2+THIKNES,CAM_HEIGHT+THIKNES*2,CAM_DEPTH/2+THIKNES/2]){
    rotate(a=[270,0,0]) {
        translate([0,0,-THIKNES]){
            cylinder(d=CAM_SCREW_SIZE*3, h=THIKNES, $fn=100);
        }
        metric_nut(size=CAM_SCREW_SIZE+0.5, hole=true, pitch=1.25, flange=2, details=true);      
    }
}
  
}
module camLid() {
    translate([60,0,0]){
        cube([CAM_WIDTH+THIKNES*2,CAM_HEIGHT+THIKNES*2, THIKNES]);
        translate([THIKNES,THIKNES,THIKNES]){
        cube([CAM_WIDTH,CAM_HEIGHT, THIKNES]);
        for (i=[0:3]) {
            movex=  (i==0 || i==2)?THIKNES:CAM_WIDTH-THIKNES;
            movey=  (i==0 || i==3)?THIKNES:CAM_HEIGHT-THIKNES;
            shifts=[0,0];
            translate([movex,movey,0]){
            //cube([THIKNES,THIKNES, CAM_DEPTH-THIKNES*2]);
            prismoid (size1=[THIKNES*2,THIKNES*2], size2=[THIKNES,THIKNES], h=CAM_DEPTH-THIKNES*2, shift=shifts);
            }
        }
    }

    }
}

module camHolderScrew() {
    translate([20,-20,0]){
        metric_nut(size=CAM_SCREW_SIZE+1, hole=true, pitch=1.25, flange=2, details=true);      
    }

    translate([40,-20,3]){
        
       rotate(a=[0,180,0]) {
        metric_bolt(headtype="pan", size=CAM_SCREW_SIZE, l=CAM_SCREW_LENGHT,pitch=1.25);
       }
    }
}

module camHolder() {

    translate([-40,-20,CAM_SCREW_LENGHT/2]){
        
       rotate(a=[0,180,0]) {
       cylinder(h=20, r=CAM_SCREW_SIZE, center=true);
       translate([0,0,-CAM_SCREW_LENGHT/2]){
        metric_bolt(headtype="NULL", size=CAM_SCREW_SIZE, l=CAM_SCREW_LENGHT,pitch=1.25);
       }
   }
    }
}

module ventilator(down) {
    for (i=[0:3]) {
        move =down? CAM_HEIGHT+THIKNES:0;
        
        translate([5,move,i*3+5]){
            cube([CAM_WIDTH-5,THIKNES, 1]);
            
        }
        
    }
    
}



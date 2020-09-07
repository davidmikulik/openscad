/*
 * Barrel hose holder
 * (c) 2020 David Mikulik
 * Licensed under 
 *   Creative Commons 
 *   Attribution Non Comercial Share alike license
 */
 
include <BOSL/constants.scad>


use <BOSL/metric_screws.scad>
use <BOSL/shapes.scad>   

THIKNES=6;
BARREL_CLIP_DIAMETER=30;
HOSE_DIAMETER=17.5;
HOLDER_WIDTH=19;
SCREW_SIZE=10;
SCREW_HEIGHT=HOLDER_WIDTH;
BOLT=1;
HOLDER=0;

if (HOLDER){
difference () {
    tube(h=HOLDER_WIDTH, od=HOSE_DIAMETER+THIKNES*2, wall=THIKNES, $fn=360);
    translate([-THIKNES/2,-HOSE_DIAMETER,0]) {   
        cube ([THIKNES,HOLDER_WIDTH, HOLDER_WIDTH]);
    }
    translate([-THIKNES/2,0,HOLDER_WIDTH/2]) {   
        rotate ([0,90,0]) {
        metric_bolt(size=SCREW_SIZE/2+1,l=SCREW_HEIGHT+10,headtype="none", align="base");
        }
    }
}

translate([-HOLDER_WIDTH/2,HOSE_DIAMETER/2,-HOLDER_WIDTH/4]) {   
    cube ([HOLDER_WIDTH,THIKNES*2, HOLDER_WIDTH*1.5]);
}
translate([-HOLDER_WIDTH/2,HOSE_DIAMETER/2+THIKNES,HOLDER_WIDTH/2-THIKNES]) {  
    rotate ([0,90,0]) {
        difference () 
        {
        
           union() { 
            translate([-HOLDER_WIDTH/2-THIKNES,0,0]) {   
                cube ([THIKNES,BARREL_CLIP_DIAMETER, HOLDER_WIDTH]);
            }
            translate([-THIKNES/2+.5,0,0]) {   
                cube ([THIKNES,BARREL_CLIP_DIAMETER, HOLDER_WIDTH]);
            }
        }
        translate([HOSE_DIAMETER/2,BARREL_CLIP_DIAMETER-HOSE_DIAMETER/2,HOLDER_WIDTH/2]) {   
                rotate ([0,90,0]) {
                metric_bolt(size=SCREW_SIZE+1,l=SCREW_HEIGHT+10,headtype="none", align="base");
                }
            }

        }
    }    
    
}
}
if (BOLT) {
    translate([0,-HOLDER_WIDTH*2,SCREW_HEIGHT+10]) {   
        rotate ([90,0,0]) {
        teardrop(r=SCREW_SIZE*1, h=THIKNES, ang=40);
        }
        rotate ([90,0,180]) {
        teardrop(r=SCREW_SIZE*1, h=THIKNES, ang=40);
        }
        metric_bolt(size=SCREW_SIZE,l=SCREW_HEIGHT,headtype="none", align="base");
    }
    translate([0,-HOLDER_WIDTH*5,SCREW_HEIGHT+10]) {   
        rotate ([90,0,0]) {
        teardrop(r=SCREW_SIZE*.8, h=THIKNES, ang=40);
        }
        rotate ([90,0,180]) {
        teardrop(r=SCREW_SIZE*.8, h=THIKNES, ang=40);
        }
        metric_bolt(size=SCREW_SIZE/2+.5,l=SCREW_HEIGHT,headtype="none", align="base");
    }    
}
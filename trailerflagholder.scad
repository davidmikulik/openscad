/*
 * Trailer flag holder
 * (c) 2020 David Mikulik
 * Licensed under 
 *   Creative Commons 
 *   Attribution Non Comercial Share alike license
 */
include <BOSL/constants.scad>
use <BOSL/metric_screws.scad>
use <BOSL/shapes.scad>
 
THIKNES=1.7;

HOLDER_WIDTH= 30;
HOLDER_DEPTH=19;
HOLDER_HEIGHT=37;
TRAILER_CASE_DEPTH=14;
TRAILER_CASE_DEPTH2=45;

SCREW_FLAG_LENGHT = 10;
SCREW_FLAG_DIAMETER = 6;

SCREW_HOLDER_LENGHT = 35;
SCREW_HOLDER_DIAMETER = 6;

FLAG_HOLDER_HEIGHT=35;
FLAG_HOLDER_DIAMETER=10.2+2*THIKNES;

HOLDER = 1;
HOLDER_PART = 1;
NUTS = 1;
FLAG_HOLDER = 1;

if (HOLDER) {
    rotate ([0,270,0]) {
    cube ([HOLDER_WIDTH,HOLDER_DEPTH, THIKNES]);
    translate ([0,HOLDER_DEPTH-TRAILER_CASE_DEPTH,THIKNES]) {
        cube ([HOLDER_WIDTH,TRAILER_CASE_DEPTH, THIKNES]);
    }
    cube ([HOLDER_WIDTH,THIKNES, HOLDER_HEIGHT]);
    translate ([HOLDER_WIDTH/2,0,HOLDER_HEIGHT/2]) {
    rotate ([270,0,0]) {
    metric_bolt(headtype="none", size=SCREW_FLAG_DIAMETER, l=SCREW_FLAG_LENGHT);
    }
    }
    rotate ([90,0,0]) {
    translate ([0,HOLDER_HEIGHT-SCREW_HOLDER_DIAMETER-2,-TRAILER_CASE_DEPTH2]) {
    cube ([HOLDER_WIDTH,SCREW_HOLDER_DIAMETER+2, TRAILER_CASE_DEPTH2]);
    }
    translate ([4,HOLDER_HEIGHT-4,0]) {
    
    metric_bolt(headtype="none", size=SCREW_HOLDER_DIAMETER, l=SCREW_HOLDER_LENGHT);
    }
    translate ([HOLDER_WIDTH-4,HOLDER_HEIGHT-4,0]) {
    metric_bolt(headtype="none", size=SCREW_HOLDER_DIAMETER, l=SCREW_HOLDER_LENGHT);
    }
    rotate ([90,0,0]) { 
        translate ([0,-TRAILER_CASE_DEPTH2,-HOLDER_HEIGHT]) {
        difference ()
        {
            cube ([HOLDER_WIDTH,THIKNES, HOLDER_HEIGHT]);
            translate ([HOLDER_WIDTH/2,0,HOLDER_HEIGHT/2]) {
                rotate ([90,0,0]) {
                cylinder(d=SCREW_FLAG_DIAMETER+1, h=THIKNES, $fn=100);
                }
            }
        }
        }
    }

    }
}
}
if (HOLDER_PART) {
rotate ([90,0,0]) {    
    translate ([HOLDER_WIDTH+5,0,-HOLDER_HEIGHT]) {
        difference ()
        {
            cube ([HOLDER_WIDTH,THIKNES, HOLDER_HEIGHT]);
            rotate ([90,0,0]) {
            translate ([4,HOLDER_HEIGHT-4,-THIKNES]) {
                    cylinder(d=SCREW_HOLDER_DIAMETER+1, h=THIKNES, $fn=100);
                }
            translate ([HOLDER_WIDTH-4,HOLDER_HEIGHT-4,-THIKNES]) {
                    cylinder(d=SCREW_HOLDER_DIAMETER+1, h=THIKNES, $fn=100);
               
                }
            }
        }
    }
}
}
if (NUTS) {
    translate ([HOLDER_WIDTH*2+15,0,0]) {
        metric_nut(size=SCREW_FLAG_DIAMETER+1, hole=true, pitch=1.5, flange=3, details=true);
        translate ([0,SCREW_HOLDER_DIAMETER*5,0]) {
        metric_nut(size=SCREW_HOLDER_DIAMETER+1, hole=true, pitch=1.5, flange=3, details=true);
        }
        translate ([0,SCREW_HOLDER_DIAMETER*9,0]) {
        metric_nut(size=SCREW_HOLDER_DIAMETER+1, hole=true, pitch=1.5, flange=3, details=true);
        }
    }
}
if (FLAG_HOLDER) {
    rotate ([90,0,0]) {
    //-FLAG_HOLDER_HEIGHT*2.5+5
    translate ([HOLDER_WIDTH*3+20,0,0]) {
        difference ()
        {
            cube ([HOLDER_WIDTH,FLAG_HOLDER_HEIGHT, THIKNES]);
            rotate ([0,0,0]) {
            translate ([HOLDER_WIDTH/2,HOLDER_HEIGHT/2, 0]) {
                    cylinder(d=SCREW_FLAG_DIAMETER+1, h=THIKNES, $fn=100);
       }
    }
    }
    rotate ([270,0,0]) {
        translate ([HOLDER_WIDTH/2,0, FLAG_HOLDER_HEIGHT-5]) {
        tube(h=FLAG_HOLDER_HEIGHT*1.5, od=FLAG_HOLDER_DIAMETER, wall=THIKNES, $fn=360);
        }
    }   
}
}
}
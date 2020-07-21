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

THIKNES=4;
BARREL_CLIP_DIAMETER=50;
HOSE_DIAMETER=17.5;
HOLDER_WIDTH=15;

difference () {
    tube(h=HOLDER_WIDTH, od=HOSE_DIAMETER+THIKNES*2, wall=THIKNES, $fn=360);
    translate([-THIKNES/2,-HOLDER_WIDTH-THIKNES,0]) {   
        cube ([THIKNES,HOLDER_WIDTH, HOLDER_WIDTH]);
    }
}
translate([-HOLDER_WIDTH/2,HOLDER_WIDTH/2+THIKNES/2,0]) {   
    cube ([HOLDER_WIDTH,THIKNES*1.5, HOLDER_WIDTH]);
}
translate([-HOLDER_WIDTH/2,HOSE_DIAMETER/2+BARREL_CLIP_DIAMETER/2+THIKNES,HOLDER_WIDTH/2]) {  
    rotate ([0,90,0]) {
        difference () {        
            tube(h=HOLDER_WIDTH, od=BARREL_CLIP_DIAMETER+THIKNES, wall=THIKNES, $fn=360);
            translate([-THIKNES/2,-THIKNES+HOSE_DIAMETER,0]) {   
                cube ([THIKNES,HOLDER_WIDTH, HOLDER_WIDTH]);
            }
        }
    }    
    
}

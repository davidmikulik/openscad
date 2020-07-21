/*
 * Lock replacement
 * (c) 2020 David Mikulik
 * Licensed under 
 *   Creative Commons 
 *   Attribution Non Comercial Share alike license
 */
 
 include <BOSL/constants.scad>


use <BOSL/metric_screws.scad>
use <BOSL/shapes.scad>

THIKNES=2;
SCREW_SIZE=19;
SCREW_HEIGHT=18;

HOLDER_SIZE=25;

SCREW =1;
NUT = 1;

if (SCREW) {
    tube(h=THIKNES, od=HOLDER_SIZE, wall=HOLDER_SIZE, $fn=360);
    //metric_nut(size=NUT_DIAMETER, hole=true, pitch=1.5, flange=0, details=true);
    metric_bolt(size=SCREW_SIZE,l=SCREW_HEIGHT,headtype="none", align="base");
}


if (NUT) {
    translate ([HOLDER_SIZE,0,0]) {
        difference () 
        {
            cube ([HOLDER_SIZE,HOLDER_SIZE, SCREW_HEIGHT]);
            translate ([HOLDER_SIZE/2,HOLDER_SIZE/2,SCREW_HEIGHT]) {
                metric_bolt(size=SCREW_SIZE+1,l=SCREW_HEIGHT+5,headtype="none", align="base");
            }
        }
    }
}
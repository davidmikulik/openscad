/*
 * Bosh Mum suizer part
 * (c) 2019 David Mikulik
 * Licensed under 
 *   Creative Commons 
 *   Attribution Non Comercial Share alike license
*/

include <BOSL/constants.scad>
use <BOSL/metric_screws.scad>
use <BOSL/shapes.scad>

THIKNES=2;
HOLE_DIMETER = 8;

LEFT=false;
NUT_DIAMETER=4;
NUT_SIZE=6;
ONLY_BOLT=false;
SCREW_SIZE=4;
SCREW_DIEMETER=4.1;
HEAD_DIAMETER=7.5;
HEAD_DEPTH=4;
SCREW_LENGHT= 28;

WIDTH= 35;
HEIGHT=15;
DEPTH=12;

if (ONLY_BOLT) {
    metric_bolt(headtype="socket", size=SCREW_SIZE-1, l=SCREW_LENGHT);
}
else {
 rotate ([180,0,0]) {
 difference () 
    {
    cube ([WIDTH,DEPTH, HEIGHT]);
    rotate ([90,0,0]) {
        translate([WIDTH/2,0,-DEPTH]){
            cylinder(d=HOLE_DIMETER, h=DEPTH, $fn=100);
        }
    }
    if (LEFT) {
        translate([WIDTH/8,DEPTH/2,0]){
            cylinder(d=SCREW_DIEMETER, h=HEIGHT, $fn=100);
            translate([0,0,HEIGHT-HEAD_DEPTH]){
                cylinder(d=HEAD_DIAMETER, h=HEAD_DEPTH, $fn=100);
            }
        }
        translate([WIDTH-(WIDTH/8),DEPTH/2,0]){
            cylinder(d=SCREW_DIEMETER, h=HEIGHT, $fn=100);
            translate([0,0,HEIGHT-HEAD_DEPTH]){
                cylinder(d=HEAD_DIAMETER, h=HEAD_DEPTH, $fn=100);
            }
        }
    }
    else {
        
        translate([WIDTH/8,DEPTH/2,HEIGHT]){
            metric_bolt(headtype="none", size=SCREW_SIZE, l=HEIGHT*2);
        }
        translate([WIDTH-(WIDTH/8),DEPTH/2,HEIGHT]){
            metric_bolt(headtype="none", size=SCREW_SIZE, l=HEIGHT*2);
        }
        translate([WIDTH/4,DEPTH/2, 0])
        {
            cylinder(d=NUT_DIAMETER+0.2, h=NUT_SIZE-1, $fn=100);
        }
         translate([WIDTH-WIDTH/4,DEPTH/2, 0]){
            cylinder(d=NUT_DIAMETER+0.2, h=NUT_SIZE-1, $fn=100);
        }
    }
        
    }
    if (LEFT) {
     translate([WIDTH/4,DEPTH/2, -NUT_SIZE]){
        cylinder(d=NUT_DIAMETER, h=NUT_SIZE, $fn=100);
    }
     translate([WIDTH-WIDTH/4,DEPTH/2, -NUT_SIZE]){
        cylinder(d=NUT_DIAMETER, h=NUT_SIZE, $fn=100);
    }
    }
    }
}

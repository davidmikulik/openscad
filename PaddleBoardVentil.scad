/*
 * Paddle board ventil
 * (c) 2020 David Mikulik
 * Licensed under 
 *   Creative Commons 
 *   Attribution Non Comercial Share alike license
 */
 
include <BOSL/constants.scad>

use <BOSL/metric_screws.scad>
use <BOSL/shapes.scad> 

THIKNES=6;
VENTIL_DIAMETER=17.5;
VENTIL_HEIGTH=12;
SCREW_SIZE=27;
SCREW_HEIGHT=6;
WITH_INNER_SCREW=1;
INNER_SCREW_SIZE=14.4;
$fn=360;


tube(h=VENTIL_HEIGTH, od=VENTIL_DIAMETER+THIKNES*2, wall=THIKNES);
difference() 
{
    metric_bolt(size=SCREW_SIZE,l=SCREW_HEIGHT,headtype="none", align="base");
    translate([0,0,-SCREW_HEIGHT*2]) {   
        cylinder(h=SCREW_HEIGHT+VENTIL_HEIGTH, d=VENTIL_DIAMETER);
    }
}
if (WITH_INNER_SCREW) {
    translate([0,0,-SCREW_HEIGHT]) {
        difference() 
        {
        cylinder(h=SCREW_HEIGHT+VENTIL_HEIGTH, d=VENTIL_DIAMETER);
        translate([0,0,SCREW_HEIGHT+VENTIL_HEIGTH]) {
        metric_bolt(size=INNER_SCREW_SIZE,l=THIKNES+SCREW_HEIGHT+VENTIL_HEIGTH,headtype="none", align="base");
        }
        }
    }
}

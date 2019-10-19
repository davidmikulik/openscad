/*
 * Ikea drawer holder
 * (c) 2019 David Mikulik
 * Licensed under 
 *   Creative Commons 
 *   Attribution Non Comercial Share alike license
 */
include <BOSL/constants.scad>
use <BOSL/shapes.scad>

THIKNES=2;
HOLDER_WIDTH=15.7;
HOLDER_LENGHT=300;
HOLDER_DEPTH=8.7;
HOLDER_PIN_DIAMETER=7.9;
HOLDER_PIN_HEIGTH=7.62;
HOLDER_PINS=true;
HOLDER_HOLE_DIAMETER=4;

difference()
    {
    cube ([HOLDER_WIDTH-THIKNES*2,HOLDER_LENGHT,THIKNES]);
    rotate ([0,0,90]) {
        translate ([91,-HOLDER_WIDTH/2,0]) {
            cylinder(d=HOLDER_HOLE_DIAMETER, h=THIKNES*2, $fn=100);
        translate ([125,0,0]) {
            cylinder(d=HOLDER_HOLE_DIAMETER, h=THIKNES*2, $fn=100);
        }

        }
    }
}
cube ([HOLDER_WIDTH-THIKNES*2,THIKNES,HOLDER_DEPTH]);
cube ([THIKNES,HOLDER_LENGHT,HOLDER_DEPTH]);
translate([HOLDER_WIDTH-THIKNES*2,0,0]) {
    cube ([THIKNES,HOLDER_LENGHT,HOLDER_DEPTH]);
}

if (HOLDER_PINS) {
   translate ([HOLDER_WIDTH/2,27.5,-HOLDER_PIN_HEIGTH]) {
       tube(h=HOLDER_PIN_HEIGTH, od=HOLDER_PIN_DIAMETER, wall=THIKNES);
   translate ([0,128,0]) {
       tube(h=HOLDER_PIN_HEIGTH, od=HOLDER_PIN_DIAMETER, wall=THIKNES);
   translate ([0,128,0]) {
       tube(h=HOLDER_PIN_HEIGTH, od=HOLDER_PIN_DIAMETER, wall=THIKNES);
   }   }
   }
}
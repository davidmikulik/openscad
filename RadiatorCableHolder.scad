 /*
 * Radiator cable holder
 * (c) 2020 David Mikulik
 * Licensed under 
 *   Creative Commons 
 *   Attribution Non Comercial Share alike license
 */
 
THIKNES= 2;
WIDTH=15;
HEIGTH=10;

DIAMETER=15;
CORNER=true;

cube([WIDTH,HEIGTH,THIKNES]);
if (CORNER) 
    cube([THIKNES, HEIGTH,WIDTH]);
translate ([DIAMETER/2,HEIGTH,DIAMETER/2]) {
    rotate([90,CORNER?45:0,0]) {
        difference () {
            cylinder(d=DIAMETER,h=HEIGTH, $fn=100);
            cylinder(d=DIAMETER-THIKNES*2,h=HEIGTH, $fn=100);
        translate ([-THIKNES,0,0]) 
            cube([THIKNES*2,WIDTH,WIDTH]);
        translate ([-WIDTH/2,WIDTH/4,THIKNES]) 
            cube([WIDTH,THIKNES/2,WIDTH/3]);
        }

    }
}
 /*
 * Radiator cable holder
 * (c) 2020 David Mikulik
 * Licensed under 
 *   Creative Commons 
 *   Attribution Non Comercial Share alike license
 */
 
THIKNES= 4;
WIDTH=20;
HEIGTH=30;

DIAMETER=20;

cube([WIDTH,HEIGTH,THIKNES]);
translate ([WIDTH/2,WIDTH/2,DIAMETER-THIKNES*2.5]) {
    rotate([90,0,0]) {
        difference () {
            cylinder(d=DIAMETER,h=WIDTH/2, $fn=100);
            cylinder(d=DIAMETER-THIKNES*2,h=WIDTH/2, $fn=100);
        translate ([-THIKNES,0,0]) 
            cube([THIKNES*2,WIDTH,WIDTH]);
        translate ([-WIDTH/2,THIKNES*1.2,WIDTH/10]) 
            cube([WIDTH,THIKNES/2,WIDTH/3]);
        }

    }
}
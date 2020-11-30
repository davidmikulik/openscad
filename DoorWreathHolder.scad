 /*
 * Door wreath holder
 * (c) 2020 David Mikulik
 * Licensed under 
 *   Creative Commons 
 *   Attribution Non Comercial Share alike license
 */
 
 
THIKNES = 4;
WIDTH = 20;
HEIGTH=70;

CABLE_WIDTH= 12;

cube ([WIDTH,HEIGTH,THIKNES]);
cableTie();
translate ([0,HEIGTH-THIKNES,0])
    cableTie();

module cableTie() {
    translate ([0,0,THIKNES])
        difference () {
            cube ([WIDTH,THIKNES,THIKNES*2]);
            translate ([WIDTH/2-CABLE_WIDTH/2,0,THIKNES/2])
                cube ([CABLE_WIDTH,THIKNES,THIKNES]);
        }
    
}
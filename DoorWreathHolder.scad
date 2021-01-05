 /*
 * Door wreath holder
 * (c) 2020 David Mikulik
 * Licensed under 
 *   Creative Commons 
 *   Attribution Non Comercial Share alike license
 */
 
 
THIKNES = 1;
THIKNES_HOLDER=4;
WIDTH = 20;
HEIGTH=70;

DOOR_DEPTH1 = 27; 
DOOR_HEIGHT = 14;
DOOR_DEPTH2 = 15;

CABLE_WIDTH= 12;

//holderWithHook ();
holderForGlueTape();

module holderWithHook () {
    translate ([0,0,-DOOR_DEPTH1-THIKNES])
        cube ([WIDTH,THIKNES,DOOR_DEPTH1+THIKNES]);
    translate ([0,-DOOR_HEIGHT,-DOOR_DEPTH1-THIKNES])
        cube ([WIDTH,DOOR_HEIGHT,THIKNES]);
    translate ([0,-DOOR_HEIGHT-THIKNES,-DOOR_DEPTH1-THIKNES-DOOR_DEPTH2])
        cube ([WIDTH,THIKNES,DOOR_DEPTH2+THIKNES]);
    translate ([0,-DOOR_HEIGHT-THIKNES,-DOOR_DEPTH1-THIKNES*2-DOOR_DEPTH2])
        cube ([WIDTH,HEIGTH,THIKNES]);
    cube ([WIDTH,HEIGTH*1.5,THIKNES]);
    translate ([0,HEIGTH*1.5,0])
        holderForGlueTape ();
}
module holderForGlueTape  () {
    cube ([WIDTH,HEIGTH,THIKNES_HOLDER]);
    cableTie();
    translate ([0,HEIGTH-THIKNES_HOLDER,0])
        cableTie();
}

module cableTie() {
    translate ([0,0,THIKNES_HOLDER])
        difference () {
            cube ([WIDTH,THIKNES_HOLDER,THIKNES_HOLDER*2]);
            translate ([WIDTH/2-CABLE_WIDTH/2,0,THIKNES_HOLDER/2])
                cube ([CABLE_WIDTH,THIKNES_HOLDER,THIKNES_HOLDER]);
        }
    
}
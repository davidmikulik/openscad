/*
 * Tablet frame - wall mount
 * (c) 2020 David Mikulik
 * Licensed under 
 *   Creative Commons 
 *   Attribution Non Comercial Share alike license
 */


//$fn=100;
THIKNES=2;

EXTERNAL_WIDTH=246;
EXTERNAL_HEIGHT=159;
DEPTH=7.5+10;

WINDOW_WIDTH=227;
WINDOW_HEIGHT=130.5;

WITH_COVER=1;
WITH_BACK=1;
WITH_LOGO=1;


if (WITH_COVER) cover();
if (WITH_BACK) {
    translate ([0,EXTERNAL_HEIGHT+THIKNES*4,0]) {
        back();
    }
}
     
module back () {
    difference () {
        cube ([EXTERNAL_WIDTH, EXTERNAL_HEIGHT, DEPTH]);
        translate ([THIKNES,THIKNES,THIKNES]) {
            cube ([EXTERNAL_WIDTH-THIKNES*2, EXTERNAL_HEIGHT-THIKNES*2, DEPTH-THIKNES]);
        }
    translate ([(EXTERNAL_WIDTH-2),(EXTERNAL_HEIGHT/2-40),DEPTH-4     ]) {
        clip(true);
    }
    vent ();

    }
    
}

module cover () {
    difference () {
        cube ([EXTERNAL_WIDTH+THIKNES*2, EXTERNAL_HEIGHT+THIKNES*2, DEPTH+THIKNES]);
        translate ([(EXTERNAL_WIDTH-WINDOW_WIDTH)/2,(EXTERNAL_HEIGHT-WINDOW_HEIGHT)/2,0]) {
            cube ([WINDOW_WIDTH, WINDOW_HEIGHT, THIKNES]);
        }
        translate ([THIKNES,THIKNES,THIKNES]) {
            cube ([EXTERNAL_WIDTH, EXTERNAL_HEIGHT, DEPTH]);
        }
    if (WITH_LOGO)
    translate ([(EXTERNAL_WIDTH-20)/2,(EXTERNAL_HEIGHT-0),-1]) {
        rotate ([180,0,0]) {
            scale([.1,.1,.02]) {
                surface(file="Atos-logo-220x165.png",invert=true);
            }
        }
    }
    }
    translate ([(EXTERNAL_WIDTH),(EXTERNAL_HEIGHT/2-40),DEPTH-4]) {
        clip(false);
    }
}

module vent () {
        translate ([0,EXTERNAL_WIDTH/8,0]) {
        for (i=[0:10]) {
            move =0;
            
            translate([EXTERNAL_WIDTH/4,i*8+5, move]){
                cube([EXTERNAL_WIDTH-EXTERNAL_WIDTH/2,2, THIKNES*2]);               
            }            
        }
    }
}
module clip(hole) {
    x=3;
    y=80;
    z=2;
    if (hole) {
        x=x+0.2;
        y=y+0.2;
        z=z+0.2;
    cube ([x, y, z]);
    }
    else {
        cube ([x, y, z]);
    }
}
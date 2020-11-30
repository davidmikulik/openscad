 /*
 * Notebook camera cover generator
 * (c) 2020 David Mikulik
 * Licensed under 
 *   Creative Commons 
 *   Attribution Non Comercial Share alike license
 */
 
THIKNES=1;

FRAME_SMALL=4;
FRAME=18;
DEPTH=7;
DEPTH_FRAME=0.63;
WIDTH=17;
FRAME_IMAGE="eye.png";


cube ([FRAME,WIDTH,THIKNES]);
translate ([-THIKNES,0,0])
    cube ([THIKNES,WIDTH,DEPTH+2*THIKNES]);
translate ([0,0,DEPTH+THIKNES])
    difference () 
    {
        cube ([FRAME,WIDTH,THIKNES]);
        translate ([FRAME,0,2.5])
        rotate([0,0,90])
            scale([.09,.09,.02])
                        surface(file=FRAME_IMAGE,invert=true);
    }
translate ([FRAME_SMALL,0,DEPTH+THIKNES-DEPTH_FRAME])
    cube ([FRAME-FRAME_SMALL,WIDTH,DEPTH_FRAME]);

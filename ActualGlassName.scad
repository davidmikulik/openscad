/*
 * Actual glass name
 * (c) 2020 David Mikulik
 * Licensed under 
 *   Creative Commons 
 *   Attribution Non Comercial Share alike license
 */
 

$fn=100;
THIKNES=2;
GLASS_DIAMETER=82;
GLASS_THIKNES=10;

HOLDER_HEIGTH=20;

NAME_WIDTH = 50;
NAME="Martin";

difference () {
    union () {
        difference () {
        cylinder(d=GLASS_DIAMETER, h=HOLDER_HEIGTH);
        cylinder(d=GLASS_DIAMETER-THIKNES, h=HOLDER_HEIGTH-THIKNES);
        }
        difference () {
        cylinder(d=GLASS_DIAMETER-GLASS_THIKNES-THIKNES, h=HOLDER_HEIGTH);
        cylinder(d=GLASS_DIAMETER-THIKNES-GLASS_THIKNES-THIKNES, h=HOLDER_HEIGTH);
        }
        
    }
    cylinder(d=GLASS_DIAMETER-THIKNES-GLASS_THIKNES-THIKNES, h=HOLDER_HEIGTH);
    translate ([-GLASS_DIAMETER/2,-GLASS_DIAMETER/2.6,0])
        cube([GLASS_DIAMETER,GLASS_DIAMETER,GLASS_DIAMETER]);

}
translate ([-NAME_WIDTH/2,-GLASS_DIAMETER/2-.4,0]) {
    //difference () 
    {
        cube([NAME_WIDTH,THIKNES,HOLDER_HEIGTH]);
        translate ([6,0.4,6])
            rotate ([90,0,0])
                linear_extrude(2) 
                    text(NAME);
    }
}
 
/*
 * Door bell rain protection
 * (c) 2019 David Mikulik
 * Licensed under 
 *   Creative Commons 
 *   Attribution Non Comercial Share alike license
 */
 
include <BOSL/constants.scad>
use <BOSL/shapes.scad>

BELL_WIDTH=96.15;
BELL_HEIGHT=34.6;

THIKNES=2;

PROTECTION_WIDTH=110;
PROTECTION_HEIGTH=55;
ROOF_HEIGHT=30;

SCREW_HOLE_DIAMETER = 4;

BASE=false;
TOP_PLATE=true;

if (BASE) {
    difference()
    {
        cube([PROTECTION_WIDTH,PROTECTION_HEIGTH, THIKNES]);
        translate([PROTECTION_WIDTH/2-BELL_WIDTH/2,PROTECTION_HEIGTH-BELL_HEIGHT*1.5 ,0]){
            // cube([BELL_WIDTH,BELL_HEIGHT, THIKNES]);
                //upper hole
                translate([5,5,0]){
                    rotate ([0,0,90]) {
                    cylinder(d=SCREW_HOLE_DIAMETER, h=THIKNES*2, $fn=100);
                    }   
                }
                translate([BELL_WIDTH-5,BELL_HEIGHT-5,0]){
                    rotate ([0,0,90]) {
                    cylinder(d=SCREW_HOLE_DIAMETER, h=THIKNES*2, $fn=100);
                    }   
                } 
        }
    }
    rotate ([0,0,270])
    { 
        difference()
        {
            
            translate([-PROTECTION_HEIGTH/2,THIKNES/2,THIKNES,]) {
            prismoid(size1=[PROTECTION_HEIGTH,THIKNES], size2=[PROTECTION_HEIGTH*0.7,THIKNES], h=ROOF_HEIGHT, shift=[PROTECTION_HEIGTH*0.15,0]);
            }
            rotate ([-90,0,0]) {
            translate ([-10,-ROOF_HEIGHT+3,THIKNES/2]) {
                cylinder(d=THIKNES, h=THIKNES*2, $fn=100);
            }
            translate ([-PROTECTION_HEIGTH*.7+10,-ROOF_HEIGHT+3,THIKNES/2]) {
                cylinder(d=THIKNES, h=THIKNES*2, $fn=100);
            }

            }
        }
        difference()
        {    
            translate([-PROTECTION_HEIGTH/2,PROTECTION_WIDTH-THIKNES/2,THIKNES,]) {
            prismoid(size1=[PROTECTION_HEIGTH,THIKNES], size2=[PROTECTION_HEIGTH*0.7,THIKNES], h=ROOF_HEIGHT, shift=[PROTECTION_HEIGTH*0.15,0]);
            }    
            rotate ([-90,0,0]) {
            translate ([-10,-ROOF_HEIGHT+3,PROTECTION_WIDTH-THIKNES*2]) {
                cylinder(d=THIKNES, h=THIKNES*2, $fn=100);
            }
            translate ([-PROTECTION_HEIGTH*.7+10,-ROOF_HEIGHT+3,PROTECTION_WIDTH-THIKNES*2]) {
                cylinder(d=THIKNES, h=THIKNES*2, $fn=100);
            }

            }        
        }
    }

    translate ([0,PROTECTION_HEIGTH,-THIKNES/2]) {
        rotate ([29,0,0]) {
        cube([PROTECTION_WIDTH,THIKNES,ROOF_HEIGHT*1.5]);
        }
    }
}

if (TOP_PLATE) {
    translate ([0,PROTECTION_HEIGTH*2,0]) {
    difference ()
        {
        cube([PROTECTION_WIDTH,35, THIKNES]);
        translate ([31,18,0]) {
        cylinder(d=20, h=THIKNES*2, $fn=100);
        }
        }
    translate ([THIKNES,0,THIKNES]) {
    cube([THIKNES,35,10]);
    rotate ([0,90,0]) {
    translate ([-10+4.3,7.3,-THIKNES*0.5]) {
        cylinder(d=THIKNES-0.4, h=THIKNES, $fn=100);
    }
    translate ([-10+4.3,25.9,-THIKNES*0.5]) {
        cylinder(d=THIKNES-0.4, h=THIKNES, $fn=100);
    }
    }
    translate ([PROTECTION_WIDTH-THIKNES*3,0,0]) {
    cube([THIKNES,35,10]);
    rotate ([0,90,0]) {
    translate ([-10+4.3,7.3,0]) {
        cylinder(d=THIKNES-0.4, h=THIKNES*2, $fn=100);
    }
    translate ([-10+4.3,25.9,0]) {
        cylinder(d=THIKNES-0.4, h=THIKNES*2, $fn=100);
    }
    }        
    }

    }
    }
}

/*
 * Magnetic holder generator
 * (c) 2020 David Mikulik
 * Licensed under 
 *   Creative Commons 
 *   Attribution Non Comercial Share alike license
 */
 
$fn=100;


THIKNES=2;
TOP_THIKNES=0.5;

MAGNET_DIAMETER = 20.2;
MAGNET_HEIGHT = 4.95;// TWO 9.87;//

MAGNET_COUNT=1;

WITH_RECTANGLE_COVER=1;
WITH_ROUND_CAP=0;
WITH_ROUND_CAP_HOLE=0;
WITH_ROUND_CAP_IMAGE=0;
ROUND_CAP_IMAGE="piseksmall.png";



if (WITH_RECTANGLE_COVER)
    rectangleCover();
for (i=[0:1:MAGNET_COUNT-1]) {
    translate ([(MAGNET_DIAMETER+THIKNES)*i,0,0]) {
    if (WITH_ROUND_CAP)
        magnetroundcap ();
    magnetHolder();
    }
}

module rectangleCover() {
    translate ([-MAGNET_DIAMETER/2-THIKNES,-MAGNET_DIAMETER/2-THIKNES,0]) {
        difference () {
            cube ([(MAGNET_DIAMETER*(MAGNET_COUNT))+(MAGNET_COUNT>1?(THIKNES*MAGNET_COUNT+THIKNES):THIKNES*2),MAGNET_DIAMETER+THIKNES*2,MAGNET_HEIGHT+TOP_THIKNES]);
            translate ([THIKNES,THIKNES,TOP_THIKNES])
            cube ([MAGNET_DIAMETER*(MAGNET_COUNT)+(MAGNET_COUNT>1?THIKNES*MAGNET_COUNT-THIKNES:0),MAGNET_DIAMETER,MAGNET_HEIGHT]);

        }
    }
}
module magnetHolder() {
    translate([0,0,TOP_THIKNES]) {
        difference() 
        {
            cylinder (d=MAGNET_DIAMETER+THIKNES,h=MAGNET_HEIGHT);
            cylinder (d=MAGNET_DIAMETER,h=MAGNET_HEIGHT);
        }
        translate([0,0,MAGNET_HEIGHT-1]) {
            difference() 
            {
                cylinder (d=MAGNET_DIAMETER,h=0.5);
                cylinder (d=MAGNET_DIAMETER-0.3,h=0.5);
            }         
        }
    }
}

module magnetroundcap () {
        difference() 
    {
        cylinder (d=MAGNET_DIAMETER+THIKNES*4,h=TOP_THIKNES);
        if (WITH_ROUND_CAP_HOLE)
            cylinder (d=10,h=TOP_THIKNES);
        if (WITH_ROUND_CAP_IMAGE) {
            translate ([-MAGNET_DIAMETER/2,MAGNET_DIAMETER/2,-1]) {
            rotate ([180,0,0]) {
                scale([.1,.1,.02]) {
                    surface(file=ROUND_CAP_IMAGE,invert=true);
                }
            }  
          }
      }
    }

}
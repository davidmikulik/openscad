/*
 * Prusa MK3S PEI sheet holder
 * (c) 2020 David Mikulik
 * Licensed under 
 *   Creative Commons 
 *   Attribution Non Comercial Share alike license
 */
 
$fn=100;
THIKNES=2;
MAGNET_DIAMETER = 19.77;
MAGNET_HEIGHT = 4.95;
MAGNET_COUNT=20;
SHEET_X=255;
SHEET_Y=210;
STEP= ((SHEET_X*SHEET_Y)/((MAGNET_HEIGHT+THIKNES)*(MAGNET_HEIGHT+THIKNES)))/MAGNET_COUNT;

COUNT_X= round(SHEET_X/STEP);
STEP_X=SHEET_X/COUNT_X;
sheet();

echo (STEP);
echo (COUNT_X);
echo (STEP_X);
echo (round(SHEET_Y/STEP));
translate ([MAGNET_DIAMETER/2+THIKNES,MAGNET_DIAMETER/2+THIKNES,THIKNES]) {
    magnetHolder();
    for(x = [MAGNET_DIAMETER+THIKNES+STEP_X : MAGNET_DIAMETER+STEP_X : SHEET_X-MAGNET_DIAMETER-STEP_X]) {
        translate ([x,0,THIKNES]) {
            magnetHolder();
        }
    }
}
translate ([SHEET_X-MAGNET_DIAMETER/2-THIKNES,MAGNET_DIAMETER/2+THIKNES,THIKNES]) {
            magnetHolder();
}
translate ([SHEET_X-MAGNET_DIAMETER/2-THIKNES,SHEET_Y-MAGNET_DIAMETER/2-THIKNES,THIKNES]) {
            magnetHolder();
}
translate ([MAGNET_DIAMETER/2+THIKNES,SHEET_Y-MAGNET_DIAMETER/2-THIKNES,THIKNES]) {
    magnetHolder();
    for(x = [MAGNET_DIAMETER+THIKNES+STEP_X : MAGNET_DIAMETER+STEP_X : SHEET_X-MAGNET_DIAMETER-STEP_X]) {
        translate ([x,0,THIKNES]) {
            magnetHolder();
        }
    }
}
for(x = [MAGNET_DIAMETER/2+THIKNES*6 : MAGNET_DIAMETER+STEP_X : SHEET_X]) {
    translate ([x,MAGNET_DIAMETER+STEP_X,THIKNES]) {
        magnetHolder();
    }
}
for(x = [MAGNET_DIAMETER/2+THIKNES*6 : MAGNET_DIAMETER+STEP_X : SHEET_X]) {
    translate ([x,(MAGNET_DIAMETER+STEP_X)*2,THIKNES]) {
        magnetHolder();
    }
}

module magnetHolder() {
    difference() 
    {
        cylinder (d=MAGNET_DIAMETER+THIKNES,h=MAGNET_HEIGHT);
        cylinder (d=MAGNET_DIAMETER,h=MAGNET_HEIGHT);
    }         
}

module sheet() {
    cube([SHEET_X, SHEET_Y, THIKNES]);
    translate ([0,-THIKNES,0]) {
        cube([SHEET_X, THIKNES, MAGNET_HEIGHT+THIKNES]);
    }
    translate ([0,SHEET_Y,0]) {
        cube([SHEET_X, THIKNES, MAGNET_HEIGHT+THIKNES]);
    }
}
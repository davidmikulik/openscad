/*
 * Mini thermomether magnetic holder
 * (c) 2020 David Mikulik
 * Licensed under 
 *   Creative Commons 
 *   Attribution Non Comercial Share alike license
 */
 
$fn=100;
THIKNES=2;
MAGNET_DIAMETER = 20;
MAGNET_HEIGHT = 9.87;//4.95;
THERMOMETHER_WIDTH=57.17;
THERMOMETHER_HEIGTH=32.38;
THERMOMETHER_DEPTH=11.6;


difference () {
    translate([-THERMOMETHER_WIDTH/2,-THERMOMETHER_HEIGTH/2,0]) {
        thermometherHolder();
    }
}
translate([0,THERMOMETHER_HEIGTH+THIKNES*2,0]) {
    magnetHolder();
}

module magnetHolder() {
    difference() 
    {
        cylinder (d=MAGNET_DIAMETER+THIKNES*4,h=THIKNES);
        cylinder (d=10,h=THIKNES);
    }
    translate([0,0,THIKNES]) {
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
module thermometherHolder () {
    difference () {
        cube([THERMOMETHER_WIDTH+THIKNES*2, THERMOMETHER_HEIGTH+THIKNES*2, THERMOMETHER_DEPTH+THIKNES*2]);
        translate([THIKNES,THIKNES,THIKNES]) {
            cube([THERMOMETHER_WIDTH, THERMOMETHER_HEIGTH, THERMOMETHER_DEPTH+THIKNES]);
        }
    translate([THERMOMETHER_WIDTH/2,THERMOMETHER_WIDTH/2-MAGNET_DIAMETER/2,-MAGNET_HEIGHT/2]) {
        cylinder (d=MAGNET_DIAMETER+THIKNES,h=MAGNET_HEIGHT+THIKNES);
    }
    }

}
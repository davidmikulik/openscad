/*
 * Measuring tape magnetic cover
 * (c) 2020 David Mikulik
 * Licensed under 
 * Creative Commons 
 * Attribution Non Comercial Share alike license
 */
 
 
THIKNES = 0.5;

MAGNET_DIAMETER=6.6;
MAGNET_THIKNES=1;

METER_WIDTH=24;
METER_DIAMETER=35;

$fn=100;
 
body ();
translate ([METER_DIAMETER*1.5,0,0])
cover ();
module body () {
    difference () 
        {
        cylinder(d=METER_DIAMETER+THIKNES*2, h=METER_WIDTH);
        translate ([0,0,THIKNES])
            cylinder(d=METER_DIAMETER, h=METER_WIDTH);
        }
    difference () 
        {
        cylinder(d=MAGNET_DIAMETER+THIKNES*2, h=METER_WIDTH+MAGNET_THIKNES-(METER_WIDTH/4+MAGNET_THIKNES));
        translate ([0,0,METER_WIDTH-(METER_WIDTH/4+MAGNET_THIKNES)])
            cylinder(d=MAGNET_DIAMETER, h=MAGNET_THIKNES);
        }
 }
module cover () {
    difference () 
        {
        cylinder(d=METER_DIAMETER+THIKNES*7, h=METER_WIDTH/4);
        translate ([0,0,THIKNES])
            cylinder(d=METER_DIAMETER+THIKNES*5, h=METER_WIDTH/4);
        }
    difference () 
        {
        cylinder(d=MAGNET_DIAMETER+THIKNES*2, h=METER_WIDTH/4+MAGNET_THIKNES);
        translate ([0,0,METER_WIDTH/4])
            cylinder(d=MAGNET_DIAMETER, h=MAGNET_THIKNES);
        }
 } 
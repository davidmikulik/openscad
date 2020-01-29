/*
 * Raspberry Pi 4 Wall holder
 * (c) 2020 David Mikulik
 * Licensed under 
 * Creative Commons 
 * Attribution Non Comercial Share alike license
 */
 

include <BOSL/constants.scad>
use <BOSL/shapes.scad>
THIKNES=2;
LENGHT=70;
WALL_PART=20;
WIDTH=10;
HEIGHT=31;
SCREW_HOLE=3;

cube ([THIKNES,WIDTH,HEIGHT]);
translate([THIKNES,0,0]){
    cube ([LENGHT,WIDTH,THIKNES]);
    translate([LENGHT,0,0]){
        cube ([THIKNES,WIDTH,HEIGHT]);
    }
}
translate([-WALL_PART+THIKNES,0,HEIGHT]){
difference()
{
    cube ([WALL_PART,WIDTH,THIKNES]);
    rotate ([0,0,90]) {
        translate ([WIDTH/2,-WALL_PART/2,0]) {
            cylinder(d=SCREW_HOLE, h=THIKNES*2, $fn=100);    
        }
    }
}
}
translate([LENGHT+THIKNES,0,HEIGHT]){
difference()
{
    cube ([WALL_PART,WIDTH,THIKNES]);
    rotate ([0,0,90]) {
        translate ([WIDTH/2,-WALL_PART/2,0]) {
            cylinder(d=SCREW_HOLE, h=THIKNES*2, $fn=100);    
        }
    }
}
}

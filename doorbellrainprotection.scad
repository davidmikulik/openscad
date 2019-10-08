/*
 * Door bell rain protection
 * (c) 2019 David Mikulik
 * Licensed under 
 *   Creative Commons 
 *   Attribution Non Comercial Share alike license
 */
 
include <BOSL/constants.scad>
use <BOSL/shapes.scad>

BELL_WIDTH=40.12;
BELL_HEIGHT=72.8;
THIKNES=2;

ROOF_WIDTH=88;
ROOF_HEIGHT=40;

SCREW_HOLE_UP = 9.66; //from upper side
SCREW_HOLE_DOWN = 16; //from down side
SCREW_HOLE_DIAMETER = 4;

//cube([ROOF_WIDTH,ROOF_HEIGHT, THIKNES]);
difference()
{
    translate([ROOF_WIDTH/2,ROOF_HEIGHT,0]){rotate ([0,0,180]) {
    pie_slice(ang=180, l=ROOF_HEIGHT, r=ROOF_WIDTH/2, $fn=100);
    }}

    translate([ROOF_WIDTH/2,ROOF_HEIGHT,THIKNES]){rotate ([0,0,180]) {
    pie_slice(ang=180, l=ROOF_HEIGHT-THIKNES, r=ROOF_WIDTH/2-THIKNES, $fn=100);
    //arced_slot(r=ROOF_WIDTH/2, h=ROOF_HEIGHT, sd1=0, sd2=THIKNES, sa=THIKNES, ea=180,$fn=200);
    }}
}
translate([ROOF_WIDTH/2-BELL_WIDTH/2,ROOF_HEIGHT,0]){
    difference()
        {
        cube([BELL_WIDTH,BELL_HEIGHT, THIKNES]);
            //upper hole
            translate([BELL_WIDTH/2,SCREW_HOLE_UP,0]){
                rotate ([0,0,90]) {
                cylinder(d=SCREW_HOLE_DIAMETER, h=THIKNES*2, $fn=100);
                }   
            }
            translate([BELL_WIDTH/2,BELL_HEIGHT-SCREW_HOLE_DOWN,0]){
                rotate ([0,0,90]) {
                cylinder(d=SCREW_HOLE_DIAMETER, h=THIKNES*2, $fn=100);
                }   
            } 
    }
}

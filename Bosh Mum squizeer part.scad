/*
 * Bosh Mum suizer part
 * (c) 2019 David Mikulik
 * Licensed under 
 *   Creative Commons 
 *   Attribution Non Comercial Share alike license
*/

include <BOSL/constants.scad>
use <BOSL/metric_screws.scad>
use <BOSL/shapes.scad>

THIKNES=2;
HOLE_DIMETER = 8;
PART_DIAMETER = 43;
PART_HEIGHT=11;
LEFT=0;
SCREW_SIZE=4;
SCREW_LENGHT= 32;

if (!LEFT) {
rotate ([90,0,90]) {
translate ([PART_DIAMETER/2.5,PART_HEIGHT/2, -9]) {
 cylinder(d=SCREW_SIZE, h=PART_DIAMETER/4, $fn=100);
}
translate ([-PART_DIAMETER/2.5,PART_HEIGHT/2, -9]) {
 cylinder(d=SCREW_SIZE, h=PART_DIAMETER/4, $fn=100);
}
}
}

difference()
{
cylinder(d=PART_DIAMETER, h=PART_HEIGHT, $fn=100);
cylinder(d=HOLE_DIMETER, h=PART_HEIGHT, $fn=100);

if (LEFT) {
rotate ([90,0,90]) {
translate ([PART_DIAMETER/2.5,PART_HEIGHT/2, -9]) {
 cylinder(d=SCREW_SIZE, h=PART_DIAMETER/4, $fn=100);
}
translate ([-PART_DIAMETER/2.5,PART_HEIGHT/2, -9]) {
 cylinder(d=SCREW_SIZE, h=PART_DIAMETER/4, $fn=100);
}
}
}

// Screws
rotate ([90,0,90]) {
translate ([PART_DIAMETER/4,PART_HEIGHT/2, PART_DIAMETER/2-9]) {
metric_bolt(headtype="socket", size=SCREW_SIZE, l=SCREW_LENGHT);
translate ([0,0,-PART_DIAMETER+15])
{
    metric_nut(size=SCREW_SIZE, hole=false);
    translate ([0,0,-3])
    {
        metric_nut(size=SCREW_SIZE, hole=false);
    }
        translate ([0,0,-6])
    {
        metric_nut(size=SCREW_SIZE, hole=false);
        translate ([0,0,37]) {
        cylinder(d=SCREW_SIZE*2, h=6, $fn=100);
        translate ([0,0,-5]) {
        cylinder(d=SCREW_SIZE, h=5, $fn=100);
        }
    }
    }
}    
}
translate ([-PART_DIAMETER/4,PART_HEIGHT/2, PART_DIAMETER/2-9]) {
metric_bolt(headtype="socket", size=SCREW_SIZE, l=SCREW_LENGHT);
translate ([0,0,-PART_DIAMETER+15])
{
    metric_nut(size=SCREW_SIZE, hole=false);
    translate ([0,0,-3])
    {
        metric_nut(size=SCREW_SIZE, hole=false);
    }
        translate ([0,0,-6])
    {
        metric_nut(size=SCREW_SIZE, hole=false);
        translate ([0,0,37]) {
        cylinder(d=SCREW_SIZE*2, h=6, $fn=100);
        translate ([0,0,-5]) {
        cylinder(d=SCREW_SIZE, h=5, $fn=100);
        }
    }
    }
    
}     
}
}
    


if (LEFT) {
    translate ([0,-PART_DIAMETER/2, 0]) {
        cube ([PART_DIAMETER,PART_DIAMETER, PART_HEIGHT]);    
    }
}
else
    {
    translate ([-PART_DIAMETER,-PART_DIAMETER/2, 0]) {
        //union() {
            cube ([PART_DIAMETER,PART_DIAMETER, PART_HEIGHT]);       
        //}
        
    }
}
}


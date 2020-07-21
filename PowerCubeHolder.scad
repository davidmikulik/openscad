/*
 * Power cube holder
 * (c) 2020 David Mikulik
 * Licensed under 
 *   Creative Commons 
 *   Attribution Non Comercial Share alike license
 */
 
 
include <BOSL/constants.scad>



use <BOSL/metric_screws.scad>
use <BOSL/shapes.scad>

WIDTH=62;
HEIGHT=50;
HOLE=39;
THIKNES=2;
WIRE=16;

$fn = 40;

difference () {
    union () {
        cuboid ([WIDTH,WIDTH, HEIGHT], fillet=THIKNES/2);
        translate ([0,0,HEIGHT/2]) {
            //cube ([WIDTH+THIKNES*2,WIDTH+THIKNES*2, THIKNES]);
            cuboid([WIDTH+THIKNES*2,WIDTH+THIKNES*2, THIKNES], fillet=THIKNES/2);
        }
    }
    translate ([0,0,-HEIGHT]) {
        cylinder(h=HEIGHT*10, d=39,$fn = 100);
    }
    translate ([0,0,THIKNES]) {
        cuboid ([WIDTH-THIKNES*2,WIDTH-THIKNES*2, HEIGHT], fillet=THIKNES/2);
    }
    
    translate ([0,0,HEIGHT/2]) {
        rotate ([90,0,0]) {
            cylinder(h=HEIGHT*10, d=WIRE,$fn = 100);
        }
}
}


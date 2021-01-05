/*
 * Compresor filter part
 * (c) 2020 David Mikulik
 * Licensed under 
 *   Creative Commons 
 *   Attribution Non Comercial Share alike license
 */
 
include <BOSL/constants.scad>
include <knee.scad>


use <BOSL/metric_screws.scad>
use <BOSL/shapes.scad>

difference () {
    union () {
        metric_bolt(size=19.6,l=12.6,headtype="none", align="base");
        cylinder(d=25, h=22,$fn=6);
        translate ([0,0,23])
            cube ([53,83,3], true);
    }

    translate ([0,0,-12.6])
        cylinder(d=13.5, h=46, $fn=100);
}

rotate ([0,180,0]) {
    translate ([60,0,-10.6]) {
    difference () 
    {
        cube ([59,89,28], true);
        translate ([0,0,3])
            cube ([53,83,25], true);
        translate ([0,0,-20])
            cylinder(d=13.5, h=46, $fn=100);
    }
    translate ([0,0,13])
    difference () 
    {
        cube ([53,83,1], true);
        cube ([52,82,1], true);
    }
}
}

/*
 * Aygo dashboard button
 * (c) 2019 David Mikulik
 * Licensed under 
 *   Creative Commons 
 *   Attribution Non Comercial Share alike license
*/

include <BOSL/constants.scad>
use <BOSL/metric_screws.scad>
use <BOSL/shapes.scad>

tube(h=22.2, od=45.5, wall=2, $fn=200);
tube(h=2, od=45.5, wall=6.4, $fn=200);
translate([0,0,0.5]){
    tube(h=2, od=45.5-6.4-2.4-2, wall=3, $fn=200);
}
translate([0,0,-1]){
tube(h=4, od=29, wall=29, $fn=200);
}
holder(true);
holder(false);
module holder (left) {
    move = left ? -45.5/2-8: 45.5/2-2;
    hmove = left ? 0: 22.2-3.7-5;
    translate([move,-5,hmove]){
        difference() {
            cube([10,14,5]);
            move = left ? 4:6;
            translate ([move,3,0]) {
                cylinder(h=5,d=4.8, $fn=100);
            }
            translate ([move,10,0]) {
                cylinder(h=5,d=5.5, $fn=100);
            }
        }
    }
}

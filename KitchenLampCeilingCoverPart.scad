/*
 * Kitchen lamp ceiling cover
 * (c) 2019 David Mikulik
 * Licensed under 
 *   Creative Commons 
 *   Attribution Non Comercial Share alike license
*/


include <BOSL/constants.scad>
use <BOSL/metric_screws.scad>
use <BOSL/shapes.scad>

WALL=2;
TUBEDIAMETER= 22.8;
TUBELENGTH= 50;

TOPPARTLENGTH=90;
TOPPARTDIAMETERTOP=85;
TOPPARTDIAMETERDOWN=75;
TUBE = false;
TOPPART= true;

if (TUBE) {
    tube(h=TUBELENGTH, od=TUBEDIAMETER, wall=WALL, $fn=100);
    tube(h=5, od=TUBEDIAMETER+8, wall=WALL+4, $fn=100);
}

if (TOPPART) {
    translate([TUBEDIAMETER+10+TOPPARTDIAMETERDOWN,0,0]){
        tube(h=TOPPARTLENGTH, od1=TOPPARTDIAMETERTOP, od2=TOPPARTDIAMETERDOWN, id1=TOPPARTDIAMETERTOP-WALL, id2=TOPPARTDIAMETERDOWN-WALL, $fn=360);
        tube(h=5, od=TOPPARTDIAMETERDOWN+28, wall=WALL+8, $fn=360);
        translate([0,0,TOPPARTLENGTH]){
         tube(h=5, od=TOPPARTDIAMETERTOP-10, wall=TOPPARTDIAMETERTOP/2-TUBEDIAMETER/2-11, $fn=360);   
        }
    }
}



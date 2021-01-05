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

WALL=1;
TUBEDIAMETER= 22.8;
TUBELENGTH= 50;

TOPPARTLENGTH=90;
TOPPARTDIAMETERTOP=85;
TOPPARTDIAMETERDOWN=75;

SCREWTUBEHEIGTH=60;
SCREWTUBEDIAMETER=25;
SCREWTUBESCREWLENGTH=21;



TUBE = false;
TOPPART= false;
SCREWTUBE=true;
TOPTUBE=false;

TOPTUBEDIAMETER=102;
TOPTUBEHEIGHT=60;

if (TOPTUBE) {
    tube(h=10, od=TOPTUBEDIAMETER+WALL*2, wall=WALL, $fn=100);
    translate([0,0,6])
    tube(h=TOPTUBEHEIGHT, od=TOPTUBEDIAMETER, wall=WALL, $fn=100);
}
if (SCREWTUBE) {
    //tube(h=SCREWTUBEHEIGTH, od=SCREWTUBEDIAMETER, wall=WALL, $fn=100);
    difference () 
    {
        cylinder(d=SCREWTUBEDIAMETER+WALL*2,h=SCREWTUBEHEIGTH,$fn=100);
        translate([0,0,SCREWTUBESCREWLENGTH-WALL*2])
        cylinder(d=SCREWTUBEDIAMETER,h=SCREWTUBEHEIGTH,$fn=100);
        translate([0,0,SCREWTUBESCREWLENGTH-WALL*2])
            metric_bolt(headtype="", size=SCREWTUBEDIAMETER, l=20, details=true);
    }
}

if (TUBE) {
    tube(h=TUBELENGTH, od=TUBEDIAMETER, wall=WALL, $fn=100);
    tube(h=5, od=TUBEDIAMETER+8, wall=WALL+4, $fn=100);
}

if (TOPPART) {
    translate([TUBEDIAMETER+10+TOPPARTDIAMETERDOWN,0,0]){
        tube(h=TOPPARTLENGTH, od1=TOPPARTDIAMETERTOP, od2=TOPPARTDIAMETERDOWN, id1=TOPPARTDIAMETERTOP-WALL, id2=TOPPARTDIAMETERDOWN-WALL, $fn=360);
        tube(h=5, od=TOPPARTDIAMETERDOWN+28, wall=WALL+8, $fn=360);
        translate([0,0,5]){
            tube(h=22, id1=TOPPARTDIAMETERDOWN+24, od2=TOPPARTDIAMETERDOWN, wall=WALL,$fn=360);
        }
        translate([0,0,TOPPARTLENGTH]){
         tube(h=5, od=TOPPARTDIAMETERTOP-10, wall=TOPPARTDIAMETERTOP/2-TUBEDIAMETER/2-7, $fn=360);   
        }
    }
}



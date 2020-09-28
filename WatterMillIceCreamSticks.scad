/*
 * Wattermill ice cream stics
 * (c) 2020 David Mikulik
 * Licensed under 
 *   Creative Commons 
 *   Attribution Non Comercial Share alike license
 */
 
include <BOSL/constants.scad>

use <BOSL/metric_screws.scad>
use <BOSL/shapes.scad> 

$fn=200;
THIKNES=6;
MILL_INT_DIAMETER=25.6;
MILL_EXT_DIAMETER=80;
MILL_DEPTH=15;
STICK_WIDTH=5;
STICK_THICKNES=1.5;
CUBE_WIDTH=5;
CUBE_LENGHT=MILL_EXT_DIAMETER/2+MILL_INT_DIAMETER/2;
COUNT_OF_STICKS=12;
PI=0+3.1415926;
//translate ([-MILL_INT_DIAMETER/4,-MILL_INT_DIAMETER/4,0]) 
{
    tube(h=MILL_DEPTH, od=MILL_INT_DIAMETER+THIKNES*2, wall=THIKNES);
    tube(h=MILL_DEPTH, od=MILL_EXT_DIAMETER, wall=THIKNES);
}
for (i = [1:COUNT_OF_STICKS]) {
    th = 360 / COUNT_OF_STICKS * i;
    translate([(MILL_INT_DIAMETER)*cos(th), (MILL_INT_DIAMETER)*sin(th), 0]) {
        //sphere(r = 0.5*10) ;
            rotate ([0,0,th]) {
                translate ([0,MILL_INT_DIAMETER/2+THIKNES,MILL_DEPTH/2])
                {
                    cube(size=[CUBE_LENGHT,CUBE_WIDTH,MILL_DEPTH], center=true);
                }
            }
    }
}

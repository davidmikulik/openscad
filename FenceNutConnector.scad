/*
 * Fence nut connector
 * (c) 2020 David Mikulik
 * Licensed under 
 *   Creative Commons 
 *   Attribution Non Comercial Share alike license
 */
 
 
include <BOSL/constants.scad>


use <BOSL/metric_screws.scad>
use <BOSL/shapes.scad>

THIKNES=4;
NUT_DIAMETER=11;
HOLDER_SIZE=50;


tube(h=THIKNES, od=HOLDER_SIZE, wall=HOLDER_SIZE/2-NUT_DIAMETER/2, $fn=360);
metric_nut(size=NUT_DIAMETER, hole=true, pitch=1.5, flange=3, details=true);
/*
 * Globus holder
 * (c) 2020 David Mikulik
 * Licensed under 
 *   Creative Commons 
 *   Attribution Non Comercial Share alike license
 */
 
include <BOSL/constants.scad>
use <BOSL/shapes.scad>
THIKNES=10;
SIZE=220;
GLOBUS_HOLE=3;

$fn = 100;
//holder ();
distance ();

module distance () 
{
    difference()
    {
        cylinder(d=GLOBUS_HOLE*5, h=4, $fn=100);
        cylinder(d=GLOBUS_HOLE*2, h=15, $fn=100);
    }
}
module holder () {
    difference()
    {
        pie_slice(ang=180, l=20, r=SIZE/2+THIKNES, $fn=100);
        pie_slice(ang=180, l=20, r=SIZE/2, $fn=100);

    }

    translate([SIZE/2-THIKNES,5,10]){
            rotate ([0,90,0]) {
    cylinder(d=GLOBUS_HOLE, h=15, $fn=100);
            }}
    translate([-SIZE/2,10,10]){
            rotate ([0,90,0]) {
    cylinder(d=GLOBUS_HOLE*5, h=10, $fn=100);
            }}
    translate([-SIZE/2+10,10,10]){
            rotate ([0,90,0]) {
    cylinder(d=GLOBUS_HOLE, h=15, $fn=100);
            }}
    translate([-SIZE/2-THIKNES*2,10,10]){
            rotate ([0,90,0]) {
                cylinder(d=GLOBUS_HOLE*20, h=15, $fn=100);
            }}
}
    
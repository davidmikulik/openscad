/*
 * Kitchen socket part
 * (c) 2020 David Mikulik
 * Licensed under 
 *   Creative Commons 
 *   Attribution Non Comercial Share alike license
 */
 
$fn=100;
THIKNES=4;

difference() {
    cylinder (d=90,h=10);
    cylinder (d=70,h=10);
    translate ([-45,-5,0]) {cube([90,90,10]);}
    translate ([0,-50,0]) {cylinder (d=25,h=10);}
}
rotate ([90,0,90]) {
translate ([-4,5,39.5-5])  {cylinder (d=10,h=10);}
translate ([-4,5,-39.5-5]) {cylinder (d=10,h=10);}
}
    
rotate ([90,0,90]) {
    translate ([-3,5,-45+9])     {cylinder (d=5.85,h=2.7);cylinder (d=5,h=8.5);}
    translate ([-3,5,45-10-7.5]) {translate([0,0,7.5-2.7]) {cylinder (d=5.85,h=2.7);}cylinder (d=5,h=8.5);}
}

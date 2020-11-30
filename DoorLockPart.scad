/*
 * Door lock part
 * (c) 2020 David Mikulik
 * Licensed under 
 *   Creative Commons 
 *   Attribution Non Comercial Share alike license
 */
 
cube([24.5,14,1.4]);
$fn=100;
 
difference () {
translate([24.5/2-17.7/2,0,1.4])
    cube([17.7,14,13.7-2.7]);
translate([24.5/2-17.7/2,0,1.4])
    rotate([38,0,0])
        cube([27.7,24,13.7-1.4]);
}
    translate([24.5/2,14+13,14/2]) {
        rotate([90,0,0]) {
            difference () {
                cylinder(d=9,h=13);
                translate([0,0,-5]) {
                cylinder(d=5.6,h=23);}
            }
        }
}

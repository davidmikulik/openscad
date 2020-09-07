/*
 * Wardrobe shelf brace
 * (c) 2020 David Mikulik
 * Licensed under 
 *   Creative Commons 
 *   Attribution Non Comercial Share alike license
 */
 
THIKNES=6;

WIDTH=30;
LENGHT=88;
HEIGTH=18;
SCREWS=3;
LAP=20;
$fn=50;
cube ([WIDTH,LENGHT, HEIGTH]);
translate([0,0,-LAP-THIKNES/2]) {
    difference () {    
        cube ([WIDTH,THIKNES, THIKNES+HEIGTH+LAP*2]);
        rotate ([90,0,0]) {
            translate([WIDTH/2,LAP/2,-THIKNES*2]) {
                cylinder(h=THIKNES*2, d=SCREWS);
            }
            translate([WIDTH/2,LAP*1.5+HEIGTH+THIKNES,-THIKNES*2]) {
                cylinder(h=THIKNES*2, d=SCREWS);
            }
        }
    }
}
translate([0,0,HEIGTH]) {
    cube ([WIDTH,LENGHT+LAP, THIKNES]);
}
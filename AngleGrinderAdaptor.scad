/*
 * Angle grinder adaptor
 * (c) 2020 David Mikulik
 * Licensed under 
 * Creative Commons 
 * Attribution Non Comercial Share alike license
 */
 
$fn=100;
union () {
    difference() 
    {
        cylinder (d=82,h=6);
        cylinder (d=16,h=6);
    }
    translate ([-10,-40,00]) {
        cube ([20,12,33+13]);
    }
    rotate([90,0,0]) { translate ([0,38,40-6]) {
        difference() 
        {
            cylinder (d=13,h=40);
            cylinder (d=9.7,h=40);
        }
    }}
}
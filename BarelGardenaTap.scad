/*
 * Barel gardena connector
 * (c) 2020 David Mikulik
 * Licensed under 
 *   Creative Commons 
 *   Attribution Non Comercial Share alike license
 */
 
 
include <BOSL/constants.scad>
include <knee.scad>


use <BOSL/metric_screws.scad>
use <BOSL/shapes.scad>

$fn = 20;

THIKNES=2;
BAREL_DIMETER = 180;
HOLDER_ANGLE=60;
HOLDER_HEIGHT=30;


translate([BAREL_DIMETER/4,BAREL_DIMETER/2,0]){

translate([BAREL_DIMETER-18,BAREL_DIMETER/3,HOLDER_HEIGHT]) {
    rotate ([0,0,90]) {
    cube ([THIKNES*6,HOLDER_HEIGHT*3, HOLDER_HEIGHT/4]);
    difference () {
    cube ([THIKNES*4,HOLDER_HEIGHT*3, BAREL_DIMETER/4]);
    translate([0,BAREL_DIMETER/4,HOLDER_HEIGHT]){
       rotate ([90,0,90]) {
       cylinder(h=THIKNES*10, r=10/2);
        }
    }        
    }
    translate([0,BAREL_DIMETER/4,HOLDER_HEIGHT]){
    rotate ([0,90,0]) {
    snap_connector();
    translate([0,0,-53]){
    tube(h=60, or=10, wall=THIKNES);
    translate([10,10,0]){
    rotate ([90,90,0]) {
    knee(50, 20, THIKNES, 90);
    } 
    }  
    }
    }
    }
}
}
translate([BAREL_DIMETER/1.5,-BAREL_DIMETER/1.7,0]){
rotate ([0,0,60]) {
difference () {
pie_slice(ang=HOLDER_ANGLE, l=HOLDER_HEIGHT, r=BAREL_DIMETER, orient=ORIENT_Z);
translate([-THIKNES,0,0]){
pie_slice(ang=HOLDER_ANGLE, l=HOLDER_HEIGHT, r=BAREL_DIMETER, orient=ORIENT_Z);
}
}
}
}
translate([BAREL_DIMETER/1.5,BAREL_DIMETER/3,HOLDER_HEIGHT*2]){
//tady to bylo
}
}





module snap_connector(){
	difference() {
		union() {
			translate([0,0,25]) cylinder(h=1.5, r=15.7/2);
			translate([0,0,20]) cylinder(h=3.2, r=15.7/2);
			translate([0,0,19]) cylinder(h=3, r=17/2);
			translate([0,0, 6]) cylinder(h=2.88, r=19.5/2);
			cylinder(r=13/2, h=28);
			//cylinder(h=2.88, r=29/2);
			translate([0,0,26.5]) rotate_extrude(convexity = 10)
					translate([6.3, 0, 0])
					circle(r = 1.5);
//			translate([0,0,9+2.88]) collar(3, 19.4);
//			rotate([0, 180, 0])translate([0,0,-16]) collar(3, 17.2);
		}
		cylinder(r=9/2, h=29);
// Indent in base - remove if you are adding this to something else.
		//cylinder(r=18/2, h=1);
	}

// Membrain, only needed if using indent above.
/*	translate([0, 0, 0.95])cylinder(r=26/2, h=0.2);
	rotate([0, 0,   0])translate([6 ,-1.3, 3])cube([3.7, 2.6, 3]);
	rotate([0, 0,  90])translate([6 ,-1.3, 3])cube([3.7, 2.6, 3]);
	rotate([0, 0, 180])translate([6 ,-1.3, 3])cube([3.7, 2.6, 3]);
	rotate([0, 0, 270])translate([6 ,-1.3, 3])cube([3.7, 2.6, 3]);*/
}


 
 

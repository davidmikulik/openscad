/*
 * Chain guard
 * (c) 2020 David Mikulik
 * Licensed under 
 * Creative Commons 
 * Attribution Non Comercial Share alike license
 */
 
include <BOSL/constants.scad>

use <BOSL/metric_screws.scad>
use <BOSL/shapes.scad> 

$fn=360;
THIKNES=3.3;
THIKNES_SMALL=7;

DIAMETER = 210;
DIAMETER_SMALL = 196;
WALL=13;
WALL_SMALL=6;
SCREW_DIAMETER=5.6;

SCREW_HEAD_DIAMETER=9.24;
SCREW_HOLDER_DIAMETER=15;
SCREW_HOLDER_THIKNES=16;
SCREW_MOVE=9.3;

PEDAL_WIDTH=45;

difference () {
    cylinder(h=THIKNES, d=DIAMETER);
    cylinder(h=THIKNES, d=DIAMETER-WALL*2);
    translate ([DIAMETER/2-PEDAL_WIDTH,DIAMETER/2-PEDAL_WIDTH,0]) {
        rotate([0,0,45]) {
        cube([PEDAL_WIDTH,PEDAL_WIDTH, THIKNES_SMALL+THIKNES],center=true);
        }
    }
}
translate ([0,0,-THIKNES_SMALL]) {
    difference () {
        cylinder(h=THIKNES_SMALL, d=DIAMETER_SMALL);
        cylinder(h=THIKNES_SMALL, d=DIAMETER_SMALL-WALL_SMALL*2);
    }
    translate ([DIAMETER_SMALL/2-PEDAL_WIDTH+10,DIAMETER_SMALL/2-PEDAL_WIDTH+10,THIKNES]) {
        rotate([0,0,45]) {
        cube([PEDAL_WIDTH/4,PEDAL_WIDTH, THIKNES_SMALL],center=true);
        }
    }        
}
for (i = [1:4]) {
    th = 360 / 4 * i;
    screwHolder(th);
}
module screwHolder(th) {
        
        translate([(DIAMETER_SMALL/2-THIKNES*2)*cos(th), (DIAMETER_SMALL/2-THIKNES*2)*sin(th), THIKNES/2]) {
            echo (th);
            echo (th%180==0?90:0);
                rotate ([0,0,th%180==0?90:0]) 
                    {
                    {
                        difference () {
                            union () {
                            cube(size=[SCREW_HOLDER_DIAMETER,SCREW_HOLDER_DIAMETER+DIAMETER-DIAMETER_SMALL,THIKNES+THIKNES/2], center=true);
                            translate([0,th>=270?SCREW_MOVE:-SCREW_MOVE,-THIKNES_SMALL+THIKNES/2]) {
                            cylinder(d=SCREW_HOLDER_DIAMETER, h=SCREW_HOLDER_THIKNES, center=true);
                            }
                            }
                            translate([0,th>=270?SCREW_MOVE:-SCREW_MOVE,-THIKNES_SMALL+THIKNES/2]) {
                            cylinder(d=SCREW_DIAMETER, h=SCREW_HOLDER_THIKNES, center=true);
                            translate([0,0,THIKNES]) {
                            cylinder(d=SCREW_HEAD_DIAMETER, h=SCREW_HOLDER_THIKNES, center=true);
                            }
                            }
                        }
                    }
                }
        }
}
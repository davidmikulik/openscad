/*
 * Table football ball entry
 * (c) 2020 David Mikulik
 * Licensed under 
 *   Creative Commons 
 *   Attribution Non Comercial Share alike license
 */
include <BOSL/constants.scad>
use <BOSL/shapes.scad>
 
 THIKNES=1.7;
 
 tubeDiameter =52;
 tubeHeigth=19.4;
 tubeMargin=80;
 pinDiamater=2;
 
 tube(h=tubeHeigth, od=tubeDiameter, wall=THIKNES, $fn=200);
 difference () 
 {
    tube(h=THIKNES*2, od=tubeMargin, wall=(tubeMargin-tubeDiameter)/2, $fn=200);
    translate ([-(tubeMargin-tubeDiameter+5), 0,-1]) {
cylinder(h=THIKNES*3, d=pinDiamater,  $fn=200);
}
    translate ([(tubeMargin-tubeDiameter+5), 0,-1]) {
cylinder(h=THIKNES*3, d=pinDiamater,  $fn=200);
}
    translate ([0,(tubeMargin-tubeDiameter+5),-1]) {
cylinder(h=THIKNES*3, d=pinDiamater,  $fn=200);
}
    translate ([0,-(tubeMargin-tubeDiameter+5),-1]) {
cylinder(h=THIKNES*3, d=pinDiamater,  $fn=200);
}

 }
difference () {
sphere(tubeDiameter/2+THIKNES*2, $fn=200);
sphere(tubeDiameter/2-THIKNES, $fn=200);
translate ([-tubeDiameter, -tubeDiameter,0]) {
cube([tubeDiameter*2,tubeDiameter*2,tubeDiameter]);
}
translate ([-tubeDiameter, 0,-tubeDiameter]) {
cube([tubeDiameter*2,tubeDiameter*2,tubeDiameter]);
}
}

/*
 * Parametric cable tie
 * (c) 2020 David Mikulik
 * Licensed under 
 * Creative Commons 
 * Attribution Non Comercial Share alike license
 */
include <BOSL/constants.scad>
use <BOSL/shapes.scad>

THIKNES= 0.4;

WIDTH=10;

CABLE_LENGTH=150;

PIECE_LENGTH=5;
PIECE_COUNT=(CABLE_LENGTH-PIECE_LENGTH*2)/PIECE_LENGTH;

head ();
translate ([WIDTH/2+WIDTH*.2,0,PIECE_LENGTH*2]) {
for ( i = [0 : PIECE_COUNT] ){
translate ([0,0,i*PIECE_LENGTH])
piece ();
}
}
module head () {
    difference () {
        cube([WIDTH*1.4,THIKNES, PIECE_LENGTH*2]);
        translate ([WIDTH*.2,0,PIECE_LENGTH])
        cube([WIDTH,THIKNES+0.1, THIKNES+0.1]);
        translate ([WIDTH/2+WIDTH*.2,THIKNES/2,PIECE_LENGTH+THIKNES])
        prismoid(size1=[WIDTH/3,THIKNES], size2=[WIDTH*.9,THIKNES], h=PIECE_LENGTH/4);
        translate ([WIDTH/2+WIDTH*.2,THIKNES/2,PIECE_LENGTH-PIECE_LENGTH/4])
        prismoid(size1=[WIDTH*.9,THIKNES], size2=[WIDTH/3,THIKNES], h=PIECE_LENGTH/4);
    }
}

module piece () {
    prismoid(size1=[WIDTH,THIKNES], size2=[WIDTH/2,THIKNES], h=PIECE_LENGTH);
}

 
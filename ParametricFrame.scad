/*
 * Parametric frame
 * (c) 2020 David Mikulik
 * Licensed under 
 * Creative Commons 
 * Attribution Non Comercial Share alike license
 */
include <BOSL/constants.scad>
use <BOSL/shapes.scad>

WIDTH=114;
HEIGTH=104;
THIKNES=10;
FRAME_PART_WITH=20;


difference () 
{
    union () {
        framePart("RIGHT");
        framePart("BOTTOM");
        framePart("TOP");
        framePart("LEFT");
    }
    translate ([FRAME_PART_WITH*1.25, -WIDTH/2+FRAME_PART_WITH*.75,0])
    cube ([HEIGTH,WIDTH,THIKNES-THIKNES/2]);
}
translate ([FRAME_PART_WITH-14,0,0])
    hook ();
module hook () {
    difference () {
    cube ([10,20,THIKNES/2]);
    translate ([2,5,0])
    cube ([4,10,THIKNES/2]);
    }
}
module framePart(part) {
    rotate([0,0,part=="RIGHT"?-90:part=="LEFT"?90:part=="TOP"?180:0])
    translate([part=="TOP"?-HEIGTH-FRAME_PART_WITH-FRAME_PART_WITH/2:part=="RIGHT"?-WIDTH/2-FRAME_PART_WITH:part=="LEFT"?-WIDTH/2+FRAME_PART_WITH/2:part=="BOTTOM"?FRAME_PART_WITH:0,part=="RIGHT"?HEIGTH/2+FRAME_PART_WITH*1.5:part=="LEFT"?-HEIGTH/2-FRAME_PART_WITH:part=="BOTTOM"?FRAME_PART_WITH:-FRAME_PART_WITH/2,0]) {
    difference ()
        {
        prismoid(size1=[FRAME_PART_WITH,part=="LEFT"?HEIGTH+FRAME_PART_WITH*2:part=="RIGHT"?HEIGTH+FRAME_PART_WITH*2:WIDTH+FRAME_PART_WITH*2], size2=[FRAME_PART_WITH*.5,part=="LEFT"?HEIGTH+FRAME_PART_WITH*2:part=="RIGHT"?HEIGTH+FRAME_PART_WITH*2:WIDTH+FRAME_PART_WITH*2,FRAME_PART_WITH,part=="LEFT"?HEIGTH:part=="RIGHT"?HEIGTH+FRAME_PART_WITH*2:WIDTH], h=THIKNES);
        translate ([-FRAME_PART_WITH,part=="TOP"?WIDTH/2+FRAME_PART_WITH:part=="BOTTOM"?WIDTH/2+FRAME_PART_WITH:part=="RIGHT"?HEIGTH/2+FRAME_PART_WITH:HEIGTH/2+FRAME_PART_WITH,0])
        rotate ([0,0,-45])
        cube([FRAME_PART_WITH*2,FRAME_PART_WITH*2,THIKNES]);
        translate ([-FRAME_PART_WITH/2,part=="TOP"?-WIDTH/2-FRAME_PART_WITH:part=="BOTTOM"?-WIDTH/2-FRAME_PART_WITH:part=="RIGHT"?-HEIGTH/2-FRAME_PART_WITH:-HEIGTH/2-FRAME_PART_WITH,0])
        rotate ([0,0,-45])
        cube([FRAME_PART_WITH*2,FRAME_PART_WITH*2,THIKNES]);
        }
    }
}
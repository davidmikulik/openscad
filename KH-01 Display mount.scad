/*
 * CR-10 Display mount to Kohon KH-01 
 * (c) 2020 David Mikulik
 * Licensed under 
 * Creative Commons 
 * Attribution Non Comercial Share alike license
 */
include <BOSL/constants.scad>
use <BOSL/shapes.scad>

THIKNES=4;
HOLE_HIGHT=79.4;
HOLE_WIDTH=51.9;
HEIGHT=31;
SCREW_HOLE=3;
DEPTH=7;
BOARD_WIDTH=89;
BOARD_HEIGTH=93;

DISPLAY_WIDTH=81.1;
DISPLAY_HEIGTH=51.5;

COVER_WIDTH = 99.1;
COVER_HEIGTH=89;
COVER_DEPTH=27;

PIN_HEIGTH=20;
PIN_DIAMETER=10;

CBOARD=1;
CCOVER=0;
if (CBOARD) 
{
    board();
}
if (CCOVER) 
{
    cover();
}
module cover ()
{
    translate ([BOARD_WIDTH+HOLE_WIDTH,0,0]) {
        difference () 
        {
            cube ([COVER_WIDTH,COVER_HEIGTH,THIKNES]);
            translate ([(COVER_WIDTH-DISPLAY_WIDTH)/2,11.2,0]) {
                cube ([DISPLAY_WIDTH,DISPLAY_HEIGTH,THIKNES]);
            }
            translate ([15.6,79.9,0]) 
            {
                cylinder(d=10, h=THIKNES*2, $fn=100);
            }
        }
        translate ([0,0,THIKNES]) {
            cube ([COVER_WIDTH,THIKNES, COVER_DEPTH]);
            cube ([THIKNES,COVER_HEIGTH, COVER_DEPTH]);
        }
        translate ([COVER_WIDTH-THIKNES,0,THIKNES]) {
            cube ([THIKNES,COVER_HEIGTH, COVER_DEPTH]);
        }
        translate ([0,COVER_HEIGTH-THIKNES,THIKNES]) {
            cube ([COVER_WIDTH,THIKNES, COVER_DEPTH]);
        }
    }
}
module board ()
{
    difference () {
        cube ([HOLE_WIDTH,HOLE_HIGHT,DEPTH]);
        translate ([THIKNES,THIKNES,0]) {
            displayHole();
        }
    }
    difference () 
    {
        translate ([-BOARD_WIDTH/2.5+HOLE_WIDTH/2,-BOARD_HEIGTH/2+HOLE_HIGHT/2,DEPTH]) {

            cube ([BOARD_WIDTH,BOARD_HEIGTH,THIKNES]);
            translate ([4,3,0]){
                cube ([69-PIN_DIAMETER/2,PIN_DIAMETER/2,PIN_HEIGTH]);
                cube ([PIN_DIAMETER/2,BOARD_HEIGTH-PIN_DIAMETER/2,PIN_HEIGTH]);
                pin();
            }
            translate ([69,3,0]){
                cube ([PIN_DIAMETER/2,BOARD_HEIGTH-PIN_DIAMETER/2,PIN_HEIGTH]);
                pin();
            }
            translate ([69,BOARD_HEIGTH-3,0]){
                pin();
            }
            translate ([4,BOARD_HEIGTH-3,0]){
                cube ([69-PIN_DIAMETER/2,PIN_DIAMETER/2,PIN_HEIGTH]);
                pin();
            }
        }
        translate ([THIKNES,THIKNES,THIKNES]) {
            displayHole();
        }
    }
}
module displayHole () {
    cube ([HOLE_WIDTH-THIKNES*2,HOLE_HIGHT-THIKNES*2,DEPTH*3]);
}

module pin () {
    tube(h=PIN_HEIGTH, od=PIN_DIAMETER, wall=THIKNES, $fn=100);
}


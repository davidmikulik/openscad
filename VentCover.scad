/*
 * Vent cover
 * (c) 2020 David Mikulik
 * Licensed under 
 *   Creative Commons 
 *   Attribution Non Comercial Share alike license
 */
 
$fn=200;
WITH_FAN=0;
THIKNES=5.3;
WITH_TUBE_FAN=1;

WIDTH=220;//143; //151
HEIGHT=180;//151; //143

VENT_WIDTH = 205;
VENT_HEIGHT = 125;
VENT_LAMELLA_WIDTH=10;
VENT_LAMELLA_ROTATE=30;
VENT_LAMELA_THIKNES=2;
VENT_HOLE_SPACE=2;
LAMELA_MOVE=VENT_HOLE_SPACE*8;

FAN_DIAMETER = 57;
FAN_SCREW_DIAMETER=2;
FAN_SCREW_MOVE=5;
FAN_WIDTH=60;

TUBE_FAN_DIAMETER = 123+THIKNES;
TUBE_FAN_HEIGHT = 80;

ONLY_TUBE=1;

VENT_COUNT=VENT_HEIGHT/(VENT_LAMELLA_WIDTH+VENT_HOLE_SPACE);
if (!ONLY_TUBE) {
    difference () {
        cube([WIDTH, HEIGHT, THIKNES]);
        if (WITH_TUBE_FAN) {
            translate ([(WIDTH)/2,(HEIGHT)/2,0]) {
            cylinder (d=TUBE_FAN_DIAMETER, h=VENT_LAMELLA_WIDTH);
            }
        }
        //else
        {   translate ([(WIDTH-VENT_WIDTH)/2,(HEIGHT-VENT_HEIGHT)/2,0]) {
            cube([VENT_WIDTH, VENT_HEIGHT, THIKNES]);

            }
        }

    }
        for (i = [0:VENT_COUNT]) {
            translate ([(WIDTH-VENT_WIDTH)/2,i*(VENT_LAMELLA_WIDTH+VENT_HOLE_SPACE)+LAMELA_MOVE,0]) {
                rotate ([VENT_LAMELLA_ROTATE,0,0]) {
                cube([VENT_WIDTH, VENT_LAMELLA_WIDTH-VENT_HOLE_SPACE*1.5, VENT_LAMELA_THIKNES]);
                }
            }
        if (WITH_FAN) {
            fan ();
        }
        if (WITH_TUBE_FAN) {
            tubeFan();
        }
            
    }
}
else 
{
    tubeFan();
}
module fan() {
    translate ([(WIDTH-FAN_WIDTH)/2,(HEIGHT-FAN_WIDTH)/2,0]) {
        difference () {
            cube([FAN_WIDTH,FAN_WIDTH,THIKNES]);
            translate ([(FAN_WIDTH)/2,(FAN_WIDTH)/2,0]) {
                cylinder (d=FAN_DIAMETER, h=THIKNES);
            }
            translate ([FAN_SCREW_MOVE,FAN_SCREW_MOVE,0]) {cylinder (d=FAN_SCREW_DIAMETER, h=THIKNES);}
            translate ([FAN_WIDTH-FAN_SCREW_MOVE,FAN_SCREW_MOVE,0]) {cylinder (d=FAN_SCREW_DIAMETER, h=THIKNES);}
            translate ([FAN_WIDTH-FAN_SCREW_MOVE,FAN_WIDTH-FAN_SCREW_MOVE,0]) {cylinder (d=FAN_SCREW_DIAMETER, h=THIKNES);}
            translate ([FAN_SCREW_MOVE,FAN_WIDTH-FAN_SCREW_MOVE,0]) {cylinder (d=FAN_SCREW_DIAMETER, h=THIKNES);}
        }
    }
}

module tubeFan() {
        translate ([(WIDTH)/2,(HEIGHT)/2,0]) {
            difference () 
            {
                cylinder (d=TUBE_FAN_DIAMETER+THIKNES, h=TUBE_FAN_HEIGHT);
                cylinder (d=TUBE_FAN_DIAMETER, h=TUBE_FAN_HEIGHT);        
            }
        }
}

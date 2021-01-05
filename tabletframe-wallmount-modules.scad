/*
 * Tablet frame - wall mount - modules
 * (c) 2020 David Mikulik
 * Licensed under 
 *   Creative Commons 
 *   Attribution Non Comercial Share alike license
 */
 
//include <BOSL/constants.scad>
//use <BOSL/metric_screws.scad>
use <FAKE/metric_screws.scad>
//use <BOSL/shapes.scad>
$fn=100;
 TABLET_WIDTH=145;
 TABLET_HEIGTH=70;
 TABLET_DEPTH=12;
 TABLET_FRAME=2;
 TABLET_BACK_FRAME=15;
 THIKNES=2;

 POWER_ADAPTOR_X_SIZE = 14;
 POWER_ADAPTOR_Z_SIZE = 7;
 POWER_ADAPTOR_X_MOVE = 36;
 POWER_ADAPTOR_Z_MOVE = 1.5;
 
 
 WITH_FRAME_X=1;
 WITH_FRAME_Y=1;
 WITH_ADAPTOR_Y=0;
 WITH_ADAPTOR_X=0;
 WITH_HINGE=1;
 WITH_BOLT=0;
 WITH_LOGO=1;
 WITH_TEST_HINGE_PART=0;
 HINGE_HOLE_LENGTH=TABLET_DEPTH/4;
 
 LOGO_FILE="Atos-logo-220x165.png";
 
 if (WITH_FRAME_X)
    x_frame();
 translate([0,TABLET_BACK_FRAME+TABLET_BACK_FRAME/2,0]) 
 if (WITH_FRAME_Y)
    y_frame();
 translate([0,TABLET_BACK_FRAME+TABLET_BACK_FRAME,0]) 
 if (WITH_BOLT)
    bolt();
 translate([0,TABLET_BACK_FRAME+TABLET_BACK_FRAME+TABLET_BACK_FRAME,0]) 
 if (WITH_TEST_HINGE_PART) 
     hinge();
module bolt () {
    rotate ([180,0,0])
    metric_bolt(headtype="hex", size=4-0.4, l=THIKNES*2);
}

module hinge () {
    translate ([THIKNES/2,THIKNES/2,0]) {
        difference() {
            cube([THIKNES,TABLET_BACK_FRAME+THIKNES,TABLET_DEPTH+THIKNES*2]);
            rotate ([0,90,0]) {
                translate ([-THIKNES,0,0])
                    frameHoles ();
            }
        }
    }
    if (WITH_TEST_HINGE_PART)
        translate ([THIKNES/2,-TABLET_BACK_FRAME-THIKNES*4,0])
        rotate ([0,0,0]) {
        difference() {
                cube([THIKNES,TABLET_BACK_FRAME+THIKNES,TABLET_DEPTH+THIKNES*2]);
                rotate ([0,90,0]) {
                    translate ([-THIKNES,0,0])
                        frameHoles ();
                }
            }
        }
    hingeHole(false);
    translate ([0,0,TABLET_DEPTH])
        hingeHole(false);
   translate ([THIKNES,-THIKNES-THIKNES/2,HINGE_HOLE_LENGTH+THIKNES/2])
        rotate ([0,0,180])
        hingeHole(true);
    translate ([THIKNES/2,-THIKNES,0]) {
        cylinder(d=THIKNES/2, h=TABLET_DEPTH+THIKNES*1.5);
    }
}

module hingeHole (right) {
    
    difference () {
    union () {
        translate ([THIKNES/2,(right?-THIKNES/2:-THIKNES),0]) {
            translate ([-THIKNES,0,0]) {
                cube([THIKNES*2,(right?THIKNES*2:THIKNES*1.5),(right?HINGE_HOLE_LENGTH*2.5:HINGE_HOLE_LENGTH)]);}
            cylinder(d=THIKNES*2, h=(right?HINGE_HOLE_LENGTH*2.5:HINGE_HOLE_LENGTH));
        }
    }
        translate ([THIKNES/2,(right?-THIKNES/2:-THIKNES),0]) 
        cylinder(d=(right?THIKNES:THIKNES/2), h=(right?HINGE_HOLE_LENGTH*2.5:HINGE_HOLE_LENGTH));
    }
}
module x_frame() {
    difference () {
        frame(true);
        
        if (WITH_LOGO)
        translate ([(TABLET_WIDTH-20)/2,1,TABLET_DEPTH+THIKNES*2-1])
            rotate ([0,0,0])
                scale([.1,.1,.02])
                    surface(file=LOGO_FILE,invert=true);
        if(WITH_ADAPTOR_Y)
            powerAdaptor();
    }
    translate ([TABLET_WIDTH,0,-THIKNES])
        x_frame_side(true);
    translate ([-THIKNES,0,-THIKNES])
        x_frame_side(false);
}
module x_frame_side (left) {
    difference() 
    {
        cube([THIKNES,TABLET_BACK_FRAME+THIKNES,TABLET_DEPTH+THIKNES]);
        rotate ([0,90,0]) {
            translate ([-THIKNES,0,0])
                frameHoles ();
        }
    }
} 

module frameHoles () {
        translate([-TABLET_DEPTH/4,TABLET_BACK_FRAME/4,THIKNES])
             metric_bolt(headtype="", size=4, l=THIKNES*2);
        translate([-TABLET_DEPTH/4,TABLET_BACK_FRAME/1.5,THIKNES])
             metric_bolt(headtype="", size=4, l=THIKNES*2);
        translate([-TABLET_DEPTH/1.5,TABLET_BACK_FRAME/4,THIKNES])
             metric_bolt(headtype="", size=4, l=THIKNES*2);
        translate([-TABLET_DEPTH/1.5,TABLET_BACK_FRAME/1.5,THIKNES])
             metric_bolt(headtype="", size=4, l=THIKNES*2);
}
module y_frame() {
    difference () {
    union () {
    difference () {
        frame(false);
        rotate ([90,90,0]) {
            translate ([0,0,-THIKNES])
                frameHoles ();
            translate ([0,TABLET_HEIGTH-TABLET_BACK_FRAME,-THIKNES])
                frameHoles ();
        }
        translate ([0,THIKNES,-THIKNES]) {
            cube([TABLET_BACK_FRAME+THIKNES,TABLET_BACK_FRAME+THIKNES,THIKNES]);

            translate ([0,0,TABLET_DEPTH+THIKNES]) cube([TABLET_FRAME+THIKNES,TABLET_BACK_FRAME,THIKNES]);
        }
        translate ([TABLET_HEIGTH-TABLET_BACK_FRAME-THIKNES,THIKNES,-THIKNES]) {
            cube([TABLET_BACK_FRAME+THIKNES,TABLET_BACK_FRAME+THIKNES,THIKNES]);

            translate ([TABLET_BACK_FRAME-TABLET_FRAME,0,TABLET_DEPTH+THIKNES]) cube([TABLET_FRAME+THIKNES,TABLET_BACK_FRAME,THIKNES]);
        }
    if (WITH_HINGE) {
        translate ([-THIKNES-THIKNES/2,0,-THIKNES])
            cube([TABLET_BACK_FRAME+THIKNES*5,THIKNES*2.5,TABLET_BACK_FRAME+THIKNES]);
    }
    }
    if (WITH_HINGE) {
        rotate ([0,180,90])
        translate ([-THIKNES-THIKNES/2,-TABLET_BACK_FRAME-THIKNES*1.4,-TABLET_DEPTH-THIKNES])
            hinge();
    }
    translate ([WITH_HINGE?TABLET_BACK_FRAME+THIKNES*3.5:TABLET_BACK_FRAME+THIKNES,THIKNES,0]) {
    cube([WITH_HINGE?TABLET_HEIGTH-TABLET_BACK_FRAME*2-(THIKNES*4.5):TABLET_HEIGTH-TABLET_BACK_FRAME*2-(THIKNES*2),THIKNES,TABLET_DEPTH]);
            
    }
    }
    if(WITH_ADAPTOR_Y)
        powerAdaptor();
    }
        
}

module powerAdaptor() {

    translate ([POWER_ADAPTOR_X_MOVE,0,POWER_ADAPTOR_Z_MOVE])
        cube([POWER_ADAPTOR_X_SIZE,THIKNES*2,POWER_ADAPTOR_Z_SIZE]);
}
module frame(x) {
     cube([x?TABLET_WIDTH:TABLET_HEIGTH, THIKNES, TABLET_DEPTH]);
     translate ([x?-THIKNES:0,0,TABLET_DEPTH]) {
         cube([x?TABLET_WIDTH+THIKNES*2:TABLET_HEIGTH, TABLET_FRAME+THIKNES, THIKNES]);
     }
      translate ([0,0,-THIKNES]) {
         cube([x?TABLET_WIDTH:TABLET_HEIGTH, TABLET_BACK_FRAME+THIKNES, THIKNES]);
     }

}

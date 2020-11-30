 /*
 * Actual glass name v.2
 * (c) 2020 David Mikulik
 * Licensed under 
 *   Creative Commons 
 *   Attribution Non Comercial Share alike license
 */
 

THIKNES = 3;

HOOK_DIAMETER = 20;

TEXTPAD_WIDTH = 34;
TEXTPAD_HEIGHT = 20;
TEXTPAD_NAME = "David";
TEXTPAD_IMAGE = "creeperhead.png";
//import(file = "160623.svg ", center = false, dpi = 96);
// 

NAME = 0;
IMAGE= 1;

 //hook ();
 $fn=100;
 translate ([30,0,0])   textPad ();
  
 module hook() {
     difference () {
        cylinder(d= HOOK_DIAMETER, h=THIKNES);
        cylinder(d= HOOK_DIAMETER-THIKNES*2, h=THIKNES);
        translate ([HOOK_DIAMETER/2-THIKNES*1.5,0,0])
            cube ([THIKNES/2, HOOK_DIAMETER/2, THIKNES]);
     }
     translate ([HOOK_DIAMETER/2-THIKNES,0,0])
        cube ([THIKNES, HOOK_DIAMETER*2, THIKNES]);
     translate ([HOOK_DIAMETER/2-THIKNES,HOOK_DIAMETER*2,0])
        cube ([HOOK_DIAMETER,THIKNES, THIKNES]);
     translate ([HOOK_DIAMETER*1.5-THIKNES*2,HOOK_DIAMETER,0])
        cube ([THIKNES, HOOK_DIAMETER, THIKNES]);
 }
 module textPad() {
    
    difference () 
     {
        cube ([TEXTPAD_WIDTH, TEXTPAD_HEIGHT, THIKNES*2]);
        translate ([TEXTPAD_WIDTH/2-THIKNES/2,0,THIKNES/2])
            cube ([THIKNES+.2, HOOK_DIAMETER+.4, THIKNES+.4]);
    }
    if (IMAGE)
        translate ([4,1,THIKNES*2.9])
        rotate ([0,0,0])
            scale([.09,.09,.03])
                surface(file=TEXTPAD_IMAGE,invert=true);
    translate ([2,TEXTPAD_HEIGHT/2-4,THIKNES*2]) {
        if (NAME)
            rotate ([0,0,0])
                linear_extrude(2) 
                    text(TEXTPAD_NAME, size = 8); 
    }   
 }
 
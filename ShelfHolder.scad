 /*
 * Shelf holder
 * (c) 2020 David Mikulik
 * Licensed under 
 *   Creative Commons 
 *   Attribution Non Comercial Share alike license
 */
 
THIKNES=4;
WIDTH=25;
HEIGTH=30;
SHELF_THIKNES = 18.5;
BOLT_DIAMETER=4;
BOLT_COUNT = 1;
ANGLE=-75;

        difference () 
        {
        union () {
            cube([WIDTH,HEIGTH,THIKNES]);
            cube([WIDTH,THIKNES,SHELF_THIKNES+THIKNES*2]);
            translate ([0,0,SHELF_THIKNES+THIKNES*2]) {
               
                rotate([ANGLE,0,0])
                    cube([WIDTH,THIKNES,HEIGTH]);
                }
        }
            rotate([ANGLE,0,0]) {
            for (i = [1:BOLT_COUNT]) {
                X= (WIDTH-BOLT_DIAMETER)/(BOLT_COUNT+1)*i;
                echo (X);
                translate ([X,-SHELF_THIKNES/2,SHELF_THIKNES+THIKNES]) 
                    rotate([90,0,0])
                    bolt ();
                }
            }
        }
        
module bolt () {
 translate ([0,0,-THIKNES]) 
 cylinder (d=BOLT_DIAMETER, h=SHELF_THIKNES+2*THIKNES, $fn=100);
 translate ([0,0,-SHELF_THIKNES])
 cylinder (d=BOLT_DIAMETER*2, h=HEIGTH, $fn=100);
}
 
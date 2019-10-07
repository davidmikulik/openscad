/*
 * Bosh Mum suizer part
 * (c) 2019 David Mikulik
 * Licensed under 
 *   Creative Commons 
 *   Attribution Non Comercial Share alike license
*/

THIKNES=2;
HOLE_DIMETER = 8;
PART_DIAMETER = 43;
PART_HEIGHT=11;
LEFT=0;

difference(){
cylinder(d=PART_DIAMETER, h=PART_HEIGHT, $fn=100);
cylinder(d=HOLE_DIMETER, h=PART_HEIGHT, $fn=100);

if (LEFT) {
    translate ([0,-PART_DIAMETER/2, 0]) {
        cube ([PART_DIAMETER,PART_DIAMETER, PART_HEIGHT]);    
    }
}
else
    {
    translate ([-PART_DIAMETER,-PART_DIAMETER/2, 0]) {
        //union() {
            cube ([PART_DIAMETER,PART_DIAMETER, PART_HEIGHT]);       
        //}
        
    }
}
}


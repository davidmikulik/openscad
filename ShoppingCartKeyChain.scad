/*
 * Shopping cart coin - key chain
 * (c) 2020 David Mikulik
 * Licensed under 
 * Creative Commons 
 * Attribution Non Comercial Share alike license
 */
 
 THIKNES=2.3;
 DIAMETER= 23;
 SIZE = 36;
 HOLE = 5;
 IMAGE = "smile.png";
 $fn=200;
 
 minkowski () 
 {
 difference () {
         union () {
         cylinder (d=DIAMETER,h=THIKNES);
         translate ([-THIKNES,-HOLE,0]) {
            cube  ([SIZE-HOLE/2-DIAMETER/2, HOLE+2*THIKNES, THIKNES]);
            rotate([0,0,19.9])
                translate ([2.9,-DIAMETER+15.39,0])
                cube  ([SIZE-HOLE/2-DIAMETER/2-2.8, HOLE+2*THIKNES, THIKNES]);
            rotate([0,0,-19.9])
                translate ([-0.4,DIAMETER-15.63,0])
                cube  ([SIZE-HOLE/2-DIAMETER/2-1.9, HOLE+2*THIKNES, THIKNES]);
         }
         translate ([SIZE-DIAMETER/2-(HOLE/2+THIKNES),0,0]) {
            cylinder (d=HOLE+2*THIKNES,h=THIKNES);
            
         }
     }
     translate ([SIZE-DIAMETER/2-(HOLE/2+HOLE/2+THIKNES),0,0])
        cylinder (d=HOLE,h=THIKNES);
     translate ([10,-13.5,THIKNES/2])
        rotate ([0,0,90])
            scale([.09,.09,.03])
                surface(file=IMAGE,invert=true);
 }
 }
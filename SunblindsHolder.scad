/*
 * Sunblinds holder
 * (c) 2020 David Mikulik
 * Licensed under 
 *   Creative Commons 
 *   Attribution Non Comercial Share alike license
 */
 
 $fn=100;
 PI=0+3.1415926;
 
 // MAIN CUBE 
 difference() {
    cube([17.1,16.95,2.2]);
    translate ([10.1/2,0,0]) {
        cube([7,2.6,2.2]);
    }
 }
 
 // TUBE
 translate ([17.1/2,16.95/2,2.2]) {
     difference() {
         cylinder (h=13.45-2.2, r=5);
         cylinder (h=13.45-2.2, r=5.3/2);
     }
 }
 
 // TUBE TOOTHS
 translate ([17.1/2,16.95/2,6.9]) {     
     for (i = [1:8]) {
        th = 360 / 8 * i;
        translate([(5)*cos(th), (5)*sin(th), 0]) {
            echo (th%90==0?45:0);
                rotate ([0,0,th%90]) {
                    {
                        cube(size=[2,2,17.1-4], center=true);
                    }
                }
        }
    }
}
// LOCK
translate ([(17.1-5.6)/2,-9.2+2.6,0]) {
    difference () 
        {
        cube([5.6,9.2,2.2]);
        translate ([-5/2,7,0]) {
            cube([9.2,1.87, 0.8]);
        }
        translate ([0,0.8,0]) {
            rotate ([-5,0,0]) {
                cube([5.6,4.1, 1.1]);
            }
        }
        translate ([0,-0.1,-.5]) {
            rotate ([-5,0,0]) {
                cube([5.6,4.1, 1.1]);
            }
        }
        
    }
    translate ([0,5,-.8]) {
        cube([5.6,1.87, 0.8]);
    }
}
 
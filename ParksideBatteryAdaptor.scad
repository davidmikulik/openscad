/*
 * Parkside battery adaptor
 * (c) 2020 David Mikulik
 * Licensed under 
 * Creative Commons 
 * Attribution Non Comercial Share alike license
 */
 

MAIN_BOARD = 1;
LID = 0;
LID_DISPLAY=0;
BOARD_SCREW_HOLDERS = 0;
SPARX_BATTERY =1;
WITHCASE=0;
WITH_CAR_SOCKET=0;
CASE_HEIGHT=24+40;
CASE_THIKNES=4;
$fn = 100;

if (MAIN_BOARD) { 
    mainPlate();
    batteryConnector();

if (BOARD_SCREW_HOLDERS) boardScrewHolders();
if (WITHCASE) case();
}

if (SPARX_BATTERY) {
    sparxBattery();
}
if (LID) {
    lid();
}

        
module lid() { 
    translate ([(69+38),0,0]) {
        difference() 
        {
        union () {
        cube ([69,78,CASE_THIKNES]);
        translate ([(CASE_THIKNES+1),CASE_THIKNES+1,CASE_THIKNES]) {
        cube ([69-CASE_THIKNES*2-2,78-CASE_THIKNES*2-2,CASE_THIKNES]);
        }
        }
        if (LID_DISPLAY) {
            translate ([69-20-CASE_THIKNES*2,25,0]) {
                cube([12,24,CASE_THIKNES*2]);
            }
        }

        translate ([(CASE_THIKNES*1.5),CASE_THIKNES*1.5,0]) {lidScrewHole();}
        translate ([(69-CASE_THIKNES*1.5),CASE_THIKNES*1.5,0]) {lidScrewHole();}
        translate ([(69-CASE_THIKNES*1.5),78-CASE_THIKNES*1.5,0]) {lidScrewHole();}
        translate ([(CASE_THIKNES*1.5),78-CASE_THIKNES*1.5,0]) {lidScrewHole();}
                
        }
    }
}
module lidScrewHole() {
    cylinder (d=6,h=CASE_THIKNES/2);
    cylinder (d=3,h=CASE_THIKNES*2);
}
module mainPlate() { 
    difference() {
        cube ([69,78,16]);
        translate ([(69-38)/2,10,0]) {
            cube ([38,56,5.4]);
        }
        translate ([(69-47)/2,10,5]) {
            cube ([47,61,5.4]);
        }
        translate ([(69-47)/2+10,0,2]) {
            cube ([31-3,10,6]);
        }   
        translate ([0,55,0]) {
            cube ([70,40,9.3]);
        }
        translate ([21,68,9.3]) {
            cube ([25,9,6]);
        }
        translate ([69-18,78-24,4]) {
            cube ([18,24,10]);
        }
        translate ([0,78-24,4]) {
            cube ([18,24,10]);
        }
        translate ([(69-29)/2,5,0]) {
            cube ([29,5,20]);
        }
    }
        translate ([69-8,78-24,0]) {
            triangle ();
        }
        translate ([0,78-24,0]) {
            triangle ();
        }
}

module case () {
    translate ([0,0,16])
    {
        difference () 
        {
            cube ([69,CASE_THIKNES,CASE_HEIGHT]);
            if (WITH_CAR_SOCKET) {
            translate([69/2,CASE_THIKNES,CASE_HEIGHT-20]) {rotate ([90,0,0]) {cylinder(d=23.5, h=CASE_THIKNES);}}
        }}
        cube ([CASE_THIKNES,78,CASE_HEIGHT]);
        translate ([0,78-CASE_THIKNES,0]) {cube ([69,CASE_THIKNES,CASE_HEIGHT]);}
        translate ([69-CASE_THIKNES,0,0]) {cube ([CASE_THIKNES,78,CASE_HEIGHT]);}
        translate ([CASE_THIKNES,CASE_THIKNES,0]) {lidScrewHolder();}
        translate ([69-CASE_THIKNES*2,CASE_THIKNES,0]) {lidScrewHolder();}
        translate ([69-CASE_THIKNES*2,78-CASE_THIKNES*2,0]) {lidScrewHolder();}
        translate ([4,78-CASE_THIKNES*2,0]) {lidScrewHolder();}
        
    }
}
module lidScrewHolder () {
    difference () 
    {
        cube ([5,5,CASE_HEIGHT-CASE_THIKNES],center=false);
        translate ([2.5,2.5,1]) 
        {
            cylinder (d=3,h=CASE_HEIGHT);
        }
    }
}
module boardScrewHolders () {
    translate ([20,15,16]) 
    {
        boardScrewHolder();
        translate ([31,0,0]) {boardScrewHolder();}
        translate ([31,54,0]) {boardScrewHolder();}
        translate ([0,54,0]) {boardScrewHolder();}
    }
    
}

module sparxBattery() {
translate ([-3,23,0]) 
{    
    translate ([20,-8,21]) 
    {
        sparxBatteryScrewHolder();
        translate ([32,0,0]) {sparxBatteryScrewHolder();}
        translate ([32,75,0]) {sparxBatteryScrewHolder();}
        translate ([1,74,0]) {sparxBatteryScrewHolder();}
        
       
    }
    translate ([0,-23,16]) 
    {
        difference () 
        {
            cube ([75.8,101,CASE_THIKNES]);
            translate([30,(60-27)/2-10,0]) {
                cube ([10,10,CASE_THIKNES]);
            }
        }
        translate ([0,(101-60)/2,0]) {sparxBatterySide();
            translate([7,(60-27)/2,1]) {
            cube ([4,27,11]);
        }
        };
        translate ([75.8-CASE_THIKNES,(101-60)/2,0]) {sparxBatterySide();        translate([-7,(60-27)/2,1]) {
            cube ([4,27,11]);
        }
        };
        translate ([35,0,0]) {
            rotate ([0,0,60]) {cube ([CASE_THIKNES,40,26]);}
        }
        translate ([-38+75.8,4,0]) {
            rotate ([0,0,-60]) {cube ([CASE_THIKNES,40,26]);}
        }
        translate ([75.8/2-CASE_THIKNES,0,0]) {cube ([CASE_THIKNES*2,CASE_THIKNES,26]);}
        
        translate ([75.8-CASE_THIKNES/2,101-22,0]) {
            rotate ([0,0,60]) {cube ([CASE_THIKNES,40,26]);}
        }
        translate ([0,101-18,0]) {
            rotate ([0,0,-60]) {cube ([CASE_THIKNES,40,26]);}
        }
        translate ([75.8/2-CASE_THIKNES,98,0]) {cube ([CASE_THIKNES*2,CASE_THIKNES,26]);}


    }
}
}

module sparxBatteryScrewHolder () {
    difference () 
    {
        cylinder (d=7,h=22);
        cylinder (d=3.5,h=22);
    }
}
module sparxBatterySide () {
    difference () 
    {
        cube ([CASE_THIKNES,60,26]);
        translate([-1,(60-27)/2,16]) {
            cube ([CASE_THIKNES*2,27,11]);
        }
        translate([-1,(60-16)/2,10]) {
            cube ([CASE_THIKNES*2,16,8]);
        }
        translate([-1,(60)/2+8,11]) {
            rotate([45,0,0]) {
                cube ([CASE_THIKNES*2,8,8]);
            }
        }
        translate([-1,(60)/2-8,10]) {
            rotate([45,0,0]) {
                cube ([CASE_THIKNES*2,8,8]);
            }
        }
    }
}
module boardScrewHolder () {
    difference () 
    {
        cylinder (d=5,h=7);
        cylinder (d=3,h=7);
    }
}
module batteryConnector () {
    translate ([(69-29)/2,10.1,0]) {
        difference() 
             {
             cube ([29,14,15]);
             translate ([1.5,0,2]) {cableConnectorHole();}
             translate ([1.5+2.3*1+5.2,0,2]) {cableConnectorHole();}
             translate ([1.5+2.3*2+5.2*2,0,2]) {cableConnectorHole();}
             translate ([1.5+2.3*3+5.2*3,0,2]) {cableConnectorHole();}
        }
    }
}

module cableConnectorHole()
{
    cube ([2.7,14,6.7]);
    translate ([-1.2,0,0]) {
        cube ([5.5,12,6.7]);
    }
}

module triangle() {
    difference() 
    {
        cube ([8,14,14]);
        rotate ([-45,0,0])
        {
            cube ([8,14,28]);
        }
    }
}

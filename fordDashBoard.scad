THIKNES=10;
WIDTH =160;
HEIGTH = 60;
DEPTH = 40;
module dashboard (full){
    move = full ? 0: THIKNES;
    translate([0,move,0]) {
         difference(){
            move = full ? 0: THIKNES;
            box=[WIDTH-move,DEPTH-move,HEIGTH-move];
            cube(box,true);
            if (full) {
                translate([0,-DEPTH/2+10+THIKNES,0]) {
                    rotate(90, v=[1,0,0]) {
                        cylinder(h=THIKNES*2, d=40); 
                    }
                }
            }
            
        intersection () {        
            translate([WIDTH/2,DEPTH/2,-HEIGTH/6]) {
                rotate(90, v=[1,0,0]) {
                rotate(90, v=[0,0,1]) {
                    cylinder(DEPTH,DEPTH,DEPTH,$fn=3);
                }
            }
            }
        }
         { 
            translate([-WIDTH/2,0,0]) {
                rotate(90, v=[1,0,0]) {
                    cylinder(h=DEPTH, d=HEIGTH); 
                }
           
        }
    }
    }
    }
}
difference(){
    dashboard(true);
    //dashboard(false);
}
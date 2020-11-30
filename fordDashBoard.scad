include <BOSL/constants.scad>
use <BOSL/shapes.scad>

THIKNES=3;
WIDTH =77;
HEIGTH = 20;
DEPTH = 9;
HOLE=16;
$fn = 100;
module dashboard (full){
    move = full ? 0: THIKNES;
    translate([0,move,0]) {
  
         difference(){
            mainBody(full);
            hole(full);
        }
        intersection () {
        arcus(full);}
    }
}
module mainBody(full) {
            move = full ? 0: THIKNES;
            //box=[WIDTH-move,DEPTH-move,HEIGTH-move];
            //cube(box,true);
            prismoid(size1=[WIDTH-move-HEIGTH-4,DEPTH-move], size2=[WIDTH-move-HEIGTH,DEPTH-move], h=HEIGTH-move, shift=[2,0]);

}

module arcus(full) {
                move = full ? 0: THIKNES;
                translate([-WIDTH/2+HEIGTH/2+2,DEPTH/2-move,0]) {
                rotate(90, v=[1,0,0]) {
                    pie_slice(ang=-90, l=DEPTH-move, r=HEIGTH-move);
                }
            }
            
}
module hole(full) {
            if (full) {
                translate([0,-DEPTH/2+THIKNES*2,HEIGTH/2-THIKNES/4]) {
                    rotate(90, v=[1,0,0]) {
                        cylinder(h=THIKNES*8, d=HOLE); 
                    }
                }
            }    
}
difference(){
        dashboard(true);
        dashboard(false);       
}
include <BOSL/constants.scad>
use <BOSL/shapes.scad>

THIKNES=10;
WIDTH =160;
HEIGTH = 60;
DEPTH = 40;
module dashboard (full){
    move = full ? 0: THIKNES;
    translate([0,move,0]) {
  
         difference(){
            mainBody(full);
            hole(full);
        }
        //intersection () {
        arcus();}
    //}
}
module mainBody(full) {
            move = full ? 0: THIKNES;
            //box=[WIDTH-move,DEPTH-move,HEIGTH-move];
            //cube(box,true);
            prismoid(size1=[WIDTH-move-HEIGTH,DEPTH-move], size2=[WIDTH-move-HEIGTH-16,DEPTH-move-14], h=HEIGTH-move, shift=[8,7]);

}

module arcus(full) {
                move = full ? 0: THIKNES;
                translate([WIDTH/2-HEIGTH/2,DEPTH/2,0]) {
                rotate(90, v=[1,0,0]) {
                  {
                //    cylinder(h=DEPTH, d=HEIGTH*1.4); 
                    pie_slice(ang=90, l=DEPTH, r1=60, r2=55);
                }         
            }
            }
}
module hole(full) {
            if (full) {
                translate([0,-DEPTH/2+20+THIKNES,HEIGTH/2]) {
                    rotate(90, v=[1,0,0]) {
                        cylinder(h=THIKNES*4, d=40); 
                    }
                }
            }    
}
difference(){
    dashboard(true);
    //dashboard(false);
}
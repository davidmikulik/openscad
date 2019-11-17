$case=true;    // Show the box?
$top=false;     // Show the cover?

$pcb_x=31.5;  // PCB size
$pcb_y=58;
$pcb_z=53;

$led=false;      //have a LED indicating activity?
$led_diam=5;    // LED diameter
$led_x=20;      // X offset for LED
$led_y=50;      // Y offset for LED

$ldr=false;      // have a LDR measuring illumination?
$ldr_diam=5.2;    // same for light dependant resistor
$ldr_x=27;
$ldr_y=30;

$pir=true;      // have a motion detector?
$pir_diam=23;   // same for passive infrared sensor
$pir_x=13 ;
$pir_y=21;

$pcb_air=0.3;   // space around the PCB
$pcb_lift=5;    // space on soldering side of pcb, for pins and RFM
$bat=false;      // have a battery holder?
$bat_x=33;      // battery holder size
$bat_y=65;
$bat_z=10import("E:/Download/dice (1).stl");
;
$bat_isolate=0;   // plane between bat & PCB

$jack=1;  // number of RJ jacks
$jack_x=11.2; // size of RJ jacks
$jack_z=8.2;
$jack_lift=-2; // distance to LOWER PCB edge
$jack_y_offset=7.5;
$jack1_x_offset=7.5;
$jack2_x_offset=23;

$wall=1.2;    // wall thickness

$hold_size=5;       // size of PCB and cover holdings
$screw_hole=1.5;    // hole inside
$screw_diam=2.5;    // screw diameter for the cover

$inner_x=$pcb_x+2*$pcb_air;
$inner_y=$bat_y+2*$pcb_air;
$inner_z=$bat_z+$pcb_z;
$outer_x=$inner_x+2*$wall;
$outer_y=$inner_y+2*$wall;
$outer_z=$inner_z+$wall;

$pcb_z_base=$bat_z+$bat_isolate+$pcb_lift+$wall;  // lower edge of PCB

if ($case){    
difference(){
    // outer cube
    minkowski(){translate([$wall/2,$wall/2,0])cube ([$outer_x-$wall,$outer_y-$wall,$outer_z-1]);
        cylinder(r=$wall/2,h=1,$fn=20);}
    translate([$wall,$wall,$wall])
        cube ([$inner_x,$inner_y,$inner_z+1]);  // inner cube
    if($jack>0) translate([$jack1_x_offset+$pcb_air+$wall,-1,$pcb_z_base+$jack_lift-$wall/2])
       cube ([$jack_x,$wall+2,$jack_z+2]);
    if ($jack>1) translate([$jack1_x_offset+$pcb_air+$wall,-1,$pcb_z_base+$jack_lift-$wall/2])
       cube ([$jack2_x_offset+$jack_x-$jack1_x_offset,$wall+2,$jack_z+2]);
    // x size was $jack_x, but the small part between the jacks was too fragile
}
// battery fixing
translate([$wall/2,$wall/2,$wall0])
    difference(){
        cube ([$outer_x-$wall,$outer_y-$wall,$bat_z]);
        translate([($outer_x-$bat_x-$wall)/2,$wall/2+$pcb_air,0])
            cube ([$bat_x,$bat_y,$bat_z+1]);}

// boxes & holes for screws holding the top
translate ([$wall/2,$wall/2,0]) difference(){
    cube([$hold_size,$hold_size,$outer_z]);
    translate([$hold_size/2,$hold_size/2,0])
        cube([$screw_hole,$screw_hole,2*$outer_z+1],center=true);}
    // cylinder($outer_z+1,$screw_hole);}
translate ([$outer_x-$hold_size-$wall/2,$wall/2,0]) difference(){
    cube([$hold_size,$hold_size,$outer_z]);
    translate([$hold_size/2,$hold_size/2,0])
        cube([$screw_hole,$screw_hole,2*$outer_z+1],center=true);}
translate ([$wall/2,$outer_y-$hold_size-$wall/2,0]) difference(){
    cube([$hold_size,$hold_size,$outer_z]);
    translate([$hold_size/2,$hold_size/2,0])
        cube([$screw_hole,$screw_hole,2*$outer_z+1],center=true);}
translate ([$outer_x-$hold_size-$wall/2,$outer_y-$hold_size-$wall/2,0]) difference(){
    cube([$hold_size,$hold_size,$outer_z]);
    translate([$hold_size/2,$hold_size/2,0])
        cube([$screw_hole,$screw_hole,2*$outer_z+1],center=true);}
        
// boxes & holes holding PCB
translate ([$wall/2,$wall/2,0]) difference(){
        cube([$hold_size+$wall/2+$pcb_air,$hold_size-$wall/2+$pcb_air+$jack_y_offset,$pcb_z_base]);
        translate([($hold_size+$wall/2)/2+$pcb_air,($hold_size+$wall/2)/2+$pcb_air+$jack_y_offset-$wall,0])
            cube([$screw_hole,$screw_hole,2*$outer_z+1],center=true);}
//        cylinder($pcb_z_base+1,$screw_hole);}
translate ([$outer_x-$wall-$hold_size-$pcb_air,$wall/2,0]) difference(){
        cube([$hold_size+$wall/2+$pcb_air,$hold_size+$wall/2+$pcb_air+$jack_y_offset,$pcb_z_base]);
        translate([($hold_size+$wall/2)/2,($hold_size+$wall/2)/2+$pcb_air+$jack_y_offset-$wall,0])
            cube([$screw_hole,$screw_hole,2*$outer_z+1],center=true);}
translate ([$wall/2,-$wall/2+$jack_y_offset+$pcb_y-$hold_size,0]) difference(){
        cube ([$hold_size+$wall/2+$pcb_air,$outer_y+$wall/2-($wall/2+$jack_y_offset+$pcb_y-$hold_size),$pcb_z_base]);
        translate([($hold_size+$wall/2)/2+$pcb_air,$wall/2+$hold_size/2,0])
            cube([$screw_hole,$screw_hole,2*$outer_z+1],center=true);}
translate ([$outer_x-$wall-$hold_size-$pcb_air,-$wall/2+$jack_y_offset+$pcb_y-$hold_size,0]) difference(){
        cube ([$hold_size+$wall/2+$pcb_air,$outer_y+$wall/2-($wall/2+$jack_y_offset+$pcb_y-$hold_size),$pcb_z_base]);
        translate([($hold_size+$wall/2)/2,$wall/2+$hold_size/2,0])
            cube([$screw_hole,$screw_hole,2*$outer_z+1],center=true);}

}   // if ($case)

// top beside the case
if ($top){
    translate([$outer_x+4,$wall/2,0])
     difference(){
        minkowski(){
            cube([$outer_x-$wall,$outer_y-$wall,$wall/2]);
            sphere(r=$wall/2,$fn=20);
        }
        translate([-$wall,-$wall,-$wall])cube([$outer_x+$wall+2,$outer_y+$wall+2,$wall]);
        // holes for screws holding the top
        translate([$wall/2+$hold_size/2,$wall/2+$hold_size/2,-1])
        cylinder($fn=12,11,d=$screw_diam);
        translate([$outer_x-$wall-$hold_size/2,$wall/2+$hold_size/2,-1])
        cylinder($fn=12,11,d=$screw_diam);
        translate([$wall/2+$hold_size/2,$outer_y-$wall-$hold_size/2,-1])
        cylinder($fn=12,11,d=$screw_diam);
        translate([$outer_x-$wall-$hold_size/2,$outer_y-$wall-$hold_size/2,-1])
        cylinder($fn=12,11,d=$screw_diam);
        if ($led) translate([$led_x+$pcb_air+$wall,$led_y+$pcb_air+$wall,-1])
            cylinder($fn=20,d=$led_diam,$wall+2);
        if ($ldr) translate([$ldr_x+$pcb_air+$wall,$ldr_y+$pcb_air+$wall,-1])
            cylinder($fn=20,d=$ldr_diam,$wall+2);
        if ($pir) translate([$pir_x+$pcb_air+$wall,$pir_y+$pcb_air+$wall,-1])
            cylinder($fn=40,d=$pir_diam,$wall+2);

    }
}
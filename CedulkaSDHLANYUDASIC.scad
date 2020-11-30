$fn=100;

$board_rounding_radius=3;
$board_height=50;
$board_width=210;
$board_thicknes=2;

$holder_height=40;
$holder_width=5;
$holder_thicknes=5;
$holder_offset=3;

$text_offset_horizontal = 30;
$text_offset_vertical = $board_height/2 + 0;

//$font="Le Pochoir Creux:style=Normal";
$font="Stencil:style=Normal";
$font_size=30;
$text="FRAXINUS SHOREA PICEA PINUS";

difference(){
    
union(){
minkowski(){
    cube([$board_width,$board_height,$board_thicknes], center=false);
    cylinder(r=$board_rounding_radius,h=0.1);
};
translate([$holder_offset,$holder_offset,$board_thicknes]) cube([$holder_width,$holder_height,$holder_thicknes], center=false);
};

translate([$holder_width+2*$holder_offset,($board_height-$font_size/2)/1.5,-$board_thicknes/2]){
    linear_extrude(height=$board_thicknes*2, $fn=110){
        text($text, font=$font, size=$font_size, halign = "left", valign="center" );
    };
};
};
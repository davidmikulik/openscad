module metric_bolt(headtype, size, l)
{
	//rotate([90,0,0]) cylinder(d=size, h=l, center=true); //horizontal
	translate ([0,0,-l]) cylinder(d=size, h=l);
}
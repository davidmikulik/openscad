channel_width =11;
channel_depth = 3;
slot_width = 6;
slot_depth = 1.5;
clip_diameter = 15;
clip_width = channel_width;
clip_standoff = 4;

top_width = 10;
top_depth = 2;

a = channel_width / 2;
b = slot_width / 2;
c = clip_diameter / 2;


module base() {
	difference() {
		union() {
			cube([a, a, channel_depth]);
			translate([a, a, 0]) {
				cube([a, a, channel_depth]);
				cylinder(channel_depth, a, a, $fn=50);
			}

			translate([a, a, channel_depth]) cylinder(slot_depth, b, b, $fn=50);
		}
		translate([-0.5, -b, -0.5]) cube([2 *a + 1, a, channel_depth + 1]);
		translate([-0.5, a + b, -0.5]) cube([2 *a + 1, a, channel_depth + 1]);
	}
}


module top() {
	translate([-(clip_diameter / 2 + 1), -clip_width / 4, 0]) difference() {
		union() {
			cube([clip_diameter + 2, a, clip_diameter / 10 + clip_standoff]);
			translate([c+4, 0, clip_diameter / 10 + clip_standoff]) cube([a, a, clip_diameter / 10 + clip_standoff]);
			translate([1, 0, clip_diameter / 3 + clip_standoff]) cube([clip_diameter + 1, a, clip_diameter / 20 + clip_standoff]);
		}
//		union() {
//			translate([c + 1, clip_width + 0.5, clip_diameter / 2 + clip_standoff]) rotate([90, 0 ,0]) cylinder(clip_width + 1, c, c, $fn = 50);
//			translate([clip_diameter / 6 + 1, -0.5, clip_diameter / 2 + clip_standoff]) cube([clip_diameter * 2/3, clip_width + 1, clip_diameter]);
//		}
	}
}

base();
translate([a, a, channel_depth + slot_depth]) rotate([0, 0, 90]) top();
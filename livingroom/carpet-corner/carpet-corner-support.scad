module rightangle(w, h, thickness=1.0, rounded_corner=5, width=10, hole_radius=1.0, hole_spacing=7) {
	difference() {
		// Base plate
		minkowski() {
			cube([w-rounded_corner*2, h-rounded_corner*2, thickness], center=true);
			cylinder(r=rounded_corner,h=0.001);
		}

		// Slice off the top (unwanted rounded corners)
		translate([0,(h-rounded_corner*2)/2,0])
			cube([w,width,thickness*2], center=true);

		// Slice off the right (unwanted rounded corners)
		translate([(w-rounded_corner*2)/2,0,0])
			cube([width,h,thickness*2], center=true);

		// Cut out the middle to make an L-shape
		cube([w-rounded_corner*2-width,h-rounded_corner*2-width,thickness*2], center=true);

		// --- Holes ---

		// Corner
		translate([-w/2+rounded_corner/2+hole_radius,-h/2+rounded_corner/2+hole_radius,0])
			cylinder(r=hole_radius, h=thickness*2, center=true, $fn=24);

		// Vertical
		for (i = [0:((h-width-hole_spacing*2)/hole_spacing)]) {
			translate([-w/2+hole_radius*2,h/2-width-hole_spacing-i*hole_spacing,0])
				cylinder(r=hole_radius, h=thickness*2, center=true, $fn=24);
		}

		// Horizontal
		for (i = [0:((w-width-hole_spacing*2)/hole_spacing)]) {
			translate([w/2-width-hole_spacing-i*hole_spacing,-w/2+hole_radius*2,0])
				cylinder(r=hole_radius, h=thickness*2, center=true, $fn=24);
		}
	}
}

rightangle(60,60);
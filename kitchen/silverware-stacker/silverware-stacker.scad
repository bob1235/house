
module tapercube(w1=10, h1=10, w2=10, h2=10, depth=10, cut=3.0) {
  plane = 0.001;
  hull() {
    translate([cut/2,cut/2,0])
      cube([w1-cut, h1-cut, plane]);
    translate([0,0,cut/2]) {
      translate([0,cut/2])
        cube([w1, h1-cut, plane]);
      translate([cut/2,0])
        cube([w1-cut, h1, plane]);
    }

    translate([-(w2-w1)/2, -(h2-h1)/2, 0]) {
      translate([cut/2,cut/2,depth-plane])
        cube([w2-cut, h2-cut, plane]);
      translate([0,0,depth-cut/2]) {
        translate([0,cut/2])
          cube([w2, h2-cut, plane]);
        translate([cut/2,0])
          cube([w2-cut, h2, plane]);
      }
    }
  }
}

module neck(bw=44+3, tw=57+3) {
  difference() {
    tapercube(bw, 15, tw, 15, 50);

    translate([(bw-10)/2,0,8.1])
      difference() {
        cube([10,15,42]);
        for(x=[-5.5,10+5.5])
          translate([x,7,0])
            scale([0.5,1,1])
              cylinder(h=42,r=14);
      }
  }
}

neck();
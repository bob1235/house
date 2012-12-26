flat_r=38/2;
flat_d=4.0;
screw_pos_r=flat_r-2.5;
screw_r=1.0;
hole_spacing=5;
hole_r=1.9;
cap_h=2;

cap_r=screw_r+1;

color([0.8,0.8,0.8,0.9]) {
  difference() {
    union() {
      cylinder(r=flat_r, h=flat_d, $fn=64);
      for(z=[0,360/3, 360/3*2]) {
        translate([cos(z)*screw_pos_r, sin(z)*screw_pos_r, 0]) {
          translate([0,0,flat_d+cap_h/2])
            cylinder(r=cap_r,h=cap_h,center=true,$fn=24);
        }
      }
    }

    for(z=[0,360/3, 360/3*2]) {
      translate([cos(z)*screw_pos_r, sin(z)*screw_pos_r, 0]) {
        cylinder(r=screw_r,h=20,center=true,$fn=24);
      }
    }

    for(x=[-2,-1,0,1,2])
      for(y=[-2,-1,0,1,2])
        translate([x*hole_spacing,y*hole_spacing,0])
          if(x!=-2 || y!=-2)
          if(x!=-2 || y!=2)
          if(x!=2  || y!=2)
          if(x!=2  || y!=-2)
          // cylinder(r=hole_r,h=20,center=true,$fn=24);
          cube([hole_r*2,hole_r*2,20],center=true);
  }

  for(z=[0,360/3, 360/3*2]) {
    translate([cos(z)*screw_pos_r, sin(z)*screw_pos_r, 0]) {
      translate([0,0,flat_d+cap_h]) {
        difference() {
          sphere(r=cap_r/2+1,$fn=24);
          translate([0,0,-cap_r*3/2])
            cube([cap_r*3,cap_r*3,cap_r*3],center=true);
        }
      }
    }
  }

  difference() {
    translate([-flat_r+2,0,0])
      rotate([0,0,90])
        scale([0.5,1,1])
          cylinder(r=5,h=2,$fn=48);

    difference() {
      cylinder(r=flat_r+5, h=flat_d, $fn=64);
      cylinder(r=flat_r+1, h=flat_d, $fn=64);
    }
  }
}
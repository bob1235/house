oval_dia_major=48;
oval_dia_minor=29;
oval_d=1.2;
plug_dia=26;
plug_d=10;

scale([1,oval_dia_minor/oval_dia_major, 1])
  cylinder(r=oval_dia_major/2,h=oval_d,$fn=64);

translate([0,0,oval_d]) {
  difference() {
    cylinder(r1=plug_dia/2,r2=plug_dia/2-0.5,h=plug_d);

    cylinder(r1=plug_dia/2-2,r2=plug_dia/2-0.5-2,h=plug_d);
  }
}
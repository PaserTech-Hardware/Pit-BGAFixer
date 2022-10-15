module squircle(size = [1, 1, 1], r = 0.5, center = false) {
  x = size[0] - r * 2;
  y = size[1] - r * 2;
  z = size[2];
  
  translate(center ? [-(x / 2), -(y / 2), 0] : [r, r, 0])
  hull() {
    translate([0, 0, 0]) cylinder(z, r = r);
    translate([x, 0, 0]) cylinder(z, r = r);
    translate([0, y, 0]) cylinder(z, r = r);
    translate([x, y, 0]) cylinder(z, r = r);
  }
}

module squircle_outline(size = [1, 1, 1], width = 1, r = 0.5, center = false) {
  
  difference() {
    squircle(size, r, center);

    translate([width, width, -1])
    squircle([size[0] - width * 2, size[1] - width * 2, size[2] + 2], r, center);
  }
}

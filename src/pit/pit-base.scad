use <../lib/squircle.scad>

module pit_base(size, chiptray) {

  difference() {

    // body
    squircle(size, 7);

    // cutout for chiptray
    translate([(size[0] - chiptray[0]) / 2, 0, size[2] - 1]) {

      hull() {

        // groove for chiptray
        squircle(chiptray, 3);

        // remove bottom corners
        cube([chiptray[0], 3, chiptray[2]]);
      }
    }

    // groove of bottom magnet
    tray_center = [(size[0] - chiptray[0]) / 2 + chiptray[0] / 2, chiptray[1] / 2];
    translate([tray_center[0], tray_center[1], size[2] - 5]) {
      
      translate([-10, -10, 0])
      squircle([20, 20, 5], 2);

      translate([0, 10, 0])
      cylinder(5, 2, 2, center = false);

      translate([0, -10, 0])
      cylinder(5, 2, 2, center = false);

      translate([-10, 0, 0])
      cylinder(5, 2, 2, center = false);

      translate([10, 0, 0])
      cylinder(5, 2, 2, center = false);
    }

    // top shape cutout
    translate([(size[0] - 20) / 2, size[1] - 10, 0])
    squircle([20, 20, size[2]], 3);

    // bottom shape cutout
    translate([(size[0] - 20) / 2, -15, 0])
    squircle([20, 20, size[2]], 3);
  }
}

use <../lib/squircle.scad>

module pit_chiptray(size, chip, mesh) {

  tray_center = [(size[0]) / 2, size[1] / 2];
    bar_length = (size[0] - chip[0] - 4) / 2;

  difference() {

    // chip tray
    squircle(size, 3);

    // groove for steel mesh
    translate([tray_center[0] - mesh[0] / 2, tray_center[1] - mesh[1] / 2, size[2] - 1 - mesh[2]])
    cube([mesh[0], mesh[1], size[2] - 1 - mesh[2]], center = false);

    // groove for chip
    translate([tray_center[0] - chip[0] / 2, tray_center[1] - chip[1] / 2, size[2] - 1 - mesh[2] - chip[2]]) {

      // main
      cube([chip[0], chip[1], size[2] - 1 - mesh[2] - chip[2]], center = false);

      // handlers
      translate([chip[0] / 2, chip[1], 0])
      cylinder(5, 2, 2, center = false);

      translate([chip[0] / 2, 0, 0])
      cylinder(5, 2, 2, center = false);
    }

    // left and right bars
    translate([0, size[1] / 2 - 6, size[2] / 2]) {
      squircle([bar_length, 12, size[2]], 1);
      cube([1, 12, size[2]], center = false);
    }

    translate([size[0] - bar_length, size[1] / 2 - 6, size[2] / 2]) {
      squircle([bar_length , 12, size[2]], 1);
      
      translate([bar_length - 1, 0, 0])
      cube([1, 12, size[2]], center = false);
    }

    // the hole under the chip
    translate([tray_center[0] - (chip[0] / 2 + 5), tray_center[1] - 1, 0])
    squircle([chip[0] + 10, 2, size[2]]);
  }


}

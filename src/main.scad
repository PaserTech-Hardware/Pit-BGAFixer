use <pit/pit-base.scad>
use <pit/pit-chiptray.scad>

$fs = 0.1;

// pit-base [x, y, z]
pitbase_size  = [85, 85, 10];

// pit-chiptray [x, y, z]
chiptray_size = [60, 80,  4];

// chip package size [x, y, z]
chip_size = [14, 14, 1];

// steel mesh size [x, y, z]
steel_mesh_size = [50, 50, 0.2];

pit_base(
  size     = pitbase_size,
  chiptray = chiptray_size
);

// 0.2 is the tolerance
translate([pitbase_size[1] + 10, 0, 0])
pit_chiptray(
  size = [chiptray_size[0] - 0.2, chiptray_size[1] - 0.2, chiptray_size[2]],
  chip = [chip_size[0] + 0.2, chip_size[1] + 0.2, chip_size[2]],
  mesh = [steel_mesh_size[0] + 0.2, steel_mesh_size[1] + 0.2, steel_mesh_size[2]]
);

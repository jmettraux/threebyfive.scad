
//
// src/east.scad

include <threebyfive.scad>;

ww = wall_width + o2;


difference() {

  outer_box();

  translate([ cw * 0.5 - height / 2 - 100, -cl, -height ])
    cube([ 100, cl * 2, height * 2 ]);

  //translate([ cw * 0.5 - height / 2, -cl, -height ])
  //  cube([ 50, cl * 2, height * 2 ]);
}

difference() {

  cube([
    inner_box_width + 2 * ww,
    inner_box_length + 2 * ww,
    inner_box_height,
      ], center=true);
  #translate([ 0, 0, ww ])
    cube([
      inner_box_width + 4 * ww,
      inner_box_length,
      inner_box_height,
        ], center=true);
}


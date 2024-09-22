
//
// src/west.scad

include <threebyfive.scad>;


ww = wall_width + o2;


difference() {

  outer_box();

  translate([ 0, -cl, -height ])
    cube([ 50, cl * 2, height * 2 ]);

  w = inner_box_width + 2 * ww;

  #translate([ -0.5 * w + ww, 0, 0 ])
    cube([
      w + o2,
      inner_box_length + 2 * ww + o4,
      inner_box_height + 2 * ww
        ], center=true);
}


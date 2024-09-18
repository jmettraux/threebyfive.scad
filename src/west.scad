
//
// src/west.scad

include <threebyfive.scad>;


ww = wall_width + o2;


difference() {

  outer_box();

  translate([ cw * 0.5 - height / 2, -cl, -height ])
    cube([ 50, cl * 2, height * 2 ]);

  #translate([ -4.40, 0, 0 ])
    cube([
      inner_box_width + 4 * ww,
      inner_box_length + 2 * ww,
      inner_box_height + ww
        ], center=true);
}


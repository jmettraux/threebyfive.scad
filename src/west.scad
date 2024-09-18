
//
// src/west.scad

include <threebyfive.scad>;


difference() {

  outer_box();

  translate([ cw * 0.5 - height / 2, -cl, -height ])
    cube([ 50, cl * 2, height * 2 ]);
}


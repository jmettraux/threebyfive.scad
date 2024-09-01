
//
// src/south.scad

include <threebyfive.scad>;


difference() {

  outer_box();

  translate([ -10, 0, 10 - o4 ])
    cube([ cw + 10, 1.5 * cl, 10 ], center=true);
      // minus roof

  translate([ -5.5 * o2, 0, o4 ])
    cube([ card_width + o2, card_length + o2, height ], center=true);
}


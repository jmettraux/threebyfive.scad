
//
// src/east.scad

include <threebyfive.scad>;

ww = wall_width + o2;


difference() {

  outer_box();

  translate([ -100, -cl, -height ])
    cube([ 100, cl * 2, height * 2 ]);
}

difference() {

  w = card_width;
  l = inner_box_length;
  h = inner_box_height;

  translate([ -0.5 * w, 0, 0 ])
    cube([
      w,
      l + 1.4,
      h
        ], center=true);
  translate([ -0.5 * inner_box_width, 0, ww ])
    cube([
      w + ww,
      l - 2 * ww,
      h - ww
        ], center=true);
}


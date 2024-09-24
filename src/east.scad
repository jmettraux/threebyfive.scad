
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

  w = inner_box_width + 2 * ww;
  l = inner_box_length;
  h = inner_box_height - 2 * o2;

  translate([ -0.5 * w, 0, 0 ])
    cube([
      w,
      l,
      h
        ], center=true);
  translate([ -0.5 * inner_box_width - 1 * ww, 0, ww ])
    cube([
      w + ww,
      l - 2 * ww,
      h - ww
        ], center=true);

  //translate([ -0.5 * w, 0, 0 ])
  //  cube([
  //    w,
  //    inner_box_length + 2 * ww,
  //    inner_box_height + 2 * ww
  //      ], center=true);
  //translate([ -0.5 * inner_box_width - 1 * ww, 0, ww ])
  //  cube([
  //    w + ww,
  //    inner_box_length,
  //    inner_box_height + 3 * ww,
  //      ], center=true);
}



//
// src/dimensions.scad

// unit is mm

o2 = 0.2;
o4 = 0.4;

inch = 25.4;

card_length = 5 * inch;
card_width = 3 * inch;

cyld = 14;
height = 15;

cl = card_length + o4;
cw = card_width + height / 2 + o4;

$fn = 60;


module outer_box() {

  difference() {

    hull() {

      translate([ -cw / 2,   cl / 2, 0 ]) sphere(d=height);
      translate([  cw / 2,   cl / 2, 0 ]) sphere(d=height);
      translate([ -cw / 2, - cl / 2, 0 ]) sphere(d=height);
      translate([  cw / 2, - cl / 2, 0 ]) sphere(d=height);
    }

    translate([ cw / 2 + cyld / 2, 0,  ]) rotate([ 90, 0, 0 ])
      cylinder(d=cyld, h=cl * 1.4, center=true);
  }
}


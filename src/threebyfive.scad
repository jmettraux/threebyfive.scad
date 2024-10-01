
//
// src/threebyfive.scad

// unit is mm

o2 = 0.2;
o4 = 0.4;

inch = 25.4;

card_width = 3 * inch;
card_length = 5 * inch;

cyld = 14;
height = 15;

cl = card_length + o4;
cw = card_width + height / 2 + o4;

$fn = 60;

wall_width = 0.8;
inner_box_width = card_width + o2;
inner_box_length = card_length + o2;
inner_box_height = height - wall_width * 2 - 11 * o2;
  //echo("inner_box_height", inner_box_height);

dx = 35;


module outer_box() {

  translate([ -dx, 0, 0 ]) {

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
}

//module index_card() {
//  cube([ card_width, card_length, 0.2 ], center=true);
//}
  //
//translate([ 0, 0, height ]) color("ivory") index_card();
//translate([ 0, 0, height + 1 ]) color("ivory") index_card();
//translate([ 0, 0, height + 2 ]) color("ivory") index_card();
//translate([ 0, 0, height + 3 ]) color("ivory") index_card();

//outer_box();


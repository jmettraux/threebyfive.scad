
//
// src/pad.scad
//
// a simpler, simple pad
//

// unit is mm

$fn = 90;

o2 = 0.2;
inch = 25.4;
ball_radius = 1;
small_ball_radius = 0.7;
clip_width = 37;
clip_depth = 3;
clip_length = 60;
elastic_width = 3.5 + 0.1;
elastic_height = 2.4 + 0.1;
//rail_height = elastic_height + 4 * o2;
para_diameter = 4.9;
para_trench = 20;
groove_depth = elastic_height + 4 * o2;
ridge_depth = 6.6;
ridge_height = 2;

br = ball_radius;
sbr = small_ball_radius;
bd = ball_radius * 2;
cw = clip_width;
cd = clip_depth;
cl = clip_length;


width = 3 * inch + bd + o2;
length = 5 * inch + br + o2;
height = 9;

w2 = 0.5 * width;
l2 = 0.5 * length;

module ball() { sphere(r=br); }
module sball() { sphere(r=sbr); }


// plate

module elastic_holes() {
  //  ew = elastic_width + 7.2 * o2;
  //  eh = elastic_height + br;
  //  rh = rail_height;
  //  l = length - cw;
  ew = elastic_width;
  translate([ -l2, w2 - 0.5 * ew, 0 ])
    for (i = [ 1 : 2.0 : 35 ]) {
      translate([ i * ew, 2.1 * o2, 0 ])
        cylinder(d=ew, h=1.1 * (height + d), center=true);
    }
}

difference() {
  hull() {
    translate([ - l2, - w2, 0 ]) ball();
    translate([ - l2, + w2, 0 ]) ball();
    translate([ + l2, - w2, 0 ]) ball();
    translate([ + l2, + w2, 0 ]) ball();
  }
  elastic_holes();
}
translate([ 0, + w2 - ridge_depth, -br ]) rotate([ 0, 90, 0 ])
  cylinder(d=ridge_height, h=length, center=true);
translate([ 0, - w2 + ridge_depth, -br ]) rotate([ 0, 90, 0 ])
  cylinder(d=ridge_height, h=length, center=true);

// left side

hull() {
  translate([ - l2, - w2, 0 ]) ball();
  translate([ - l2, + w2, 0 ]) ball();
  translate([ - l2, - w2, height ]) ball();
  translate([ - l2, + w2, height ]) ball();
}

// top side

hull() {
  translate([ - l2, + w2, 0 ]) ball();
  translate([ + l2 - pt, + w2, 0 ]) ball();
  translate([ - l2, + w2, height ]) ball();
  translate([ + l2 - pt, + w2, height ]) ball();
}

// top under clip

hull() {
  translate([ + l2 - pt, + w2 - br + sbr, 0 ]) sball();
  translate([ + l2 - pt, + w2 - br + sbr, 0.77 * height ]) sball();
  translate([ + l2, + w2 - br + sbr, 0 ]) sball();
  translate([ + l2, + w2 - br + sbr, 0.77 * height ]) sball();
}

// right side

hull() {
  translate([ + l2, - w2 + 1 * cw, 0 ]) ball();
  translate([ + l2, + w2, 0 ]) ball();
  translate([ + l2, - w2 + 1.2 * cw, height ]) ball();
  translate([ + l2, + w2, height ]) ball();
}

// bottom big part

d = cd - br + 2.5 + 0.3;
pt = clip_width + para_diameter + 3 * o2;

difference() {
  hull() {
    translate([ - l2 + pt, - w2, 0 ]) ball();
    translate([ - l2 + pt, + w2, 0 ]) ball();
    translate([ - l2 + pt, - w2, -d ]) ball();
    translate([ - l2 + pt, + w2, -d ]) ball();
  }
  translate([ -l2 + pt, + 0.75 * w2, - 0.45 * d ])
    rotate([ 0, 90, 0 ])
      cylinder(d=para_diameter, h = 7 * br, center=true);
  translate([ -l2 + pt, - 0.75 * w2, - 0.45 * d ])
    rotate([ 0, 90, 0 ])
      cylinder(d=para_diameter, h = 7 * br, center=true);
}
hull() {
  translate([ - l2 + pt, - w2, 0 ]) ball();
  translate([ - l2 + pt, - w2, -d ]) ball();
  translate([ - l2 + pt + para_diameter, - w2, 0 ]) ball();
}

difference() {
  hull() {
    translate([ + l2 - pt, - w2, 0 ]) ball();
    translate([ + l2 - pt, + w2, 0 ]) ball();
    translate([ + l2 - pt, - w2, -d ]) ball();
    translate([ + l2 - pt, + w2, -d ]) ball();
  }
  translate([ + l2 - pt, + 0.75 * w2, - 0.45 * d ])
    rotate([ 0, 90, 0 ])
      cylinder(d=para_diameter, h = 7 * br, center=true);
  translate([ + l2 - pt, - 0.75 * w2, - 0.45 * d ])
    rotate([ 0, 90, 0 ])
      cylinder(d=para_diameter, h = 7 * br, center=true);
}
hull() {
  translate([ + l2 - pt, - w2, 0 ]) ball();
  translate([ + l2 - pt, - w2, -d ]) ball();
  translate([ + l2 - pt - para_diameter, - w2, 0 ]) ball();
}

hull() { // central arrow 1
  translate([ + l2 - pt, 0, 0 ]) ball();
  translate([ + l2 - pt, 0, -d ]) ball();
  translate([ + l2 - pt - para_diameter, 0, 0 ]) ball();
  translate([ + l2 - pt + para_diameter, 0, 0 ]) ball();
}
hull() { // central arrow 2
  translate([ - l2 + pt, 0, 0 ]) ball();
  translate([ - l2 + pt, 0, -d ]) ball();
  translate([ - l2 + pt - para_diameter, 0, 0 ]) ball();
  translate([ - l2 + pt + para_diameter, 0, 0 ]) ball();
}

hull() { // +x arrow
  translate([ + l2, 0, 0 ]) ball();
  translate([ + l2, 0, -d ]) ball();
  translate([ + l2 - para_diameter, 0, 0 ]) ball();
  //translate([ + l2 + para_diameter, 0, 0 ]) ball();
}
hull() { // -x arrow
  translate([ - l2, 0, 0 ]) ball();
  translate([ - l2, 0, -d ]) ball();
  //translate([ - l2 - para_diameter, 0, 0 ]) ball();
  translate([ - l2 + para_diameter, 0, 0 ]) ball();
}

// fix "under the pen"

hull() {
  translate([ + l2 - pt, + w2, 0 ]) ball();
  translate([ + l2 - pt, + w2, -d ]) ball();
  translate([ - l2 + pt, + w2, 0 ]) ball();
  translate([ - l2 + pt, + w2, -d ]) ball();
}

// bottom left sides

difference() {
  hull() {
    translate([ - l2, - w2, 0 ]) ball();
    translate([ - l2, + w2, 0 ]) ball();
    translate([ - l2, - w2, -d ]) ball();
    translate([ - l2, + w2, -d ]) ball();
  }
  translate([ -l2, + 0.75 * w2, - 0.45 * d ])
    rotate([ 0, 90, 0 ])
      cylinder(d=para_diameter, h = 7 * br, center=true);
  translate([ -l2, - 0.75 * w2, - 0.45 * d ])
    rotate([ 0, 90, 0 ])
      cylinder(d=para_diameter, h = 7 * br, center=true);
}
hull() {
  translate([ - l2, + w2, 0 ]) ball();
  translate([ - l2, + w2, -d ]) ball();
  translate([ 0, + w2, 0 ]) ball();
  translate([ 0, + w2, -d ]) ball();
}

// bottom right side

difference() {
  hull() {
    translate([ + l2, - w2, 0 ]) ball();
    translate([ + l2, + w2, 0 ]) ball();
    translate([ + l2, - w2, -d ]) ball();
    translate([ + l2, + w2, -d ]) ball();
  }
  translate([ + l2, + 0.75 * w2, - 0.45 * d ])
    rotate([ 0, 90, 0 ])
      cylinder(d=para_diameter, h = 7 * br, center=true);
  translate([ + l2, - 0.75 * w2, - 0.45 * d ])
    rotate([ 0, 90, 0 ])
      cylinder(d=para_diameter, h = 7 * br, center=true);
}

hull() {
  translate([ + l2, - w2, 0 ]) ball();
  translate([ + l2, - w2, -d ]) ball();
  translate([ + l2 - para_diameter, - w2, 0 ]) ball();
}
hull() {
  translate([ + l2, + w2, 0 ]) ball();
  translate([ + l2, + w2, -d ]) ball();
  translate([ + l2 - 0.7 * para_diameter, + w2, 0 ]) ball();
  translate([ + l2, + w2, height ]) ball();
}

hull() {
  translate([ - l2, - w2, 0 ]) ball();
  translate([ - l2, - w2, -d ]) ball();
  translate([ - l2 + para_diameter, - w2, 0 ]) ball();
  translate([ - l2, - w2, height ]) ball();
}

// groove

gd = groove_depth;
gz = 0.75 * gd;

hull() {
  translate([ - l2, + w2, -d ]) ball();
  translate([ + l2 - pt, + w2, -d ]) ball();
  translate([ - l2, + w2 + gd, -d ]) ball();
  translate([ + l2 - pt, + w2 + gd, -d ]) ball();
  translate([ - l2, + w2, - d + gz ]) ball();
  translate([ + l2 - pt, + w2, - d + gz ]) ball();
}
hull() {
  translate([ - l2, + w2, height ]) ball();
  translate([ + l2 - pt, + w2, height ]) ball();
  translate([ - l2, + w2 + gd, height ]) ball();
  translate([ + l2 - pt, + w2 + gd, height ]) ball();
  translate([ - l2, + w2, height - gz ]) ball();
  translate([ + l2 - pt, + w2, height - gz ]) ball();
}



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

br = ball_radius;
sbr = small_ball_radius;
bd = ball_radius * 2;
cw = clip_width;
cd = clip_depth;
cl = clip_length;


width = 3 * inch + bd + o2;
length = 5 * inch + bd + o2;
height = 9;

w2 = 0.5 * width;
l2 = 0.5 * length;

module ball() { sphere(r=br); }
module sball() { sphere(r=sbr); }


// plate

hull() {
  translate([ - l2, - w2, 0 ]) ball();
  translate([ - l2, + w2, 0 ]) ball();
  translate([ + l2, - w2, 0 ]) ball();
  translate([ + l2, + w2, 0 ]) ball();
}

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
  translate([ + l2 - cw, + w2, 0 ]) ball();
  translate([ - l2, + w2, height ]) ball();
  translate([ + l2 - cw, + w2, height ]) ball();
}

// top under clip

hull() {
  translate([ + l2 - cw, + w2 - br + sbr, 0 ]) sball();
  translate([ + l2 - cw, + w2 - br + sbr, 0.77 * height ]) sball();
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

d = cd - br + 2.5;

hull() {
  translate([ - l2, - w2, 0 ]) ball();
  translate([ - l2, + w2, 0 ]) ball();
  translate([ + l2 - cw, - w2, 0 ]) ball();
  translate([ + l2 - cw, + w2, 0 ]) ball();
  translate([ - l2, - w2, -d ]) ball();
  translate([ - l2, + w2, -d ]) ball();
  translate([ + l2 - cw, - w2, -d ]) ball();
  translate([ + l2 - cw, + w2, -d ]) ball();
}

// bottom small part

hull() {
  translate([ - l2, - w2, 0 ]) ball();
  translate([ - l2, + w2 - cl - br, 0 ]) ball();
  translate([ + l2, - w2, 0 ]) ball();
  translate([ + l2, + w2 - cl - br, 0 ]) ball();
  translate([ - l2, - w2, -d ]) ball();
  translate([ - l2, + w2 - cl - br, -d ]) ball();
  translate([ + l2, - w2, -d ]) ball();
  translate([ + l2, + w2 - cl - br, -d ]) ball();
}

// bottom right side

hull() {
  translate([ + l2, - w2, 0 ]) ball();
  translate([ + l2, + w2, 0 ]) ball();
  translate([ + l2, - w2, -d ]) ball();
  translate([ + l2, + w2, -d ]) ball();
}


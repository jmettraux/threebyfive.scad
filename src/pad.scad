
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
clip_width = 37;
clip_depth = 3;
clip_length = 60;

br = ball_radius;
bd = ball_radius * 2;
cw = clip_width;
cd = clip_depth;
cl = clip_length;


length = 5 * inch + bd + o2;
width = 3 * inch + bd + o2;
height = 9;

module ball() { sphere(r=br); }


// plate

hull() {
  translate([ - 0.5 * length, - 0.5 * width, 0 ]) ball();
  translate([ - 0.5 * length, + 0.5 * width, 0 ]) ball();
  translate([ + 0.5 * length, - 0.5 * width, 0 ]) ball();
  translate([ + 0.5 * length, + 0.5 * width, 0 ]) ball();
}

// left side

hull() {
  translate([ - 0.5 * length, - 0.5 * width, 0 ]) ball();
  translate([ - 0.5 * length, + 0.5 * width, 0 ]) ball();
  translate([ - 0.5 * length, - 0.5 * width, height ]) ball();
  translate([ - 0.5 * length, + 0.5 * width, height ]) ball();
}

// top side

hull() {
  translate([ - 0.5 * length, + 0.5 * width, 0 ]) ball();
  translate([ + 0.5 * length - cw, + 0.5 * width, 0 ]) ball();
  translate([ - 0.5 * length, + 0.5 * width, height ]) ball();
  translate([ + 0.5 * length - cw, + 0.5 * width, height ]) ball();
}

// bottom big part

d = cd - br;

hull() {
  translate([ - 0.5 * length, - 0.5 * width, 0 ]) ball();
  translate([ - 0.5 * length, + 0.5 * width, 0 ]) ball();
  translate([ + 0.5 * length - cw, - 0.5 * width, 0 ]) ball();
  translate([ + 0.5 * length - cw, + 0.5 * width, 0 ]) ball();
  translate([ - 0.5 * length, - 0.5 * width, -d ]) ball();
  translate([ - 0.5 * length, + 0.5 * width, -d ]) ball();
  translate([ + 0.5 * length - cw, - 0.5 * width, -d ]) ball();
  translate([ + 0.5 * length - cw, + 0.5 * width, -d ]) ball();
}

// bottom small part

hull() {
  translate([ - 0.5 * length, - 0.5 * width, 0 ]) ball();
  translate([ - 0.5 * length, + 0.5 * width - cl - br, 0 ]) ball();
  translate([ + 0.5 * length, - 0.5 * width, 0 ]) ball();
  translate([ + 0.5 * length, + 0.5 * width - cl - br, 0 ]) ball();
  translate([ - 0.5 * length, - 0.5 * width, -d ]) ball();
  translate([ - 0.5 * length, + 0.5 * width - cl - br, -d ]) ball();
  translate([ + 0.5 * length, - 0.5 * width, -d ]) ball();
  translate([ + 0.5 * length, + 0.5 * width - cl - br, -d ]) ball();
}

// bottom right side

hull() {
  translate([ + 0.5 * length, - 0.5 * width, 0 ]) ball();
  translate([ + 0.5 * length, + 0.5 * width, 0 ]) ball();
  translate([ + 0.5 * length, - 0.5 * width, -d ]) ball();
  translate([ + 0.5 * length, + 0.5 * width, -d ]) ball();
}


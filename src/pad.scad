
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
clip_width = 35;
clip_depth = 3;

br = ball_radius;
bd = ball_radius * 2;
cw = clip_width;
cd = clip_depth;


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



// drawline.pde
//
// Draws a line from center around a circle path with descent stroke color

int angle = 0, c = 0, s = 1;
float radius = 180;


void setup() {
  background(0);
  size(400, 400);
  strokeWeight(6);
  smooth();
}

void draw() {

  stroke(c);
  float x = cos(radians(angle)) * radius; 
  float y = sin(radians(angle)) * radius;
  line(width/2, height/2, x + width/2, y + height/2);

  angle++;
  c = c + s;

  if (angle > 360) {
    angle  = 0;
  }

  // descent gradient from 0 to 255 and back
  if (c > 254 || c < 1) {
    s = s*-1;
  }
}

void keyPressed() {
  if (key == 'j') {
    c=+5;
  }
}
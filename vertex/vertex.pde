

PShape s;

void setup() {
  size(500, 500, P3D);
  s = createShape(SPHERE, 100); //loadShape("my.obj");
}

void draw() {
  background(204);
  camera(mouseX, height/2, (height/2) / tan(PI/6), width/2, height/2, 0, 0, 1, 0);
  translate(width/2, height/2);
  fill(155);
  PImage img = loadImage("texture.png");
  
  s.setTexture(img);
  shape(s, 0, 0);
  
}

boolean active = true;

int angle = 0;

color[] colors = {#e05633, #f7e04a, #ffffff};
int i=0;
color d = colors[i];

void setup() {
  background(0);
  size(400, 400);
  strokeWeight(3);
  //frameRate(40);
}

void draw() {

  stroke(random(255));
  float radius = random(20, 190);
  float x = cos(radians(angle)) * radius; 
  float y = sin(radians(angle)) * radius;
  line(width/2, height/2, x + width/2, y + height/2);

  if (active) {
    angle++;
  }

  if (angle > 360) {
    angle  = 0;
    d = colors[i++];
    println(""+i);
  }

  if (i > 2) i=0;
}

void keyPressed() {
  if (key == 'j') {
    if (active) active=false;
    else active=true;
  }
}
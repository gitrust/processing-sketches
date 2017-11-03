

class Ball {
  PVector position;
  PVector velocity;
  PVector gravity ;
  float friction;
  int id;
  boolean rest = false;
  int ballColor = 255;
  float mass;
  boolean intersection;

  float radius, m;

  Ball(float x, float y, float r_, int id) {
    this.id = id;
    position = new PVector(x, y);
    velocity = new PVector(random(25), random(25));
    gravity = new PVector(0, 0.9);
    friction = 0.8;

    radius = r_;
    mass = radius*.2;
  }

  // check intersection and remember value
  boolean intersects(Ball b) {    
    this.intersection = dist(position.x, position.y, b.position.x, b.position.y) < (radius * 2 + 0.5 );
    b.intersection= this.intersection;
    return this.intersection;
  }

  int getId() {
    return this.id;
  }

  void draw() {
    noStroke();
    fill(ballColor);
    ellipse(position.x, position.y, radius*2, radius*2);

    fill(0);
    text(""+this.id, position.x-3, position.y);
  }
}
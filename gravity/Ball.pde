

class Ball {
  PVector position;
  PVector velocity;
  PVector gravity ;
  float friction;
  int id;
  boolean rest = false;
  int ballColor = 255;
  float mass;

  float radius, m;

  Ball(float x, float y, float r_, int id) {
    this.id = id;
    position = new PVector(x, y);
    velocity = new PVector(random(25), random(25));
    gravity = new PVector(0, 0.8);
    friction = 0.8;

    radius = r_;
    mass = radius*.1;
    id = int(random(28888));
  }

  boolean intersects(Ball b) {
    boolean i = dist(position.x, position.y, b.position.x, b.position.y) < (radius * 2 +0.3); 
    if (i) {
      ballColor = 100;
      b.ballColor = 100;
    } else { 
      ballColor = 255;
      b.ballColor = 255;
    }
    return i;
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


class Ball {
  PVector position;
  PVector velocity;
  PVector gravity ;
  float friction;
  int id;
  boolean rest = false;

  float radius, m;

  Ball(float x, float y, float r_) {
    position = new PVector(x, y);
    velocity = new PVector(0, 1.1);
    gravity = new PVector(0, 0.3);
    friction = 0.5;

    radius = r_;
    m = radius*.1;
    id = int(random(28888));
  }

  int getId() {
    return this.id;
  }

  void draw() {
    noStroke();
    fill(204);
    ellipse(position.x, position.y, radius*2, radius*2);
    fill(0);
    text("y"+int(position.y), position.x, position.y);
  }
}
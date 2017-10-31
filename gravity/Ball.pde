

class Ball {
  PVector position;
  PVector velocity;
  PVector gravity ;
  int id;

  float radius, m;

  Ball(float x, float y, float r_) {
    position = new PVector(x, y);
    velocity = new PVector(0, 2.1);
    gravity = new PVector(0, 0.94);

    radius = r_;
    m = radius*.1;
    id = int(random(200));
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
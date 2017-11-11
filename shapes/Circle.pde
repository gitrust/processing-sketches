

class Circle extends Shape {
  int diameter;
  Circle(float x, float y, int diameter) {
    super(x, y);
    this.diameter=diameter;
  }

  void draw() {
    stroke(getColor());
    ellipse(getX(), getY(), diameter, diameter);
  }

  boolean contains(float x, float y) {
    float disX = getX() - x;
    float disY = getY() - y;
    if (sqrt(sq(disX) + sq(disY)) < diameter/2 ) {
      return true;
    } else {
      return false;
    }
  }
}
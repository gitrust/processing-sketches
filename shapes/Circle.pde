

class Circle extends Shape {
  int diameter;
  Circle(float x, float y, int diameter) {
    super(x, y);
    this.diameter=diameter;
  }

  void draw() {
    ellipse(getX(), getY(), diameter, diameter);
  }
}


abstract class Shape {
  private float x;
  private float y;

  Shape(float x, float y) {
    this.x=x;
    this.y=y;
  }

  float getX() {
    return this.x;
  }
  float getY() {
    return this.y;
  }
  boolean intersects(Shape s) {
    return false;
  }

  abstract void draw();
}
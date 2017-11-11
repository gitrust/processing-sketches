

abstract class Shape {
  private float x;
  private float y;
  private boolean selected;
  private color c = color(255, 255, 1, 255);

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

  boolean contains(float x, float y) {
    return false;
  }
  
  void move(float x,float y) {
    this.x=x;
    this.y=y;
  }

  void setSelected(boolean s) {
    this.selected=s;
  }

  boolean isSelected() {
    return this.selected;
  }

  color getColor() {
    if (this.selected) {
      return color(255, 0, 255, 255);
    }
    return c;
  }

  abstract void draw();
}
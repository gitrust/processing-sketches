

class Rectangle extends Shape {
  int w;
  int h;

  Rectangle(float x, float y, int w, int h) {
    super(x, y);
    this.w=w;
    this.h=h;
  }

  void draw() {
    rect(getX(), getY(), w, h);
  }
  
  boolean contains(float x, float y) {
    return getX() < x && (getX()+w) > x && getY() < y && (getY()+h) > y;
  }
}
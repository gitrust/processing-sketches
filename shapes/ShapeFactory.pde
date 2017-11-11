

class ShapeFactory {

  ShapeFactory() {
  }

  Shape addCircle(float x, float y) {
    return new Circle(x, y, 30);
  }

  Shape addRectangle(float x, float y) {
    return new Rectangle(x, y, 50, 50);
  }
}
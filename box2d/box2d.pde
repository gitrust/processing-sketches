
import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

ArrayList<Box> boxes;

Box2DProcessing box2d;  

void setup() {
  smooth();

  boxes = new ArrayList<Box>();
  size(400, 400);

  // Initialize and create the Box2D world
  box2d = new Box2DProcessing(this);  
  box2d.createWorld();
}

void draw() {
  background(244);
  box2d.step();

  if (mousePressed) {
    Box b = new Box(mouseX, mouseY);
    boxes.add(b);
  }

  for (Box b : boxes) {
    b.display();
  }
}
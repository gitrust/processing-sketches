



class Controller {
  ShapeFactory f;
  ArrayList<Shape> shapes ;
  Modes modes ;

  Controller() {
    f = new ShapeFactory();
    shapes = new ArrayList<Shape>();
    modes = new Modes();
  }

  void action(char k) {
    modes.setKey(k);

    if (modes.isAttach()) {
      if (key == 'c') {
        shapes.add(f.addCircle(width/2, height/2));
      } else
        if (key == 'r' ) {
          shapes.add(f.addRectangle(width/2, height/2));
        }
    }
  }

  String getModeText() {
    return modes.getModeText();
  }

  String getModeHelp() {
    return modes.getModeHelp();
  }


  void draw() {
    fill(0);
    for (Shape s : shapes) {
      s.draw();
    }
  }
}
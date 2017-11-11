



class Controller {
  private ShapeFactory f;
  private ArrayList<Shape> shapes ;
  private Modes modes;
  private boolean mouseSelected = false;
  private float mX=0;
  private float mY=0;
  private boolean mPressed=false;


  Controller() {
    this.f = new ShapeFactory();
    this.shapes = new ArrayList<Shape>();
    this.modes = new Modes();
  }

  void action(char k) {
    this.modes.setKey(k);

    if (this.modes.isAttach()) {
      if (key == 'c') {
        this.shapes.add(f.addCircle(width/2, height/2));
      } else
        if (key == 'r' ) {
          this.shapes.add(f.addRectangle(width/2, height/2));
        }
    }
  }

  void mPressed(boolean pressed) {
    this.mPressed=pressed;
  }

  String getModeText() {
    return this.modes.getModeText();
  }

  String getModeHelp() {
    return this.modes.getModeHelp();
  }

  void mousePosition(float mX, float mY) {
    this.mX=mX;
    this.mY=mY;
  }

  void clicked(float mX, float mY) {
    this.mouseSelected = !mouseSelected;
  }

  void draw() {
    stroke(0);

    for (Shape s : this.shapes) {

      // select / unselect shape
      if (this.mPressed) {
        if (s.contains(this.mX, this.mY)) {
          s.setSelected(true);
        }

        // move only selected 
        if (modes.isSelect() && s.isSelected()) {
          s.move(this.mX, this.mY);
        }
      } else {
        s.setSelected(false);
      }

      s.draw();
    }
  }
}
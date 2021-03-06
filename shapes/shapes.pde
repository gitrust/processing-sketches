


Controller c;


void setup() {
  c = new Controller();
  size(400, 400);
}

void draw() {
  c.mousePosition(mouseX,mouseY);
  background(155);

  c.draw();

  text("MODE: " + c.getModeText(), 20, 20);
  text("" + c.getModeHelp(), 20, 40);
}

void keyPressed() {
  c.action(key);
}

void mouseClicked() {
   c.clicked(mouseX,mouseY); 
}

void mousePressed() {
  c.mPressed(true);
}

void mouseReleased() {
  c.mPressed(false);
}
// processing 3.3.6

// balls with gravity and collision detection


ArrayList<Ball> balls = new ArrayList() ;
Logic logic = new Logic();
int max = 100;
int id = 1;
boolean f = true;

void setup() {
  size(300, 700);
}

void draw() {
  background(51);

  for (Ball b : balls) {
    logic.apply(b, balls);

    b.draw();
  }
}

void keyPressed() {
  if (key == 'b') {
    if (balls.size() < max)
      balls.add(new Ball(100, random(20, 30), 20, id++));
  }

  if (key == 'd') {
    if (f) {
      frameRate(60); 
      f=false;
    } else {
      frameRate(2); 
      f =true;
    }
  }
}
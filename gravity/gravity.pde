// processing 3.3.6

// balls with gravity and collision detection


ArrayList<Ball> balls = new ArrayList() ;
Logic logic = new Logic();
int maxBalls = 3;
int id = 1;

void setup() {
  size(300, 700);


  // balls.add(new Ball(100,100, 20));
  // balls.add(new Ball(100,20, 20));

  //frameRate(10);
}

void draw() {
  background(51);

  for (Ball b : balls) {
    logic.apply(b, balls);

    b.draw();
  }

  // put one ball each 50 frame into scene
  if (maxBalls > balls.size()) {
    if (frameCount % 50 == 0) {
      balls.add(new Ball(100, random(20, 30), 20,id++));
    }
  }
}
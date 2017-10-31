// processing 3.3.6

// balls with gravity and collision detection


ArrayList<Ball> balls = new ArrayList() ;
Logic logic = new Logic();
int ballCount = 2;

void setup() {
  size(300, 700);
  
  for (int i = 0;i< ballCount; i++) {
    balls.add(new Ball(random(20,width), random(20,30), 20));
  }
  
  //frameRate(10);
  
}

void draw() {
  background(51);

  for (Ball b : balls) {
    logic.apply(b);
    b.draw();
  }
  
}
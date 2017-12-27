// processing 3.3.6

// balls with gravity and collision detection

// https://airesearch.de/web_articles/particle_simulation/
// https://www.openprocessing.org/sketch/849#

ArrayList<Ball> balls = new ArrayList() ;
Logic logic = new Logic();
int max = 100;
int id = 1;
boolean f = true;

void setup() {
  size(200, 700);
  smooth();
}

void draw() {
  background(51);
  
  fill(255);
  text("Press 'b'",width/2-40,height/2);

  for (Ball b : balls) {
    logic.apply(b, balls);

    b.draw();
  }
}

void reset() {
   balls = new ArrayList();
   id=0;
   
}

void keyPressed() {
  if (key == 'b') {
    if (balls.size() < max)
      balls.add(new Ball(100, random(20, 30), 20, id++));
  }
  if (key == 'r') reset();

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
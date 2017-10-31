// processing 3.3.6

// balls with gravity and collision detection


ArrayList<Ball> balls = new ArrayList() ;

void setup() {
  size(700, 500);
  
  for (int i = 0;i< 12; i++) {
    balls.add(new Ball(random(20,width), random(20,height), 20));
  }
  
}

void draw() {
  background(51);

  for (Ball b : balls) {
    b.update();
    b.draw();
  }
  
}







class Ball {
  PVector position;
  PVector velocity;
  PVector gravity ;
  int id;

  float radius, m;

  Ball(float x, float y, float r_) {
    position = new PVector(x, y);
    velocity = new PVector(0,2.1);
    gravity = new PVector(0,0.94);
    
    radius = r_;
    m = radius*.1;
    id = int(random(200));
  }
  
  int getId() {
    return this.id;
  }

  void update() {
    position.add(velocity);
    velocity.add(gravity);
    
    if (position.y > height - radius) {
      position.y = height -radius;      
    }
  }

  void draw() {
    noStroke();
    fill(204);
    ellipse(position.x, position.y, radius*2, radius*2);
    fill(0);
    text("y"+int(position.y),position.x,position.y);
  }
}
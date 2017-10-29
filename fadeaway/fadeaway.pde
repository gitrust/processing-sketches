
ArrayList<Point> points = new ArrayList();

void setup() {
    size(200,200);
    
    addPoints(10);
}

void draw() {
  background(0);
  
  for (Point p: points) {
    if (p.isAlive())
      p.draw();
  }
  
  if (frameCount % 40 == 0) {
    for (Point p: points) {
      if (!p.isAlive()) {
        awake(p);
      }
    }
  }
}

void awake(Point p) {
  p.setLife(int(random(100,1000)));
  p.position(random(15,width-15),random(15,height-15));
  p.setSize(int(random(15,40)));
}

void addPoints(int count) {
  for (int i=0;i< count; i++) {
    points.add(new Point(random(15,width-15),random(15,height-15),int(random(1000))));
  }
}


class Point {
  float x;
  float y;
  int life;
  int size = 40;
  
  Point (float x, float y, int life) {
     this.x = x;
     this.y = y;
     this.life = life < 0 ? 100: life;
  }
  
  void position(float x, float y) {
     this.x = x;
     this.y = y;
  }
  
  void setLife(int life) {
     this.life=life; 
  }
  
  void setSize(int size) {
     this.size = size; 
  }
  
  void draw() {
      noStroke();
      fill(100,100,100,100);
      arc(this.x, this.y, this.size, this.size, 0, PI*4, CHORD);
      
      this.life--;
  }
  
  boolean isAlive() {
     return this.life > 0; 
  }
}

// processing 3.3.6

// Buttons fading away 

ArrayList<Point> points = new ArrayList();
int borderOffset = 40;
int pointcount = 40;
boolean drawlife = false;

void setup() {
    size(400,400);
    
    addPoints(pointcount);
    frameRate(20);
}

void draw() {
  background(0);
  
  for (Point p: points) {
    if (p.isAlive()) {
      p.draw();
    }
    
    if (frameCount % 2 == 0) {
      if (!p.isAlive()) {
        awake(p);
      }      
    }
  }
}

void awake(Point p) {
  p.setLife(int(random(4,200)));
  p.position(random(borderOffset,width-borderOffset),random(borderOffset,height-borderOffset));
  p.setSize(40); //int(random(15,40)));
}

void addPoints(int count) {
  for (int i=0;i< count; i++) {
    points.add(new Point(random(borderOffset,width-borderOffset),random(borderOffset,height-borderOffset),int(random(4,200))));
  }
}


class Point {
  float x;
  float y;
  int initiallife;
  int life;
  int size = 40;
  int[] rgb;
  
  Point (float x, float y, int life) {
     this.x = x;
     this.y = y;
     this.life = life;
     this.initiallife = life;
     //this.rgb = new int[]{int(random(255)),int(random(255)),int(random(255))};
     this.rgb = new int[]{int(random(200,255)),120,82};
  }
  
  void position(float x, float y) {
     this.x = x;
     this.y = y;
  }
  
  void setLife(int life) {
     this.life=life;
     this.initiallife = life;
  }
  
  void setSize(int size) {
     this.size = size; 
  }
  
  
  void draw() {
    
      // normalize life value to alpha color
      int a = int((float(this.life) / float(this.initiallife)) * 255.0);
      
      // button
      noStroke();
      fill(rgb[0],rgb[1],rgb[2],a);
      arc(this.x, this.y, this.size, this.size, 0, PI*4, CHORD);
      
      
      // core
      fill(rgb[0],rgb[1]+3,rgb[2]+3,a);
      arc(this.x, this.y, this.size-20, this.size-20, 0, PI*4, CHORD);
      
      // text
      if (drawlife) {
        fill(255);
        text(""+this.life,this.x,this.y);
      }
      
      this.life--;
  }
  
  boolean isAlive() {
     return this.life > 0; 
  }
}
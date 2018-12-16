
float w = 20;
float h = 20;
float number = 20;
boolean rot = true;

void setup() {
  size(400,400);
}

void draw() {  
  for (int i =0;i< number;i++) {
    createRect();      
  }

  fill(0);
  
}

private void createRect() {
  fill(255);
  stroke(0);
  float x = random(w,width-w*2);
  float y = random(h,height-h*2);
    
    
  pushMatrix();    
  translate(x+w/2,y-h/2);
  if (rot) {
     rotate(radians(random(90)));
  }
    
  float rw = w;//random(2,w);
  float rh = 3;//random(4,h);
  rect(0,0,rw,rh);
  popMatrix();
}
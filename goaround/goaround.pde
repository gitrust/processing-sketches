// Pressing Control-R will render this sketch.

// Line starting in the center of the rectangle and
// running around 


// color the line
int r = 100;
int g =100;
int b = 100;
int a = 100;

// count of rounds
int round = 0;

// line end position
float x = 0;
float y = 0;

float initialspeed = 30;
float speed = initialspeed;
float speedlimit = 200;
char c = 'a';
boolean direction_cw = true;
boolean scatter = true;
boolean resetbackground = true;
boolean stats = false;

void setup() { 
    
    // set the background color
    background(244);
    
    // canvas size (Integers only, please.)
    size(500, 500); 
    
    // limit the number of frames per second
   // frameRate(30);
    
    // set the width of the line. 
    strokeWeight(int(width*0.08));
    
    fill(153);
} 

void draw() {  
	// this is run repeatedly.  
    // reset speed and background color
    if (speed > speedlimit) {
       if (resetbackground)  background(0);
       speed = initialspeed;
       
       // switch direction
       if (direction_cw) direction_cw = false; else direction_cw = true;
       
    }

    // statistics
    if (stats)
      drawText("c:" + c+", x:"+x +", y:"+y+",s="+speed+",r:"+round,20, 20);
    
    // stay in bounds with line end
    if ( x < 0 ) x = 0;
    if ( y < 0 ) y = 0;
    if ( x > width ) x = width;
    if ( y > height ) y = height;
    if (x == 0 && y == 0) round++;
  
    // position of line end,
    // draw around the rectangle
    if (direction_cw) clockwise(); else counterclockwise();
    
    // increase speed
    if (c == 'd') {
        speed++;
    }
  
    // color of the line
    r = darker(r);
    g = darker(g);
    b = darker(b);
    stroke(r, g, b, a);
    
    // draw the line
    line(width/2,height/2, x, y);
}

int darker(int c) {
  
  int step = 20;
  if (c < 255) {
    c = c + step;
  } else {
    c= int(random(c));
  }
  return c > 255? 255 : c; 
}

void clockwise() {
  if ( x < width &&  y ==0 ) {
    c = 'a';
    x = x + speed;
  } else if ( x == width && y < height ) {
    y = y + speed;
    c = 'b';
  } else if ( y == height && x > 0 ) {
    x = x - speed;
    c = 'c';
  } else if ( x == 0 && y > 0 ) {
    y = y - speed;
    c = 'd';
  } 
}

void counterclockwise() {
  if (x == 0 && y < height) {
    y= y + speed;
    c = 'd';
  } else if (y == height && x < width) {
    x= x + speed;
    c = 'c';
  } else if (x == width && y > 0) {
    y= y - speed;
    c = 'b';
  } else if (y == 0 && x > 0) {
    x= x - speed;
    c = 'a';
  }  
}

void drawText(String text, float x, float y) {
    noStroke();
    fill(0);
    rect(0,y,width,30);
    fill(255);
    text(" " + text,x,y,width,30);
}
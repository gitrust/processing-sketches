
static int HA = 200;
PVector velocity= new PVector(1,1);
PVector acceleration = new PVector(1,1);
PVector friction = new PVector(0,0);
PVector pos = new PVector(HA,HA);
PVector center = new PVector(HA,HA);
boolean rest=false;
int motion = 0;
boolean slowmotion = false;

void setup()
{
    smooth();
    size(400,400);    
    frameRate(25);
}


void draw(){
    background(color(#0b0538));


    fill(255);
    stroke(255);
    line(HA,HA, pos.x,pos.y);
    noStroke();
    ellipse(pos.x,pos.y,40,40);
    
    // vector pointing towards center
    if (!rest) {
        PVector dir = PVector.sub(center,pos);
        dir.normalize();
        dir.mult(15);
        acceleration = dir;
                
        velocity.add(acceleration);
        velocity.mult(friction.y);
        pos.add(velocity);       
    }
    
    displayInfo();
}

void displayInfo() {
    stroke(255);
    text("Fra: " + int(frameRate),10,20,100);
    text("Pos: " + pos.toString(),10,40,100);
    text("Acc: " + acceleration.toString(),10,60,100);
    text("Fri: " + friction.toString(),10,80,100);
    text("Vel: " + velocity.toString(),10,100,100);
    
    text("Hit SPACE (3/30 FPS)",10,370,120);
}

void mouseDragged() {
    rest =true;
    pos.set(mouseX,mouseY);
}

void mouseReleased() {
    rest = false;
    friction = new PVector(0.9,0.9);
    pos.set(mouseX,mouseY);
    velocity.set(1,1);
}

// tweak framerate
void keyPressed() {
   if (key == ' ') {
       slowmotion  = !slowmotion;
       
       if (slowmotion) {
         frameRate(3);
       } else {
         frameRate(30);
       }
   }
}



// https://processing.org/tutorials/pvector/
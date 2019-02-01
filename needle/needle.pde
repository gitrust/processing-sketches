
static int HA = 200;
PVector velocity= new PVector(1,1);
PVector acceleration = new PVector(1,1);
PVector friction = new PVector(0.8,0.8);
PVector pos = new PVector(HA,HA);
PVector center = new PVector(HA,HA);
boolean rest=false;
int motion = 0;

void setup()
{
    smooth();
    size(400,400);    
    frameRate(30);
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
    
}

void mouseDragged() {
    rest =true;
    pos.set(mouseX,mouseY);
}

void mouseReleased() {
    rest = false;
    pos.set(mouseX,mouseY);
    velocity.set(1,1);
}



// https://processing.org/tutorials/pvector/
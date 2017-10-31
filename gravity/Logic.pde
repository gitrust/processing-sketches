

class Logic{  
  
  
  Logic() {
  }
 
  void apply(Ball b) {
    b.position.add(b.velocity);
    b.velocity.add(b.gravity);
    
    // hit the ground
    if (b.position.y > height - b.radius) {
      // reset position of ball
      b.position.y = height - b.radius;
      
      // add some friction
      //b.position.add(b.friction);
    }
  }
}
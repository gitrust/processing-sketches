

class Logic {  


  Logic() {
  }

  void apply(Ball b) {
    if (b.rest) {
      return;  
    }
    
    b.position.add(b.velocity);
    b.velocity.add(b.gravity);
    

    // hit the ground
    if (int(b.position.y) > height - b.radius) {
      // reset position of ball
      b.position.y = height - b.radius;
      
      // add friction
      b.velocity.y *= -(b.friction);
      
      // stop ball moving
      if (abs(b.velocity.y) < 0.9) {
         b.rest = true;
      }
    } 
    // hit top
    else if (b.position.y < b.radius) {
      b.position.y = b.radius;
    }
    
    if (int(b.position.y) == (height-2) && (abs(b.velocity.y) < 1))  {
      b.velocity.y = 0;
    }
   
  }
  
  
}
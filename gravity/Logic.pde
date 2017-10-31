

class Logic {  


  Logic() {
  }

  void apply(Ball b) {
    b.position.add(b.velocity);
    b.velocity.add(b.gravity);

    // hit the ground
    if (b.position.y > height - b.radius) {
      // reset position of ball
      b.position.y = height - b.radius;
      
      // add friction
      b.velocity.y *= -0.5;
    } else if (b.position.y < b.radius) {
      b.position.y = b.radius;
    }
  }
}
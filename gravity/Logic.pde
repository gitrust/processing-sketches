

class Logic {  


  Logic() {
  }

  void apply(Ball b, ArrayList<Ball> balls) {
    if (b.rest) {
      return;
    }

    b.position.add(b.velocity);
    b.velocity.add(b.gravity);



    collision(b, balls);

    borderCollision(b);
  }

  void borderCollision(Ball b) {
    // hit the ground
    if (int(b.position.y) > height - b.radius) {
      // reset position of ball
      b.position.y = height - b.radius;

      // add friction
      // bounce
      b.velocity.y *= -(b.friction);

      // stop ball moving
      if (abs(b.velocity.y) < 2) {
        b.rest = true;
      }
    }

    // hit top
    if (b.position.y < b.radius) {
      b.position.y = b.radius;
      b.velocity.y *= -(b.friction);
    } 
    // hit right hand
    if (b.position.x > width - b.radius) {
      b.position.x = width - b.radius;
      b.velocity.x *= -(b.friction);
    }
    // left side
    if (b.position.x < b.radius) {
      b.position.x = b.radius;
      b.velocity.x *= -(b.friction);
    }
  }

  void collision(Ball b, ArrayList<Ball> balls) {
    // https://gamedevelopment.tutsplus.com/tutorials/when-worlds-collide-simulating-circle-circle-collisions--gamedev-769
    for (Ball ball : balls) {
      // skip same ball
      if (ball.id != b.id && ball.intersects(b)) {
        collisionAlg3(b, ball);
      }
    }
  }

  void collisionAlg1(Ball b, Ball b2) {
    //float collisionPointX = ((b.position.x * ball.radius) + (ball.position.x * b.radius)) / (b.radius + ball.radius);
    //float collisionPointY = ((b.position.y * ball.radius) + (ball.position.y * b.radius)) / (b.radius + ball.radius);

    // first ball
    float newVelX1 = (b.velocity.x * (b.mass - b2.mass) + (2 * b2.mass * b2.velocity.x)) / (b.mass + b2.mass);
    float newVelY1 = (b.velocity.y * (b.mass - b2.mass) + (2 * b2.mass * b2.velocity.y)) / (b.mass + b2.mass);
    // second ball
    float newVelX2 = (b2.velocity.x * (b2.mass - b.mass) + (2 * b.mass * b.velocity.x)) / (b.mass + b2.mass);
    float newVelY2 = (b2.velocity.y * (b2.mass - b.mass) + (2 * b.mass * b.velocity.y)) / (b.mass + b2.mass);

    b.velocity.x = newVelX1;
    b.velocity.y = newVelY1;
    b2.velocity.x = newVelX2;
    b2.velocity.y = newVelY2;
  }

  // http://ericleong.me/research/circle-circle/
  void collisionAlg2(Ball b, Ball b2) {
    // PROBLEM: sticking
    
    float cx1 = b.position.x;
    float cy1 = b.position.y;

    float cx2 = b2.position.x;
    float cy2 = b2.position.y;


    float d = dist(b.position.x, b.position.y, b2.position.x, b2.position.y);
    // Find the norm of the vector from the point of collision for the first circle and the point of collision of the second circle
    float nx = (cx2 - cx1) / d; 
    float ny = (cy2 - cy1) / d; 
    // Calculate the p-value that takes into account the velocities of both circles.
    float p = 2 * (b.velocity.x * nx + b.velocity.y * ny - b2.velocity.x * nx - b2.velocity.y * ny) / (b.mass + b2.mass); 

    // Calculate the final velocity of each circle using each p-value. 
    // Note that each resultant is just the opposite sign with each variable replaced with the corresponding variable
    float vx1 = b.velocity.x - p * b.mass * nx; 
    float vy1 = b.velocity.y - p * b.mass * ny; 

    float vx2 = b2.velocity.x + p * b2.mass * nx; 
    float vy2 = b2.velocity.y + p * b2.mass * ny;

    b.velocity.x = vx1;
    b.velocity.y = vy1;
    b2.velocity.x = vx2;
    b2.velocity.y = vy2;
  }

  void collisionAlg3(Ball b1, Ball b2) {
    //http://gamedev.tutsplus.com/tutob1.rials/implementation/when-worlds-collide-simulating-circle-circle-collisions/
    
    float axvel = (b1.velocity.x * (b1.mass - b2.mass) + (2 * b2.mass * b2.velocity.x)) / (b1.mass + b2.mass);
    float ayvel = (b1.velocity.y * (b1.mass - b2.mass) + (2 * b2.mass * b2.velocity.y)) / (b1.mass + b2.mass);
    b2.velocity.x = (b2.velocity.x * (b2.mass - b1.mass) + (2 * b1.mass * b1.velocity.x)) / (b1.mass + b2.mass);
    b2.velocity.y = (b2.velocity.y * (b2.mass - b1.mass) + (2 * b1.mass * b1.velocity.y)) / (b1.mass + b2.mass);
    b1.velocity.x = axvel;
    b1.velocity.y = ayvel;
    
    //b1.x = b1.x + b1.velocity.x;
    //b1.y = b1.y + b1.velocity.y;
  }
}
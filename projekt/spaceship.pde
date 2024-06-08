class Spaceship {
  PShape shape;
  PVector position;
  PVector velocity;
  PVector acceleration;
  float maxSpeed;
  float rotationAngleY; // Rotacja wokół osi Y
  float rotationAngleX; // Rotacja wokół osi X
  float scale;

  boolean forward, backward, left, right, up, down, rotateLeft, rotateRight;

  Spaceship(PShape shape, float scale) {
    this.shape = shape;
    this.position = new PVector(width/2, height/2, 0);
    this.velocity = new PVector(0, 0, 0);
    this.acceleration = new PVector(0, 0, 0);
    this.maxSpeed = 5;
    this.rotationAngleY = 0;
    this.rotationAngleX = 0;
    this.scale = scale;
  }

  void update() {
    acceleration.set(0, 0, 0);

    if (forward) {
      PVector forwardAccel = PVector.fromAngle(rotationAngleY);
      forwardAccel.mult(0.1);
      acceleration.add(forwardAccel);
    }
    if (backward) {
      PVector backwardAccel = PVector.fromAngle(rotationAngleY);
      backwardAccel.mult(-0.1);
      acceleration.add(backwardAccel);
    }
    if (left) {
      PVector leftAccel = PVector.fromAngle(rotationAngleY - HALF_PI);
      leftAccel.mult(0.1);
      acceleration.add(leftAccel);
    }
    if (right) {
      PVector rightAccel = PVector.fromAngle(rotationAngleY + HALF_PI);
      rightAccel.mult(0.1);
      acceleration.add(rightAccel);
    }
    if (up) {
      acceleration.add(0, -0.1, 0);
    }
    if (down) {
      acceleration.add(0, 0.1, 0);
    }

    velocity.add(acceleration);
    velocity.limit(maxSpeed);
    position.add(velocity);

    if (rotateLeft) {
      rotationAngleY -= 0.05;
    }
    if (rotateRight) {
      rotationAngleY += 0.05;
    }

    velocity.mult(0.99); // Damping to slow down gradually
  }

  void display() {
    pushMatrix();
    translate(position.x, position.y, position.z);
    rotateZ(PI);
    rotateY(rotationAngleY);
    scale(scale);
    shape(shape);
    translate(0, 2, 5);
    //light
    spotLight(255,255,200, position.x, position.y, position.z, 1, 0, 0, PI/2, 600);
    //sphere(1);
    popMatrix();
    
  }

  void handleKeyPress(char key) {
    if (key == 'w' || key == 'W') {
      forward = true;
    }
    if (key == 's' || key == 'S') {
      backward = true;
    }
    if (key == 'a' || key == 'A') {
      left = true;
    }
    if (key == 'd' || key == 'D') {
      right = true;
    }
    if (key == 'q' || key == 'Q') {
      rotateLeft = true;
    }
    if (key == 'e' || key == 'E') {
      rotateRight = true;
    }
    if (key == 'z' || key == 'Z') {
      up = true;
    }
    if (key == 'x' || key == 'X') {
      down = true;
    }
  }

  void handleKeyRelease(char key) {
    if (key == 'w' || key == 'W') {
      forward = false;
    }
    if (key == 's' || key == 'S') {
      backward = false;
    }
    if (key == 'a' || key == 'A') {
      left = false;
    }
    if (key == 'd' || key == 'D') {
      right = false;
    }
    if (key == 'q' || key == 'Q') {
      rotateLeft = false;
    }
    if (key == 'e' || key == 'E') {
      rotateRight = false;
    }
    if (key == 'z' || key == 'Z') {
      up = false;
    }
    if (key == 'x' || key == 'X') {
      down = false;
    }
  }
}

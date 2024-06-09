class Spaceship {
  PShape shape;
  PVector position;
  PVector velocity;
  PVector acceleration;
  float maxSpeed;
  float rotationAngleY; // Rotacja wokół osi Y
  float rotationAngleX; // Rotacja wokół osi X
  float scale;
  float rotationY = 0, rotationX = 0;

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
      acceleration.add(0, 0, -0.1);
    }
    if (backward) {
      acceleration.add(0, 0, 0.1);
    }
    if (left) {
      acceleration.add(-0.1, 0, 0);
    }
    if (right) {
      acceleration.add(0.1, 0, 0);
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

    rotationAngleY += rotationY;
    rotationAngleX += rotationX;
    velocity.mult(0.99);
  }

  void display() {
    pushMatrix();
    translate(position.x, position.y, position.z);
    rotateZ(PI);
    rotateY(PI/2);
    rotateY(rotationAngleY);
    rotateX(rotationAngleX);
    scale(scale);
    shape(shape);

    translate(0, 2, 5);
    //sphere(2);
    //float dirX = sin(rotationAngleY);
    //float dirY = -sin(rotationAngleX);
    //float dirZ = -cos(rotationAngleY);
    float dirX = cos(rotationAngleX) * sin(rotationAngleY);
    float dirY = -sin(rotationAngleX);
    float dirZ = cos(rotationAngleX) * -cos(rotationY);
    spotLight(255, 0, 0, 0, 0, 0, dirX, dirY, dirZ, PI/2, 600);
    println(dirX, dirY, dirZ);
    //translate(-100,0,0);
    //fill(0,0,255);
    //sphere(10);
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

  void handleMouseDragged() {
    // Obracanie statku za pomocą myszki
    rotationY += (mouseX - pmouseX) * 0.001;
    rotationX -= (mouseY - pmouseY) * 0.001;
  }


  void handleMouseReleased() {
    rotationY = 0;
    rotationX = 0;
  }
}

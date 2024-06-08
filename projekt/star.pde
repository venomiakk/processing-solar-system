class Star {
  PVector position;
  float radius;
  PImage texture;
  PShape starSh;
  float rotationSpeed = 0.003;
  float selfRotation;

  Star(float x, float y, float z, float r, PImage texture) {
    this.position = new PVector(x, y, z);
    this.radius = r;
    this.texture = texture;
    starSh = createShape(SPHERE, r);
    starSh.setTexture(texture);
    starSh.setStroke(false);
  }

  void update() {
    selfRotation -= rotationSpeed;
  }

  void display() {
    update();
    pushMatrix();
    translate(position.x, position.y, position.z);
    rotateY(selfRotation);
    noStroke();
    
    //ambient(50,50, 50);
    //specular(50, 0 ,0);
    //shininess(10);
    //emissive(125, 30, 55);

    shape(starSh);
    popMatrix();
  }
}

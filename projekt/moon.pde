class Moon {
  PVector position;
  float radius;
  color col;
  float angle;
  float distance;
  float orbitSpeed;
  float deviation;
  PShape shape;
  float scale;
  float selfRotation;
  float rotationSpeed;
  Planet planet;
  boolean isShape = false;
  boolean isCube = false;
  float scaleFactorX;
  float scaleFactorY;
  float scaleFactorZ;
  float shine;
  float emiR, emiG, emiB;
  float specR, specG, specB;
  float ambR, ambG, ambB;

  Moon(Planet p, float dist, float r, float orbitSpeed, float scale, boolean iscube, PShape sh) {
    this.planet = p;
    this.distance = dist;
    this.radius = r;
    this.angle = random(TWO_PI);
    this.orbitSpeed = orbitSpeed/100;
    this.deviation = random(-40, 41);
    this.shape = sh;
    this.scale = scale;
    this.rotationSpeed = random(0, 1);
    this.selfRotation = 0;
    this.isShape = true;
    this.isCube = iscube;
    this.scaleFactorX = random(0.9, 1.2);
    this.scaleFactorY = random(0.9, 1.2);
    this.scaleFactorZ = random(0.9, 1.2);
    this.shine = random(1.0, 10.0);
    this.emiR = random(10, 255);
    this.emiG = random(10, 255);
    this.emiB = random(10, 255);
    this.specR = random(10, 255);
    this.specG = random(10, 255);
    this.specB = random(10, 255);
    this.ambR = random(10, 255);
    this.ambG = random(10, 255);
    this.ambB = random(10, 255);
  }

  Moon(Planet p, float dist, float r, float orbitSpeed, float scale, boolean iscube, color c) {
    this.planet = p;
    this.distance = dist;
    this.radius = r;
    this.angle = random(TWO_PI);
    this.orbitSpeed = orbitSpeed/100;
    this.deviation = random(-40, 41);
    this.col = c;
    this.scale = scale;
    this.rotationSpeed = random(0, 1) / 10;
    this.selfRotation = 0;
    this.isCube = iscube;
    this.scaleFactorX = random(0.9, 1.2);
    this.scaleFactorY = random(0.9, 1.2);
    this.scaleFactorZ = random(0.9, 1.2);
    this.shine = random(1.0, 10.0);
    this.emiR = random(10, 255);
    this.emiG = random(10, 255);
    this.emiB = random(10, 255);
    this.specR = random(10, 255);
    this.specG = random(10, 255);
    this.specB = random(10, 255);
    this.ambR = random(10, 255);
    this.ambG = random(10, 255);
    this.ambB = random(10, 255);
  }

  void update() {
    angle += this.orbitSpeed;
    selfRotation -= rotationSpeed;
    position = new PVector(
      planet.position.x + cos(angle) * distance,
      planet.position.y,
      planet.position.z + sin(angle) * distance
      );
  }

  void display() {
    update();
    pushMatrix();
    translate(position.x, position.y, position.z);
    rotateY(selfRotation);
    noStroke();

    ambient(ambR, ambG, ambB);
    specular(specR, specG, specB);
    shininess(shine);
    emissive(emiR, emiG, emiB);

    scale(scale);
    if (isShape == false)
    {
      fill(col);

      if (isCube==true) {
        scale(scaleFactorX, scaleFactorY, scaleFactorZ);
        box(radius);
      } else {
        scale(scaleFactorX, scaleFactorY, scaleFactorZ);
        sphere(radius);
      }
    } else
    {
      scale(scaleFactorX, scaleFactorY, scaleFactorZ);
      shape(shape);
    }
    popMatrix();
  }

  void setEmissive(float emiR, float emiG, float emiB) {
    this.emiR = emiR;
    this.emiG = emiG;
    this.emiB = emiB;
  }
  void setAmbient(float ambR, float ambG, float ambB) {
    this.ambR = ambR;
    this.ambG = ambG;
    this.ambB = ambB;
  }

  void setSpecular(float specR, float specG, float specB) {
    this.specR = specR;
    this.specG = specG;
    this.specB = specB;
  }
  
}

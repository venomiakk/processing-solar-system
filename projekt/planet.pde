class Planet {
  PVector position;
  float radius;
  color col;
  float angle;
  float distance;
  float orbitSpeed;
  float deviation;
  float selfRotation;
  float rotationSpeed;
  Star star;
  PShape pshape;
  boolean isShape = false;
  float scale;
  boolean isTexture = false;
  PImage texture;
  boolean isCube = false;
  float scaleFactorX, scaleFactorY, scaleFactorZ;
  float shine;
  float emiR, emiG, emiB;
  float specR, specG, specB;
  float ambR, ambG, ambB;

  Planet(Star s, float dist, float r, float orbitSpeed, float scale, boolean iscube, color c) {
    this.star = s;
    this.distance = dist;
    this.radius = r;
    this.col = c;
    this.angle = random(TWO_PI);
    this.orbitSpeed = orbitSpeed/100;
    this.deviation = random(-40, 41);
    this.rotationSpeed = random(0, 1) / 10;
    this.selfRotation = 0;
    this.isShape = false;
    this.scale = scale;
    this.isTexture = false;
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
  Planet(Star s, float dist, float r, float orbitSpeed, float scale, boolean iscube, PShape sh) {
    this.star = s;
    this.distance = dist;
    this.radius = r;
    this.angle = random(TWO_PI);
    this.orbitSpeed = orbitSpeed/100;
    this.deviation = random(-40, 41);
    this.rotationSpeed = random(0, 1) / 10;
    this.selfRotation = 0;
    this.pshape = sh;
    this.isShape = true;
    this.scale = scale;
    this.isTexture = false;
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
  // teksturowanie planet nie dziala
  Planet(Star s, float dist, float r, float orbitSpeed, float scale, boolean iscube, PImage img) {
    this.star = s;
    this.distance = dist;
    this.radius = r;
    this.angle = random(TWO_PI);
    this.orbitSpeed = orbitSpeed/100;
    this.deviation = random(-40, 41);
    this.rotationSpeed = random(0, 1) / 10;
    this.selfRotation = 0;
    this.isShape = false;
    this.scale = scale;
    this.isTexture = true;
    this.texture = img;
    this.pshape = createShape(SPHERE, r);
    this.pshape.setTexture(this.texture);
    this.pshape.setStroke(false);
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
      star.position.x + cos(angle) * distance,
      star.position.y,
      star.position.z + sin(angle) * distance
      );
  }

  void display() {
    update();
    pushMatrix();
    translate(position.x, position.y, position.z);
    rotateY(selfRotation);
    scale(scale);

    ambient(ambR, ambG, ambB);
    specular(specR, specG, specB);
    shininess(shine);
    emissive(emiR, emiG, emiB);

    noStroke();
    if (isShape == false)
    {
      fill(col);
      if (isCube==true)
      {
        scale(scaleFactorX, scaleFactorY, scaleFactorZ);
        box(radius);
      } else {
        scale(scaleFactorX, scaleFactorY, scaleFactorZ);
        sphere(radius);
      }
    } else {
      scale(scaleFactorX, scaleFactorY, scaleFactorZ);
      shape(pshape);
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

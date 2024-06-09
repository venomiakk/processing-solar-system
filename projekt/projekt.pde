Star sun;
Planet planet1, planet2, planet3, planet4;
Moon p1moon1, p1moon2, p2moon1, p2moon2, p3moon1, p3moon2, p4moon1;
Spaceship ship;
PShape earth_moon, shipShape, p3, earth;
PImage suntxt;
boolean cameraToggle = false;
float rotationX, rotationY;
Planet[] planets;
Moon[] moons;
boolean gameOver = false;

void setup() {
  size(1400, 800, P3D);
  earth_moon = loadShape("moon/Moon2K.obj");
  suntxt = loadImage("sun-texture.jpg");
  p3 = loadShape("AlienPlanet/AlienPlanet.obj");

  sun = new Star(400, 300, 20, 50, suntxt);


  planet1 = new Planet(sun, 120, 20, 2, 1, false, color(49, 170, 31));
  planet1.setEmissive(15, 15, 15);
  planet1.setAmbient(4, 50, 9);
  planet1.setSpecular(0, 40, 0);

  planet2 = new Planet(sun, 270, 30, 1, 1, true, color(0, 50, 255));
  planet2.setEmissive(15, 15, 15);
  planet2.setAmbient(0, 15, 50);
  planet2.setSpecular(0, 50, 0);


  planet3 = new Planet(sun, 450, 40, 0.7, 10, false, p3);

  planet4 = new Planet(sun, 700, 20, 2.5, 1, false, color(200, 40, 99));
  planet4.setEmissive(15, 15, 15);
  planet4.setAmbient(40, 5, 10);
  planet4.setSpecular(40, 5, 0);


  p1moon1 = new Moon(planet1, 30, 7, 1, 1, true, color(233, 15, 0));
  p1moon1.setEmissive(15, 15, 15);
  p1moon1.setAmbient(40, 5, 0);
  p1moon1.setSpecular(30, 5, 0);
  p1moon2 = new Moon(planet1, 50, 9, 3, 3, false, earth_moon);


  p2moon1 = new Moon(planet2, 40, 10, 1, 4, false, earth_moon);

  p2moon2 = new Moon(planet2, 60, 5, 5, 1, false, color(87, 87, 166));
  p2moon2.setEmissive(15, 15, 15);
  p2moon2.setAmbient(23, 23, 10);
  p2moon2.setSpecular(30, 5, 0);


  p3moon1 = new Moon(planet3, 40, 5, 5, 1, false, color(187, 7, 66));
  p3moon1.setEmissive(15, 15, 15);
  p3moon1.setAmbient(23, 0, 15);
  p3moon1.setSpecular(20, 15, 10);

  p3moon2 = new Moon(planet3, 70, 10, 2, 1, true, color(27, 187, 200));
  p3moon2.setEmissive(15, 15, 15);
  p3moon2.setAmbient(0, 25, 30);
  p3moon2.setSpecular(0, 5, 15);


  p4moon1 = new Moon(planet4, 60, 10, 1, 1, false, color(0, 87, 16));
  p4moon1.setEmissive(15, 15, 15);
  p4moon1.setAmbient(0, 43, 10);
  p4moon1.setSpecular(0, 5, 33);

  planets = new Planet[4];
  moons = new Moon[7];
  planets[0] = planet1;
  planets[1] = planet2;
  planets[2] = planet3;
  planets[3] = planet4;
  moons[0] = p1moon1;
  moons[1] = p1moon2;
  moons[2] = p2moon1;
  moons[3] = p2moon2;
  moons[4] = p3moon1;
  moons[5] = p3moon2;
  moons[6] = p4moon1;


  shipShape = loadShape("ship/AirShip.obj");
  ship = new Spaceship(shipShape, 10);
  rotationX = 0;
  rotationY = 0;
}

void draw() {
  background(100);
  ambientLight(200, 200, 200);
  pointLight(255, 255, 255, sun.position.x, sun.position.y, sun.position.z);
  rotateX(rotationX);
  rotateY(rotationY);

  sun.display();

  planet1.display();
  planet2.display();
  planet3.display();
  planet4.display();

  p1moon1.display();
  p1moon2.display();
  p2moon1.display();
  p2moon2.display();
  p3moon1.display();
  p3moon2.display();
  p4moon1.display();

  //ship.setupCamera();
  ship.update();
  ship.display();
  //spotLight(255,255,200, ship.position.x, ship.position.y, ship.position.z, 1, 0, 0, PI/2, 600);
  // Ustawienie kamery
  float dirX = sin(ship.rotationAngleY);
  float dirY = -sin(ship.rotationAngleX);
  float dirZ = -cos(ship.rotationAngleY);
  //float dirX = cos(ship.rotationAngleX) * sin(ship.rotationAngleY);
  //float dirY = -sin(ship.rotationAngleX);
  //float dirZ = cos(ship.rotationAngleX) * -cos(ship.rotationY);
  if (cameraToggle) {
    // Pozycja kamery nad statkiem
    //camera(ship.position.x+100, ship.position.y-100, ship.position.z, ship.position.x-100, ship.position.y+100, ship.position.z, 1, 0, 0);
    camera(ship.position.x+100, ship.position.y-100, ship.position.z, ship.position.x-100, ship.position.y+100, ship.position.z, dirX, dirY, dirZ);
  } else {
    // Standardowa pozycja kamery
    //camera(0, height / 2, (height / 2) / tan(PI/6), width / 2, height / 2, 0, 0, 1, 0);
    camera(500, 200, 1100, sun.position.x, sun.position.y, sun.position.z, 0, 1, 0);
  }

  checkCollisions();
  if (gameOver) {
    background(215);
    fill(255, 0, 0);
    textSize(32);
    textAlign(CENTER, CENTER);
    text("Game Over", width/2, height/2);
    return;
  }
}

void keyPressed() {
  ship.handleKeyPress(key);
  if (key == ENTER) {
    cameraToggle = !cameraToggle;
  }
  if (key == ' ') {
    gameOver = true;
  }
}

void keyReleased() {
  ship.handleKeyRelease(key);
}

void mouseDragged() {
  ship.handleMouseDragged();
}


void mouseReleased() {
  ship.handleMouseReleased();
}

void checkCollisions() {
  float distance = PVector.dist(ship.position, sun.position);
  if (distance < sun.radius + 10) {
    gameOver = true;
  }
  for (int i = 0; i < planets.length; i++) {
    distance = PVector.dist(ship.position, planets[i].position);
    if (distance < planets[i].radius + 10) {
      gameOver = true;
    }
  }
  for (int i = 0; i < moons.length; i++) {
    distance = PVector.dist(ship.position, moons[i].position);
    if (distance < moons[i].radius + 10) {
      gameOver = true;
    }
  }
}

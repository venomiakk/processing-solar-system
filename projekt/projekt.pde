Star sun;
Planet earth, planet2;
Moon moon, p2moon;
Spaceship ship;
PShape earth_moon, shipShape;
PImage suntxt;
Ship player;
boolean cameraToggle = false;

void setup() {
  // konsstruktor do teksturowania planet nie dziala chyba ?
  //TODO camera class, view of solar system or view behind spaceship
  //TODO ustawic material dla defultowych kolorow
  size(1400, 800, P3D);
  earth_moon = loadShape("moon/Moon2K.obj");
  suntxt = loadImage("sun-texture.jpg");
  sun = new Star(400, 300, 20, 50, suntxt);
  earth = new Planet(sun, 200, 30, 1, 1, true, color(0, 50, 255));
  planet2 = new Planet(sun, 100, 20, 2, 1, false, color(49, 170, 31));

  moon = new Moon(earth, 50, 10, 5, 4, false, earth_moon);
  p2moon = new Moon(planet2, 30, 9, 3, 1, true, color(255, 0, 0));

  shipShape = loadShape("ship/AirShip.obj");
  ship = new Spaceship(shipShape, 10);
}

void draw() {
  background(50);
  ambientLight(200, 200, 200);
  pointLight(255, 255, 255, sun.position.x, sun.position.y, sun.position.z);


  sun.display();
  earth.display();
  moon.display();
  planet2.display();
  p2moon.display();

  //ship.setupCamera();
  ship.update();
  ship.display();
    // Ustawienie kamery
  if (cameraToggle) {
    // Pozycja kamery z boku
    camera(ship.position.x+100, ship.position.y-100, ship.position.z, ship.position.x-100, ship.position.y+100, ship.position.z, 1, 0, 0);
  } else {
    // Standardowa pozycja kamery
    camera(width / 2, height / 2, (height / 2) / tan(PI/6), width / 2, height / 2, 0, 0, 1, 0);
  }
}

void keyPressed() {
  ship.handleKeyPress(key);
   if (key == ENTER) {
    cameraToggle = !cameraToggle;
    println("toggle");
  }
}

void keyReleased() {
  ship.handleKeyRelease(key);
}

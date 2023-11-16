private Spaceship bob = new Spaceship();
private Star[] bobby =  new Star[150];
boolean[] keys = new boolean[4]; // a, w, d, space

public void setup() {
  size(500, 500);

  for (int i = 0; i < bobby.length; i++) {
    bobby[i] = new Star();
  }
}

public void draw() {
  background(0);

  for (int i = 0; i < bobby.length; i++) {
    bobby[i].show();
  }

  if (keys[0]) {
    bob.turn(-5);
  }
  
  if (keys[1]) {
    bob.accelerate(0.075);
  }
  
  if (keys[2]) {
    bob.turn(5);
  }
  
  if (keys[3]) {
    bob.hyperspace();
  }
  
  bob.move();
  bob.show();
}

public void keyPressed() {
  if (key == 'a' || keyCode == LEFT) {
    keys[0] = true;
  }

  if (key == 'w' || keyCode == UP) {
    keys[1] = true;
  }

  if (key == 'd' || keyCode == RIGHT) {
    keys[2] = true;
  }

  if (key == ' ') {
    keys[3] = true;
  }
}

public void keyReleased() {
  if (key == 'a' || keyCode == LEFT) {
    keys[0] = false;
  }

  if (key == 'w' || keyCode == UP) {
    keys[1] = false;
  }

  if (key == 'd' || keyCode == RIGHT) {
    keys[2] = false;
  }

  if (key == ' ') {
    keys[3] = false;
  }
}

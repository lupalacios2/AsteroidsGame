private Spaceship bob = new Spaceship();
private Star[] bobby =  new Star[150];

public void setup() {
  size(300, 300);
  
  for (int i = 0; i < bobby.length; i++) {
     bobby[i] = new Star();
  }
}

public void draw() {
  background(0);
  
  for (int i = 0; i < bobby.length; i++) {
     bobby[i].show();
  }
  
  bob.move();
  bob.show();
}

public void keyPressed() {
  if (key == 'a' || keyCode == LEFT) {
    bob.turn(-30);
  }
  
  if (key == 'w' || keyCode == UP) {
    bob.accelerate(0.5);
  }
  
  if (key == 'd' || keyCode == RIGHT) {
    bob.turn(30);
  }
  
  if (key == ' ') {
    bob.hyperspace();
  }
}

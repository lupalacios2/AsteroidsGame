private Spaceship bob = new Spaceship();
private Star[] bobby =  new Star[150];
private ArrayList <Asteroid> asteroids = new ArrayList <Asteroid> ();
private boolean[] keys = new boolean[4]; // a, w, d, s

public void setup() {
  size(500, 500);

  for (int i = 0; i < bobby.length; i++) {
    bobby[i] = new Star();
  }
  
  for (int j = 0; j < 5; j++) {
    asteroids.add(new Asteroid());
  }
}

public void draw() {
  background(0);

  for (int i = 0; i < bobby.length; i++) {
    bobby[i].show();
  }
  
  for (int j = 0; j < asteroids.size(); j++) {
    asteroids.get(j).move();
    asteroids.get(j).show();
    
    double d = dist(bob.getX(), bob.getY(), asteroids.get(j).getX(), asteroids.get(j).getY());  
    if (d < 35) {
      asteroids.remove(j);
    }
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
    bob.brake();
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
  
  if (key == 's' || keyCode == DOWN) {
    keys[3] = true;
  }

  if (key == ' ') {
    bob.hyperspace();
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
  
  if (key == 's' || keyCode == DOWN) {
    keys[3] = false;
  }
}

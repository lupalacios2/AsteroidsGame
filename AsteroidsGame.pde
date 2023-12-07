private Spaceship bob = new Spaceship();
private Star[] bobby =  new Star[150];
private ArrayList <Asteroid> asteroids = new ArrayList <Asteroid> ();
private ArrayList <Bullet> shots = new ArrayList <Bullet> ();
private boolean[] keys = new boolean[5]; // a, w, d, s, space
private int frameDiff = 0;

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
  frameDiff++;

  for (int i = 0; i < bobby.length; i++) {
    bobby[i].show();
  }
  
  for (int j = 0; j < asteroids.size(); j++) {
    asteroids.get(j).move();
    asteroids.get(j).show();
    
    double d = dist((float) bob.getX(), (float) bob.getY(), (float) asteroids.get(j).getX(), (float) asteroids.get(j).getY());  
    if (d < 35) {
      asteroids.remove(j);
    }
  }
  
  for (int k = 0; k < shots.size(); k++) {
    shots.get(k).move();
    shots.get(k).show();
    
    for (int l = 0; l < asteroids.size(); l++) {
      double d = dist((float) shots.get(k).getX(), (float) shots.get(k).getY(), (float) asteroids.get(l).getX(), (float) asteroids.get(l).getY());  
       if (d < 35) {
        asteroids.remove(l);
        shots.remove(k);
        break;
      }
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
  
  if (keys[4] && frameDiff > 15) {
    frameDiff = 0;
    shots.add(new Bullet(bob));
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
    keys[4] = true;
  }

  if (keyCode == SHIFT) {
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
  
  if (key == ' ') {
    keys[4] = false;
  }
}

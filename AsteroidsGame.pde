private Spaceship bob = new Spaceship();
private Star[] bobby =  new Star[100];
private ArrayList <Asteroid> asteroids = new ArrayList <Asteroid> ();
private ArrayList <Bullet> shots = new ArrayList <Bullet> ();
private boolean[] keys = new boolean[5]; // a, w, d, s, space
private int asteroidDiff = 0;
private int bulletDiff = 0;
private int points = 0;

private void reset() {
  background(0);
  
  bob = new Spaceship();
  bobby =  new Star[100];
  
  asteroids = new ArrayList <Asteroid> ();
  shots = new ArrayList <Bullet> ();

  for (int i = 0; i < bobby.length; i++) {
    bobby[i] = new Star();
  }
  
  for (int j = 0; j < 10; j++) {
    asteroids.add(new Asteroid());
  }
  
  asteroidDiff = 0;
  bulletDiff = 0;
  points = 0;
}

public void setup() {
  size(500, 500);

  for (int i = 0; i < bobby.length; i++) {
    bobby[i] = new Star();
  }
  
  for (int j = 0; j < 10; j++) {
    asteroids.add(new Asteroid());
  }
}

public void draw() {
  background(0);
  bulletDiff++;
  asteroidDiff++;

  for (int i = 0; i < bobby.length; i++) {
    bobby[i].show();
  }

  if ((asteroids.size() < 10 && asteroidDiff > 90) || (asteroids.size() < 5 && asteroidDiff > 30)) {
    asteroidDiff = 0;
    asteroids.add(new Asteroid());
  }
  
  for (int j = 0; j < asteroids.size(); j++) {
    asteroids.get(j).move();
    asteroids.get(j).show();
    
    double d = dist((float) bob.getX(), (float) bob.getY(), (float) asteroids.get(j).getX(), (float) asteroids.get(j).getY());  
    if (d < 35) {
      reset();
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
        points += 100;
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
  
  if (keys[4] && bulletDiff > 20) {
    bulletDiff = 0;
    shots.add(new Bullet(bob));
  }
  
  bob.move();
  bob.show();
  
  textSize(25);
  fill(255);
  text("Score: " + points, 20, 40);
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

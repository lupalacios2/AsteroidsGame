class Asteroid extends Floater {
  private double rotationSpeed;
  
  public Asteroid() {
    corners = 9;
    xCorners = new int[corners];
    yCorners = new int[corners];
    xCorners[0] = 0;
    yCorners[0] = 28;
    xCorners[1] = 20;
    yCorners[1] = 24;
    xCorners[2] = 28;
    yCorners[2] = 8;
    xCorners[3] = 20;
    yCorners[3] = -12;
    xCorners[4] = 4;
    yCorners[4] = -24;
    xCorners[5] = -4;
    yCorners[5] = -16;
    xCorners[6] = -20;
    yCorners[6] = -12;
    xCorners[7] = -24;
    yCorners[7] = 8;
    xCorners[8] = -8;
    yCorners[8] = 16;
    
    for (int i = 0; i < corners; i++) {
      xCorners[i] += randomize();
      yCorners[i] += randomize();
    }
    
    myColor = color(128, 128, 128); 

    myCenterX = Math.random() * 256;
    myCenterY = Math.random() * 256;

    myXspeed = Math.random() * 2 - 1;
    myYspeed = Math.random() * 2 - 1;
    
    if (Math.random() > 0.5) {
      rotationSpeed = -1;
    } else {
      rotationSpeed = 1;
    }

    myPointDirection = Math.random() * 361;
  }
  
  private int randomize() {
    return (int)(Math.random() * 10) - 5;
  }
  
  public double getY() {
    return myCenterY;
  }
  
  public double getX() {
    return myCenterX;
  }
  
  public void move() {
    turn(rotationSpeed);
    super.move();
  }
}

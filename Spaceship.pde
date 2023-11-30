class Spaceship extends Floater {
  public Spaceship() {
    corners = 4;

    xCorners = new int[corners];   
    xCorners[0] = -8;
    xCorners[1] = 16;
    xCorners[2] = -8;
    xCorners[3] = -2;

    yCorners = new int[corners];
    yCorners[0] = 8;
    yCorners[1] = 0;
    yCorners[2] = -8;
    yCorners[3] = 0;

    myColor = color(255);   

    myCenterX = 250;
    myCenterY = 250;

    myXspeed = 0;
    myYspeed = 0;

    myPointDirection = 0;
  }
  
  public void hyperspace() {
    myCenterX = Math.random() * 300;
    myCenterY = Math.random() * 300;
    myXspeed = 0;
    myYspeed = 0;
  }
  
  public void brake() {
    myXspeed = myYspeed = 0;
  }
  
  public float getY() {
    return (float) myCenterY;
  }
  
  public float getX() {
    return (float) myCenterX;
  }
}

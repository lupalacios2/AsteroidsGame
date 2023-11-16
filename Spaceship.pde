class Spaceship extends Floater {
  public Spaceship() {
    //the number of corners, a triangular floater has 3
    corners = 3;

    // x coordinates
    xCorners = new int[corners];   
    xCorners[0] = -8;
    xCorners[1] = 16;
    xCorners[2] = -8;

    // y coordinates
    yCorners = new int[corners];
    yCorners[0] = 8;
    yCorners[1] = 0;
    yCorners[2] = -8;

    myColor = color(255);   

    // holds center coordinates
    myCenterX = 150;
    myCenterY = 150;

    //holds the speed of travel in the x and y directions
    myXspeed = 1;
    myYspeed = 1;

    myPointDirection = 0;
  }
  
  public void hyperspace() {
    myCenterX = Math.random() * 300;
    myCenterY = Math.random() * 300;
    myXspeed = 0;
    myYspeed = 0;
  }
}

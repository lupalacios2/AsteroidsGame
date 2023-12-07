class Bullet extends Floater {
  Bullet(Spaceship theShip) {
    myCenterX = theShip.getX();
    myCenterY = theShip.getY();

    myXspeed = theShip.getXspeed() * 1.5;
    myYspeed = theShip.getYspeed() * 1.5;

    myPointDirection = theShip.getPointDirection();
    
    accelerate(10);
    
    myColor = color(169);   
  }
  
  public void show() {
    fill(255);
    ellipse((float) myCenterX, (float) myCenterY, 10, 10);
    fill(0);
    ellipse((float) myCenterX, (float) myCenterY, 9, 9);
  }
  
  public void move() {     
    myCenterX += myXspeed;    
    myCenterY += myYspeed;     
  } 
  public double getY() {
    return myCenterY;
  }
  
  public double getX() {
    return myCenterX;
  }
}

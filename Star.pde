// note that this class does NOT extend Floater
class Star {
  private int x, y, c;
  
  public Star() {
    x = (int)(Math.random() * 501);
    y = (int)(Math.random() * 501);
    c = color((int)(Math.random() * 256), (int)(Math.random() * 256), (int)(Math.random() * 256));
  }
  
  public void show() {
    noStroke();
    fill(c);
    ellipse(x, y, 3, 3);
  }
}

class Star {
  //your code here
  protected int x, y, c;
  public Star() {
    x = (int)(Math.random()*720);
    y = (int)(Math.random()*720);
    c = (int)(Math.random()*255);
  }
  
  public void show() {
    fill(c);
    noStroke();
    ellipse(x, y, (float)c/64.0, (float)c/64.0);;
  }
  
  public void move() {
      
  }
}

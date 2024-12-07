class Laser extends Floater {
  private int lifeSpan;
  public Laser(Spaceship ship) {
    myCenterX = ship.getX();
    myCenterY = ship.getY();
    myXspeed = ship.getXspeed();
    myYspeed = ship.getYspeed();
    myPointDirection = ship.getPointDir();  
    accelerate(8);
    lifeSpan = 120;
  }
  public void show() {
    noStroke();
    fill(255, 200, 200);
    ellipse((float)myCenterX, (float)myCenterY, 10, 10);  
  }
  
  public void decay() {
    lifeSpan -= 1;
  }
  public int getLifeSpan() {
    return lifeSpan;
  }
}


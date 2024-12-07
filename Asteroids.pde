class Asteroid extends Floater {
  private double w; // angular velocity
  private float scale;
  
  public Asteroid() {
      scale = (float)(Math.random()*1.5+1);
      corners = 6; //the number of corners, a triangular floater has 3   
      xCorners = new float[] {-10+SRO(),-5+SRO(), 5+SRO(), 10+SRO(), 5+SRO(), -5+SRO()};   
      yCorners = new float[] {0+SRO(), 9+SRO(), 9+SRO(), 0+SRO(), -9+SRO(), -9+SRO()};   
      for(int i = 0; i < corners; i++) {
        xCorners[i] = xCorners[i]*scale;
        yCorners[i] = yCorners[i]*scale;
      }
      myColor = 0;   
      myCenterX = (int)(Math.random()*720);
      myCenterY = (int)(Math.random()*720); //holds center coordinates   
      myXspeed = (float)(Math.random()*5)-2;
      myYspeed = (float)(Math.random()*5)-2; //holds the speed of travel in the x and y directions   
      myPointDirection = (int)(Math.random()*360);
      w = (int)(Math.random()*5);
    }
  
  public void move() {
    turn(w);
    super.move();
  }
  
  public float getS() {
    return (float)scale;
  }
  
}

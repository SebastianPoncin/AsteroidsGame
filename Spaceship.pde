class Spaceship extends Floater  
{   
    //your code here
    public Spaceship() {
      corners = 4;  //the number of corners, a triangular floater has 3   
      xCorners = new int[] {-8, 16, -8, -2};   
      yCorners = new int[] {-8, 0, 8, 0};   
      myColor = 255;   
      myCenterX = 360;
      myCenterY = 360; //holds center coordinates   
      myXspeed = 0;
      myYspeed = 0; //holds the speed of travel in the x and y directions   
      myPointDirection = 0;
    }
    
    public void hyperspace() {
      myCenterX = (int)(Math.random()*720);
      myCenterY = (int)(Math.random()*720);
      myXspeed = 0;
      myYspeed = 0;
      myPointDirection = (int)(Math.random()*360);
    }
}

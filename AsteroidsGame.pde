Spaceship shippy = new Spaceship();
boolean[] keys = {false, false, false, false, false}; // W A S D SPACE
Star[] stars = new Star[200];
float t = 0;
float t2 = 0;
boolean dead = false;

ArrayList <Laser> laserz = new ArrayList <Laser>();
ArrayList <Asteroid> asteroids = new ArrayList <Asteroid>();

public void setup() 
{
  size(720,720);
  //your code here
  for(int i = 0; i < stars.length; i++) {
    stars[i] = new Star();
  }
  
  for(int i = 0; i < 10; i++) {
    asteroids.add(new Asteroid());
  }
  
  frameRate(60);
}

public void draw() {
  

  if(!dead) {
    noStroke();
    //background(0, 20, 64); // Dark underwater background
    background(0);
    
    if(keys[0]) {
      shippy.accelerate(0.1);
    }
    if(keys[1]) {
      shippy.turn(-4);
    }
    if(keys[3]) {
      shippy.turn(4);
    }
    if(keys[2] && t > t2+0.5) {
      shippy.hyperspace();
      t2 = t;
    }
    if(keys[4] && t > t2+0.4) {
      laserz.add(new Laser(shippy));
      shippy.accelerate(-2);
      t2 = t;
      println(laserz.size());
    }
    for(int i = 0; i < stars.length; i++) {
      stars[i].show();
    }
    
    
    
    shippy.move();
    
    
    noStroke();
    shippy.show();
    
    for(int i = 0; i < asteroids.size(); i++) {
      Asteroid asta = asteroids.get(i);
      asta.move();
      stroke(255);
      asta.show();
      
      if(dist(shippy.getX(), shippy.getY(), asta.getX(), asta.getY()) <= 12*asta.getS()) {
        dead = true;
      }
    }
    
    for(int i = 0; i < laserz.size(); i++) { // HOLY MY CODE IS BAD
      boolean removal = false;
      Laser las = laserz.get(i);
      //removal == true;
      if(las.getLifeSpan() < 0) {
        removal = true;
      } else {
        las.move();
        las.show();
        las.decay();
      }
      for(int j = 0; j < asteroids.size(); j++) {
        Asteroid asta = asteroids.get(j);
        if(dist(las.getX(), las.getY(), asta.getX(), asta.getY()) <= 10*asta.getS()) {
          asteroids.remove(j);
          j-=1;
          removal = true;
        }
      }
      
      if(removal) {
        laserz.remove(i);
        i-=1;
      }
      
    }
    
    
  }
 
  
  
  
  /*for (int y = -50; y < height+50; y += 10) { // scuffed but whatever
    for (int x = -50; x < width+50; x += 10) {

      float wave1 = sin((x * 0.03) + (t + y * 0.02)) * 10;
      float wave2 = cos((y * 0.03) + (t + x * 0.02)) * 10;

      // yeah idk what this is either
      float noiseFactor = noise(x * 0.02, y * 0.02, t) * 5;


      float offsetX = wave1 + noiseFactor;
      float offsetY = wave2 + noiseFactor;


      noStroke();
      fill(0, 228- y / 4, 328 - x / 4, 180);


      ellipse(x + offsetX, y + offsetY, 7, 7); 
    }
  }*/
  t += 0.02; 
  //fill(0, 60, 120, 100);
  //rect(0, 0, 720, 720);
}

int SRO() {
  return (int)(Math.random()*9)-4;
}



void keyPressed() {
  if (keyCode == 87) { // w
    keys[0] = true;
  }
  if (keyCode == 65) { // a
    keys[1] = true;
  }
  if (keyCode == 83) { // s
    keys[2] = true;
  }
  if (keyCode == 68) { // d
    keys[3] = true;
  }
  if (keyCode == 32) { // SPACE
    keys[4] = true;
  }

}
void keyReleased() {
  if (keyCode == 87) { // w
    keys[0] = false;
  }
  if (keyCode == 65) { // a
    keys[1] = false;
  }
  if (keyCode == 83) { // s
    keys[2] = false;
  }
  if (keyCode == 68) { // d
    keys[3] = false;
  }
  if (keyCode == 32) { // SPACE
    keys[4] = false;
  }
}

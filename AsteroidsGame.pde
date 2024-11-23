//your variable declarations here
Spaceship shippy = new Spaceship();
boolean[] keys = {false, false, false, false}; // W A S D
Star[] stars = new Star[200];
float t = 0;
float t2 = 0;

public void setup() 
{
  size(720,720);
  //your code here
  for(int i = 0; i < stars.length; i++) {
    stars[i] = new Star();
  }
  frameRate(60);
}
public void draw() {
  noStroke();
  background(0, 20, 64); // Dark underwater background

  
  
  
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
  for(int i = 0; i < stars.length; i++) {
    stars[i].show();
  }
  
  shippy.move();
  shippy.show();
  
  // Layered sine waves for dynamic ripples
  for (int y = -50; y < height+50; y += 10) {
    for (int x = -50; x < width+50; x += 10) {
      // Combine sine waves for multidirectional ripple
      float wave1 = sin((x * 0.03) + (t + y * 0.02)) * 10;
      float wave2 = cos((y * 0.03) + (t + x * 0.02)) * 10;

      // Add Perlin noise to enhance realism
      float noiseFactor = noise(x * 0.02, y * 0.02, t) * 5;

      // Final position offsets
      float offsetX = wave1 + noiseFactor;
      float offsetY = wave2 + noiseFactor;

      // Gradient color for depth effect
      noStroke();
      fill(0, 228- y / 4, 328 - x / 4, 180);

      // Draw distorted ripples
      ellipse(x + offsetX, y + offsetY, 7, 7); // Small overlapping circles
    }
  }
  t += 0.02; // Increment time for smooth animation
  fill(0, 60, 120, 100);
  rect(0, 0, 720, 720);
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
}

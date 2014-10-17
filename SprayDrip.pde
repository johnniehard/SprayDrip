//spraysplatter with dripping paint

import java.util.Random;
Random generator = new Random();



float radius;
PVector loc;
float size = 20;

void setup(){
  size(500, 500);
  smooth();
  noStroke();
  background(255);
  
  loc = new PVector(width/2, height/2);
  radius = (height*0.1)/2;
}

void draw(){
  if(mousePressed){
  loc = new PVector(mouseX, mouseY);
  for(int i = 0; i < 8; i++){
  float nGX = (float) generator.nextGaussian();
  float nGY = (float) generator.nextGaussian();
  
  pushMatrix();
  float posX = loc.x + radius/4*nGX;
  float posY = loc.y + radius/4*nGY;
  translate(posX, posY);
  fill(200, 0, 0, 50);
  noStroke();
  
  float distOrigin = dist(loc.x, loc.y, posX, posY);
  size = map(distOrigin, 0, radius, 20, 1);
  size = constrain(size, 1, 20);
  
  ellipse(0, 0, size, size);
  popMatrix();
 
  }
  }
  /*noFill();
  stroke(0);
  ellipse(loc.x, loc.y, radius*2, radius*2);*/
}

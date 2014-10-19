//spraysplatter with dripping paint

//import java.util.Random;
//Random generator = new Random();

ArrayList<Drip> drips;

float radius;
PVector loc;
float strl;
float maxStrl;
color c = color(200, 0, 0, 50);

void setup() {
  size(500, 500);
  smooth();
  noStroke();
  background(255);

  drips = new ArrayList<Drip>();

  loc = new PVector(width/2, height/2);
  radius = (height*0.6)/2;
  maxStrl = radius * 0.15;
}

void draw() {
  //draw spray splatter
  if(frameCount < 500){
  for (int i = 0; i < 100; i++) {
   

    pushMatrix();
    PVector pos = new PVector(loc.x+random(-radius, radius), loc.y+random(-radius, radius));
    translate(pos.x, pos.y);
    fill(c);
    noStroke();

    float distOrigin = PVector.dist(loc, pos);
    strl = map(distOrigin, 0, radius, maxStrl, 0);
    strl = constrain(strl, 0, maxStrl);
    if(strl > 0){
    ellipse(0, 0, strl, strl);
    }
    popMatrix();
  }

  //add drips
  float r = random(1);
  if(r < 0.02){
    PVector dripLoc = new PVector(loc.x+random(-radius*0.6, radius*0.6), 0);
    drips.add(new Drip(new PVector(dripLoc.x, loc.y), c));
  }
  }

  //run drips
  for (int i = drips.size ()-1; i >= 0; i--) {
    Drip drip = drips.get(i);
    if (drip.isAlive) {
      drip.run();
    } else {
      drips.remove(i);
    }
  }
  
  
}

/*
PVector getGaussian(){
  float nGX = (float) generator.nextGaussian();
    float nGY = (float) generator.nextGaussian();
    float posX = loc.x + radius/4*nGX;
    float posY = loc.y + radius/4*nGY;
    PVector gaussian = new PVector(posX, posY);
    return gaussian;
}
*/

class Drip{
  PVector loc;
  PVector speed;
  PVector slowdown;
  float strl;
  color c;
  boolean isAlive;
  
 Drip(PVector loc, color c){
  this.loc = loc;
  speed = new PVector(0, random(0.75, 0.85));
  slowdown = new PVector(0, -0.0015);
  strl = random(radius*0.05, radius*0.15);
  this.c = c;
  isAlive = true;
 } 
 
 void update(){
   if(speed.y >= 0){
   loc.add(speed);
   speed.add(slowdown);
   } else{
    isAlive = false; 
   }
 }
 
 void display(){
   pushMatrix();
   translate(loc.x, loc.y);
   noStroke();
   fill(c);
   ellipse(0, 0, strl, strl);
   popMatrix();
 }
 
 void run(){
   update();
   display();
 }
}

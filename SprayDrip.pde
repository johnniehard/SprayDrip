//spraysplatter with dripping paint

import java.util.Random;
Random generator = new Random();

ArrayList<Drip> drips;

float radius;
PVector loc;
float size = 20;
color c = color(200, 0, 0, 50);

void setup() {
  size(500, 500);
  smooth();
  noStroke();
  background(255);

  drips = new ArrayList<Drip>();

  loc = new PVector(width/2, height/2);
  radius = (height*0.6)/2;
}

void draw() {
  //draw spray splatter
  for (int i = 0; i < 1000; i++) {
   

    pushMatrix();
    PVector pos = getGaussian();
    translate(pos.x, pos.y);
    fill(c);
    noStroke();

    float distOrigin = PVector.dist(loc, pos);
    size = map(distOrigin, 0, radius, 20, 1);
    size = constrain(size, 1, 20);

    ellipse(0, 0, size, size);
    popMatrix();
  }

  //add drips
  float r = random(1);
  if(r < 0.01){
    drips.add(new Drip(getGaussian(), c));
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

PVector getGaussian(){
  float nGX = (float) generator.nextGaussian();
    float nGY = (float) generator.nextGaussian();
    float posX = loc.x + radius/4*nGX;
    float posY = loc.y + radius/4*nGY;
    PVector gaussian = new PVector(posX, posY);
    return gaussian;
}


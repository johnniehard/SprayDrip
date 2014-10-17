class Drip{
  PVector loc;
  PVector speed;
  PVector slowdown;
  float size;
  color c;
  boolean isAlive;
  
 Drip(PVector loc, color c){
  this.loc = loc;
  speed = new PVector(0, random(0.75, 0.85));
  slowdown = new PVector(0, -0.0015);
  size = random(10, 20);
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
   ellipse(0, 0, size, size);
   popMatrix();
 }
 
 void run(){
   update();
   display();
 }
}

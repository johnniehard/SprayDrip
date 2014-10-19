//maintains aspect ratio
//set desired sketch ratio
int ratioW = 4;
int ratioH = 3;

void setup() {
  setMySize(window.innerWidth, window.innerHeight);
  smooth();
}

void draw() {
  fill(0);
  rect(0,0, width, height);
  fill(255);
  rect(10, 10, width-20, height-20);
  fill(100,0,0);
  noStroke();
  ellipse(width/2, height/2, height*0.6, height*0.6);
}

void setMySize(float w, float h) {
  
 
    size(w, w*(ratioH/ratioW));
    if(w*(ratioH/ratioW) > h){
      size(h*(ratioW/ratioH), h)
    }

}


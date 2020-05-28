int theta = 0;

void setup() {
  size(800, 800);
  colorMode(HSB, 360, 100, 100);
  background(0, 0, 100);
}

void draw() {
  stroke(theta, 100, 100);
  translate(width/2, height/2);
  rotate(theta*PI/180.0);
  line(0,-height/4,0,0);
  theta++;
  
  if(frameCount >= 360){
    noLoop();
  }
}

void keyPressed() {
  if (key == ENTER) saveFrame("####.png");
}

int theta = 0;

void setup() {
  size(800, 800);
  colorMode(HSB, 360, 100, 100);
  background(0, 0, 0);
}

void draw() {
  stroke(theta, 40, 90);
  translate(width/2, height/2);
  rotate(theta*PI/180.0);
  line(0,-(theta%72)*3-120,0,0);
  theta++;
  
  if(frameCount >= 360){
    noLoop();
  }
}

void keyPressed() {
  String timestamp = str(year()) + nf(month(), 2) + nf(day(), 2) + nf(hour(), 2) + nf(minute(), 2) + nf(second(), 2);
  if (key == ENTER) saveFrame("frames/"+ timestamp +".png");
}

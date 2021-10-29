PImage mainImg, maskImg, bgImg;
PGraphics foodieLayer;
color colors[] = {
  color(26, 188, 156, 100), color(46, 204, 113, 100),color(52, 152, 219, 100), 
  color(241, 196, 15, 100), color(230, 126, 34, 100), color(231, 76, 60, 100)};
color reds[] = {#ffffff, #772C40, #632434};
//#491521, #F4C3D3

void setup() {
  size(1024, 1280);
  smooth();
  frameRate(10);
  background(#ffffff);
  
  mainImg = loadImage("mainImg.png");
  maskImg = loadImage("maskImg.jpg");
  bgImg = loadImage("bgImg.jpg");
  
  foodieLayer = createGraphics(width, height);
}

void draw() {
  foodieLayer.beginDraw();
  foodieLayer.noStroke();
  foodieLayer.fill(255, 255, 255, 30);
  foodieLayer.rect(0, 0, width, height);
  foodieLayer.fill(colors[int(random(colors.length))]);
  //float r = random(3, 150);
  //foodieLayer.ellipse(random(width), random(height), r, r);
  //foodieLayer.fill(#E2D0D7, 20);
  //foodieLayer.rect(0, 0, width, height);
  //foodieLayer.fill(reds[int(random(reds.length))]);
  float r = random(2, 60);
  foodieLayer.circle(random(200, 800), random(200, 800), r);
  foodieLayer.circle(random(200, 800), random(200, 800), r);
  foodieLayer.endDraw();
  
  foodieLayer.mask(maskImg);
  
  image(foodieLayer, 0, 0);
  image(mainImg, 0, 0);
}

void keyPressed() {
  String timestamp = str(year()) + nf(month(), 2) + nf(day(), 2) + nf(hour(), 2) + nf(minute(), 2) + nf(second(), 2);
  if (key == ENTER) saveFrame("frames/"+ timestamp +".png");
}

color base = #0068b7;
color sub = #9fd9f6;
color accent = #fdd000;
float yoff = 0.0;
PFont font;
PGraphics waveLayer, textLayer;

void setup() {
  size(1280, 720);
  //noLoop();
  smooth();
  
  font = createFont("Wanderlust", 320);
}

void draw() {    
  waveLayer = createGraphics(width, height);
  waveLayer.beginDraw();
  waveLayer.background(sub);
  waveLayer.fill(base);
  waveLayer.noStroke();
  //waveLayer.stroke(accent);
  //waveLayer.strokeWeight(4);
  waveLayer.beginShape();
  float xoff = 0;
  for(float x = -160; x <= width + 160; x += 160) {
    float y = map(noise(xoff, yoff), 0, 1, 240, 400);
    waveLayer.curveVertex(x, y);
    xoff += 1;
  }
  waveLayer.vertex(width + 160, height+8);
  waveLayer.vertex(-160, height+8);
  waveLayer.endShape(CLOSE);
  yoff += 0.01;
  waveLayer.endDraw();
  
  textLayer = createGraphics(width, height);
  textLayer.beginDraw();
  textLayer.textFont(font);
  textLayer.textAlign(CENTER, CENTER);
  textLayer.fill(255);
  textLayer.text("WAVE", width/2, height/2 - 32);
  textLayer.endDraw();
  
  blendMode(BLEND);
  noTint();
  image(waveLayer, 0, 0);
  //background(accent, frameCount);
  blendMode(SCREEN);
  //image(textLayer, 0, 0);
  waveLayer.mask(textLayer);
  image(waveLayer, 0, -8);
  image(waveLayer, 0, -8);
  
  //blendMode(MULTIPLY);
  //textFont(font);
  //textAlign(CENTER, CENTER);
  //fill(accent);
  //text("WAVE", width/2, height/2 - 40);
}

void keyPressed() {
  //if (key == ENTER) saveFrame("frames/####.png");
  String timestamp = str(year()) + nf(month(), 2) + nf(day(), 2) + nf(hour(), 2) + nf(minute(), 2) + nf(second(), 2);
  if (key == ENTER) saveFrame("frames/"+ timestamp +".png");
}

//color cf = color(61, 148, 255);
//color ck = color(255, 242, 66);
//color ca = color(255, 92, 105);
//color ce = color(66, 235, 97);
color cf = #78c3fb;
color ck = #ffe77e;
color ca = #eb9486;
color ce = #439775;
color colors[] = {cf, ck, ca, ce};
int stws[] = {8, 16, 24, 32};

void setup() {
  size(800, 800);
  noLoop();
  strokeCap(PROJECT);
}

void draw() {
  background(255);
  for (int i = 0; i < width; i += 80) {
    stroke(colors[int(random(colors.length))]);
    strokeWeight(stws[int(random(stws.length))]);
    line(i, 0, width, height-i);
    line(0, i, width-i, height);
  }
}

void keyPressed() {
  //if (key == ENTER) saveFrame("frames/####.png");
  String timestamp = str(year()) + nf(month(), 2) + nf(day(), 2) + nf(hour(), 2) + nf(minute(), 2) + nf(second(), 2);
  if (key == ENTER) saveFrame("frames/"+ timestamp +".png");
}

color colors[] = {#cbe6f8, #f8f4cb, #f8cbcb, #d0f8cb};
color bg = #151f31;

void setup() {
  size(800, 800);
  frameRate(8);
  background(bg);
}

void draw() {
  if (frameCount % 40 == 0) {
    filter(BLUR, 2);
    blendMode(BLEND);
    noStroke();
    fill(bg, 80);
    rect(0, 0, width, height);
  }

  blendMode(SCREEN);
  float r_x = random(width);
  float r_y = random(height);
  float r_r = random(24);
  color r_c = colors[int(random(colors.length))];

  stroke(r_c);
  line(r_x-r_r, r_y, r_x+r_r, r_y);
  line(r_x, r_y-r_r, r_x, r_y+r_r);

  noStroke();
  fill(r_c);
  circle(r_x, r_y, r_r);
}

void keyPressed() {
  if (key == ENTER) saveFrame("frames/####.png");
}

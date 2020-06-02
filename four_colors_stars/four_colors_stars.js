var colors;
var bg;

function setup() {
  createCanvas(400,400);
  frameRate(8);
  colors = ["#cbe6f8", "#f8f4cb", "#f8cbcb", "#d0f8cb"];
  bg = color("#151f31");
  background(bg);
  bg.setAlpha(80);
}


function draw() {
  if (frameCount % 40 == 0) {
    filter(BLUR, 2);
    blendMode(BLEND);
    noStroke();
    fill(bg);
    rect(0, 0, width, height);
  }
  
  blendMode(SCREEN);
  const r_x = random(width);
  const r_y = random(height);
  const r_r = random(16);
  const r_c = colors[int(random(colors.length))];

  stroke(r_c);
  line(r_x-r_r, r_y, r_x+r_r, r_y);
  line(r_x, r_y-r_r, r_x, r_y+r_r);

  noStroke();
  fill(r_c);
  circle(r_x, r_y, r_r);
}

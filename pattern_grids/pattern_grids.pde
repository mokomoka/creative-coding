int grid_size = 80;
color main_color = #ff8c42;
color accent_color = #4e598c;
color def_color = main_color;

void setup() {
  size(800, 800);
  frameRate(1);
}

void draw() {
  background(255);
  for (int x = 0; x < width; x += grid_size) {
    for (int y = 0; y < height; y += grid_size) {
      gridPattern(x, y, int(random(10)));
      stroke(0);
      strokeWeight(4);
      noFill();
      rect(x, y, grid_size, grid_size);
    }
  }
}

void gridPattern(int x, int y, int n) {
  switch(n) {
  case 0:
    def_color = accent_color;
    gridPattern(x, y, int(random(10)));
    def_color = main_color;
    break;
  case 1:
    stroke(#f9c784);
    strokeWeight(4);
    for (int i = 5; i <= grid_size; i += 20) {
      line(x, y+i, x+i, y);
      line(x+grid_size, y+i, x+i, y+grid_size);
    }
  case 2:
    stroke(#fcaf58);
    strokeWeight(4);
    for (int i = 10; i <= grid_size; i += 20) {
      line(x, y+i, x+i, y);
      line(x+grid_size, y+i, x+i, y+grid_size);
    }
  case 3:
    stroke(def_color);
    strokeWeight(4);
    for (int i = 20; i <= grid_size; i += 20) {
      line(x, y+i, x+i, y);
      line(x+grid_size, y+i, x+i, y+grid_size);
    }
    break;
  case 4:
    stroke(def_color);
    strokeWeight(4);
    for (int i = 10; i <= grid_size; i += 10) {
      line(x, y+i, x+grid_size, y+i);
    }
    break;
  case 5:
    stroke(def_color);
    for (int i = 10; i <= grid_size; i += 10) {
      line(x+i, y, x+i, y+grid_size);
    }
    break;
  case 6:
    stroke(def_color);
    strokeWeight(2);
    for (int i = 10; i <= grid_size; i += 10) {
      line(x, y+i, x+grid_size, y+i);
      line(x+i, y, x+i, y+grid_size);
    }
    break;
  case 7:
    noStroke();
    fill(#fcaf58);
    for (int i = 1; i*8 <= grid_size; i++) {
      for (int j = 1; j*8 <= grid_size; j++) {
        if ((i%2 == 0 && j%2 == 1) || (i%2 == 1 && j%2 == 0)) {
          circle(x+i*8, y+j*8, 4);
        }
      }
    }
   case 8:
    noStroke();
    fill(def_color);
    for (int i = 1; i*8 <= grid_size; i++) {
      for (int j = 1; j*8 <= grid_size; j++) {
        if ((i%2 == 0 && j%2 == 0) || (i%2 == 1 && j%2 == 1)) {
          circle(x+i*8, y+j*8, 4);
        }
      }
    }
    break;
  case 9:
    stroke(def_color);
    strokeWeight(4);
    for(int i = 10; i < grid_size; i += 10){
      rect(x+i, y+i, grid_size-i*2, grid_size-i*2);
    }
  }
}

void keyPressed() {
  if (key == ENTER) saveFrame("frames/####.png");
}

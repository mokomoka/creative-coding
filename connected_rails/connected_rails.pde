int len = 80;
int start = 40;
int weight = 16;
//color colors[] = {#008dd6, #e3d600, #e13816, #008b42};
color colors[] = {#5887bf, #f7ca11, #e56c3e, #3d9055};

void setup() {
  size(800, 800);
  //noLoop();
  frameRate(1);
  strokeWeight(weight);
  strokeCap(SQUARE);
}

void draw() {
  background(255);
  int x = start;
  int y = start;
  int count = 0;
  boolean points[][] = new boolean[10][10];
  String direction = "";
  Rail old, now;
  int type;
  do {
    type = int(random(6));
  } while (type == 3);
  old = new Rail(x, y, type);
  stroke(colors[count]);
  old.drawRail();
  points[0][0] = true;
  if (old.getR()) {
    x += len;
    direction = "right";
  } else if (old.getD()) {
    y += len;
    direction = "down";
  }
  type = choiceRnd(old.connectTypes(direction));

  while (trueCount(points) < 100) {
    count++;
    if (x < 0 || width < x || y < 0 || height < y) {
      do {
        x = start + len * int(random(10));
        y = start + len * int(random(10));
      } while (points[(x-start)/len][(y-start)/len]);
      type = int(random(6));
    }

    if (type != -1) {
      now = new Rail(x, y, type);
      stroke(colors[count%colors.length]);
      now.drawRail();
      int i = (x-start)/len;
      int j = (y-start)/len;
      points[i][j] = true;
      old = now;
      if (old.getR() && i < 9 && !points[i+1][j]) {
        x += len;
        direction = "right";
        type = choiceRnd(old.connectTypes(direction));
      } else if (old.getD() && j < 9 && !points[i][j+1]) {
        y += len;
        direction = "down";
        type = choiceRnd(old.connectTypes(direction));
      } else if (old.getL() && i > 0 && !points[i-1][j]) {
        x -= len;
        direction = "left";
        type = choiceRnd(old.connectTypes(direction));
      } else if (old.getU() && j > 0 && !points[i][j-1]) {
        y -= len;
        direction = "up";
        type = choiceRnd(old.connectTypes(direction));
      } else if(trueCount(points) == points.length * points[0].length) {
        break;
      } else {
        do {
          x = start + len * int(random(10));
          y = start + len * int(random(10));
        } while (points[(x-start)/len][(y-start)/len]);
        type = int(random(6));
      }
    }
  }
}

int choiceRnd(int a[]) {
  return a[int(random(a.length))];
}

int trueCount(boolean b[][]) {
  int count = 0;
  for (int i = 0; i < b.length; i++) {
    for (int j = 0; j < b[i].length; j++) {
      if (b[i][j]) count++;
    }
  }
  return count;
}

void keyPressed() {
  //if (key == ENTER) saveFrame("frames/####.png");
  String timestamp = str(year()) + nf(month(), 2) + nf(day(), 2) + nf(hour(), 2) + nf(minute(), 2) + nf(second(), 2);
  if (key == ENTER) saveFrame("frames/"+ timestamp +".png");
}

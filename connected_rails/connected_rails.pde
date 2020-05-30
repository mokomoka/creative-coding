int len = 80;
color colors[] = {#000000, #333333, #666666, #999999, #cccccc};

void setup() {
  size(800, 800);
}

void draw() {
  background(255);
  int x = 40;
  int y = 40;
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

  while (!isAllTrue(points)) {
    count++;
    if (x < 0 || width < x || y < 0 || height < y) {
      do {
        x = 40 + 80 * int(random(10));
        y = 40 + 80 * int(random(10));
      } while (points[(x-40)/80][(y-40)/80]);
      type = int(random(6));
    }

    if (type != -1) {
      now = new Rail(x, y, type);
      stroke(colors[count%5]);
      now.drawRail();
      int i = (x-40)/80;
      int j = (y-40)/80;
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
      } else {
        do {
          x = 40 + 80 * int(random(10));
          y = 40 + 80 * int(random(10));
        } while (points[(x-40)/80][(y-40)/80]);
        type = int(random(6));
      }
    }
  }
}

int choiceRnd(int a[]) {
  return a[int(random(a.length))];
}

boolean isAllTrue(boolean b[][]) {
  for (int i = 0; i < b.length; i++) {
    for (int j = 0; j < b[i].length; j++) {
      if (!b[i][j]) return false;
    }
  }
  return true;
}

void mouseClicked() {
  redraw();
}

void keyPressed() {
  //if (key == ENTER) saveFrame("frames/####.png");
  String timestamp = str(year()) + nf(month(), 2) + nf(day(), 2) + nf(hour(), 2) + nf(minute(), 2) + nf(second(), 2);
  if (key == ENTER) saveFrame("frames/"+ timestamp +".png");
}

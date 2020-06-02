int len = 80;
int start = 40;

void setup() {
  size(800, 800);
  //noLoop();
  frameRate(1);
  strokeCap(SQUARE);
}

void draw() {
  background(250);
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
  old.setRail();
  points[0][0] = true;
  if (old.getR()) {
    x += len;
    direction = "right";
  } else if (old.getD()) {
    y += len;
    direction = "down";
  }
  type = choiceRnd(old.connectTypes(direction));

  while (trueCount(points) < 100) { //行き止まりになったら終わりにしたい場合はコメントアウトする
  //while (count < 100) { //行き止まりになったら終わりにしたい場合はもとに戻す
  //  count++;
    if (x < 0 || width < x || y < 0 || height < y) {
      do {
        x = start + len * int(random(10));
        y = start + len * int(random(10));
      } while (points[(x-start)/len][(y-start)/len]);
      type = int(random(6));
    }

    if (type != -1) {
      now = new Rail(x, y, type);
      now.setRail();
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
      } else if (trueCount(points) == points.length * points[0].length) {
        break;
      } else { //行き止まりになったら終わりにしたい場合はコメントアウトする
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

color colors[] = {#a4c4e8, #b5b5b6, #ffec00, #0363a6, #f6c4be, #f9f9fc, #e37560, #16395e, #457fbc, #0d0103};
color color_base, color_main1, color_main2, color_accent;
int space = 80;
int hole = 40;
Point points[][] = new Point[9][9];
Point point1, point2;

void setup() {
  size(800, 800);
  //noLoop();
  frameRate(1);

  //color_base = colors[int(random(3))];
  //color_main1 = colors[int(random(3, 9))];
  //do {
  //  color_main2 = colors[int(random(3, 9))];
  //} while (color_main2 == color_main1);
  color_accent = colors[9];
}

void draw() {
  if (frameCount%8 == 1) {
    color_base = colors[int(random(3))];
    color_main1 = colors[int(random(3, 9))];
    do {
      color_main2 = colors[int(random(3, 9))];
    } while (color_main2 == color_main1);
  }

  background(color_base);
  fill(color_accent);
  noStroke();
  int i = 0;
  int j = 0;
  for (int x = space; x < width; x += space) {
    for (int y = space; y < height; y += space) {
      circle(x, y, hole);
      points[i][j] = new Point(x, y);
      j++;
    }
    i++;
    j = 0;
  }

  int to = -1; //方向を決める　偶数のとき横線、奇数のとき縦線
  int l = 0; // 2点目のi用
  int k = 0; // 2点目のj用
  int old_l = 99;
  int old_k = 99;
  int count_same = 0;
  strokeCap(ROUND);
  strokeWeight(hole-16);
  stroke(color_main1);

  for (i = 0; i < points.length; i++) {
    for (j = 0; j < points[i].length; j++) {
      if (points[i][j].isUsed()) {
        continue;
      }
      point1 = points[i][j];
      points[i][j].use();

      if (isUsedLR(points, i, j) && isUsedUD(points, i, j)) {
        point2 = point1;
      } else if (!isUsedLR(points, i, j) && !isUsedUD(points, i, j)) {
        to++;
      } else {
        if (isUsedLR(points, i, j)) to = 1;
        else to = 0;
      }

      count_same = 0;
      if (to%2 == 0) {
        do {
          l = int(random(i, points.length));
          if (old_l != l) {
            old_l = l;
          } else {
            count_same++;
            if (count_same > 9) {
              count_same = 99;
              point2 = point1;
              break;
            }
          }
        } while (points[l][j].isUsed() || isUsedBetween(points, i, j, l, j));
        if (count_same != 99) {
          point2 = points[l][j];
          for (; l > i; l--) {
            points[l][j].use();
          }
        }
        stroke(color_main1);
      } else {
        do {
          k = int(random(j, points[i].length));
          if (old_k != k) {
            old_k = k;
          } else {
            count_same++;
            if (count_same > 9) {
              count_same = 99;
              point2 = point1;
              break;
            }
          }
        } while (points[i][k].isUsed() || isUsedBetween(points, i, j, i, k));
        if (count_same != 99) {
          point2 = points[i][k];
          for (; k > j; k--) {
            points[i][k].use();
          }
        }
        stroke(color_main2);
      }

      point1.connect(point2);
    }
  }
}

boolean isUsedLR(Point a[][], int i, int j) {
  boolean isUsedL = false;
  boolean isUsedR = false;
  if (i == 0 || a[i-1][j].isUsed()) {
    isUsedL = true;
  }
  if (i == a.length-1 || a[i+1][j].isUsed()) {
    isUsedR = true;
  }
  return isUsedL && isUsedR;
}

boolean isUsedUD(Point a[][], int i, int j) {
  boolean isUsedU = false;
  boolean isUsedD = false;
  if (j == 0 || a[i][j-1].isUsed()) {
    isUsedU = true;
  }
  if (j == a[0].length-1 || a[i][j+1].isUsed()) {
    isUsedD = true;
  }
  return isUsedU && isUsedD;
}

boolean isUsedBetween(Point a[][], int i, int j, int l, int k) {
  if (i == l) {
    for (int n = j+1; n < k; n++) {
      if (a[i][n].isUsed()) return true;
    }
  } else {
    for (int n = i+1; n < l; n++) {
      if (a[n][j].isUsed()) return true;
    }
  }
  return false;
}

//void mouseClicked() {
//  if (mouseButton == LEFT) {
//    redraw();
//  } else if (mouseButton == RIGHT) {
//    color_base = colors[int(random(3))];
//    color_main1 = colors[int(random(3, 9))];
//    do {
//      color_main2 = colors[int(random(3, 9))];
//    } while (color_main2 == color_main1);
//    color_accent = colors[9];
//    redraw();
//  }
//}

void keyPressed() {
  String timestamp = str(year()) + nf(month(), 2) + nf(day(), 2) + nf(hour(), 2) + nf(minute(), 2) + nf(second(), 2);
  if (key == ENTER) saveFrame("frames/"+ timestamp +".png");
}

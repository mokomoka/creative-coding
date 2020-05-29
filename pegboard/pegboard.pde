color colors[] = {#a4c4e8, #b5b5b6, #ffec00, #0363a6, #f6c4be, #f9f9fc, #e37560, #16395e, #457fbc, #0d0103};
color color_base, color_main1, color_main2, color_accent;
int space = 80;
int hole = 40;
Point points[][] = new Point[9][9];
Point point1, point2;
String timestamp;

void setup() {
  size(800, 800);
  timestamp = str(year()) + nf(month(), 2) + nf(day(), 2);

  color_base = colors[int(random(3))];
  color_main1 = colors[int(random(3, 9))];
  do {
    color_main2 = colors[int(random(3, 9))];
  } while (color_main2 == color_main1);
  color_accent = colors[9];
}

void draw() {
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

  strokeCap(ROUND);
  strokeWeight(hole-8);

  int to = 0; //方向を決める　偶数のとき横線、奇数のとき縦線
  int l = 0;
  int k = 0;
  stroke(color_main1);

  for (i = 0; i < points.length; i++) {
    for (j = 0; j < points[i].length; j++) {
      if(points[i][j].isUsed){
        continue;
      }
      point1 = points[i][j];
      points[i][j].use();
      
      if(isUsedLR(points, i, j) && isUsedUD(points, i, j)){
        point2 = point1;
        println(i, j, i, j);
      } else if(!isUsedLR(points, i, j) && !isUsedUD(points, i, j)){
        to++;
      } else {
        if (isUsedLR(points, i, j)) to = 1;
        else to = 0;
      }
      
      if (to%2 == 0) {
        do {
          l = int(random(9));
        } while (points[l][j].isUsed() && isUsedUD(points, l, j));
        point2 = points[l][j];
        points[l][j].use();
        println(i, j, l, j);
        if (l > i) {
          for (; l > i; l--) {
            points[l][j].use();
          }
        } else {
          for (; l < i; l++) {
            points[l][j].use();
          }
        }
        stroke(color_main1);
      } else {
        do {
          k = int(random(9));
        } while (points[i][k].isUsed() && isUsedLR(points, i, k));
        point2 = points[i][k];
        points[i][k].use();
        println(i, j, i, k);
        if (k > j) {
          for (; k > j; k--) {
            points[i][k].use();
          }
        } else {
          for (; k < j; k++) {
            points[i][k].use();
          }
        }
        stroke(color_main2);
      }
      point1.connect(point2);
    }
  }

  noLoop();
}

boolean isUsedLR(Point a[][], int i, int j) {
  boolean isUsedL = false;
  boolean isUsedR = false;
  if (i == 0 || a[i-1][j].isUsed) {
    isUsedL = true;
  }
  if (i == a.length-1 || a[i+1][j].isUsed) {
    isUsedR = true;
  }
  //println(i, j, "isUsedLR " + str(isUsedL && isUsedR));
  return isUsedL && isUsedR;
}

boolean isUsedUD(Point a[][], int i, int j) {
  boolean isUsedU = false;
  boolean isUsedD = false;
  if (j == 0 || a[i][j-1].isUsed) {
    isUsedU = true;
  }
  if (j == a[0].length-1 || a[i][j+1].isUsed) {
    isUsedD = true;
  }
  //println(i, j, "isUsedUD " + str(isUsedU && isUsedD));
  return isUsedU && isUsedD;
}

int isUsedCount(Point a[][]) {
  int count = 0;
  for (int i = 0; i < a.length; i++) {
    for (int j = 0; j < a[0].length; j++) {
      if (a[i][j].isUsed) {
        count++;
      }
    }
  }
  println(count);
  return count;
}

void keyPressed() {
  timestamp += nf(hour(), 2) + nf(minute(), 2) + nf(second(), 2);
  if (key == ENTER) saveFrame("frames/"+ timestamp +".png");
}

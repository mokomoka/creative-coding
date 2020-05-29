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

  // 今は始点と終点のみisUsedとしているが、間も全て使用済み判定にして
  // ぱっとみ全部埋まってる感じにしたい
  strokeCap(ROUND);
  strokeWeight(hole-8);

  int count_lines = 0;
  boolean rnd_i[] = new boolean[9];
  boolean rnd_j[] = new boolean[9];
  for (int a = 0; a < 9; a++) {
    rnd_i[a] = false;
    rnd_j[a] = false;
  }
  i = 0;
  j = 0;
  while (isUsedCount(points) < 81) {
    i = int(random(9));
    do {
      j = int(random(9));
      rnd_j[j] = true;
      if(isAllTrue(rnd_j)) break;
    } while (points[i][j].isUsed());
    point1 = points[i][j];
    points[i][j].use();
    int k = j;
    int l = i;
    for (int a = 0; a < 9; a++) {
      rnd_j[a] = false;
    }
    if (count_lines % 2 == 0) {
      do {
        j = int(random(9));
        rnd_j[j] = true;
        if(isAllTrue(rnd_j)) break;
      } while (points[i][j].isUsed());
      point2 = points[i][j];
      points[i][j].use();
      if (k > j) {
        for (; k > j; k--) {
          points[i][k].use();
        }
      } else {
        for (; k < j; k++) {
          points[i][k].use();
        }
      }
      stroke(color_main1);
    } else {
      do {
        i = int(random(9));
        rnd_i[i] = true;
      } while (points[i][j].isUsed() && !isAllTrue(rnd_i));
      point2 = points[i][j];
      points[i][j].use();
      if (l > i) {
        for (; l > i; l--) {
          points[l][j].use();
        }
      } else {
        for (; l < i; l++) {
          points[l][j].use();
        }
      }
      stroke(color_main2);
    }
    point1.connect(point2);
    count_lines++;
  }

  noLoop();
}

boolean isAllTrue(boolean a[]) {
  int count = 0;
  for (int i = 0; i < a.length; i++) {
    if (a[i]) count++;
  }
  if (count == a.length) return true;
  else return false;
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
  return count;
}

void keyPressed() {
  timestamp += nf(hour(), 2) + nf(minute(), 2) + nf(second(), 2);
  if (key == ENTER) saveFrame("frames/"+ timestamp +".png");
}

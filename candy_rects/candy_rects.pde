color pale[] = {#fbe5e7, #fffabb, #d3ecf3};
color icy[] = {#fdf5f9, #fffef1, #f3f9fd};
color pastel[] = {#f5becf, #fff7a0, #bbe2f1};

void setup() {
  size(900, 900);
  noStroke();
  noLoop();
}

void draw() {
  int count = 0;
  color c;
  for(int x = 0; x < width; x += 90){
    for(int y = 0; y <height; y += 90){
      if(count % 3 == 0) {
        c = pale[int(random(3))];
      }else if(count % 3 == 1){
        c = icy[int(random(3))];
      }else{
        c = pastel[int(random(3))];
      }
      fill(c);
      rect(x, y, 90, 90);
      count++;
    }
  }
}

void mouseClicked(){
  redraw();
}

void keyPressed() {
  //if (key == ENTER) saveFrame("frames/####.png");
  String timestamp = str(year()) + nf(month(), 2) + nf(day(), 2) + nf(hour(), 2) + nf(minute(), 2) + nf(second(), 2);
  if (key == ENTER) saveFrame("frames/"+ timestamp +".png");
}

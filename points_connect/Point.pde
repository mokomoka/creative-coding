class Point {
  float x, y, dx, dy;

  Point(float x, float y) {
    this.x = x;
    this.y = y;
    dx = random(-8, 8);
    dy = random(-8, 8);
  }
  
  void move() {
    x += dx;
    y += dy;
    noStroke();
    fill(255);
    circle(x, y, 16);
    if (x <= 0 || x > width) {
      dx = -dx;
    } else if (y <= 0 || y > height) {
      dy = -dy;
    }
  }
  
  void connect(Point a){
    stroke(255);
    strokeWeight(4);
    line(x, y, a.getX(), a.getY());
  }
  
  void reset(){
    x = random(width);
    y = random(height);
    dx = random(-8, 8);
    dy = random(-8, 8);
  }
  
  float getX(){
    return x;
  }
  
  float getY(){
    return y;
  }
}

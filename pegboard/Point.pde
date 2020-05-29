class Point {
  int x, y;
  boolean isUsed = false;

  Point(int x, int y) {
    this.x = x;
    this.y = y;
  }

  void use() {
    this.isUsed = true;
  }

  boolean isUsed() {
    return this.isUsed;
  }
  
  void connect(Point a) {
    line(x, y, a.getX(), a.getY());
  }
  
  int getX(){
    return this.x;
  }
  
  int getY(){
    return this.y;
  }
}

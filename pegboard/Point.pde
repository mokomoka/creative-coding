class Point {
  private int x, y;
  private boolean used_flag = false;

  Point(int x, int y) {
    this.x = x;
    this.y = y;
  }

  void use() {
    this.used_flag = true;
  }

  boolean isUsed() {
    return this.used_flag;
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

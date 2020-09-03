class Key {
  int x;
  boolean isWhite;
  PGraphics a;

  int key_w;
  int key_h;
  color key_color;

  Key(int x, boolean isWhite, PGraphics a) {
    this.x = x;
    this.a = a;

    if (isWhite) {
      key_w = key_white_width;
      key_h = key_white_height;
      key_color = white;
    } else {
      key_w = key_black_width;
      key_h = key_black_height;
      key_color = black;
    }
  }

  void draw() {
    a.stroke(body);
    a.strokeWeight(4);
    a.fill(key_color);
    a.rect(x, 0, key_w, key_h);
  }
}

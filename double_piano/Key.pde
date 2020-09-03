class Key {
  int x;
  boolean isWhite;
  PGraphics layer;

  int key_w;
  int key_h;
  color key_color;
  color line_color;

  Key(int x, boolean isWhite, PGraphics layer) {
    this.x = x;
    this.layer = layer;

    if (isWhite) {
      key_w = key_white_width;
      key_h = key_white_height;
      key_color = white;
      line_color = white_line;
    } else {
      key_w = key_black_width;
      key_h = key_black_height;
      key_color = black;
      line_color = black_line;
    }
  }

  void draw() {
    layer.stroke(line_color);
    layer.strokeWeight(4);
    layer.fill(key_color);
    layer.rect(x, 0, key_w, key_h);
  }
}

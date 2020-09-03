class Note {
  int type; // {type}分音符を生成することになる
  PGraphics layer;

  Note(int type, PGraphics layer) {
    this.type = type;
    this.layer = layer;
  }

  void drawNote(float x, float y, float scale, float angle) {
    layer.strokeCap(SQUARE);
    layer.pushMatrix();
    layer.scale(scale);

    layer.translate(x, y);
    layer.rotate(angle);
    single(0, 0);
    if (type >= 8) {
      float dy = random(-28, 28);
      single(80, dy);
      layer.strokeWeight(16);
      layer.stroke(255, 128);
      layer.line(20, -120+8, 100, -120+8+dy); 
      if (type >= 16) {
        layer.line(20, -90+8, 100, -90+8+dy);
      }
    }
    layer.popMatrix();
  }

  void single(float x, float y) {
    layer.stroke(255, 180);
    layer.strokeWeight(4);
    layer.fill(255, 180);
    layer.line(x+20, y-120, x+20-1, y);
    layer.pushMatrix();
    layer.translate(x, y);
    layer.rotate(-PI/8.0);
    layer.noStroke();
    layer.ellipse(0, 0, 40, 28);
    layer.popMatrix();
  }
}

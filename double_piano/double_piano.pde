PGraphics piano1, piano2, mask, piano_body, notes;
color white = #ffffff;
color white_line = #999999;
color black = #333333;
color black_line = #222222;
color body = #444444;
color body_line = #444444;

int key_white_width = 100;
int key_white_height = 800;
int key_black_width = 50;
int key_black_height = 720;
int count = 0;

void setup() {
  size(800, 800);
  smooth();
  noLoop();
}

void draw() {
  background(body);

  piano1 = createGraphics(width, height);
  piano1.beginDraw();
  for (int i = 0; i <= width; i += key_white_width) {
    Key keys1 = new Key(i, true, piano1);
    keys1.draw();
  }
  for (int i = 0; i < width; i += key_white_width) {
    if (count%7 != 2 && count%7 != 6) {
      Key keys1_b = new Key(i+key_black_width+key_black_width/2, false, piano1);
      keys1_b.draw();
    }
    count++;
  }
  piano1.endDraw();

  count = 0;
  piano2 = createGraphics(width, height);
  piano2.beginDraw();
  for (int i = 0; i <= width; i += key_white_width) {
    Key keys2 = new Key(i, true, piano2);
    keys2.draw();
  }
  for (int i = 0; i < width; i += key_white_width) {
    if (count%7 != 0 && count%7 != 4) {
      Key keys2_b = new Key(i+key_black_width+key_black_width/2, false, piano2);
      keys2_b.draw();
    }
    count++;
  }

  mask = createGraphics(width, height);
  mask.beginDraw();
  mask.noStroke();
  mask.fill(255);
  mask.triangle(width, 0, 0, height, width, height);
  mask.endDraw();

  image(piano1, 0, 0);
  piano2.mask(mask);
  pushMatrix();
  translate(width/2, height/2);
  rotate(-PI/2.0);
  image(piano2, -width/2, -height/2);
  popMatrix();

  strokeWeight(4);
  stroke(white_line);
  line(0, 0, width, height);

  stroke(body_line);
  fill(body);
  rect(width-key_white_width, height-key_white_width, key_white_width, key_white_width);

  piano_body = createGraphics(width, height);
  piano_body.beginDraw();
  piano_body.stroke(128);
  piano_body.fill(255);
  piano_body.beginShape();
  float x1 = width*0.6;
  float x4 = width-key_white_width-key_black_width;
  float x2 = x1;
  float x3 = x4;
  float y1 = key_white_width*2;
  float y2 = key_white_width*3;
  float y3 = y2;
  float y4 = key_white_width*4;
  piano_body.vertex(0, 0);
  piano_body.vertex(x1, 0);
  piano_body.vertex(x1, y1);
  piano_body.bezierVertex(x2, y2, x3, y3, x4, y4);
  piano_body.vertex(x4, key_white_width*6);
  piano_body.bezierVertex(x4, key_white_width*6.3, key_white_width*6.3, x4, key_white_width*6, x4);
  piano_body.vertex(y4, x4);
  piano_body.bezierVertex(y3, x3, y2, x2, y1, x1);
  piano_body.vertex(0, x1);
  piano_body.vertex(0, 0);
  piano_body.endShape();
  piano_body.endDraw();

  int note_num = 24;
  notes = createGraphics(width, height);
  notes.beginDraw();
  notes.background(body);
  Note note4[] = new Note[note_num];
  Note note8[] = new Note[note_num];
  Note note16[] = new Note[note_num];
  for (int i = 0; i < note_num; i++) {
    float scale = random(0.2, 1);
    note4[i] = new Note(4, notes);
    note4[i].drawNote(random(x4) * 1/scale, random(x4) * 1/scale, scale, random(2*PI));
    note8[i] = new Note(8, notes);
    note8[i].drawNote(random(x4) * 1/scale, random(x4) * 1/scale, scale, random(2*PI));
    note16[i] = new Note(16, notes);
    note16[i].drawNote(random(x4) * 1/scale, random(x4) * 1/scale, scale, random(2*PI));
  }
  notes.endDraw();

  //tint(body);
  //image(piano_body, 0, 0);
  //noTint();
  notes.mask(piano_body);
  image(notes, 0, 0);
}

void keyPressed() {
  //if (key == ENTER) saveFrame("frames/####.png");
  String timestamp = str(year()) + nf(month(), 2) + nf(day(), 2) + nf(hour(), 2) + nf(minute(), 2) + nf(second(), 2);
  if (key == ENTER) saveFrame("frames/"+ timestamp +".png");
}

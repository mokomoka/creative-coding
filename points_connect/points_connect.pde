Point[] points = new Point[12];
int vertex = 3;

void setup() {
  size(800, 800);
  frameRate(30);
  
  for(int i = 0; i < points.length; i++){
    points[i] = new Point(random(width), random(height));
  }
}

void draw() {
  background(0);
  
  for(int i = 0; i < points.length; i++){
    points[i].move();
    
    if(i%vertex != 0){
      points[i].connect(points[i-1]);
    } else if(i+vertex-1 < points.length) {
      points[i].connect(points[i+vertex-1]);
    } else {
      points[i].connect(points[points.length-1]);
    }
  }
}

void keyPressed() {
  if (key == ENTER) saveFrame("####.png");
}

void mousePressed(){
  if(mouseButton == LEFT){  
    vertex++;
    if(vertex > 8){
      vertex = 2;
    }
  } else if(mouseButton == RIGHT){
    for(int i = 0; i < points.length; i++){
      points[i].reset();
    }
  }
}

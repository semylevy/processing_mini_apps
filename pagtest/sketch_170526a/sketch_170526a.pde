void setup() {
 size(640, 360);
 noStroke();
}

int radius = 280;

void draw() {
  background(100);
  drawCircle(width/2, radius, 6);
  radius--;
}

void drawCircle(int x, int radius, int level) {
 float levelTone = 126 * level / 4.0; 
 fill(levelTone);
 ellipse(x, height/2, radius*2, radius*2);
 if(level > 1) {
  level -= 1;
  drawCircle(x + radius/2, radius/2, level);
 }
}
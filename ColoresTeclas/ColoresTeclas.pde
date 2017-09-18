color relleno;
 
void setup() {
  size(200, 200);
  noStroke();
  background(0);
  relleno = color(255,255,255);
}
void draw() { 
  fill(relleno);
  ellipse(100,100,50,80);
}
void keyPressed() {
 if (keyCode == UP)
  {
    relleno = color(255,0,0);
  }
  if(keyCode == DOWN)
  {
    relleno = color(0,255,0);
  }
  if(keyCode == RIGHT)
  {
    relleno = color(0,0,255);
  }
  if(keyCode == LEFT)
  {
    relleno = color(255,0,255);
  }
  if(key == 'h'){
    relleno = color(0,0,0);
  }
}
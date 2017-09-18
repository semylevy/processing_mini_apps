float x,y,z,a;

void setup() {
  size(600,600,P3D);
  x = width/2;
  y = height/2;
  z = 0;
  a = 1;
}

void draw() {
  translate(x,y,z);
  rotateX(PI/a);
  rectMode(CENTER);
  rect(0,0,100,100);

  z++; // The rectangle moves forward as z increments.
  a++;
}
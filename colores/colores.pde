void setup(){
  size(800,600);
  background(0,0,0);
}

int mov = 0;
void draw(){
  strokeWeight(10);
  stroke(255,mouseX*.4,mouseY*.4);
  line(400,300,mouseX,mouseY);
  fill(255,mouseY,mouseX);
  rect(mov,200,100,200);
  mov++;
  if(mov==800){
    mov=-100;
  }
}
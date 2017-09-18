PImage tortuga, oveja;
int x1, y1, x2, y2;

void setup(){
 size(800,600);
 x1=500;
 y1=10;
 x2=100;
 y2=100;
 tortuga = loadImage("turtle.png");
 oveja = loadImage("sheep.png");
}

void draw(){
  background(255);
  image(tortuga, x2, y2);
  image(oveja, x1, y1); 
}

void keyPressed(){
  if(keyCode==LEFT){
    x1-=10;
    if(abs(y2-y1)<150 && abs(x2-x1)<150){
     x2-=10; 
    }
  }
  if(keyCode==RIGHT){
    x1+=10;
    if(abs(y2-y1)<150 && abs(x2-x1)<150){
     x2+=10; 
    }
  }
  if(keyCode==UP){
    y1-=10;
    if(abs(y2-y1)<150 && abs(x2-x1)<150){
     y2-=10; 
    }
  }
  if(keyCode==DOWN){
    y1+=10;
  }
  if(abs(y2-y1)<150 && abs(x2-x1)<150){
     y2+=10; 
    }
}
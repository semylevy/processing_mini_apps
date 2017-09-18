int numFrames = 3;  //Número de cuadros de la animación
int frame = 0;
PImage[] images = new PImage[numFrames];
 
void setup()
{
  size(200, 200);
  frameRate(10);
 
  images[0]  = loadImage("caballo1.jpg");
  images[1]  = loadImage("caballo2.jpg"); 
  images[2]  = loadImage("caballo3.jpg");
 
 
} 
 
void draw() 
{ 
  frame = (frame+1) % numFrames;  //Para crear el ciclo
  image(images[frame], 50, 50);
}
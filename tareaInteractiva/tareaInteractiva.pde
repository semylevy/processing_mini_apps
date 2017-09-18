//Juego estilo "Guitar Hero". Usar teclas 'g', 'h', 'j', 'k' para tocar las notas cuando éstas llegen a los objetivos.

import processing.sound.*;

Nota[] nota1, nota2, nota3, nota4;
int keyCount1=0;
int keyCount2=0;
int keyCount3=0;
int keyCount4=0;
int score;
/*int [] secuenciaVerde = {1,0,0,0,1,0,0,0,1,0};
int [] secuenciaRojo = {0,1,0,0,1,1,0,0,0,1};
int [] secuenciaAmarillo = {0,0,1,0,1,0,1,0,0,0};
int [] secuenciaAzul = {0,0,0,1,1,0,0,1,0,0};*/  //Las secuencias se pueden llenar manualmente

int [] secuenciaVerde = new int [1000];
int [] secuenciaRojo = new int [1000];
int [] secuenciaAmarillo = new int [1000];
int [] secuenciaAzul = new int [1000];

PImage bgInactivo, verde, rojo, amarillo, azul;
SoundFile notaDo;
SoundFile notaRe;
SoundFile notaMi;
SoundFile notaFa;
boolean cont = true;

void setup(){
  int [] probabilidad = {1,0,0,0,0};
  for(int i=0; i<1000; i++){
   secuenciaVerde[i]=(probabilidad[int(random(5))]);
   secuenciaRojo[i]=(probabilidad[int(random(5))]);
   secuenciaAmarillo[i]=(probabilidad[int(random(5))]);
   secuenciaAzul[i]=(probabilidad[int(random(5))]);
  }
  nota1 = new Nota[secuenciaVerde.length];
  nota2 = new Nota[secuenciaRojo.length];
  nota3 = new Nota[secuenciaAmarillo.length];
  nota4 = new Nota[secuenciaAzul.length];
  for(int i=0; i<secuenciaVerde.length; i++){
   nota1[i] = new Nota(-i*100, secuenciaVerde, i, 1);
   nota2[i] = new Nota(-i*100, secuenciaRojo, i, 2);
   nota3[i] = new Nota(-i*100, secuenciaAmarillo, i, 3);
   nota4[i] = new Nota(-i*100, secuenciaAzul, i, 4);
  }
  bgInactivo = loadImage("bgInactivo.jpg");
  verde = loadImage("verde.png");
  rojo = loadImage("rojo.png");
  amarillo = loadImage("amarillo.png");
  azul = loadImage("azul.png");
  notaDo = new SoundFile(this, "Do.mp3");
  notaRe = new SoundFile(this, "Re.mp3");
  notaMi = new SoundFile(this, "Mi.mp3");
  notaFa = new SoundFile(this, "Fa.mp3");
  size(600,600);
}

void draw(){
  background(255);
  image(bgInactivo, 0, 0, 600, 600);
  //line(0,575,600,575);
  for (Nota nota1 : nota1) {
    nota1.creaNota();
    nota1.anima();
  }
  for (Nota nota2 : nota2) {
    nota2.creaNota();
    nota2.anima();
  }
  for (Nota nota3 : nota3) {
    nota3.creaNota();
    nota3.anima();
  }
  for (Nota nota4 : nota4) {
    nota4.creaNota();
    nota4.anima();
  }
}

void keyPressed(){
 if(key == 'g'){
  int temp=keyCount1;
  while(secuenciaVerde[temp]==0){
    keyCount1++;
    temp=temp+1;
  }
  if(nota1[keyCount1].checkTry(600)){
   notaDo.play();
   score++;
  } else{
   nota1[keyCount1].endScreen();
  }
 }
 
 if(key == 'h'){
  int temp=keyCount2;
  while(secuenciaRojo[temp]==0){
    keyCount2++;
    temp=temp+1;
  }
  if(nota2[keyCount2].checkTry(600)){
    notaRe.play();
    score++;
  } else{
   nota2[keyCount2].endScreen();  
  }
 }
 
 if(key == 'j'){
  int temp=keyCount3;
  while(secuenciaAmarillo[temp]==0){
    keyCount3++;
    temp=temp+1;
  }
  if(nota3[keyCount3].checkTry(600)){
    notaMi.play();
    score++; 
  } else{
   nota3[keyCount3].endScreen();  
  }
 }
 
 if(key == 'k'){
  int temp=keyCount4;
  while(secuenciaAzul[temp]==0){
    keyCount4++;
    temp=temp+1;
  }
  if(nota4[keyCount4].checkTry(600)){
    notaFa.play();
    score++;
  } else{
   nota4[keyCount4].endScreen(); 
  }
 }
}

class Nota{
 
 float ypos;
 int [] secuencia;
 int num, tipo;
 
 Nota(float tempY, int [] sec, int numTemp, int tipoTemp){
  num=numTemp;
  secuencia=sec;
  ypos=tempY; 
  tipo=tipoTemp;
 }
 
 boolean checkTry (float pos){
   for(int i=-50; i<80; i++){
     if(pos==ypos+i){
       if(tipo==1){
        keyCount1++; 
       }
       if(tipo==2){
        keyCount2++; 
       }
       if(tipo==3){
        keyCount3++; 
       }
       if(tipo==4){
        keyCount4++; 
       }
       ypos+=100;
       return true;
     }
   }
   if(tipo==1){
    keyCount1++; 
   }
   if(tipo==2){
    keyCount2++; 
   }
   if(tipo==3){
    keyCount3++; 
   }
   if(tipo==4){
    keyCount4++; 
   }
   return false;
 }
 
 void creaNota(){
   if(secuencia[num]==1.0){
     if(tipo==1){
       image(verde, 93, ypos, verde.width/1.4, verde.height/1.5);
     }
     if(tipo==2){
       image(rojo, 210, ypos, rojo.width/1.4, rojo.height/1.5);
     }
     if(tipo==3){
       image(amarillo, 325, ypos, amarillo.width/1.4, amarillo.height/1.5);
     }
     if(tipo==4){
       image(azul, 433, ypos, azul.width/1.4, azul.height/1.5);
     }
   }
 }
 
 void endScreen(){
   cont = false;
   fill(255,0,0);
   rect(100,150,400,300);
   textSize(32);
   fill(0);
   text("Score: ", 250, 200);
   textSize(100);
   text(score, 235, 350);
   frameRate(0);
 }
 
 void anima(){
   if(cont==true){
     ypos=ypos+3;
   }
 }
  
}
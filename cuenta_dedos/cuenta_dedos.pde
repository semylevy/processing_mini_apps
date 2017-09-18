import com.leapmotion.leap.*;
import com.leapmotion.leap.processing.LeapMotion;
import ddf.minim.*;//importar libreria
import ddf.minim.ugens.*;

LeapMotion leapMotion;
Minim minim;//declaracion de objeto minim
AudioOutput out;//declaracion de objeto AudioOutput
String note = "";
int temporal = 0;
int anterior = 0;

void setup()
{
  size(800, 600);
  background(200);
  frameRate(60);
  textAlign(CENTER);
  textSize(120);
  leapMotion = new LeapMotion(this);
  
  minim = new Minim(this);//inicializacion del objeto minim (sonido)
  
  out = minim.getLineOut();//función para grabar output
}

void draw()
{
  background(200);
  fill(0, 0, 80); 
  anterior = temporal;
  temporal = contarDedos();
  String dedos = "Dedos: "+temporal;
  text(dedos, 400, 400);
  if(anterior!=temporal){
     if(temporal==1){
       out.playNote("C");
       note = "DO"; 
     }
     if(temporal==2){
       out.playNote("D");
       note = "DO"; 
     }
     if(temporal==3){
       out.playNote("E");
       note = "DO"; 
     }
     if(temporal==4){
       out.playNote("F");
       note = "DO"; 
     }
     if(temporal==5){
       out.playNote("G");
       note = "DO"; 
     }
  }
}

int contarDedos()
{
  int extended = 0;
  com.leapmotion.leap.Controller controller = leapMotion.controller();
  if (controller.isConnected())
  {
    Frame frame = controller.frame();
    if (!frame.hands().isEmpty())
    {
      for (Hand hand : frame.hands())
      {
        for (Finger finger : hand.fingers())
        {
          if (finger.isExtended())
          {
            extended++;
          }
        }
      }
    }//Cierra if frame.hands
  }//Cierra if controller connected
  println(extended);
  return extended;
}
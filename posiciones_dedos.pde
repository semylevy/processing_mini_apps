//import java.util.Map;
//import java.util.concurrent.ConcurrentMap;
//import java.util.concurrent.ConcurrentHashMap;

import com.leapmotion.leap.Controller;
import com.leapmotion.leap.Finger;
import com.leapmotion.leap.Frame;
import com.leapmotion.leap.Hand;
import com.leapmotion.leap.Tool;
import com.leapmotion.leap.Vector;
import com.leapmotion.leap.processing.LeapMotion;

LeapMotion leapMotion;


void setup()
{
  size(800, 600);
  strokeWeight(20);
  leapMotion = new LeapMotion(this);
}

void draw()
{
  background(255);
  Controller controller = leapMotion.controller();
  if (controller.isConnected())
  {
    Frame frame = controller.frame();
      for (Hand hand : frame.hands())
      {
        if(hand.isLeft())
           stroke(96,111,140);
        if(hand.isRight())
           stroke(222,76,138);
        for (Finger finger : hand.fingers())
        {
           Vector pos = finger.tipPosition();
           float x=pos.getX();
           float y=pos.getY();
           float x_s = leapMotion.leapToSketchX(x);
           float y_s = leapMotion.leapToSketchY(y);
           point(x_s,y_s);
        }//Cierra for dedos
      } //Cierra for manos

  }//Cierra if controller connected
 
}
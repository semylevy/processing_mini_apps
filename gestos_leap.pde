import com.leapmotion.leap.Controller;
import com.leapmotion.leap.Frame;
import com.leapmotion.leap.Gesture;
import com.leapmotion.leap.processing.LeapMotion;


LeapMotion leapMotion;
int dibujo;

void setup()
{
  size(500, 300);

  leapMotion = new LeapMotion(this);
  dibujo = 0;
}

void draw()
{
  background(255);
  switch(dibujo)
  {
    case 0:
       break;
    case 1:
       noStroke();
       fill(30, 89, 69);
       ellipse(250,150,100, 100);
       break;
    case 2:
       noStroke();
       fill(222, 76, 138);
       ellipse(200, 200, 120, 60);
       break;
    case 3:
       noStroke();
       fill(211,110,112);
       rect(180,150,30,30);
       rect(260,150,30,30);
       rect(320,150,30,30);
       break;
    case 4:
       stroke(96,111,140);
       strokeWeight(20);
       point(100,150);
       point(120,130);
       point(140,110);
       point(160,90);
       point(180,70);
       break;
  }
}

void onInit(final Controller controller)
{
  controller.enableGesture(Gesture.Type.TYPE_CIRCLE);
  controller.enableGesture(Gesture.Type.TYPE_KEY_TAP);
  controller.enableGesture(Gesture.Type.TYPE_SCREEN_TAP);
  controller.enableGesture(Gesture.Type.TYPE_SWIPE);
 }

void onFrame(final Controller controller)
{
  Frame frame = controller.frame();
  for (Gesture gesture : frame.gestures())
  {
    switch(gesture.type())
    {
      case TYPE_CIRCLE:
         dibujo = 1;
         println("Circle");
         break;
      case TYPE_SCREEN_TAP:
         dibujo = 2;
         println("Screen tap");
         break;
      case TYPE_KEY_TAP:
         dibujo = 3;
         println("Key tap");
         break;
      case TYPE_SWIPE:
         dibujo = 4;
         println("Swipe");
         break;
      case TYPE_INVALID:
         dibujo=0;
         break;
    }
 
    //println("gesture " + gesture + " id " + gesture.id() + " type " + gesture.type() + " state " + gesture.state() + " duration " + gesture.duration() + " durationSeconds " + gesture.durationSeconds()); 
  }
}
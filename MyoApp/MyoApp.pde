import de.voidplus.myo.*;
import ddf.minim.*;

Minim minim;
AudioPlayer player1;
AudioPlayer player2;
AudioPlayer player3;
AudioPlayer player4;

Myo myo;

PImage[] img;
boolean[] active;

void setup() {
  size(800, 200);
  background(255);
  // ...
 
  minim = new Minim(this);
  player1 = minim.loadFile("data/dedos.mp3");
  player2 = minim.loadFile("data/palma.mp3");
  player3 = minim.loadFile("data/puno.mp3");
  player4 = minim.loadFile("data/voltea.mp3");

  
  myo = new Myo(this);
  // myo.setVerbose(true);
  // myo.setVerboseLevel(2); // Default: 1 (1-3)
  
  myo.setFrequency(10);
  
  img = new PImage[5];
  img[0] = loadImage("data/double_tab.png");
  img[1] = loadImage("data/spread_fingers.png");
  img[2] = loadImage("data/wave_right.png");
  img[3] = loadImage("data/wave_left.png");
  img[4] = loadImage("data/make_a_fist.png");
  
  active = new boolean[5];
  resetImages();
}

void resetImages(){
  for(int i = 0; i<5; i++){
    active[i] = false;
  }
}

void draw() {
  background(255);
  // ...

  for (int i = 0; i<5; i++) {
    tint(255, (active[i]) ? 100 : 50);
    image(img[i], ((140*i)+(i*10))+30, 30, 140, 140);
  }
}

void myoOnPose(Device myo, long timestamp, Pose pose) {
  
  if (!pose.getType().toString().equals("REST")) {
    resetImages();
  }
  
  switch (pose.getType()) {
  case REST:
    // resetImages();
    break;
  case FIST:
    active[4] = true;
    player3.rewind();
    player3.play();
    myo.vibrate();
    break;
  case FINGERS_SPREAD:
    active[1] = true;
    player2.rewind();
    player2.play();
    break;
  case DOUBLE_TAP:
    active[0] = true;
    player1.rewind();
    player1.play();
    break;
  case WAVE_IN:
    active[2] = true;
    player4.rewind();
    player4.play();
    break;
  case WAVE_OUT:
    active[3] = true;
    player4.rewind();
    player4.play();
    break;
  default:
    break;
  }
}

void myoOnLock(Device myo, long timestamp) {
  resetImages();
}

void myoOnUnLock(Device myo, long timestamp) {
  resetImages();
}
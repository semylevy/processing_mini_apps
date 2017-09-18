import de.voidplus.myo.*;

Myo myo;

void setup() {
  size(800, 400);
  background(255);

  myo = new Myo(this);
}

void myoOnPose(Device myo, long timestamp, Pose pose) {
  println("Sketch: myoOnPose() has been called");
  switch (pose.getType()) {
    case REST:
      println("Pose: REST");
      break;
    case FIST:
      println("Pose: FIST");
      break;
    case FINGERS_SPREAD:
      println("Pose: FINGERS_SPREAD");
      break;
    case DOUBLE_TAP:
      println("Pose: DOUBLE_TAP");
      break;
    case WAVE_IN:
      println("Pose: WAVE_IN");
      break;
    case WAVE_OUT:
      println("Pose: WAVE_OUT");
      break;
  }
}
/**/
import processing.sound.SoundFile;

SoundFile startup;
int logo_t = 0, cubeSize = 60, t = 0;
float logo_cameraY = 0;
PFont  MSGothic20, MSGothic32;
String state = "...";
boolean done = false, loadDone = false;

void setup() {
  size(1024, 768, P3D);
  background(0);
  startup = new SoundFile(this, "dstudio.wav");
  MSGothic20 = loadFont("MS-Gothic-20.vlw");
  MSGothic32 = loadFont("MS-Gothic-32.vlw");
  cubeSize = max(width, height)/7;
  strokeCap(ROUND);
  println(LEFT, CENTER, RIGHT);
}

void draw() {
  if (!loadDone) { // display logo if didnt finish loading OR 250 frames passed
    if (logo_t==1) {
      startup.play();
      new Thread(() -> { // run in a new thread
        try {
          state = "Loading Basalt...";
          loadBasalt();

          done = true; // dont delete this; its so the program knows when you're done
        }
        catch (Throwable e) { // in case of an error (Throwable is like, catch every single error)
          fd = new long[] { // replace all of the logo faces with X
            0b1000001001000100001010000001000000101000010001001000001000000000l,
            0b1000001001000100001010000001000000101000010001001000001000000000l,
            0b1000001001000100001010000001000000101000010001001000001000000000l,
            0b1000001001000100001010000001000000101000010001001000001000000000l,
            0b1000001001000100001010000001000000101000010001001000001000000000l,
            0b1000001001000100001010000001000000101000010001001000001000000000l,
          };
          state = e.toString(); // and display the error message
        }
      }
      ).start();
    } else if (logo_t<0) {
      background(0);
      // yeah dont delete this
      logo_t++;
      loadDone = logo_t>-1;
      return;
    }
    if (logo_t < 250) { // mike's logo
      renderLogo();
    } else {
      background(0);
      BasaltRender("dtpls & fluxdrive", width/2, map2(constrain(logo_t, 250, 300), 250, 300, -100, 250, EXPONENTIAL, EASE_OUT), 40, #ffffff, 10, 16, sin((float)millis()/500)*8, 2, 2, 2, 2, 2, 20, 1, 1, CENTER);
      BasaltRender("present", width/2, map2(constrain(logo_t, 250, 300), 250, 300, 999, 350, EXPONENTIAL, EASE_OUT), 20, #808080, 6, 8, cos((float)millis()/500)*4, 2, 2, 0, 2, 2, 0, 1, 1, CENTER);
    }
    logo_t++;
    if (logo_t>=0) textWS(done?"Finished loading.":state, width/2, height-40, 255,
      0, 4,
      0, 0.03, 0, 0,
      15, 10, false); // finished loading
    fill(255);
    loadDone = logo_t>400&&done; // false if didnt finish loading OR 250 frames passed
    if (loadDone && logo_t>0) { // i dont know what this is for but uhh yeah dont delete it
      loadDone = false;
      logo_t = -4;
    }
  } else {
    try {
      // this is where we begin !
    }
    catch (Throwable e) {
      println(e.toString());
    }
  }
  t++;
}
/**/
/*
void setup() {
 size(640, 480, P2D);
 }
 
 void draw() {
 background(0);
 try {
 BasaltRender("doodly doodly da", 50, 50, 50, 50, 50, 50, 50);
 } catch (Throwable e) {
 println(e.toString());
 }
 }
 */

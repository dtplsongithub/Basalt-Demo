/**/
void renderLogo() {
  background(0);
  pushMatrix();
  beginCamera();
  lights();
  camera();
  translate(width/2, height/2);
  rotateX(map2(constrain(logo_t, 0, 100), 0, 100, PI/4*3, -QUARTER_PI/3, QUARTIC, EASE_OUT));
  rotateY(map2(constrain(logo_t, 0, 100), 0, 100, HALF_PI/4*3, QUARTER_PI/3, CUBIC, EASE_OUT)+logo_cameraY);
  logo_cameraY -= constrain((float)logo_t*map2(constrain(logo_t, 100, 200), 40, 150, 0, 0.006f, CUBIC, EASE_IN_OUT)/100, 0, 0.006f);
  endCamera();
  translate(0, 0, -cubeSize/2);
  pushMatrix();
  stroke(0xff00ff00);
  translate(-cubeSize/2, -cubeSize/2);
  rotateY(map(constrain(logo_t, 0, 40), 0, 40, -PI/8*5, HALF_PI));
  renderFace(-cubeSize, 0, cubeSize, cubeSize, 5);
  if (logo_t>=40) {
    pushMatrix();
    rotateX(map2(constrain(logo_t, 40, 100), 40, 100, PI, -HALF_PI, CUBIC, EASE_OUT));
    renderFace(-cubeSize, -cubeSize, cubeSize, cubeSize, 0);
    popMatrix();
    translate(-cubeSize, 0);
    rotateY(map2(constrain(logo_t, 40, 100), 40, 100, -PI, HALF_PI, CUBIC, EASE_OUT));
    renderFace(-cubeSize, 0, cubeSize, cubeSize, 4);
  }
  popMatrix();
  translate(cubeSize/2, -cubeSize/2);
  rotateY(map2(constrain(logo_t, 0, 60), 0, 60, PI/8*10, HALF_PI, CUBIC, EASE_OUT));
  renderFace(-cubeSize, 0, cubeSize, cubeSize, 3);
  if (logo_t>=60) {
    pushMatrix();
    rotateY(map2(constrain(logo_t, 60, 120), 60, 120, 0, -HALF_PI, CUBIC, EASE_OUT));
    renderFace(-cubeSize, 0, cubeSize, cubeSize, 2);
    popMatrix();
    translate(0, cubeSize, 0);
    rotateX(map2(constrain(logo_t, 60, 120), 60, 120, PI, -HALF_PI, CUBIC, EASE_OUT));
    renderFace(-cubeSize, 0, cubeSize, cubeSize, 1);
  }
  popMatrix();
  textFont(MSGothic32);
  textWS("ELECTRICAL WHISK", width/2, height/4*3, (int)map(constrain(logo_t, 82, 130), 82, 130, 0, 255),
    0, map2(constrain(logo_t, 230, 520), 230, 520, 0, 4, EXPONENTIAL, EASE_OUT),
    0, map2(constrain(logo_t, 80, 130), 80, 130, 0, 0.05, EXPONENTIAL, EASE_OUT), 0, 0,
    (int)map2(constrain(logo_t, 80, 130), 80, 130, 660, 20, EXPONENTIAL, EASE_OUT), 30, true);
  textFont(MSGothic20);
  textWS("productions", width/2, height/4*3+30, (int)map(constrain(logo_t, 132, 180), 132, 180, 0, 255),
    0, map2(constrain(logo_t, 230, 520), 230, 520, 0, 4, LINEAR, 0),
    0, map2(constrain(logo_t, 130, 180), 130, 180, 0, 0.03, EXPONENTIAL, EASE_OUT), 0, 0,
    (int)map2(constrain(logo_t, 130, 180), 130, 180, 660, 20, EXPONENTIAL, EASE_OUT), 25, false);
}

long[] fd = new long[] { // UDNWSE
  0b1111111111111111110000111100001111000011111001111111111101111110l,
  0b0000000000000000000110000010110000111100000110000000000000000000l,
  0b1111111011111111110001111100001111000011110001111111111111111110l,
  0b0101010110101010010101011010101001010101101010100101010110101010l,
  0b0111111011111111110000111111111111111110110000001111111101111111l,
  0b0101010110101010010101011010101001010101101010100101010110101010l,
};

void textWS(String s, int x, int y, int op, float xm, float ym, float xf, float yf, float xo, float yo, int xs, float sm, boolean smooth) {
  pushStyle();
  fill(255, op);
  textAlign(CENTER, CENTER);
  for (int i = 0; i < s.length(); i++) {
    wavyChar(s.charAt(i), x+xs*(-s.length()/2+i), y, xm, ym, xf, yf, xo, yo, op, i, sm, smooth);
  }
  popStyle();
}
void wavyChar(char text, int x, int y, float xm, float ym, float xf, float yf, float xo, float yo, int op, int i, float sm, boolean smooth) {
  if (smooth) boldChar(text, (x+sin((logo_t+sm*i)*xf+xo)*xm), (y+sin((logo_t+sm*i)*yf+yo)*ym), op);
  else boldChar(text, (int)(x+sin((logo_t+sm*i)*xf+xo)*xm), (int)(y+sin((logo_t+sm*i)*yf+yo)*ym), op);
}
void boldChar(char text, float x, float y, int op) {
  text(text, x, y);
  fill(255, op/2);
  text(text, x, y+1);
  text(text, x, y-1);
  text(text, x+1, y);
  text(text, x-1, y);
  fill(255, op);
}

void renderFace(float x, float y, float w, float h, int which) {
  int subdivisions = 8;
  noFill();
  stroke(0xff00ff00);
  rect(x, y, w, h);
  noStroke();
  for (int i = 0; i < subdivisions*subdivisions; i++) {
    fill(boolAt(fd[which], i)?255:0);
    rect(x+(w/subdivisions)*(i%subdivisions), y+(h/subdivisions)*(i/subdivisions), w/subdivisions, h/subdivisions);
  }
}

boolean boolAt(long x, int i) {
  return((x>>i)&1)==1;
}
/**/

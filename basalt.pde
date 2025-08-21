StringDict charData;

void BasaltRender(String text, float x, float y, float s, color col, float thick, float sp, float ia) {
  BasaltRender(text, x, y, s, col, thick, sp, ia, 0, 0, 0, 0, 0, 0, 1, 1);
}

void BasaltRender(String text, float x, float y, float s, color col, float thick, float sp, float ia, float sx, float sy) {
  BasaltRender(text, x, y, s, col, thick, sp, ia, 0, 0, 0, 0, 0, 0, sx, sy);
}

void BasaltRender(String text, float x, float y, float s, color col, float thick, float sp, float ia, float xf, float xo, float xm, float yf, float yo, float ym, float sx, float sy) {
  BasaltRender(text, x, y, s, col, thick, sp, ia, xf, xo, xm, yf, yo, ym, sx, sy, LEFT);
}

void BasaltRender(String text, float x, float y, float s, color col, float thick, float sp, float ia, float xf, float xo, float xm, float yf, float yo, float ym, float sx, float sy, int align) {
  stroke(col);
  strokeWeight(thick);
  for (int i = 0; i<text.length(); i++) { // ste_ti is i and ste_i is j
    char currentChar = text.toLowerCase().charAt(i); // capitalization is not yet supported
    String currentCharData = charData.get(""+currentChar);
    if (currentCharData == null) continue; // yes yes i use continue fight me
    int gridSize = int(currentCharData.charAt(0)+"")-1;
    for (int j = 1; j<currentCharData.length(); j+=4) {

      float tx1 = i*(s+sp)+(s/gridSize)*(float)int(currentCharData.charAt(j)+"")*sx; // x and y without any modifiers like sinus functions or ItaliK
      float ty1 = (s/gridSize)*(float)int(currentCharData.charAt(j+1)+"")*sy;
      tx1 += x + ((ia*((s+ty1)/s))-ia*1.25) + sin(((float)millis()/1000)*xf+xo*i)*xm;
      ty1 += y + sin(((float)millis()/1000)*yf+yo*i)*ym; //bless you

      float tx2 = i*(s+sp)+(s/gridSize)*(float)int(currentCharData.charAt(j+2)+"")*sx;
      float ty2 = (s/gridSize)*(float)int(currentCharData.charAt(j+3)+"")*sy;
      tx2 += x + ((ia*((s+ty2)/s))-ia*1.25) + sin(((float)millis()/1000)*xf+xo*i)*xm;
      ty2 += y + sin(((float)millis()/1000)*yf+yo*i)*ym;
      
      if (align == CENTER) {
        tx1 -= text.length()*(s+sp)/2;
        tx2 -= text.length()*(s+sp)/2;
      }

      point(tx1, ty1);
      point(tx2, ty2);
      line(tx1, ty1, tx2, ty2);
    }
  }
}

void loadBasalt() {
  charData = new StringDict();
  charData.set("a", "310011021010221220121");
  charData.set("b", "500040030304141323243433404340232");
  charData.set("c", "31020122201100112");
  charData.set("d", "300020010021210211221");
  charData.set("e", "30002002002220111");
  charData.set("f", "3000200200111");
  charData.set("g", "3102012220110011222212111");
  charData.set("h", "3000220220121");
  charData.set("i", "31012");
  charData.set("j", "210110111");
  charData.set("k", "30002011111201122");
  charData.set("l", "200010111");
  charData.set("m", "30002001111202022");
  charData.set("n", "3000200222022");
  charData.set("o", "20010101111010100");
  charData.set("p", "30002002001212021");
  charData.set("q", "3002020211202020012211122");
  charData.set("r", "300020020012120211122");
  charData.set("s", "300200001012121222202");
  charData.set("t", "300201012");
  charData.set("u", "2000101111110");
  charData.set("v", "30001011212212120");
  charData.set("w", "30002021111222022");
  charData.set("x", "200110110");
  charData.set("y", "3110011201112");
  charData.set("z", "2001001100111");
  charData.set("0", "20010101111010100");
  charData.set("1", "31012");
  charData.set("2", "300202021012101022202");
  charData.set("3", "30020202201212202");
  charData.set("4", "3000101212022");
  charData.set("5", "300200001012121222202");
  charData.set("6", "300200002012121222202");
  charData.set("7", "3002020221121");
  charData.set("8", "300200002012120222202");
  charData.set("9", "300200001012120222202");
  charData.set("%", "4000101111110100003302223233333323222");
  charData.set("#", "50141034310143034");
  charData.set("=", "501410343");
  charData.set(".", "31212");
  charData.set(",", "52415");
  charData.set(":", "521212323");
  charData.set(";", "521212314");
  charData.set("(", "5302121232334");
  charData.set(")", "5203131333324");
  charData.set("[", "5302020242434");
  charData.set("]", "5302030342434");
  charData.set("{", "53021212323341222");
  charData.set("}", "52031313333244232");
  charData.set("'", "52021");
  charData.set("\"", "510113031");
  charData.set("!", "310111212");
  charData.set("?", "52231312020102424");
  charData.set("^", "520112031");
  charData.set("$", "4012101020222222323031014");
  charData.set("&", "510201001011212030314144412423134");
  charData.set("<", "512301234");
  charData.set(">", "532103214");
}

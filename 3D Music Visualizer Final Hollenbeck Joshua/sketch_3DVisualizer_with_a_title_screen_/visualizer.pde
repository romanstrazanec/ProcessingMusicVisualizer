class Visualizer {
  PImage fade;
  float rWidth, rHeight;
  int hVal;

  Visualizer() {
    hVal = 0;
    rectMode(CORNERS);
    fade = get(0, 0, width, height);
    rWidth = width * 0.99;
    rHeight = height * 0.99;
  }

  void drawEQ() {
    tint(255, 255, 255, 254);
    image(fade, (width - rWidth) / 2, (height - rHeight) / 2, rWidth, rHeight);
    noTint();

    smooth();
    colorMode(HSB);
    fill(hVal, 255, 255);
    stroke(hVal, 255, 225);
    colorMode(RGB);

    fft.forward(mp3.mix);
    for (int i = 0; i < fft.specSize(); i += 50) {
      rect(i, height, i + 50, height - fft.getFreq(i / 2) * 1.2);
    }

    fade = get(0, 0, width, height);
    hVal +=1;

    if (hVal > 255) hVal = 0;
  }
}

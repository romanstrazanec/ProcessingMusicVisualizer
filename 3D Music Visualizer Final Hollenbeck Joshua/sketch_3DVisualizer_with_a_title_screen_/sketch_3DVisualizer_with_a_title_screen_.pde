// By: Joshua Hollenbeck
// Works with Processing 3 - Test Change
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;

Visualizer classicVi;

Minim minim;
FFT fft;

AudioOutput out;
AudioPlayer mp3;

PFont directions;
PImage fade;
float rWidth, rHeight;
int hVal;

boolean started;
boolean selection;
boolean canPlay;
boolean canPauseAndPlay;
PImage title;

void setup() {
  size(900, 500, P3D);
  title = loadImage("VisualZtitle .png");
  frameRate(60);
  started = false;
  selection = false;

  minim = new Minim(this);
  mp3 = minim.loadFile("mashUp.mp3", 2048);
  out = minim.getLineOut(Minim.STEREO, 44100);
  fft = new FFT(mp3.bufferSize(), mp3.sampleRate());
  rectMode(CORNERS);
  mp3.loop();

  fade = get(0, 0, width, height);
  rWidth = width*0.99;
  rHeight = height*0.99;
  classicVi = new Visualizer();

  if (!started) mp3.pause();
}

void draw() {
  if (!started) {
    background(title);
    canPauseAndPlay = false;
  } else if (started) {
    canPlay = true;
    background(0);
    classicVi.drawEQ();

    if (canPlay) {
      mp3.play();
      pauseAndPlay();
    }
  }
}

void mouseClicked() {
  started = true;
}

void keyPressed() {
  if (key == ESC) {
    started = false;
    mp3.pause();
  }
}

void pauseAndPlay() {
  if (key == 'p') mp3.pause();
  else if (key == 'q') mp3.play();
}

void close() {
  out.close();
  minim.stop();
  super.stop();
}

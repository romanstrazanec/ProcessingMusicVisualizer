// By: Joshua Hollenbeck
// Works with Processing 3 - Test Change
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;

Visualizer classicVi;

Minim minim;
FFT fft;

AudioInput in;

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
  in = minim.getLineIn(Minim.STEREO, 2048);
  fft = new FFT(in.bufferSize(), in.sampleRate());
  rectMode(CORNERS);

  fade = get(0, 0, width, height);
  rWidth = width * 0.99;
  rHeight = height * 0.99;
  classicVi = new Visualizer();
}

void draw() {
  if (!started) {
    background(title);
    canPauseAndPlay = false;
  } else if (started) {
    canPlay = true;
    background(0);
    classicVi.drawEQ();
  }
}

void mouseClicked() {
  started = true;
}

void keyPressed() {
  if (key == ESC) started = false;
}

void close() {
  minim.stop();
  super.stop();
}

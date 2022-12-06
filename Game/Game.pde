import processing.sound.*; //allows sound to be imported into Processing
SoundFile brownNoise; //background noise for the hospital room

import gifAnimation.*;
Gif doorText;
Gif doorAText;
Gif diaryText;

Walter w; //contstructs 1 object from the Walter class with w parameters
HospitalRoom hr; //constructs 1 object from the class HospitalRoom with hr parameters
LivingRoom lr;

int roomCounter;

boolean noMove;

PImage whiteScreen;
int transparency;
int transparencyChange=4;
int transparencyMax=280;
boolean increaseTransparency;
boolean decreaseTransparency;

void setup() {
  fullScreen(); //sets the run window to fullscreen
  brownNoise=new SoundFile(this, "brownNoise.wav");
  doorText=new Gif(this, "doorText.gif");
  doorAText=new Gif(this, "doorAText.gif");
  diaryText=new Gif(this, "diaryText.gif");
  whiteScreen=loadImage("whiteScreen.png");

  w=new Walter(); //initializes the class Walter
  hr=new HospitalRoom(); //initializes the class HospitalRoom
  lr=new LivingRoom();

  hr.brownNoise(); //plays brown noise
}

void draw() {
  println(noMove);
  if (roomCounter==0) {
    hr.displayHR();
    hr.boundaries();
    hr.bedBoundaries();
    hr.doorInteraction();
    hr.diaryBoundaries();
    hr.diaryInteraction();
    w.displayWalter();
    hr.bedBoundaries();
  }
  if (roomCounter==1) {
    lr.displayLR();
    w.walterScene1();
    w.displayWalter();
  }
  w.walterMove();
  roomTransition();
}

void roomTransition() {
  if (increaseTransparency) {
    tint(255, transparency);
    image(whiteScreen, 0, 0, width, height);
    transparency+=transparencyChange;
  }
  if (transparency > transparencyMax) {
    decreaseTransparency=true;
    roomCounter++;
  }
  if (decreaseTransparency) {
    increaseTransparency=false;
    tint(255, transparency);
    image(whiteScreen, 0, 0, width, height);
    transparency-=transparencyChange;
    if (transparency==0) {
      noTint();
      noMove=false;
    }
  }
}

void keyPressed() {
  if (noMove==false)
    w.walterKeyPressed();

  hr.hrKeyPressed();
}

void keyReleased() {
  w.walterKeyReleased();
}
